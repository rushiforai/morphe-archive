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
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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
    description = "Adds a switch to Settings that hides the labels of the navigation bar tabs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val item = NavigationItemFingerprint.method
        // NavigationBarItem(selected, onClick, icon, modifier, onLongClick, label: String, ..., label composable, ...)
        val call = item.rangeCall {
            it.size >= 9 && it[0] == "Z" && it[5] == "Ljava/lang/String;" && it[6] == "Z" && it[7].startsWith("L") && it[8] == "Z"
        } ?: throw PatchException("Tab composable call not found")
        val label = call.start + 7
        item.addInstructions(
            call.index,
            """
                invoke-static/range { v$label .. v$label }, $NAVIGATION_BAR->label(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$label
                check-cast v$label, ${call.parameters[7]}
            """,
        )

        addSwitch("fakh_hide_nav_labels", "Hide navigation bar labels", false)
    }
}

@Suppress("unused")
val glassNavigationBarPatch = bytecodePatch(
    name = "Glass navigation bar",
    description = "Draws the navigation bar as a floating, translucent capsule (turned on in Fakh Patches).",
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
        }
        addSwitch("fakh_glass_navbar", "Glass navigation bar", false)
    }
}

@Suppress("unused")
val navigationBarRightPatch = bytecodePatch(
    name = "Navigation bar on the right",
    description = "Adds a switch to Settings that moves the landscape navigation bar to the right edge.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute { addSwitch("fakh_nav_right", "Navigation bar on the right", false) }
}
