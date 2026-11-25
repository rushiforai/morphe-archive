/*
 * Written for HushPinterest (Pinterest), 2026, after the settings logo long press in
 * https://github.com/SysAdminDoc/Hushfacebook (GPL-3.0).
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.pinterest.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.mutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The R field naming the home feed's greeting header, the bar the Pinterest logo sits in. This
 * build reads ids from R rather than inlining them, and the logo's own id is only in the layout.
 */
internal const val GREETING_HEADER_ID = "home_feed_greeting_header_view"

/** What gets the header once Pinterest has found it. */
internal const val GREETING_HEADER_HOOK = "$ENTRY->onGreetingHeader(Landroid/view/View;)V"

private const val FIND_VIEW = "Landroid/view/View;->findViewById(I)Landroid/view/View;"

/** Where Pinterest finds the greeting header: the hook goes in at [index], passing the header in [register]. */
internal class HeaderSite(val method: Method, val index: Int, val register: Int)

private fun Instruction.readsHeaderId(): Boolean {
    if (opcode != Opcode.SGET) return false
    val field = (this as ReferenceInstruction).reference as? FieldReference ?: return false
    return field.name == GREETING_HEADER_ID && field.type == "I"
}

/**
 * Every place Pinterest finds the greeting header: the R field read, `findViewById` with it, then
 * `move-result-object`. In 14.39.0 that's the header controller's bind, the only method reading
 * the field. No Pinterest call changes, since the logo has no listener of its own to stand in for.
 */
internal fun BytecodePatchContext.greetingHeaderSites(): List<HeaderSite> {
    val sites = mutableListOf<HeaderSite>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.forEach { method ->
            val body = method.instructions()
            body.indices.filter { body[it].readsHeaderId() }.mapNotNullTo(sites) { headerFoundAt(method, body, it) }
        }
    }
    return sites
}

private fun headerFoundAt(method: Method, body: List<Instruction>, at: Int): HeaderSite? {
    val find = body.getOrNull(at + 1) as? FiveRegisterInstruction ?: return null
    if (find.opcode != Opcode.INVOKE_VIRTUAL || (find as ReferenceInstruction).reference.toString() != FIND_VIEW ||
        find.registerCount != 2 || find.registerD != (body[at] as OneRegisterInstruction).registerA) return null
    val kept = body.getOrNull(at + 2)
    if (kept?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    return HeaderSite(method, at + 3, (kept as OneRegisterInstruction).registerA)
}

/**
 * Hands the greeting header to [GREETING_HEADER_HOOK] right after Pinterest finds it, so a long
 * press on the Pinterest logo opens the HushPinterest screen. Answers false and changes nothing
 * when this build doesn't find the header exactly once that way: the logo then stays as it was,
 * and the icon shortcut and App info still open the screen.
 */
internal fun BytecodePatchContext.hookLogoLongPress(): Boolean {
    val sites = greetingHeaderSites()
    val site = sites.singleOrNull() ?: run {
        patchLog.warning("HushPinterest settings: ${sites.size} places find the home feed header, so the Pinterest logo doesn't open the settings")
        return false
    }
    val method = mutable(site.method)
    // The header is only in its register on the path from findViewById.
    if ((method.implementation!!.instructions[site.index] as BuilderInstruction).location.labels.isNotEmpty()) {
        patchLog.warning("HushPinterest settings: ${site.method.definingClass}->${site.method.name} branches past the home feed header, so the Pinterest logo doesn't open the settings")
        return false
    }
    method.addInstruction(site.index, "invoke-static/range { v${site.register} .. v${site.register} }, $GREETING_HEADER_HOOK")
    return true
}

/** Pinterest's bottom bar, by its class name, which the obfuscator keeps. */
internal const val BOTTOM_BAR = "Lcom/pinterest/navigation/view/FloatingBottomNavBar;"

/** What each bottom bar tab's long press goes through: Pinterest's listener in, the one to set out. */
internal const val TAB_PRESS_HOOK =
    "$ENTRY->onTabLongPress(Landroid/view/View\$OnLongClickListener;)Landroid/view/View\$OnLongClickListener;"

private const val SET_ID = "Landroid/view/View;->setId(I)V"
private const val LONG_PRESS_LISTENER = "Landroid/view/View\$OnLongClickListener;"

/** Where the bottom bar gives a tab its long press: the hook goes in at [index], on the listener in [register]. */
internal class TabPressSite(val method: Method, val index: Int, val register: Int)

private fun Instruction.setsLongPress(): Boolean {
    if (opcode != Opcode.INVOKE_INTERFACE && opcode != Opcode.INVOKE_VIRTUAL) return false
    val called = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    return called.name == "setOnLongClickListener" && called.returnType == "V" &&
        called.parameterTypes.map { it.toString() } == listOf(LONG_PRESS_LISTENER) &&
        (this as FiveRegisterInstruction).registerCount == 2
}

/**
 * Every place the bottom bar gives a tab its id and then its long press. In 14.45.0 that's the
 * method that builds each tab and the one that builds a tab again in its place, each once.
 */
internal fun BytecodePatchContext.tabPressSites(): List<TabPressSite> {
    val bar = classDefByOrNull(BOTTOM_BAR) ?: return emptyList()
    return bar.methods.flatMap { method ->
        val body = method.instructions()
        val idAt = body.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == SET_ID }
        if (idAt < 0) return@flatMap emptyList()
        body.indices.filter { it > idAt && body[it].setsLongPress() }
            .map { TabPressSite(method, it, (body[it] as FiveRegisterInstruction).registerD) }
    }
}

/**
 * Passes Pinterest's listener for each bottom bar tab's long press through [TAB_PRESS_HOOK], so a
 * long press on the Home tab opens the HushPinterest screen (#48). Pinterest's own Home long press
 * only logs the press, and every other tab keeps Pinterest's, since the extension tells Home by
 * the id the tab was just given. Answers false and changes nothing when this build gives no tab a
 * long press that way.
 */
internal fun BytecodePatchContext.hookHomeTabLongPress(): Boolean {
    val sites = tabPressSites()
    if (sites.isEmpty()) {
        patchLog.warning("HushPinterest settings: no place gives a bottom bar tab its long press, so the Home tab doesn't open the settings")
        return false
    }
    // Last first within a method, so an earlier site's index still points at its call.
    sites.sortedByDescending { it.index }.forEach { site ->
        val r = site.register
        mutable(site.method).addInstructions(
            site.index,
            """
                invoke-static/range { v$r .. v$r }, $TAB_PRESS_HOOK
                move-result-object v$r
            """,
        )
    }
    return true
}
