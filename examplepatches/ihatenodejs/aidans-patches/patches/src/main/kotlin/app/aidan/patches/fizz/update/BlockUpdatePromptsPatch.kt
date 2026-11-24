package app.aidan.patches.fizz.update

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.aidan.patches.fizz.shared.fizzTargets
import app.aidan.patches.shared.disableRequiredVoidMethods
import app.aidan.patches.shared.returnRequiredBoolean
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val MAIN_ACTIVITY = "Lcom/fizzsocial/fizz/MainActivity;"
private const val VERSION_BRIDGE = "Lapp/aidan/extension/fizz/VersionBridge;"

/**
 * Update-gate and version-spoofing targets for one supported Fizz build.
 *
 * [updateFlagField] is the `isAppUpdateRequired` flag of the onboarding UI state, [wireVersion]
 * and [wireBuildNumber] are the literals the client actually sends, which is what the bridge
 * spoofs at runtime.
 */
private data class UpdateTargets(
    val sessionState: String,
    val sessionOutdatedMethod: String,
    val versionComparator: String,
    val versionComparatorMethod: String,
    val onboardingUiState: String,
    val updateFlagField: String,
    val onboardingScreen: String,
    val updatePrompt: String,
    val okhttpInterceptor: String,
    val okhttpInterceptorMethod: String,
    val sessionRequestData: String,
    val wireVersion: String,
    val wireBuildNumber: String,
)

private val UPDATE_TARGETS_1_54_0 = UpdateTargets(
    sessionState = "Lnc/j0;",
    sessionOutdatedMethod = "d",
    versionComparator = "Lnc/c;",
    versionComparatorMethod = "b",
    onboardingUiState = "Lge/u1;",
    updateFlagField = "l0",
    onboardingScreen = "Lge/r1;",
    updatePrompt = "Lkd/o1;",
    okhttpInterceptor = "Lic/g;",
    okhttpInterceptorMethod = "a",
    sessionRequestData = "Lub/dc;",
    wireVersion = "1.54.0",
    wireBuildNumber = "400032",
)

private val UPDATE_TARGETS_1_72_0 = UpdateTargets(
    sessionState = "Ltc/s0;",
    sessionOutdatedMethod = "m",
    versionComparator = "Ltc/c;",
    versionComparatorMethod = "d",
    onboardingUiState = "Lse/h2;",
    updateFlagField = "K0",
    onboardingScreen = "Lse/d2;",
    updatePrompt = "Ltd/a2;",
    okhttpInterceptor = "Lnc/i;",
    okhttpInterceptorMethod = "a",
    sessionRequestData = "Lub/id;",
    wireVersion = "1.72.0",
    wireBuildNumber = "465123",
)

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
        val targets = fizzTargets("1.54.0" to UPDATE_TARGETS_1_54_0, "1.72.0" to UPDATE_TARGETS_1_72_0)

        // Layer 1: SessionState Outdated Check Bypass
        returnRequiredBoolean(targets.sessionState, targets.sessionOutdatedMethod, false)

        // Layer 2: Semantic Version Comparator Bypass
        returnRequiredBoolean(targets.versionComparator, targets.versionComparatorMethod, false)

        // Layer 3: Onboarding UI State Field Neutralization
        neutralizeOnboardingUiStateUpdateField(targets)

        // Layer 4: Onboarding Screen Update Branch Neutralization
        neutralizeOnboardingScreenUpdateBranch(targets)

        // Layer 5: Update Prompt Composable Stubbing
        disableRequiredVoidMethods(targets.updatePrompt, "a")

        // Layer 6: OkHttp Header Interceptor Dynamic Version Spoofing
        spoofOkHttpHeaderVersions(targets)

        // Layer 7: Session State Request Body DTO Spoofing
        spoofSessionStateRequestBodyVersion(targets)

        // Layer 8: Lifecycle Bridge Initialization (MainActivity.onCreate)
        injectVersionBridgeInitialization()
    }
}

/**
 * Ensures the onboarding UI state's isAppUpdateRequired flag is always initialized to false.
 */
private fun BytecodePatchContext.neutralizeOnboardingUiStateUpdateField(targets: UpdateTargets) {
    val stateClass = mutableClassDefByOrNull(targets.onboardingUiState)
        ?: throw PatchException("Class ${targets.onboardingUiState} not found")

    // The flag is written once, in the primary constructor.
    val writers = stateClass.methods.mapNotNull { method ->
        val instructions = method.implementation?.instructions ?: return@mapNotNull null
        val index = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IPUT_BOOLEAN && instruction.isUpdateFlagWrite(targets.updateFlagField)
        }
        if (index >= 0) method to index else null
    }
    if (writers.size != 1) {
        throw PatchException(
            "Expected exactly one IPUT_BOOLEAN of ${targets.onboardingUiState}->${targets.updateFlagField}:Z, " +
                "found ${writers.size}"
        )
    }

    val (initMethod, iputIndex) = writers.single()
    val iputInst = initMethod.implementation?.instructions?.get(iputIndex) as? TwoRegisterInstruction
        ?: throw PatchException(
            "Instruction at index $iputIndex in ${targets.onboardingUiState}->${initMethod.name} is not TwoRegisterInstruction"
        )

    initMethod.addInstructions(iputIndex, "const/4 v${iputInst.registerA}, 0x0")
}

/**
 * Ensures the onboarding screen's update check always reads false, so the update prompt is never
 * composed.
 */
