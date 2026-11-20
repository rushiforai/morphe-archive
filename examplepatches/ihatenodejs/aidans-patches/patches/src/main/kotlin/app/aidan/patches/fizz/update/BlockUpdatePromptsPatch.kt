package app.aidan.patches.fizz.update

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.aidan.patches.shared.disableRequiredVoidMethods
import app.aidan.patches.shared.returnRequiredBoolean
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
private const val ONBOARDING_UI_STATE_CLASS = "Lge/u1;"
private const val ONBOARDING_SCREEN_CLASS = "Lge/r1;"
private const val UPDATE_PROMPT_CLASS = "Lkd/o1;"
private const val SESSION_STATE_CLASS = "Lnc/j0;"
private const val VERSION_COMPARATOR_CLASS = "Lnc/c;"
private const val OKHTTP_INTERCEPTOR_CLASS = "Lic/g;"
private const val SESSION_STATE_REQUEST_DATA_CLASS = "Lub/dc;"
private const val MAIN_ACTIVITY = "Lcom/fizzsocial/fizz/MainActivity;"
private const val VERSION_BRIDGE = "Lapp/aidan/extension/fizz/VersionBridge;"

@Suppress("unused")
val blockUpdatePromptsPatch = bytecodePatch(
    name = "Block Update Prompts",
    description = "Blocks forced app update prompts, allowing older versions of the app to continue running.",
    default = true
) {
    category("General")
    compatibleWith(COMPATIBILITY_FIZZ)
    extendWith("extensions/extension.mpe")

    execute {
        // Layer 1: SessionState Outdated Check Bypass (nc.j0.d)
        returnRequiredBoolean(SESSION_STATE_CLASS, "d", false)

        // Layer 2: Semantic Version Comparator Bypass (nc.c.b)
        returnRequiredBoolean(VERSION_COMPARATOR_CLASS, "b", false)

        // Layer 3: Onboarding UI State Field Neutralization (ge.u1.<init>)
        neutralizeOnboardingUiStateUpdateField()

        // Layer 4: Onboarding Screen Update Branch Neutralization (ge.r1.h)
        neutralizeOnboardingScreenUpdateBranch()

        // Layer 5: Update Prompt Composable Stubbing (kd.o1.a)
        disableRequiredVoidMethods(UPDATE_PROMPT_CLASS, "a")

        // Layer 6: OkHttp Header Interceptor Dynamic Version Spoofing (ic.g.a)
        spoofOkHttpHeaderVersions()

        // Layer 7: Session State Request Body DTO Spoofing (ub.dc.<init>)
        spoofSessionStateRequestBodyVersion()

        // Layer 8: Lifecycle Bridge Initialization (MainActivity.onCreate)
        injectVersionBridgeInitialization()
    }
}

/**
 * Ensures OnboardingUiState.l0 (isAppUpdateRequired) is always initialized to false.
 */
private fun BytecodePatchContext.neutralizeOnboardingUiStateUpdateField() {
    val u1Class = mutableClassDefByOrNull(ONBOARDING_UI_STATE_CLASS)
        ?: throw PatchException("Class $ONBOARDING_UI_STATE_CLASS not found")

    val initMethod = u1Class.methods.firstOrNull {
        it.name == "<init>" && it.implementation != null
    } ?: throw PatchException("Method $ONBOARDING_UI_STATE_CLASS.<init> not found")

    val instructions = initMethod.implementation?.instructions
        ?: throw PatchException("Missing instructions in $ONBOARDING_UI_STATE_CLASS.<init>")

    val iputIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IPUT_BOOLEAN &&
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? FieldReference)?.let { field ->
                    field.name == "l0" && field.type == "Z"
                }
            } == true
    }

    if (iputIndex < 0) {
        throw PatchException("Anchor IPUT_BOOLEAN l0:Z not found in $ONBOARDING_UI_STATE_CLASS.<init>")
    }

    val iputInst = instructions[iputIndex] as? TwoRegisterInstruction
        ?: throw PatchException("Instruction at index $iputIndex in $ONBOARDING_UI_STATE_CLASS.<init> is not TwoRegisterInstruction")

    initMethod.addInstructions(iputIndex, "const/4 v${iputInst.registerA}, 0x0")
}

