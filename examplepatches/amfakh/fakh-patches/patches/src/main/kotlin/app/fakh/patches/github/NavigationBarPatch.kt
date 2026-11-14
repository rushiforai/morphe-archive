package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val NAVIGATION_BAR = "Lapp/fakh/extension/github/NavigationBar;"

/**
 * The method that draws one tab of the portrait bottom bar, which tags it "BottomNavigationItem_<label>". The tag is
 * a string, so it survives R8 where the class and method names do not. The same class holds the whole bar.
 */
private object NavigationItemFingerprint : Fingerprint(strings = listOf("BottomNavigationItem_"))

/** A static call with a register range: its index in the method, the first register, and its parameter types. */
private class RangeCall(val index: Int, val start: Int, val parameters: List<String>, val callee: String)

/** The first call in the method to a static method whose parameter types satisfy [matches]. */
private fun MutableMethod.rangeCall(matches: (List<String>) -> Boolean): RangeCall? {
    implementation!!.instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@forEachIndexed
        val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: return@forEachIndexed
        val parameters = reference.parameterTypes.map(CharSequence::toString)
        if (matches(parameters)) return RangeCall(index, (instruction as RegisterRangeInstruction).startRegister, parameters, reference.definingClass)
    }
    return null
}

/**
 * The call that draws one tab: NavigationBarItem(selected, onClick, icon, modifier, onLongClick, label: String,
 * enabled, label composable, alwaysShowLabel, interactionSource, colors, ...).
 */
private fun MutableMethod.tabCall(): RangeCall = rangeCall {
    it.size >= 11 && it[0] == "Z" && it[5] == "Ljava/lang/String;" && it[6] == "Z" && it[7].startsWith("L") && it[8] == "Z"
} ?: throw PatchException("Tab composable call not found")

/**
 * The landscape bar, a NavigationRail whose composable has the very same parameter types as the portrait
 * NavigationBar (modifier, containerColor, contentColor, windowInsets, content, composer, changed) but lives in
 * another class: the one static method that calls it. Null when the app has no such call.
 */
private fun BytecodePatchContext.railCall(portrait: RangeCall): Pair<MutableMethod, RangeCall>? {
    fun Method.callsRail() = implementation!!.instructions.any {
        it.opcode == Opcode.INVOKE_STATIC_RANGE && (it as ReferenceInstruction).reference.let { reference ->
            reference is MethodReference && reference.definingClass != portrait.callee &&
                reference.parameterTypes.map(CharSequence::toString) == portrait.parameters
        }
    }
    val found = mutableListOf<Pair<String, String>>()
    classDefForEach { classDef ->
        for (method in classDef.methods) {
            if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.implementation == null) continue
            if (method.callsRail()) found += classDef.type to method.name
        }
    }
    if (found.isEmpty()) return null
    if (found.size > 1) throw PatchException("More than one NavigationRail call: $found")
    val (type, name) = found.single()
    val method = mutableClassDefBy(type).methods.first { candidate ->
        candidate.name == name && candidate.implementation != null &&
            candidate.rangeCall { it == portrait.parameters } != null
    }
    return method to method.rangeCall { it == portrait.parameters }!!
}

/** The method of the bar's class that calls NavigationBar(modifier, containerColor: J, contentColor: J, windowInsets, content, ...). */
private fun BytecodePatchContext.barCall(): Pair<MutableMethod, RangeCall> {
    for (method in mutableClassDefBy(NavigationItemFingerprint.method.definingClass).methods) {
        if (method.implementation == null) continue
        val call = method.rangeCall { it.size == 7 && it[1] == "J" && it[2] == "J" } ?: continue
        return method to call
    }
    throw PatchException("NavigationBar call not found")
}

