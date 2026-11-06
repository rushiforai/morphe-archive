package suchi.morphe.patches.teuida

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val GOOGLE_CREDENTIAL_TYPE =
    "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"
private const val MICROG_CREDENTIAL_TYPE =
    "app.revanced.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL"
private const val PLAY_SERVICES_PROVIDER =
    "Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;"
private const val NEW_CREDENTIAL_BACKEND_VERSION = 252400000L

private val googleOptionFingerprint = Fingerprint(
    definingClass = "Lcom/google/android/libraries/identity/googleid/GetSignInWithGoogleOption;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;",
    ),
    strings = listOf(GOOGLE_CREDENTIAL_TYPE, "serverClientId should not be empty"),
)

private val getCredentialFingerprint = Fingerprint(
    definingClass = PLAY_SERVICES_PROVIDER,
    name = "onGetCredential",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroidx/credentials/GetCredentialRequest;",
        "Landroid/os/CancellationSignal;",
        "Ljava/util/concurrent/Executor;",
        "Landroidx/credentials/CredentialManagerCallback;",
    ),
)

internal fun patchTeuidaCredentialManager(context: BytecodePatchContext) = with(context) {
    val googleOption = googleOptionFingerprint.method
    val optionInstructions = googleOption.implementation!!.instructions.toList()
    val optionConstructorIndex = optionInstructions.indices.singleOrNull { index ->
        val instruction = optionInstructions[index]
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
            reference?.definingClass == "Landroidx/credentials/GetCustomCredentialOption;" &&
            reference.name == "<init>" &&
            reference.parameterTypes == listOf(
                "I", "Landroid/os/Bundle;", "Landroid/os/Bundle;", "Ljava/lang/String;",
                "Ljava/util/Set;", "Z", "Z",
            )
    } ?: throw PatchException("TEUIDA's Google credential constructor has changed.")
    val constructorCall = optionInstructions[optionConstructorIndex] as RegisterRangeInstruction
    if (constructorCall.registerCount != 8) {
        throw PatchException("TEUIDA's Google credential constructor argument count has changed.")
    }
    val systemProviderRegister = constructorCall.startRegister + 6
    val autoSelectRegister = constructorCall.startRegister + 7
    val systemFlagIndex = (0 until optionConstructorIndex).lastOrNull { index ->
        optionInstructions[index].opcode == Opcode.CONST_4 &&
            (optionInstructions[index] as OneRegisterInstruction).registerA == systemProviderRegister
    } ?: throw PatchException("TEUIDA's Google system-provider flag was not found.")
    val autoSelectIndex = (0 until optionConstructorIndex).lastOrNull { index ->
        optionInstructions[index].opcode == Opcode.CONST_4 &&
            (optionInstructions[index] as OneRegisterInstruction).registerA == autoSelectRegister
    } ?: throw PatchException("TEUIDA's Google auto-select flag was not found.")
    if ((optionInstructions[systemFlagIndex] as WideLiteralInstruction).wideLiteral != 1L ||
        (optionInstructions[autoSelectIndex] as WideLiteralInstruction).wideLiteral != 1L ||
        systemFlagIndex != optionConstructorIndex - 3 ||
        autoSelectIndex != optionConstructorIndex - 2 ||
        optionInstructions[optionConstructorIndex - 1].opcode != Opcode.MOVE_OBJECT ||
        (optionInstructions[optionConstructorIndex - 1] as TwoRegisterInstruction).registerA !=
            constructorCall.startRegister
    ) {
        throw PatchException("TEUIDA's Google credential flags have changed.")
    }

    val getCredential = getCredentialFingerprint.method
    val getInstructions = getCredential.implementation!!.instructions.toList()
    val backendResultIndex = getInstructions.indices.singleOrNull { index ->
        if (index < 2 || index + 1 >= getInstructions.size) return@singleOrNull false
        val versionInstruction = getInstructions[index - 2]
        val call = getInstructions[index - 1]
        val reference = (call as? ReferenceInstruction)?.reference as? MethodReference
        val arguments = call as? FiveRegisterInstruction
        val result = getInstructions[index]
        val branch = getInstructions[index + 1]
        versionInstruction.opcode == Opcode.CONST &&
            (versionInstruction as WideLiteralInstruction).wideLiteral == NEW_CREDENTIAL_BACKEND_VERSION &&
            reference?.definingClass == PLAY_SERVICES_PROVIDER &&
            reference.name == "isAvailableOnDevice" &&
            reference.parameterTypes == listOf("I") && reference.returnType == "Z" &&
            arguments?.registerCount == 2 &&
            arguments.registerD == (versionInstruction as OneRegisterInstruction).registerA &&
            result.opcode == Opcode.MOVE_RESULT && branch.opcode == Opcode.IF_EQZ &&
            (result as OneRegisterInstruction).registerA ==
                (branch as OneRegisterInstruction).registerA
    } ?: throw PatchException("TEUIDA's newer credential backend selection has changed.")
    val backendResultRegister = (getInstructions[backendResultIndex] as OneRegisterInstruction).registerA
    if (systemProviderRegister > 15 || backendResultRegister > 15) {
        throw PatchException("TEUIDA's credential registers no longer fit the verified instructions.")
    }

    val credentialClass = mutableClassDefBy(
        "Lcom/google/android/libraries/identity/googleid/GoogleIdTokenCredential;",
    )
    val typeConstant = credentialClass.fields.singleOrNull {
        it.name == "TYPE_GOOGLE_ID_TOKEN_CREDENTIAL" && it.type == "Ljava/lang/String;"
    }?.initialValue as? MutableStringEncodedValue
        ?: throw PatchException("TEUIDA's Google credential type constant was not found.")
    if (typeConstant.value != GOOGLE_CREDENTIAL_TYPE) {
        throw PatchException("TEUIDA's Google credential type constant has changed.")
    }

    googleOption.replaceInstruction(
        systemFlagIndex,
        BuilderInstruction11n(Opcode.CONST_4, systemProviderRegister, 0),
    )
    // Keep the existing getSignInIntent path when shared availability overrides report success.
    getCredential.replaceInstruction(
        backendResultIndex,
        BuilderInstruction11n(Opcode.CONST_4, backendResultRegister, 0),
    )
    typeConstant.value = MICROG_CREDENTIAL_TYPE

    var replacedTypes = 0
    classDefForEach { classDef ->
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach methodLoop@{ method ->
            val implementation = method.implementation ?: return@methodLoop
            val mutableMethod by lazy {
                mutableClass.methods.first { MethodUtil.methodSignaturesMatch(it, method) }
            }
            implementation.instructions.forEachIndexed instructionLoop@{ index, instruction ->
                if (instruction.opcode != Opcode.CONST_STRING &&
                    instruction.opcode != Opcode.CONST_STRING_JUMBO
                ) return@instructionLoop
                val reference = (instruction as ReferenceInstruction).reference as StringReference
                if (reference.string != GOOGLE_CREDENTIAL_TYPE) return@instructionLoop
                val register = (instruction as OneRegisterInstruction).registerA
                val replacement = ImmutableStringReference(MICROG_CREDENTIAL_TYPE)
                mutableMethod.replaceInstruction(
                    index,
                    if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                        BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, replacement)
                    } else {
                        BuilderInstruction21c(Opcode.CONST_STRING, register, replacement)
                    },
                )
                replacedTypes++
            }
        }
    }
    if (replacedTypes == 0) {
        throw PatchException("TEUIDA's Google credential request and response types were not found.")
    }
}
