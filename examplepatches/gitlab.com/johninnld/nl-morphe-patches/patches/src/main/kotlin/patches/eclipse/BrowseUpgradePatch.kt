package patches.eclipse

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil
import patches.shared.exactMethod
import java.util.logging.Logger

private val log = Logger.getLogger("patches.eclipse")

private const val BROWSE_TREE = "Lnl/johninnl/eclipse/auto/tree/BrowseTree;"
private const val ORIGINAL = "morphe_eclipse_original"

/** A prologue the browse upgrade inserts: where it goes, and the instructions that run before the original code. */
internal data class BrowseHook(
    val name: String,
    val owner: String,
    val returnType: String,
    val parameters: List<String>,
    val prologue: String,
) {
    val descriptor get() = "$owner->$name(${parameters.joinToString("")})$returnType"
}

/**
 * `Lj16;->u(Lo36;Ljava/lang/String;ILu06;)Lai5;` is the app's children method. The extension answers
 * the ids it owns and returns null for the rest, which falls through to the shipped code unchanged.
 * The five registers p0..p4 are consecutive, so the range form works however high they sit.
 */
internal val CHILDREN_HOOK = BrowseHook(
    name = "u", owner = "Lj16;", returnType = "Lai5;",
    parameters = listOf("Lo36;", "Ljava/lang/String;", "I", "Lu06;"),
    prologue = """
        invoke-static/range {p0 .. p4}, $BROWSE_TREE->children(Lj16;Lo36;Ljava/lang/String;ILu06;)Lai5;
        move-result-object v0
        if-eqz v0, :$ORIGINAL
        return-object v0
    """.trimIndent(),
)

/**
 * `Lcm7;->d(Ljava/lang/String;Lp16;)V` plays a media id. Ids that start with `eclipse:` are the
 * extension's and are handled there; every other id continues into the shipped code.
 */
internal val PLAY_HOOK = BrowseHook(
    name = "d", owner = "Lcm7;", returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lp16;"),
    prologue = """
        invoke-static/range {p0 .. p1}, $BROWSE_TREE->play(Lcm7;Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :$ORIGINAL
        return-void
    """.trimIndent(),
)

internal val BROWSE_HOOKS = listOf(CHILDREN_HOOK, PLAY_HOOK)

/** Registers the method has beyond its parameters. The prologue needs one (v0) that nothing has used yet. */
private fun MutableMethod.localRegisters(): Int {
    val wide = parameterTypes.count { it.toString() == "J" || it.toString() == "D" }
    val isStatic = accessFlags and AccessFlags.STATIC.value != 0
    val parameterRegisters = parameterTypes.size + wide + (if (isStatic) 0 else 1)
    return implementation!!.registerCount - parameterRegisters
}

/** The library-result factory the app wraps every children answer in. */
internal const val RESULT_CALL = "Lx45;->c(Ljava/util/List;Lu06;)Lx45;"

/** The check task the app attaches to a children answer; its construction marks the call that matters. */
private const val VALIDATOR_TASK = "Le16;"

/** The extension's stand-in for [RESULT_CALL]: same arguments and result, cut to the host's page size first. */
internal const val PAGE_CALL = "$BROWSE_TREE->page(Ljava/util/List;Lu06;)Lx45;"

/** How far past the result call to look for the check task, within the same straight-line block. */
private const val SITE_WINDOW = 8

/** Where the app's children method wraps its answer, and the two registers (list, params) that call reads. */
internal data class ResultSite(val index: Int, val listRegister: Int, val paramsRegister: Int) {
    /** The call that takes its place: the same two registers, the same result register. */
    val replacement get() = "invoke-static {v$listRegister, v$paramsRegister}, $PAGE_CALL"
}

private fun isResultCall(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_STATIC) return false
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return ReferenceUtil.getMethodDescriptor(reference) == RESULT_CALL
}

private fun isNewValidator(instruction: Instruction): Boolean =
    instruction.opcode == Opcode.NEW_INSTANCE &&
        ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == VALIDATOR_TASK

