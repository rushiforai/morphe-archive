package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

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
    description = "Draws the navigation bar as a floating, translucent capsule with a sliding selection pill. The switch is in Fakh Patches.",
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
        classDefForEach { classDef ->
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
        addSwitch("fakh_glass_navbar", "Glass navigation bar", false)
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

    execute { addSwitch("fakh_nav_position", "Landscape navigation bar position", null) }
}