private fun BytecodePatchContext.neutralizeOnboardingScreenUpdateBranch(targets: UpdateTargets) {
    val screenClass = mutableClassDefByOrNull(targets.onboardingScreen)
        ?: throw PatchException("Class ${targets.onboardingScreen} not found")

    val readers = screenClass.methods.mapNotNull { method ->
        val instructions = method.implementation?.instructions ?: return@mapNotNull null
        val index = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IGET_BOOLEAN && instruction.isUpdateFlagRead(targets.updateFlagField)
        }
        if (index >= 0) method to index else null
    }
    if (readers.size != 1) {
        throw PatchException(
            "Expected exactly one IGET_BOOLEAN of ${targets.onboardingUiState}->${targets.updateFlagField}:Z " +
                "in ${targets.onboardingScreen}, found ${readers.size}"
        )
    }

    val (composableMethod, igetIndex) = readers.single()
    val igetInst = composableMethod.implementation?.instructions?.get(igetIndex) as? TwoRegisterInstruction
        ?: throw PatchException(
            "Instruction at index $igetIndex in ${targets.onboardingScreen}->${composableMethod.name} " +
                "is not TwoRegisterInstruction"
        )

    composableMethod.replaceInstruction(igetIndex, "const/4 v${igetInst.registerA}, 0x0")
}

/**
 * Replaces the hardcoded client version and build number in the OkHttp request headers with
 * dynamic calls to VersionBridge.
 */
private fun BytecodePatchContext.spoofOkHttpHeaderVersions(targets: UpdateTargets) {
    val interceptorClass = mutableClassDefByOrNull(targets.okhttpInterceptor)
        ?: throw PatchException("Class ${targets.okhttpInterceptor} not found")

    val interceptorMethod = interceptorClass.methods.firstOrNull {
        it.name == targets.okhttpInterceptorMethod && it.implementation != null
    } ?: throw PatchException("Method ${targets.okhttpInterceptor}->${targets.okhttpInterceptorMethod} not found")

    substituteWireLiteral(
        method = interceptorMethod,
        literal = targets.wireVersion,
        bridgeMethod = "getClientVersion",
        context = "${targets.okhttpInterceptor}->${targets.okhttpInterceptorMethod}"
    )
    substituteWireLiteral(
        method = interceptorMethod,
        literal = targets.wireBuildNumber,
        bridgeMethod = "getBuildNumber",
        context = "${targets.okhttpInterceptor}->${targets.okhttpInterceptorMethod}"
    )
}

/**
 * Replaces the hardcoded client version in the session state request body DTO with a dynamic call
 * to VersionBridge.
 */
private fun BytecodePatchContext.spoofSessionStateRequestBodyVersion(targets: UpdateTargets) {
    val requestDataClass = mutableClassDefByOrNull(targets.sessionRequestData)
        ?: throw PatchException("Class ${targets.sessionRequestData} not found")

    // The client version is assigned in a single constructor of the DTO.
    val constructors = requestDataClass.methods.filter { it.name == "<init>" && it.implementation != null }
    val candidates = constructors.mapNotNull { method ->
        val instructions = method.implementation?.instructions ?: return@mapNotNull null
        val index = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING && instruction.stringValue == targets.wireVersion
        }
        if (index >= 0) method to index else null
    }
    if (candidates.size != 1) {
        throw PatchException(
            "Expected exactly one constructor of ${targets.sessionRequestData} holding the wire version " +
                "\"${targets.wireVersion}\", found ${candidates.size}"
        )
    }

    val (initMethod, versionIndex) = candidates.single()
    val reg = (initMethod.implementation?.instructions?.get(versionIndex) as? OneRegisterInstruction)?.registerA
        ?: throw PatchException(
            "Instruction at index $versionIndex in ${targets.sessionRequestData}-><init> is not OneRegisterInstruction"
        )

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

/**
 * Replaces the single hardcoded wire literal in [method] with a bridge call, so the client stops
 * advertising its real version.
 */
private fun BytecodePatchContext.substituteWireLiteral(
    method: MutableMethod,
    literal: String,
    bridgeMethod: String,
    context: String
) {
    val indices = method.implementation?.instructions?.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.CONST_STRING && instruction.stringValue == literal) index else null
    } ?: throw PatchException("Missing instructions in $context")

    if (indices.size != 1) {
        throw PatchException(
            "Expected exactly one literal \"$literal\" in $context, found ${indices.size}"
        )
    }

    val constIndex = indices.single()
    val reg = (method.implementation?.instructions?.get(constIndex) as? OneRegisterInstruction)?.registerA
        ?: throw PatchException("Instruction at index $constIndex in $context is not OneRegisterInstruction")

    method.addInstructions(
        constIndex,
        """
        invoke-static {}, $VERSION_BRIDGE->$bridgeMethod()Ljava/lang/String;
        move-result-object v$reg
        """.trimIndent()
    )
    method.removeInstruction(constIndex + 2)
}

private val Instruction.stringValue: String?
    get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.isUpdateFlagWrite(field: String) = opcode == Opcode.IPUT_BOOLEAN && fieldReferenceMatches(field)

private fun Instruction.isUpdateFlagRead(field: String) = opcode == Opcode.IGET_BOOLEAN && fieldReferenceMatches(field)

private fun Instruction.fieldReferenceMatches(field: String) = (this as? ReferenceInstruction)?.reference?.let { ref ->
    (ref as? FieldReference)?.let { it.name == field && it.type == "Z" }
} == true
