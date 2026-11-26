package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.Locale

internal const val TAB_ICONS = "tab_icons"

/** Messenger traces the bar's render-info builder under this name, which is what the builder is found by. */
internal const val TAB_ICON_TRACE = "TabBarPresenter.createRenderInfo"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"

/** Every tab's code in the builder runs through its own plugin class, named for the tab it draws. */
private const val TAB_PLUGIN = "TabContentImplementation;"
private val KEY_SHAPE = Regex("[a-z][a-z0-9]{1,39}")

private const val TAB_ICONS_CLASS = "Lapp/hushmessenger/extension/TabIcons;"
internal const val PICK_TAB_ICON = "$TAB_ICONS_CLASS->tabIcon(${DRAWABLE}Ljava/lang/String;)$DRAWABLE"

private fun iconsChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the tab bar's icons no longer match the tested build ($detail)")

private fun Instruction.iconRef() = (this as? ReferenceInstruction)?.reference
private fun Method.iconCode() = implementation?.instructions?.toList().orEmpty()

/** The builder of every tab's render info: one method, found by the name Messenger traces it under. */
internal fun Method.isTabRenderInfo(): Boolean =
    iconCode().any { (it.iconRef() as? StringReference)?.string == TAB_ICON_TRACE }

internal fun findTabIcons(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isTabRenderInfo() }

/**
 * The icon holder the builder hands every tab description, taken from the description's own constructor
 * `(holder, content description, title, badge)`, the same one Hide tab labels is built on.
 */
private fun Method.iconHolderType(): String? = iconCode()
    .filter { it.opcode == Opcode.INVOKE_DIRECT || it.opcode == Opcode.INVOKE_DIRECT_RANGE }
    .mapNotNull { it.iconRef() as? MethodReference }
    .firstOrNull { call ->
        val params = call.parameterTypes.map { it.toString() }
        call.name == "<init>" && params.size == 4 && params[0].startsWith("L") &&
            params[1] == "Ljava/lang/String;" && params[2] == "Ljava/lang/String;" && params[3] == "Z"
    }?.parameterTypes?.get(0)?.toString()

/**
 * The tab a piece of the builder belongs to: the class nearest behind it whose name ends in the plugin suffix, since
 * every tab reaches its icon through its own plugin. The key is that class's name without the suffix, lowercased
 * ("inbox", "people", "mesetting"), so a tab Messenger adds later gets a key of its own with no table to keep.
 */
private fun List<Instruction>.tabKey(site: Int): String? {
    for (i in site downTo 0) {
        val type = when (val reference = this[i].iconRef()) {
            is FieldReference -> if (reference.type.endsWith(TAB_PLUGIN)) reference.type else reference.definingClass
            is MethodReference -> reference.definingClass
            is TypeReference -> reference.type
            else -> null
        }
        if (type?.endsWith(TAB_PLUGIN) != true) continue
        val simple = type.substring(type.lastIndexOf('/') + 1, type.length - 1)
        val key = simple.dropLast(TAB_PLUGIN.length - 1).lowercase(Locale.ROOT)
        return if (KEY_SHAPE.matches(key)) key else null
    }
    return null
}

/**
 * One tab's icon: where the holder is built, which register the drawable is in, which tab it draws, and the spare
 * register the tab's name is written into, which [validateTabIcons] fills in once it has proved one is free there.
 * With [pair], [scratch] is the first of two spare registers side by side: the drawable is copied into it, the name
 * goes in the next one, and the helper reads both as a range.
 */
internal data class TabIconSite(val at: Int, val register: Int, val key: String, val scratch: Int = -1, val pair: Boolean = false) {
    /** How many instructions the hook puts in front of the site. */
    val size get() = if (pair) 4 else 3
}

/**
 * Every place the builder wraps a tab's drawable in the icon holder. Both of the holder's factories take the drawable
 * first, so the sites are found by that signature rather than by their obfuscated names.
 */
