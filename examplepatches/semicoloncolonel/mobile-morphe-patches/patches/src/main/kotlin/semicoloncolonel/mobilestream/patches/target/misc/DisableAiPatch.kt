package semicoloncolonel.mobilestream.patches.target.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.shared.misc.AI_FILTER
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.hasSignature
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate
import semicoloncolonel.mobilestream.patches.target.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Disable AI (OPT-IN, default OFF).
//
// Target 2026.43.0 declares each boolean feature flag as an object of one
// (obfuscated) flag class, with the key, a default page id and a default
// value. Flags are read through a flag reader interface, (flag, page id) ->
// value, whose main implementation is the Sapphire experiment client. It can
// return a value without calling the flag's own parser, and it has a second,
// boolean reader that takes any flag. All three are gated: the AI flags in
// AiFeatureFilter.isTargetAiKey read as off. Those are Ask Target
// (target_on_platform_agent: the AI shopping agent and AI mode in search),
// the conversational gift finder and its banner, generative replies in
// support chat, and the AI shopping list scanner.
//
// The Ask Target button in the search bar is drawn by one composable,
// whatever turns it on. Every call to it is replaced with a call that draws
// nothing, so the button is gone wherever the app would show it.
//
// Not covered: AI review summaries, which come with the product data rather
// than behind a flag.
// ─────────────────────────────────────────────────────────────────────────────

// The flag class constructor (key, defaultPageId, default, mask) checks its
// "defaultPageId" argument by name.
internal object BooleanFlagConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z", "I"),
    returnType = "V",
    strings = listOf("key", "defaultPageId"),
)

// The Ask Target button: (onClick, modifier, feature type, composer, changed, defaults).
// The feature type is Target's own, unobfuscated enum.
internal object AskTargetButtonFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Landroidx/compose/ui/Modifier;",
        "Lcom/target/firefly/schema/FeatureType;",
        "Landroidx/compose/runtime/Composer;",
        "I",
        "I",
    ),
    strings = listOf("onClick", "animator_duration_scale"),
)

private const val SKIP_BUTTON = "$AI_FILTER->skipTargetAskTargetButton(" +
    "Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V"

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off Ask Target, AI mode in search, and Target's other AI shopping tools.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val flagClass = BooleanFlagConstructorFingerprint.classDef.type

        // The parser: (String raw) -> Boolean. Its key comes from getKey().
        val gated = forEachMatchingMethod(
            { it.type == flagClass },
            { it.hasSignature("Ljava/lang/Boolean;", "Ljava/lang/String;") },
        ) { method ->
            method.prependGate(
                """
                    invoke-virtual { p0 }, $flagClass->getKey()Ljava/lang/String;
                    move-result-object v0
                    invoke-static { v0 }, $AI_FILTER->isTargetAiKey(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :msp_orig
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                """.trimIndent(),
            )
        }
        if (gated != 1) throw PatchException("Target flag parser not found ($gated)")

        // The flag readers: every implemented (flag base class, String) -> Object method. The
        // gate needs two locals: one for the flag, one for the type check.
        val flagBase = BooleanFlagConstructorFingerprint.classDef.superclass
            ?: throw PatchException("Target flag base class not found")
        val readers = forEachMatchingMethod(
            { !AccessFlags.INTERFACE.isSet(it.accessFlags) },
            { method ->
                !AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.hasSignature("Ljava/lang/Object;", flagBase, "Ljava/lang/String;") &&
                    (method.implementation?.registerCount ?: 0) >= 5
            },
        ) { method ->
            method.prependGate(
                """
                    move-object/from16 v0, p1
                    instance-of v1, v0, $flagClass
                    if-eqz v1, :msp_orig
                    check-cast v0, $flagClass
                    invoke-virtual { v0 }, $flagClass->getKey()Ljava/lang/String;
                    move-result-object v0
                    invoke-static { v0 }, $AI_FILTER->isTargetAiKey(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :msp_orig
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                """.trimIndent(),
            )
        }
        if (readers == 0) throw PatchException("Target flag readers not found")

        // The boolean reader: (flag root class, String) -> Z. It takes any flag, so the
        // extension reads the key from the flag itself. One local is enough for this gate.
        val flagRoot = classDefBy(flagBase).superclass
            ?: throw PatchException("Target flag root class not found")
        val booleanReaders = forEachMatchingMethod(
            { !AccessFlags.INTERFACE.isSet(it.accessFlags) },
            { method ->
                !AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.hasSignature("Z", flagRoot, "Ljava/lang/String;") &&
                    (method.implementation?.registerCount ?: 0) >= 4
            },
        ) { method ->
            method.prependGate(
                """
                    invoke-static/range { p1 .. p1 }, $AI_FILTER->isTargetAiFlag(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :msp_orig
                    const/4 v0, 0x0
                    return v0
                """.trimIndent(),
            )
        }
        if (booleanReaders == 0) throw PatchException("Target boolean flag readers not found")

        // Calls to the Ask Target button composable draw nothing instead.
        val button = AskTargetButtonFingerprint.method
        val isButtonCall = { instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction ->
            (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                ((instruction as ReferenceInstruction).reference as? MethodReference)?.let {
                    it.definingClass == button.definingClass && it.name == button.name &&
                        it.parameterTypes.map { type -> type.toString() } == button.parameterTypes.map { type -> type.toString() }
                } == true
        }
        val callers = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method -> method.implementation?.instructions?.any(isButtonCall) == true }) {
                callers += classDef.type
            }
        }
        var skipped = 0
        callers.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    if (!isButtonCall(instruction)) return@forEachIndexed
                    val smali = when (instruction) {
                        is RegisterRangeInstruction -> {
                            val last = instruction.startRegister + instruction.registerCount - 1
                            "invoke-static/range { v${instruction.startRegister} .. v$last }, $SKIP_BUTTON"
                        }
                        is FiveRegisterInstruction -> throw PatchException("Unexpected short call to the Ask Target button")
                        else -> return@forEachIndexed
                    }
                    method.replaceInstruction(index, smali)
                    skipped++
                }
            }
        }
        if (skipped == 0) throw PatchException("No calls to the Ask Target button found")
    }
}