/**
 * Ensures the OnboardingScreen update check in ge.r1.h always reads false, bypassing kd.o1.a.
 */
private fun BytecodePatchContext.neutralizeOnboardingScreenUpdateBranch() {
    val r1Class = mutableClassDefByOrNull(ONBOARDING_SCREEN_CLASS)
        ?: throw PatchException("Class $ONBOARDING_SCREEN_CLASS not found")

    val hMethod = r1Class.methods.firstOrNull {
        it.name == "h" && it.implementation != null
    } ?: throw PatchException("Method $ONBOARDING_SCREEN_CLASS.h not found")

    val instructions = hMethod.implementation?.instructions
        ?: throw PatchException("Missing instructions in $ONBOARDING_SCREEN_CLASS.h")

    val igetIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IGET_BOOLEAN &&
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? FieldReference)?.let { field ->
                    field.name == "l0" && field.type == "Z"
                }
            } == true
    }

    if (igetIndex < 0) {
        throw PatchException("Anchor IGET_BOOLEAN l0:Z not found in $ONBOARDING_SCREEN_CLASS.h")
    }

    val igetInst = instructions[igetIndex] as? TwoRegisterInstruction
        ?: throw PatchException("Instruction at index $igetIndex in $ONBOARDING_SCREEN_CLASS.h is not TwoRegisterInstruction")

    hMethod.replaceInstruction(igetIndex, "const/4 v${igetInst.registerA}, 0x0")
}

/**
 * Replaces hardcoded client version and build number in OkHttp headers (ic.g.a)
 * with dynamic calls to VersionBridge.
 */
private fun BytecodePatchContext.spoofOkHttpHeaderVersions() {
    val gClass = mutableClassDefByOrNull(OKHTTP_INTERCEPTOR_CLASS)
        ?: throw PatchException("Class $OKHTTP_INTERCEPTOR_CLASS not found")

    val aMethod = gClass.methods.firstOrNull {
        it.name == "a" && it.implementation != null
    } ?: throw PatchException("Method $OKHTTP_INTERCEPTOR_CLASS.a not found")

    val instructions = aMethod.implementation?.instructions
        ?: throw PatchException("Missing instructions in $OKHTTP_INTERCEPTOR_CLASS.a")

    val clientVersionHeaderIndex = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.CONST_STRING &&
            (inst as? ReferenceInstruction)?.reference?.let {
                (it as? StringReference)?.string == "fizz-client-version"
            } == true
    }
    if (clientVersionHeaderIndex < 0) {
        throw PatchException("Anchor 'fizz-client-version' header not found in $OKHTTP_INTERCEPTOR_CLASS.a")
    }

    val versionConstIndex = (clientVersionHeaderIndex - 1 downTo maxOf(0, clientVersionHeaderIndex - 4)).firstOrNull { idx ->
        val inst = instructions[idx]
        inst.opcode == Opcode.CONST_STRING &&
            (inst as? ReferenceInstruction)?.reference?.let {
                (it as? StringReference)?.string == "1.54.0"
            } == true
    } ?: throw PatchException("Version string literal '1.54.0' preceding fizz-client-version not found in $OKHTTP_INTERCEPTOR_CLASS.a")

    val reg = (instructions[versionConstIndex] as? OneRegisterInstruction)?.registerA ?: 2

    aMethod.addInstructions(
        versionConstIndex,
        """
        invoke-static {}, $VERSION_BRIDGE->getClientVersion()Ljava/lang/String;
        move-result-object v$reg
        """.trimIndent()
    )
    aMethod.removeInstruction(versionConstIndex + 2)

    // Also spoof fizz-build-number if present
    val updatedInstructions = aMethod.implementation?.instructions
        ?: throw PatchException("Missing updated instructions in $OKHTTP_INTERCEPTOR_CLASS.a")

    val buildNumberHeaderIndex = updatedInstructions.indexOfFirst { inst ->
        inst.opcode == Opcode.CONST_STRING &&
            (inst as? ReferenceInstruction)?.reference?.let {
                (it as? StringReference)?.string == "fizz-build-number"
            } == true
    }
    if (buildNumberHeaderIndex >= 0) {
        val buildConstIndex = (buildNumberHeaderIndex - 2..buildNumberHeaderIndex + 2).firstOrNull { idx ->
            if (idx !in updatedInstructions.indices) return@firstOrNull false
            val inst = updatedInstructions[idx]
            inst.opcode == Opcode.CONST_STRING &&
                (inst as? ReferenceInstruction)?.reference?.let {
                    (it as? StringReference)?.string == "400032"
                } == true
        }
        if (buildConstIndex != null) {
            val buildReg = (updatedInstructions[buildConstIndex] as? OneRegisterInstruction)?.registerA ?: 5
            aMethod.addInstructions(
                buildConstIndex,
                """
                invoke-static {}, $VERSION_BRIDGE->getBuildNumber()Ljava/lang/String;
                move-result-object v$buildReg
                """.trimIndent()
            )
            aMethod.removeInstruction(buildConstIndex + 2)
        }
    }
}