private fun endsBlock(instruction: Instruction): Boolean = instruction.opcode in setOf(
    Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW,
)

/**
 * Find the one place the app's children method turns its answer into a library result and then
 * hands it to the page-size check: a call to [RESULT_CALL] that is followed, before the block ends,
 * by the construction of the check task. The method has two calls to the factory; the other (the
 * playback-resumption single item) returns without a check and is not a candidate. Anything other
 * than exactly one candidate, or a call that cannot be re-issued with the same registers, fails patching.
 */
internal fun findResultSite(instructions: List<Instruction>): ResultSite {
    val candidates = instructions.indices.filter { start ->
        isResultCall(instructions[start]) && run {
            var reached = false
            var next = start + 1
            while (next < instructions.size && next <= start + SITE_WINDOW && !reached) {
                if (isNewValidator(instructions[next])) reached = true
                if (endsBlock(instructions[next])) break
                next++
            }
            reached
        }
    }
    check(candidates.size == 1) {
        "Expected exactly one $RESULT_CALL feeding the page-size check, found ${candidates.size}"
    }
    val call = instructions[candidates.single()] as? FiveRegisterInstruction
    check(call != null && call.registerCount == 2 && call.registerC <= 15 && call.registerD <= 15) {
        "The $RESULT_CALL call cannot be re-issued with the same two registers"
    }
    return ResultSite(candidates.single(), call.registerC, call.registerD)
}

/**
 * Insert each hook's prologue at the very start of its method, and route the app's own answers
 * through the page cut. Every hook must resolve to exactly one method (exact owner, name, return type
 * and parameters), the method must have a local register to use before anything has written to it,
 * and the result call must be found exactly once, or patching fails. The prologue only returns early
 * for ids the extension owns; the result call takes the same arguments and returns the same type, and
 * hands the list on untouched when it fits the page size. Returns the descriptors hooked.
 */
context(context: BytecodePatchContext)
internal fun injectBrowseHooks(): List<String> = BROWSE_HOOKS.flatMap { hook ->
    val method = exactMethod(hook.owner, hook.name, hook.returnType, *hook.parameters.toTypedArray()).method
    check(method.implementation != null) { "${hook.descriptor} has no code to hook" }
    check(method.localRegisters() >= 1) { "${hook.descriptor} has no free register for the prologue" }
    val hooked = mutableListOf<String>()
    if (hook === CHILDREN_HOOK) {
        // First, while the instruction indices are still the app's own.
        val site = findResultSite(method.instructions)
        method.replaceInstruction(site.index, site.replacement)
        hooked += "${hook.descriptor} result call $RESULT_CALL -> $PAGE_CALL"
    }
    method.addInstructionsWithLabels(0, hook.prologue, ExternalLabel(ORIGINAL, method.getInstruction(0)))
    hooked += hook.descriptor
    hooked
}

@Suppress("unused")
val eclipseBrowseUpgrade = bytecodePatch(
    name = "Android Auto browse upgrade",
    description = "Experimental: not yet confirmed on a classic media browser. Gives Eclipse Music's existing media browser (what hosts without templates show) the same " +
        "layout as the templated app: Home in the phone's order (Umbra DJ, mixes, linked playlists, Your Shows; no See all), Discover, Library and Radio, a non-destructive Up Next, lists (Eclipse's own " +
        "included) that never exceed the host's page size, and a tree that refreshes when the queue changes. " +
        "Eclipse's own ids, playback resumption and queue stay as they are. Works on its own or with the templated app.",
    default = true,
) {
    compatibleWith(eclipse)
    // The same extension and queue signals as the templated app; applied once whichever patches are chosen.
    dependsOn(eclipseBase, eclipseAutoExtension)
    execute {
        val hooked = injectBrowseHooks()
        log.info("Eclipse Music browse upgrade: ${BROWSE_HOOKS.size} of ${BROWSE_HOOKS.size} prologues inserted and " +
            "1 of 1 result call routed through the page cut, each matched exactly once")
        hooked.forEach { log.info("Eclipse Music browse upgrade hooked $it") }
    }
}
