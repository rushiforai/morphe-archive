package app.template.patches.sofascore.misc.animations

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.ads.RELEASE_APP_CLASS
import app.template.patches.sofascore.controls.SOFASCORE_ANIMATION_SPEED
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/**
 * The two "Animation speed" switches. The Patch settings registry only has on/off switches, so
 * the three-way choice (stock / faster / off) is two switches, and "No animations" wins when
 * both are on. Both start off (stock) and are read once per process.
 */
internal val ANIMATION_FEATURES: List<HevalFeature> = listOf(
    HevalFeature(
        id = "sofascore.animations_off",
        name = "No animations",
        description = "Turns off animations and screen transitions.",
        category = SofascoreControlsCategory.PERFORMANCE,
        default = false,
        restartRequired = true,
        icon = "play",
        choice = "Animation speed",
    ),
    HevalFeature(
        id = "sofascore.animations_fast",
        name = "Faster animations",
        description = "Plays animations twice as fast.",
        category = SofascoreControlsCategory.PERFORMANCE,
        default = false,
        restartRequired = true,
        icon = "play",
        choice = "Animation speed",
    ),
)

/** The framework read every animation-scale consumer in the app goes through. */
private val GLOBAL_GET_FLOAT = ImmutableMethodReference(
    "Landroid/provider/Settings\$Global;",
    "getFloat",
    listOf("Landroid/content/ContentResolver;", "Ljava/lang/String;", "F"),
    "F",
)

/** The same signature on the extension: scales only "animator_duration_scale". */
private val EXTENSION_GET_FLOAT = ImmutableMethodReference(
    SOFASCORE_ANIMATION_SPEED,
    "getFloat",
    listOf("Landroid/content/ContentResolver;", "Ljava/lang/String;", "F"),
    "F",
)

private const val EXTENSION_PACKAGE = "Lapp/template/extension/"

/** ReleaseApp (the manifest Application class, unobfuscated): its framework onCreate()V. */
internal object ReleaseAppOnCreateFingerprint : Fingerprint(
    definingClass = RELEASE_APP_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

private fun MethodReference.isGlobalGetFloat() =
    definingClass == GLOBAL_GET_FLOAT.definingClass && name == GLOBAL_GET_FLOAT.name &&
        returnType == GLOBAL_GET_FLOAT.returnType &&
        parameterTypes.map(CharSequence::toString) == GLOBAL_GET_FLOAT.parameterTypes

// Several Heval Controls features in one patch (like Hide match tabs), registered once every site
// is patched.
@Suppress("unused")
val animationSpeedPatch = bytecodePatch(
    name = "Animation speed",
    description = "Adds switches to turn off or speed up animations.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch)

    execute {
        // The host's entry patch merges extensions/sofascore.mpe; fail loudly if the class is missing.
        classDefBy(SOFASCORE_ANIMATION_SPEED)

        // Validate every site before the first edit.
        val onCreate = ReleaseAppOnCreateFingerprint.method
        onCreate.requireNoBranchTargetAt(0, "Animation speed init")

        // Every app call to Settings.Global.getFloat(ContentResolver, String, float): Compose's
        // motion duration scale, the Material progress indicators, Lottie and a few SDKs, all
        // reading "animator_duration_scale" (12 methods in 26.10.19). Found by the framework
        // reference, so R8 renames do not matter. The extension's own call is left alone.
        val owners = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
            val calls = classDef.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.isGlobalGetFloat() == true
                } == true
            }
            if (calls) owners += classDef
        }
        if (owners.isEmpty()) throw PatchException("Animation speed: no Settings.Global.getFloat call found")

        // 1. Application.onCreate starts with AnimationSpeed.init(this): it reads the switches and,
        // while one is on, scales ValueAnimator's duration scale and registers the transitions hook.
        onCreate.addInstructionsChecked(
            0,
            "invoke-static/range {p0 .. p0}, $SOFASCORE_ANIMATION_SPEED->init(Landroid/app/Application;)V",
        )

        // 2. Each getFloat call becomes the extension's getFloat with the same registers. The
        // extension passes every value through while both switches are off.
        var redirected = 0
        owners.forEach { owner ->
            mutableClassDefBy(owner).methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                implementation.instructions.toList().forEachIndexed { index, insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref?.isGlobalGetFloat() != true) return@forEachIndexed
                    val replacement = when (insn.opcode) {
                        Opcode.INVOKE_STATIC -> (insn as FiveRegisterInstruction).let {
                            BuilderInstruction35c(
                                Opcode.INVOKE_STATIC, it.registerCount,
                                it.registerC, it.registerD, it.registerE, it.registerF, it.registerG,
                                EXTENSION_GET_FLOAT,
                            )
                        }
                        Opcode.INVOKE_STATIC_RANGE -> (insn as RegisterRangeInstruction).let {
                            BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, it.startRegister, it.registerCount, EXTENSION_GET_FLOAT)
                        }
                        else -> throw PatchException("Animation speed: unexpected ${insn.opcode} to getFloat in ${method.definingClass}->${method.name}")
                    }
                    implementation.replaceInstruction(index, replacement)
                    redirected++
                }
            }
        }
        if (redirected == 0) throw PatchException("Animation speed: no getFloat call was redirected")

        ANIMATION_FEATURES.forEach { sofascoreControls.register(it) }
    }
}