/**
 * Replaces hardcoded "1.54.0" in SessionStateRequestData (ub.dc.<init>)
 * with dynamic call to VersionBridge.getClientVersion().
 */
private fun BytecodePatchContext.spoofSessionStateRequestBodyVersion() {
    val dcClass = mutableClassDefByOrNull(SESSION_STATE_REQUEST_DATA_CLASS)
        ?: throw PatchException("Class $SESSION_STATE_REQUEST_DATA_CLASS not found")

    val initMethod = dcClass.methods.firstOrNull { method ->
        method.name == "<init>" &&
            method.parameterTypes.size == 4 &&
            method.implementation != null
    } ?: throw PatchException("Constructor $SESSION_STATE_REQUEST_DATA_CLASS.<init>(4 args) not found")

    val instructions = initMethod.implementation?.instructions
        ?: throw PatchException("Missing instructions in $SESSION_STATE_REQUEST_DATA_CLASS.<init>")

    val versionIndex = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.CONST_STRING &&
            (inst as? ReferenceInstruction)?.reference?.let {
                (it as? StringReference)?.string == "1.54.0"
            } == true
    }
    if (versionIndex < 0) {
        throw PatchException("Literal '1.54.0' not found in $SESSION_STATE_REQUEST_DATA_CLASS.<init>")
    }

    val reg = (instructions[versionIndex] as? OneRegisterInstruction)?.registerA ?: 0

    initMethod.addInstructions(
        versionIndex,
        """
        invoke-static {}, $VERSION_BRIDGE->getClientVersion()Ljava/lang/String;
        move-result-object v$reg
        """.trimIndent()
    )
    initMethod.removeInstruction(versionIndex + 2)
}

/**
 * Injects VersionBridge.init(this) immediately after super.onCreate in MainActivity.onCreate.
 */
private fun BytecodePatchContext.injectVersionBridgeInitialization() {
    val activityClass = mutableClassDefByOrNull(MAIN_ACTIVITY)
        ?: throw PatchException("MainActivity class $MAIN_ACTIVITY not found")

    val onCreateMethod = activityClass.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Method onCreate(Bundle) not found in $MAIN_ACTIVITY")

    val instructions = onCreateMethod.implementation?.instructions
        ?: throw PatchException("Missing instructions in $MAIN_ACTIVITY.onCreate")

    val superOnCreateIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_SUPER
    }
    val targetIndex = if (superOnCreateIndex >= 0) superOnCreateIndex + 1 else 0

    onCreateMethod.addInstructions(
        targetIndex,
        "invoke-static {p0}, $VERSION_BRIDGE->init(Landroid/content/Context;)V"
    )
}
