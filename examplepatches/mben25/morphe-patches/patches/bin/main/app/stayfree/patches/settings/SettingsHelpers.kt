package app.stayfree.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val R_STRING = "Lcom/burockgames/R\$string;"
internal const val SCREEN_TREE_NODE = "Lcom/burockgames/timeclocker/common/data/ScreenTreeNode;"
private const val SETTINGS_SEARCH = "Lapp/template/extension/stayfree/SettingsSearch;"

/**
 * Index of the `sget vX, R$string;->name:I` in [method]. Scanned on the current instructions
 * rather than taken from a fingerprint match: several patches edit the same composable, and a
 * match index goes stale as soon as another patch inserts code above it.
 */
internal fun MutableMethod.indexOfStringResource(name: String): Int =
    implementation!!.instructions.indexOfFirst {
        it.opcode == Opcode.SGET &&
            ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                field.definingClass == R_STRING && field.name == name
            }
    }.takeIf { it >= 0 } ?: throw PatchException("R.string.$name not found in $definingClass")

/**
 * Index of the settings row call that follows the `R.string.name` load:
 * `Lwt9;->b(Lp27;Ljy7;Lbe3;Ljava/lang/String;…Ljava/lang/String;…Lcj4;Lcj4;Le02;III)V` in
 * 20.16.1, a 19-argument (so always `/range`) static composable whose arguments 3 and 5 are the
 * title and summary.
 */
internal fun MutableMethod.indexOfSettingsRowCall(after: Int): Int {
    val instructions = implementation!!.instructions
    return (after until instructions.size).firstOrNull { index ->
        val instruction = instructions[index]
        if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@firstOrNull false
        val reference = (instruction as ReferenceInstruction).reference as MethodReference
        val parameters = reference.parameterTypes.map(CharSequence::toString)
        reference.returnType == "V" && parameters.size > 14 &&
            parameters[3] == "Ljava/lang/String;" && parameters[5] == "Ljava/lang/String;"
    } ?: throw PatchException("Settings row call not found in $definingClass")
}

/** Register holding argument [argument] of the range call at [index] (wide types take two). */
internal fun MutableMethod.rangeArgumentRegister(index: Int, argument: Int): Int {
    val call = implementation!!.instructions[index]
    val parameters = ((call as ReferenceInstruction).reference as MethodReference).parameterTypes
        .map(CharSequence::toString)
    var register = (call as RegisterRangeInstruction).startRegister
    for (i in 0 until argument) register += if (parameters[i] == "J" || parameters[i] == "D") 2 else 1
    return register
}

/**
 * Drops a whole settings row. A composable call is one self-contained group, so removing the
 * call leaves the caller's Compose groups balanced; the `remember`ed click lambda just above it
 * still runs and is simply never used.
 */
internal fun MutableMethod.removeSettingsRow(stringName: String) {
    replaceInstruction(indexOfSettingsRowCall(indexOfStringResource(stringName)), "nop")
}

/**
 * Settings search (top bar of the home screen) walks a `ScreenTreeNode` tree that mirrors the
 * drawer and the settings menus, and lists any node whose title matches. Removing a row from a
 * screen leaves its node in the tree, so the search would still offer it and navigate there.
 *
 * Filters the children list in the node constructor
 * `<init>(ILjava/lang/Integer;Lx85;Lve9;Ljava/util/List;)V`, which is `.locals 0`: no scratch
 * register. `p1` (the node's own title id) is dead once it has been stored into `titleResId`,
 * so the id to hide is loaded into it right after that `iput`. Children are built before their
 * parent, so the node is gone before the tree is ever read.
 */
internal fun hideFromSettingsSearch(screenTreeNodeConstructor: MutableMethod, stringName: String) {
    val titleStore = screenTreeNodeConstructor.implementation!!.instructions.indexOfFirst {
        it.opcode == Opcode.IPUT &&
            ((it as ReferenceInstruction).reference as FieldReference).name == "titleResId"
    }
    if (titleStore < 0) throw PatchException("ScreenTreeNode.titleResId store not found")

    screenTreeNodeConstructor.addInstructions(
        titleStore + 1,
        """
            sget p1, $R_STRING->$stringName:I
            invoke-static {p5, p1}, $SETTINGS_SEARCH->without(Ljava/util/List;I)Ljava/util/List;
            move-result-object p5
        """,
    )
}

/** The `ScreenTreeNode` primary constructor: (title, icon, image vector, screen, children). */
internal fun Iterable<MutableMethod>.screenTreeNodeConstructor(): MutableMethod = firstOrNull {
    val parameters = it.parameterTypes.map(CharSequence::toString)
    it.name == "<init>" && parameters.size == 5 &&
        parameters.first() == "I" && parameters.last() == "Ljava/util/List;"
} ?: throw PatchException("ScreenTreeNode constructor not found")
