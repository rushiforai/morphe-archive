package dev.utaa.linimal.patches.features.readwithoutreceipt

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val BUNDLE = "Landroid/os/Bundle;"
private const val STRING = "Ljava/lang/String;"
private const val CHAT_REQUEST = "Lcom/linecorp/line/chat/request/ChatHistoryRequest;"

internal val readWithoutReceiptSessionActivityFingerprint = Fingerprint(
    name = "onCreate",
    parameters = listOf(BUNDLE),
    returnType = "V",
    // filters は命令順に評価されるため、request の extras 読取りを UI provider の文字列より前に置きます。
    filters = listOf(
        string("chatDataComponentProvider"),
        methodCall("Landroid/app/Activity;->getIntent()Landroid/content/Intent;"),
        methodCall("Landroid/content/Intent;->getExtras()Landroid/os/Bundle;"),
        string("chatUiComponentProvider"),
    ),
)

private val readWithoutReceiptSessionGetterFingerprint = Fingerprint(
    definingClass = CHAT_REQUEST,
    name = "getChatId",
    parameters = emptyList(),
    returnType = STRING,
    custom = { _, classDef -> "Landroid/os/Parcelable;" in classDef.interfaces },
)

/** super の直後で閲覧セッションを開始します。getter の反射契約も確定するまで DEX は変更しません。 */
val readWithoutReceiptSessionPatch = bytecodePatch(
    name = "Read without receipt session",
    description = "トーク画面の生成時に閲覧セッションを開始し、一時的な離脱で既読抑制が解除されないようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(readWithoutReceiptLocalReadBlockPatch)

    execute {
        val activities = readWithoutReceiptSessionActivityFingerprint.matchAllOrNull().orEmpty()
        val getters = readWithoutReceiptSessionGetterFingerprint.matchAllOrNull().orEmpty()
        val patchIds = listOf(PatchId.READ_WITHOUT_RECEIPT_SESSION, PatchId.NOTIFICATION_READ_WITHOUT_RECEIPT_SESSION)
        val actual = activities.size + getters.size
        if (activities.size != 1 || getters.size != 1) {
            recordUnappliedFeatureStatus(patchIds, 2, actual, "ReadWithoutReceiptSessionTargetsNotUnique")
            return@execute
        }
        val activity = activities.single()
        val thisRegister = readWithoutReceiptSessionThisRegister(
            activity.originalMethod,
            activity.originalClassDef.superclass,
        )
        if (thisRegister == null || !readWithoutReceiptSessionGetterSafe(getters.single().originalMethod)) {
            recordUnsafeFeatureStatus(patchIds, 2, actual, "ReadWithoutReceiptSessionShapeMismatch")
            return@execute
        }

        // p0 と p1 は隣接する parameter。range 形式で高位 register もそのまま渡し、scratch は使いません。
        checkNotNull(activity.method.implementation).addInstruction(1, readWithoutReceiptSessionHook(thisRegister))
        recordFeatureStatus(patchIds, 2, 2, "ReadWithoutReceiptSessionInjected")
    }
}

/** exact APK の SDK_INT 読み出し直前だけを許可し、未知の入口や途中への合流は拒否します。 */
internal fun readWithoutReceiptSessionThisRegister(method: Method, superclass: String?): Int? {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.name != "onCreate" ||
        method.parameterTypes != listOf(BUNDLE) || method.returnType != "V"
    ) return null
    val implementation = method.implementation ?: return null
    val thisRegister = implementation.registerCount - 2
    if (thisRegister < 0) return null
    val instructions = implementation.instructions.toList()
    val first = instructions.firstOrNull() ?: return null
    val superCall = (first as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (superCall.definingClass != superclass || superCall.name != "onCreate" ||
        superCall.parameterTypes != listOf(BUNDLE) || superCall.returnType != "V"
    ) return null
    val parametersPreserved = when (first.opcode) {
        Opcode.INVOKE_SUPER_RANGE -> (first as? RegisterRangeInstruction)?.let {
            it.registerCount == 2 && it.startRegister == thisRegister
        } == true
        Opcode.INVOKE_SUPER -> (first as? FiveRegisterInstruction)?.let {
            it.registerCount == 2 && it.registerC == thisRegister && it.registerD == thisRegister + 1
        } == true
        else -> false
    }
    if (!parametersPreserved) return null
    val sdkRead = instructions.getOrNull(1) ?: return null
    val sdkField = (sdkRead as? ReferenceInstruction)?.reference as? FieldReference ?: return null
    val sdkRegister = (sdkRead as? OneRegisterInstruction)?.registerA ?: return null
    if (sdkRead.opcode != Opcode.SGET || sdkField.definingClass != "Landroid/os/Build\$VERSION;" ||
        sdkField.name != "SDK_INT" || sdkField.type != "I" || sdkRegister !in 0 until implementation.registerCount ||
        isDivertedInjectionIndex(instructions, 1, exceptionHandlerAddresses(implementation))
    ) return null
    return thisRegister
}

/** 公開 getter が this.chatId をそのまま返すことを保証し、LINE 型への compile 依存を避けます。 */
internal fun readWithoutReceiptSessionGetterSafe(method: Method): Boolean {
    if (method.definingClass != CHAT_REQUEST || method.name != "getChatId" ||
        method.parameterTypes.isNotEmpty() || method.returnType != STRING ||
        !AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags)
    ) return false
    val implementation = method.implementation ?: return false
    if (implementation.registerCount < 1 || implementation.tryBlocks.isNotEmpty()) return false
    val instructions = implementation.instructions.toList()
    if (instructions.size != 2) return false
    val read = instructions[0] as? TwoRegisterInstruction ?: return false
    val field = (instructions[0] as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    val returned = instructions[1] as? OneRegisterInstruction ?: return false
    return instructions[0].opcode == Opcode.IGET_OBJECT && field.definingClass == CHAT_REQUEST &&
        field.name == "chatId" && field.type == STRING && read.registerB == implementation.registerCount - 1 &&
        read.registerA in 0 until implementation.registerCount && instructions[1].opcode == Opcode.RETURN_OBJECT &&
        returned.registerA == read.registerA
}

internal fun readWithoutReceiptSessionHook(thisRegister: Int) = BuilderInstruction3rc(
    Opcode.INVOKE_STATIC_RANGE,
    thisRegister,
    2,
    ImmutableMethodReference(
        "Ldev/utaa/linimal/extension/features/readwithoutreceipt/ReadWithoutReceiptHooks;",
        "onChatCreated",
        listOf("Landroid/app/Activity;", BUNDLE),
        "V",
    ),
)