@Suppress("unused")
val navigationBarPatch = bytecodePatch(
    name = "Navigation bar",
    description = "Adds settings in Fakh Patches that hide the labels of the navigation bar tabs and choose which tabs it shows.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // The tabs of the bar come from one static method that puts every tab in an array of the tab type, the
        // second parameter of the tab composable; the bar and the start tab both read it.
        val tabType = NavigationItemFingerprint.method.parameterTypes[1].toString()
        val lists = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes.isNotEmpty() ||
                    method.returnType != "Ljava/util/List;") continue
                val instructions = method.implementation?.instructions ?: continue
                if (instructions.any { (it.opcode == Opcode.NEW_ARRAY || it.opcode == Opcode.FILLED_NEW_ARRAY) &&
                        ((it as ReferenceInstruction).reference as? TypeReference)?.type == "[$tabType" }) {
                    lists += classDef.type to method.name
                }
            }
        }
        if (lists.size != 1) throw PatchException("Tab list not found: $lists")
        val tabList = mutableClassDefBy(lists.single().first).methods.first {
            it.name == lists.single().second && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/List;"
        }
        tabList.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }.reversed().forEach { index ->
                val register = (tabList.implementation!!.instructions[index] as OneRegisterInstruction).registerA
                tabList.addInstructions(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, $NAVIGATION_BAR->tabs(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """,
                )
            }

        val item = NavigationItemFingerprint.method
        val call = item.tabCall()
        val label = call.start + 7
        item.addInstructions(
            call.index,
            """
                invoke-static/range { v$label .. v$label }, $NAVIGATION_BAR->label(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$label
                check-cast v$label, ${call.parameters[7]}
            """,
        )

        addSwitch("fakh_hide_nav_labels", "Hide tab labels", false)
        addSwitch("fakh_nav_tabs", "Navigation bar tabs", null)
    }
}

@Suppress("unused")
val glassNavigationBarPatch = bytecodePatch(
    name = "Glass navigation bar",
    description = "Draws the navigation bar as a floating, translucent capsule with a sliding selection pill. Slide a finger along it to switch tabs. Liquid Glass blurs what's behind it. The switch is in Fakh Patches.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Theme")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Portrait and landscape bars: the container color is a wide argument, the 2nd and 3rd register of the range.
        val portrait = barCall()
        val rail = railCall(portrait.second)
        listOfNotNull(portrait, rail).forEach { (method, call) ->
            val color = call.start + 1
            method.addInstructions(
                call.index,
                """
                    invoke-static/range { v$color .. v${color + 1} }, $NAVIGATION_BAR->containerColor(J)J
                    move-result-wide v$color
                """,
            )
        }
        // Above the bar the app draws a divider, a line over a strip of the page color, which would cross the top of
        // the capsule: Divider(modifier, background: J, line: J, indent: F, vertical: Z, composer, changed, defaults).
        // Its colors are passed as 0 with their defaults bit set, so the defaults bits of both colors are cleared.
        portrait.first.let { method ->
            val divider = method.rangeCall {
                it.size == 8 && it[1] == "J" && it[2] == "J" && it[3] == "F" && it[4] == "Z" && it[6] == "I" && it[7] == "I"
            } ?: throw PatchException("Bar divider call not found")
            if (divider.index > portrait.second.index) throw PatchException("Bar divider call is after the bar")
            val defaults = divider.start + 9
            method.addInstructions(
                divider.index,
                """
                    invoke-static/range { v$defaults .. v$defaults }, $NAVIGATION_BAR->dividerDefaults(I)I
                    move-result v$defaults
                """,
            )
        }
        // The rail also gets a background of its own: a modifier built from a (int, long) constructor just before the call.
        rail?.let { (method, call) ->
            val instructions = method.implementation!!.instructions.toList()
            val background = (call.index - 1 downTo 0).firstOrNull { index ->
                val instruction = instructions[index]
                instruction.opcode == Opcode.INVOKE_DIRECT && (instruction as ReferenceInstruction).reference.let {
                    it is MethodReference && it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "J")
                }
            } ?: throw PatchException("Rail background not found")
            val register = (instructions[background] as FiveRegisterInstruction).registerE
            method.addInstructions(
                background,
                """
                    invoke-static/range { v$register .. v${register + 1} }, $NAVIGATION_BAR->railBackground(J)J
                    move-result-wide v$register
                """,
            )
            // The rail's tabs are the app's own item (selected, onClick, icon, modifier, onLongClick, enabled,
            // label: String, ..., selectedColor: J, unselectedColor: J, ...), called from the class of the rail.
            val railTab = mutableClassDefBy(method.definingClass).methods.firstNotNullOfOrNull { candidate ->
                if (candidate.implementation == null) return@firstNotNullOfOrNull null
                candidate.rangeCall {
                    it.size == 13 && it[0] == "Z" && it[5] == "Z" && it[6] == "Ljava/lang/String;" && it[9] == "J" && it[10] == "J"
                }?.let { candidate to it }
            } ?: throw PatchException("Rail tab call not found")
            railTab.first.addInstructions(
                railTab.second.index,
                """
                    invoke-static/range { v${railTab.second.start} .. v${railTab.second.start + 2} }, $NAVIGATION_BAR->railTab(ZLjava/lang/Object;Ljava/lang/Object;)V
                """,
            )
        }
        // The capsule draws a pill behind the selected tab that slides to the next one, so the app's own indicator goes.
        val item = NavigationItemFingerprint.method
        val tab = item.tabCall()
        item.addInstructions(
            tab.index,
            """
                invoke-static/range { v${tab.start} .. v${tab.start + 5} }, $NAVIGATION_BAR->tab(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
            """,
        )
        // The indicator is a box colored by the 'indicator' field of the item colors, read right after its tag.
        val colors = tab.parameters[10]
        val found = mutableListOf<Pair<String, String>>()
        classDefByStrings("indicator").distinctBy { it.type }.forEach { classDef ->
            for (method in classDef.methods) {
                val implementation = method.implementation ?: continue
                var tagged = false
                for (instruction in implementation.instructions) {
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    if (instruction.opcode == Opcode.CONST_STRING && (reference as? StringReference)?.string == "indicator") {
                        tagged = true
                    } else if (tagged && instruction.opcode == Opcode.IGET_WIDE && (reference as? FieldReference)?.definingClass == colors) {
                        found += classDef.type to method.name
                        break
                    }
                }
            }
        }
        if (found.size != 1) throw PatchException("Indicator color read not found: $found")
        val indicator = mutableClassDefBy(found.single().first).methods.first { method ->
            method.name == found.single().second && method.implementation?.instructions?.any {
                it.opcode == Opcode.IGET_WIDE && ((it as ReferenceInstruction).reference as FieldReference).definingClass == colors
            } == true
        }
        var tagged = false
        val read = indicator.implementation!!.instructions.withIndex().first { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (instruction.opcode == Opcode.CONST_STRING && (reference as? StringReference)?.string == "indicator") tagged = true
            tagged && instruction.opcode == Opcode.IGET_WIDE && (reference as? FieldReference)?.definingClass == colors
        }
        val register = (read.value as TwoRegisterInstruction).registerA
        indicator.addInstructions(
            read.index + 1,
            """
                invoke-static/range { v$register .. v${register + 1} }, $NAVIGATION_BAR->indicatorColor(J)J
                move-result-wide v$register
            """,
        )
        tintLabels(colors)
        removeTabRipple()
        tightenTabLabel()
        watchActivities()
        addSwitch("fakh_glass_navbar", "Liquid Glass navigation bar", false)
        addSwitch(
            "fakh_liquid_glass",
            "Background blur",
            false,
            "Blurs what's behind the glass. Uses more battery and might stutter.",
        )
    }
}

@Suppress("unused")
val navigationBarRightPatch = bytecodePatch(
    name = "Landscape navigation bar position",
    description = "Adds a setting in Fakh Patches that moves the landscape navigation bar to the left or right edge.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        watchActivities()
        addSwitch("fakh_nav_position", "Landscape navigation bar position", null)
    }
}

/**
 * Takes the press ripple off the tabs while the bar is glass, where the pill already shows the tab. Material 3 draws it
 * in a box tagged "indicatorRipple": the box's modifier gets indication(interactionSource, ripple(bounded, radius,
 * color)), the ripple built by a static call taking (Z, F, J) just before. [NAVIGATION_BAR]'s tabIndication turns that
 * indication into null, which Compose draws as nothing.
 */
private fun BytecodePatchContext.removeTabRipple() {
    val found = mutableListOf<Pair<String, String>>()
    classDefByStrings("indicatorRipple").distinctBy { it.type }.forEach { classDef ->
        for (method in classDef.methods) {
            if (method.implementation?.instructions?.any {
                    it.opcode == Opcode.CONST_STRING &&
                        ((it as ReferenceInstruction).reference as StringReference).string == "indicatorRipple"
                } == true && method.indicationCall() != null) {
                found += classDef.type to method.name
            }
        }
    }
    if (found.size != 1) throw PatchException("Tab ripple not found: $found")
    val method = mutableClassDefBy(found.single().first).methods.first {
        it.name == found.single().second && it.indicationCall() != null
    }
    val (index, type) = method.indicationCall()!!
    val register = (method.implementation!!.instructions[index] as FiveRegisterInstruction).registerE
    method.addInstructions(
        index,
        """
            invoke-static/range { v$register .. v$register }, $NAVIGATION_BAR->tabIndication(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $type
        """,
    )
}

/**
 * Moves the label of a tab up to its icon while the bar is glass, so icon and label fit the lower glass bar. Material 3
 * lays out a tab with the measure policy that looks its children up by the tags "indicatorRipple" and "label" and,
 * without a label, makes the tab 80dp tall (an 80f constant). With a label, the first 4f constant after that is the
 * space between the icon's indicator and the label, used both for the tab's content height and for the label's top;
 * [NAVIGATION_BAR]'s labelGap turns it into 0.
 */
private fun BytecodePatchContext.tightenTabLabel() {
    fun Method.gapIndex(): Int? {
        val instructions = implementation?.instructions?.toList() ?: return null
        fun literal(index: Int) = (instructions[index] as? NarrowLiteralInstruction)
            ?.takeIf { instructions[index].opcode == Opcode.CONST_HIGH16 }?.narrowLiteral
        val strings = instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        if ("indicatorRipple" !in strings || "label" !in strings) return null
        val tall = instructions.indices.firstOrNull { literal(it) == 80f.toRawBits() } ?: return null
        return (tall + 1 until instructions.size).firstOrNull { literal(it) == 4f.toRawBits() }
    }
    val found = mutableListOf<Pair<String, String>>()
    classDefByStrings("indicatorRipple").distinctBy { it.type }.forEach { classDef ->
        for (method in classDef.methods) if (method.gapIndex() != null) found += classDef.type to method.name
    }
    if (found.size != 1) throw PatchException("Tab label gap not found: $found")
    val method = mutableClassDefBy(found.single().first).methods.first {
        it.name == found.single().second && it.gapIndex() != null
    }
    val index = method.gapIndex()!!
    val register = (method.implementation!!.instructions[index] as OneRegisterInstruction).registerA
    method.addInstructions(
        index + 1,
        """
            invoke-static/range { v$register .. v$register }, $NAVIGATION_BAR->labelGap(F)F
            move-result v$register
        """,
    )
}

/**
 * In a method that tags a box "indicatorRipple": the index of the first three-argument static call after the ripple is
 * built (a static call taking Z, F, J), and the type of its last argument, the indication. Null when there is none.
 */
private fun Method.indicationCall(): Pair<Int, String>? {
    var tagged = false
    var ripple = false
    implementation!!.instructions.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        if (instruction.opcode == Opcode.CONST_STRING && (reference as? StringReference)?.string == "indicatorRipple") {
            tagged = true
        } else if (tagged && instruction.opcode == Opcode.INVOKE_STATIC && reference is MethodReference) {
            val parameters = reference.parameterTypes.map(CharSequence::toString)
            if (!ripple) {
                ripple = parameters == listOf("Z", "F", "J")
            } else if (parameters.size == 3 && parameters.all { it.startsWith("L") }) {
                return index to parameters[2]
            }
        }
    }
    return null
}

/**
 * Gives the tab labels the colors of the tab icons while the bar is glass: the accent on the selected tab and gray on
 * the others. Material 3 hands the label those colors as its content color, but the label's text style still carries
 * the color of GitHub's theme, which wins over the content color. The label's composable is the one that reads the
 * item colors' text fields (the 2nd and 5th colors the constructor stores, in Material 3's order) and no icon field;
 * just before that read it copies the style. The copy now gets the same text color the read picks, through a method
 * added to the item colors, and [NAVIGATION_BAR]'s labelStyleMask lets it use that color only while the bar is glass.
 */
private fun BytecodePatchContext.tintLabels(colors: String) {
    val stored = mutableClassDefBy(colors).methods.first { it.name == "<init>" }.implementation!!.instructions
        .filter { it.opcode == Opcode.IPUT_WIDE }
        .sortedBy { (it as TwoRegisterInstruction).registerA }
        .map { ((it as ReferenceInstruction).reference as FieldReference).name }
    if (stored.size < 5) throw PatchException("Item colors have ${stored.size} color fields")
    val texts = setOf(stored[1], stored[4])
    val icons = setOf(stored[0], stored[3])
    val targets = mutableListOf<Pair<String, Method>>()
    // Only classes that read a field of the item colors, found through the patcher's index.
    Fingerprint(filters = listOf(fieldAccess(definingClass = colors))).matchAllOrNull().orEmpty()
        .map { it.originalClassDef }.distinctBy { it.type }.forEach { classDef ->
        if (classDef.type == colors) return@forEach
        for (method in classDef.methods) {
            val fields = method.implementation?.instructions?.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field -> field.definingClass == colors }?.name
            } ?: continue
            if (fields.any { it in texts } && fields.none { it in icons }) targets += classDef.type to method
        }
    }
    if (targets.size != 1) throw PatchException("Tab label composable not found: ${targets.map { it.first }}")
    val (type, found) = targets.single()
    val label = mutableClassDefBy(type).methods.first {
        it.name == found.name && it.parameterTypes == found.parameterTypes && it.returnType == found.returnType
    }
    val instructions = label.implementation!!.instructions.toList()
    val read = instructions.indexOfFirst {
        it.opcode == Opcode.IGET_WIDE && ((it as ReferenceInstruction).reference as FieldReference).let { field ->
            field.definingClass == colors && field.name in texts
        }
    }
    // The style copy: a static call that takes a style and returns one of the same type.
    val copy = (read - 1 downTo 0).firstOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[index].opcode == Opcode.INVOKE_STATIC_RANGE && reference != null &&
            reference.parameterTypes.firstOrNull()?.toString() == reference.returnType &&
            reference.parameterTypes.getOrNull(1)?.toString() == "J"
    } ?: throw PatchException("Tab label style copy not found")
    val range = instructions[copy] as RegisterRangeInstruction
    val color = range.startRegister + 1
    val mask = range.startRegister + range.registerCount - 1
    // The read sits right after the branch on whether the tab is selected, which reads one text field when it is
    // and the other when it isn't. A method added to the item colors makes the same pick for the copy.
    val branch = instructions[read - 1]
    if (branch.opcode != Opcode.IF_EQZ) throw PatchException("Tab label color branch not found")
    val selected = (branch as OneRegisterInstruction).registerA
    val owner = (instructions[read] as TwoRegisterInstruction).registerB
    val selectedText = ((instructions[read] as ReferenceInstruction).reference as FieldReference).name
    val otherText = texts.single { it != selectedText }
    val holder = mutableClassDefBy(colors)
    holder.methods.add(
        ImmutableMethod(colors, "fakhLabelColor", listOf(ImmutableMethodParameter("Z", null, null)), "J",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(4)).toMutable().apply {
            addInstructions(
                0,
                """
                    if-eqz p1, :unselected
                    iget-wide v0, p0, $colors->$selectedText:J
                    return-wide v0
                    :unselected
                    iget-wide v0, p0, $colors->$otherText:J
                    return-wide v0
                """,
            )
        },
    )
    label.addInstructions(
        copy,
        """
            invoke-virtual { v$owner, v$selected }, $colors->fakhLabelColor(Z)J
            move-result-wide v$color
            invoke-static/range { v$mask .. v$mask }, $NAVIGATION_BAR->labelStyleMask(I)I
            move-result v$mask
        """,
    )
}

/**
 * Has every activity's bottom bar shaped once it comes to the front, through [NAVIGATION_BAR]'s watch at the start of
 * attachBaseContext. Both the glass and the landscape position patches need it, and neither leans on Material You.
 */
private fun BytecodePatchContext.watchActivities() {
    appCompatActivity().methods.first { it.name == "attachBaseContext" }.addInstructions(
        0,
        "invoke-static/range { p1 .. p1 }, $NAVIGATION_BAR->watch(Landroid/content/Context;)V",
    )
}