internal fun Method.tabIconSites(): List<TabIconSite> {
    val holder = iconHolderType() ?: return emptyList()
    val code = iconCode()
    return code.indices.mapNotNull { i ->
        if (code[i].opcode != Opcode.INVOKE_STATIC) return@mapNotNull null
        val call = code[i].iconRef() as? MethodReference ?: return@mapNotNull null
        if (call.returnType != holder || call.parameterTypes.firstOrNull()?.toString() != DRAWABLE) return@mapNotNull null
        val registers = code[i] as? FiveRegisterInstruction ?: return@mapNotNull null
        val key = code.tabKey(i) ?: return@mapNotNull null
        TabIconSite(i, registers.registerC, key)
    }
}

/**
 * Every icon the bar builds, each one named for its tab. The drawable's own register carries the answer back, so it
 * holds a drawable before the call and a drawable after it, which is what keeps a site inside one of Messenger's own
 * try blocks safe to patch: the catch sees the register exactly as it would have. The tab's name needs a register of
 * its own, so each site takes one the method no longer reads, proved dead down every path out of the call, the
 * exceptional ones too. When every register the narrow call can reach is still read, as at 588's Close Friends tab,
 * the site takes two dead registers side by side anywhere in the frame and calls the helper as a range.
 */
internal fun MutableMethod.validateTabIcons(): List<TabIconSite> {
    if (!isTabRenderInfo()) iconsChanged("builder ${hookId()}")
    if (iconHolderType() == null) iconsChanged("icon holder in ${hookId()}")
    val code = iconCode()
    val holder = iconHolderType()
    val calls = code.indices.filter { i ->
        val call = code[i].iconRef() as? MethodReference
        code[i].opcode == Opcode.INVOKE_STATIC && call != null && call.returnType == holder &&
            call.parameterTypes.firstOrNull()?.toString() == DRAWABLE
    }
    if (calls.isEmpty()) iconsChanged("no icon is built in ${hookId()}")
    // A range call would put the drawable past the helper's reach, and a tab with no plugin has no name to store under.
    calls.firstOrNull { code[it] !is FiveRegisterInstruction }?.let { iconsChanged("an icon is built from a wide call") }
    calls.firstOrNull { code.tabKey(it) == null }?.let { iconsChanged("a tab's icon has no plugin of its own") }
    val flow = ReadFlow(this)
    val targets = jumpTargets()
    val frame = implementation?.registerCount ?: 0
    return tabIconSites().map { site ->
        val call = code[site.at] as FiveRegisterInstruction
        // The helper's call is four bits wide, so both of its registers have to be inside that reach.
        if (site.register > 15) iconsChanged("${site.key}'s drawable is out of reach")
        val others = listOf(call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount - 1)
        if (site.register in others) iconsChanged("${site.key}'s drawable is passed twice")
        if (code.getOrNull(site.at + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) iconsChanged("${site.key}'s icon is dropped")
        // A jump onto the call would reach the holder with the drawable the extension never saw.
        if (site.at in targets) iconsChanged("a jump lands on ${site.key}'s icon")
        val scratch = (0..minOf(15, frame - 1)).firstOrNull { it != site.register && flow.deadAt(site.at, it) }
        if (scratch != null) return@map site.copy(scratch = scratch)
        // The copy and the name are written with eight-bit destinations, so the pair has to start below 255.
        val pair = (0..minOf(254, frame - 2)).firstOrNull {
            it != site.register && it + 1 != site.register && flow.deadAt(site.at, it) && flow.deadAt(site.at, it + 1)
        } ?: iconsChanged("${site.key}'s icon has no register to spare")
        site.copy(scratch = pair, pair = true)
    }
}

/**
 * Each drawable goes through the extension on its way into the holder, with its tab's name alongside it, and the
 * answer comes back into the register the holder reads. Sites go in from the last backwards, so the ones still to come
 * keep the places they were found at.
 */
internal fun MutableMethod.injectTabIcons() {
    for (site in validateTabIcons().sortedByDescending { it.at }) {
        val smali = if (site.pair) """
            move-object/from16 v${site.scratch}, v${site.register}
            const-string v${site.scratch + 1}, "${site.key}"
            invoke-static/range {v${site.scratch} .. v${site.scratch + 1}}, $PICK_TAB_ICON
            move-result-object v${site.register}
        """ else """
            const-string v${site.scratch}, "${site.key}"
            invoke-static {v${site.register}, v${site.scratch}}, $PICK_TAB_ICON
            move-result-object v${site.register}
        """
        addInstructions(site.at, smali.trimIndent())
    }
}
