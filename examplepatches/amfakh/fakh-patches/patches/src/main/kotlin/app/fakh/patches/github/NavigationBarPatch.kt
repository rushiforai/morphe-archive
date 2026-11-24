/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.BACKGROUND_BLUR
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.GLASS_NAVBAR
import app.fakh.patches.github.shared.Constants.HIDE_TAB_LABELS
import app.fakh.patches.github.shared.Constants.NAV_RIGHT
import app.fakh.patches.github.shared.Constants.SMALLER_NAVBAR
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
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
private const val EXTRA_TAB = "Lapp/fakh/extension/github/ExtraTab;"

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
private fun railCall(portrait: RangeCall): Pair<MutableMethod, RangeCall>? {
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

/**
 * Makes the instances of [EXTRA_TAB], one per kind of tab, tabs of the app. A tab is a singleton subclass of
 * [tabType], built from its label, its two icons, an optional accessibility label and the routes it is selected for,
 * and it gives the route a tap opens through the type's one (Z)Object method. The extension class extends Object, so
 * it gets the tab type as its superclass, a constructor that takes the kind and passes that kind's values to the
 * type's, and that route method, which calls its own.
 *
 * The app's own code knows only its four tabs and throws for any other where it switches over them; those places are
 * patched below.
 */
private fun addExtraTabs(tabType: String) {
    val routeMethod = classDefBy(tabType).methods.singleOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Ljava/lang/Object;" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Z")
    } ?: throw PatchException("Tab route method not found")
    if (classDefBy(tabType).methods.none {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) ==
                listOf("I", "I", "I", "Ljava/lang/Integer;", "Ljava/util/List;")
        }) throw PatchException("Tab constructor not found")

    mutableClassDefBy(EXTRA_TAB).apply {
        setSuperClass(tabType)
        methods.removeIf { it.name == "<init>" }
        methods.add(
            ImmutableMethod(
                type, "<init>", listOf(ImmutableMethodParameter("I", null, null)), "V",
                AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, null, null, MutableMethodImplementation(8),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        move-object v0, p0
                        invoke-static { p1 }, $EXTRA_TAB->label(I)I
                        move-result v1
                        invoke-static { p1 }, $EXTRA_TAB->icon(I)I
                        move-result v2
                        invoke-static { p1 }, $EXTRA_TAB->selectedIcon(I)I
                        move-result v3
                        const/4 v4, 0x0
                        invoke-static { p1 }, $EXTRA_TAB->routes(I)Ljava/util/List;
                        move-result-object v5
                        invoke-direct/range { v0 .. v5 }, $tabType-><init>(IIILjava/lang/Integer;Ljava/util/List;)V
                        iput p1, p0, $EXTRA_TAB->kind:I
                        return-void
                    """,
                )
            },
        )
        methods.add(
            ImmutableMethod(
                type, routeMethod.name, listOf(ImmutableMethodParameter("Z", null, null)), "Ljava/lang/Object;",
                AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-virtual { p0, p1 }, $EXTRA_TAB->route(Z)Ljava/lang/Object;
                        move-result-object v0
                        return-object v0
                    """,
                )
            },
        )
    }
    val builtIn = mutableSetOf<String>()
    classDefForEach { if (it.superclass == tabType && it.type != EXTRA_TAB) builtIn += it.type }

    // The static method that names the screen of a tab returns a name of its own for this tab.
    val screens = mutableListOf<Pair<String, String>>()
    classDefForEach { classDef ->
        for (method in classDef.methods) {
            if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/lang/String;" &&
                method.parameterTypes.map(CharSequence::toString) == listOf(tabType) &&
                method.readsAny(builtIn)) screens += classDef.type to method.name
        }
    }
    if (screens.size != 1) throw PatchException("Tab screen name method not found: $screens")
    val screen = mutableClassDefBy(screens.single().first).methods.first {
        it.name == screens.single().second && it.parameterTypes.map(CharSequence::toString) == listOf(tabType)
    }
    screen.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0 }, $EXTRA_TAB->key(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :app
            return-object v0
        """,
        ExternalLabel("app", screen.getInstruction(0)),
    )

    // The static method that tells whether a tab is selected for the screen shown, by the routes of the tab and the
    // screen's graphs, defers to this tab while its repository list shows.
    val selection = screen.definingClass.let { type ->
        mutableClassDefBy(type).methods.singleOrNull {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" && it.parameterTypes.size == 2 &&
                it.parameterTypes[0].toString() == tabType
        } ?: throw PatchException("Tab selection method not found")
    }
    selection.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p1 }, $EXTRA_TAB->selected(Ljava/lang/Object;Ljava/lang/Object;)I
            move-result v0
            if-ltz v0, :app
            return v0
        """,
        ExternalLabel("app", selection.getInstruction(0)),
    )

    // Elsewhere a `when` over the tabs ends in a call that throws when the tab is none of the app's own: where the tab
    // is saved as the one to start on, and where a tap is logged. That call becomes a nop, so the code after it, a
    // return, runs instead: the tab is not saved, so the app starts on the last of its own tabs, and is not logged.
    val throws = mutableListOf<Triple<String, String, Int>>()
    classDefForEach { classDef ->
        for (method in classDef.methods) {
            if (classDef.type == screens.single().first && method.name == screens.single().second) continue
            method.throwAfterTabWhen(builtIn)?.let { throws += Triple(classDef.type, method.name + method.parameterTypes, it) }
        }
    }
    if (throws.size != 2) throw PatchException("Tab when throws not found: $throws")
    throws.forEach { (type, signature, index) ->
        mutableClassDefBy(type).methods.first { it.name + it.parameterTypes == signature }.replaceInstruction(index, "nop")
    }
}

/** Whether the method reads a static field of one of [types], such as the singleton of one of the app's tabs. */
private fun Method.readsAny(types: Set<String>) = implementation?.instructions?.any {
    it.opcode == Opcode.SGET_OBJECT && ((it as ReferenceInstruction).reference as FieldReference).type in types
} == true

/**
 * The index of the call that throws NoWhenBranchMatchedException at the end of a `when` over the tabs: the target of
 * the `if-eqz` that follows the method's last comparison with one of the [tabs] singletons. Null when there is none.
 */
private fun Method.throwAfterTabWhen(tabs: Set<String>): Int? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val offsets = instructions.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.SGET_OBJECT ||
            ((instruction as ReferenceInstruction).reference as FieldReference).type !in tabs) return@forEachIndexed
        val branch = (index + 1..minOf(index + 4, instructions.lastIndex)).firstOrNull {
            instructions[it].opcode == Opcode.IF_EQZ
        } ?: return@forEachIndexed
        val target = offsets[branch] + (instructions[branch] as OffsetInstruction).codeOffset
        val call = offsets.indexOf(target).takeIf { it in instructions.indices } ?: return@forEachIndexed
        val reference = (instructions[call] as? ReferenceInstruction)?.reference as? MethodReference
        if (instructions[call].opcode == Opcode.INVOKE_STATIC && reference != null && reference.parameterTypes.isEmpty() &&
            classDefBy(reference.definingClass).methods.any { method ->
                method.name == reference.name && method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Lkotlin/NoWhenBranchMatchedException;"
                } == true
            }
        ) return call
    }
    return null
}

/** The method of the bar's class that calls NavigationBar(modifier, containerColor: J, contentColor: J, windowInsets, content, ...). */
private fun barCall(): Pair<MutableMethod, RangeCall> {
    for (method in mutableClassDefBy(NavigationItemFingerprint.method.definingClass).methods) {
        if (method.implementation == null) continue
        val call = method.rangeCall { it.size == 7 && it[1] == "J" && it[2] == "J" } ?: continue
        return method to call
    }
    throw PatchException("NavigationBar call not found")
}

@Suppress("unused")
val navigationBarPatch = patch(
    name = "Navigation bar",
    description = "Adds settings in Fakh Patches that hide the labels of the navigation bar tabs, choose which tabs it " +
        "shows and in what order, and add Repositories and Stars tabs.",
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

        // GitHub's tab icons come in pairs, outline and filled, but the repository and star icons have no filled one
        // at 24dp: these are ic_repo_24 and ic_star_24 without the cut-out that leaves them hollow.
        mapOf(
            "repo" to "M4,5.5C4,4.837 4.2634,4.2011 4.7322,3.7322C5.2011,3.2634 5.837,3 6.5,3H19.25C19.4489,3 19.6397,3.079 19.7803,3.2197C19.921,3.3603 20,3.5511 20,3.75V20.25C20,20.4489 19.921,20.6397 19.7803,20.7803C19.6397,20.921 19.4489,21 19.25,21H14.75C14.5511,21 14.3603,20.921 14.2197,20.7803C14.079,20.6397 14,20.4489 14,20.25C14,20.0511 14.079,19.8603 14.2197,19.7197C14.3603,19.579 14.5511,19.5 14.75,19.5H18.5V16.5H6.5C6.2348,16.5 5.9804,16.6054 5.7929,16.7929C5.6054,16.9804 5.5,17.2348 5.5,17.5V18.5C5.4999,18.7403 5.5864,18.9727 5.7436,19.1545C5.9008,19.3363 6.1182,19.4554 6.356,19.49C6.4535,19.5039 6.5473,19.5369 6.6321,19.5871C6.7168,19.6373 6.7909,19.7036 6.85,19.7824C6.9091,19.8612 6.9521,19.9509 6.9765,20.0463C7.001,20.1417 7.0064,20.241 6.9925,20.3385C6.9786,20.436 6.9456,20.5298 6.8954,20.6146C6.8452,20.6993 6.7789,20.7734 6.7001,20.8325C6.6213,20.8916 6.5316,20.9346 6.4362,20.959C6.3408,20.9835 6.2415,20.9889 6.144,20.975C5.5487,20.8894 5.0042,20.592 4.6104,20.1374C4.2166,19.6828 3.9999,19.1014 4,18.5V5.5ZM8,18.25V22.48C8,22.69 8.242,22.806 8.406,22.675L10.344,21.125C10.3883,21.0896 10.4433,21.0704 10.5,21.0704C10.5567,21.0704 10.6117,21.0896 10.656,21.125L12.594,22.675C12.6308,22.7044 12.6751,22.7227 12.7218,22.728C12.7685,22.7334 12.8158,22.7254 12.8582,22.705C12.9006,22.6846 12.9364,22.6527 12.9615,22.6129C12.9866,22.5731 12.9999,22.527 13,22.48V18.25C13,18.1837 12.9737,18.1201 12.9268,18.0732C12.8799,18.0263 12.8163,18 12.75,18H8.25C8.1837,18 8.1201,18.0263 8.0732,18.0732C8.0263,18.1201 8,18.1837 8,18.25Z",
            "star" to "M12,0.25C12.2855,0.25 12.5462,0.4121 12.6726,0.6681L15.7309,6.8649L22.5695,7.8586C22.852,7.8997 23.0867,8.0975 23.1749,8.3691C23.2631,8.6406 23.1896,8.9386 22.9851,9.1379L18.0367,13.9614L19.2048,20.7724C19.2531,21.0538 19.1374,21.3381 18.9065,21.5059C18.6755,21.6738 18.3693,21.6959 18.1166,21.563L12,18.3473L5.8834,21.563C5.6307,21.6959 5.3245,21.6738 5.0935,21.5059C4.8626,21.3381 4.7469,21.0538 4.7952,20.7724L5.9633,13.9614L1.0149,9.1379C0.8104,8.9386 0.7369,8.6406 0.8251,8.3691C0.9133,8.0975 1.148,7.8997 1.4305,7.8586L8.2691,6.8649L11.3275,0.6681C11.4538,0.4121 11.7145,0.25 12,0.25Z",
        ).forEach { (name, path) ->
            resourceFile("res").resolve("drawable/fakh_ic_${name}_fill_24.xml").writeText(
                """
                    <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp"
                        android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                        <path android:fillColor="#ff000000" android:fillType="evenOdd" android:pathData="$path" />
                    </vector>
                """.trimIndent(),
            )
        }
        addExtraTabs(tabType)

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

        addSwitch(HIDE_TAB_LABELS)
        addRow("fakh_nav_tabs", "Navigation bar tabs")
    }
}

private val sharedNavLabelHooksPatch = patch {
    execute {
        val colors = NavigationItemFingerprint.method.tabCall().parameters[10]
        tintLabels(colors)
        tightenTabLabel()
        watchActivities()
    }
}

@Suppress("unused")
val glassNavigationBarPatch = patch(
    name = "Glass navigation bar",
    description = "A floating, translucent navigation bar. Slide a finger along it to switch tabs. The switch is " +
        "in Fakh Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Theme")
    dependsOn(githubSettingsPatch, sharedNavLabelHooksPatch)
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
        removeTabRipple()
        addSwitch(GLASS_NAVBAR)
        addSwitch(BACKGROUND_BLUR)
    }
}

@Suppress("unused")
val smallerNavigationBarPatch = patch(
    name = "Smaller navigation bar",
    description = "Shrinks the navigation bar height, icon-to-label spacing, and label text size.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, sharedNavLabelHooksPatch)
    extendWith("extensions/extension.mpe")

    execute {
        addSwitch(SMALLER_NAVBAR)
    }
}

@Suppress("unused")
val navigationBarRightPatch = patch(
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
        register(NAV_RIGHT)
        addRow("fakh_nav_position", "Landscape navigation bar position")
    }
}

/**
 * Takes the press ripple off the tabs while the bar is glass, where the pill already shows the tab. Material 3 draws it
 * in a box tagged "indicatorRipple": the box's modifier gets indication(interactionSource, ripple(bounded, radius,
 * color)), the ripple built by a static call taking (Z, F, J) just before. [NAVIGATION_BAR]'s tabIndication turns that
 * indication into null, which Compose draws as nothing.
 */
private fun removeTabRipple() {
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
private fun tightenTabLabel() {
    fun Method.gapIndices(): List<Int> {
        val instructions = implementation?.instructions?.toList() ?: return emptyList()
        fun literal(index: Int) = (instructions[index] as? NarrowLiteralInstruction)
            ?.takeIf { instructions[index].opcode == Opcode.CONST_HIGH16 }?.narrowLiteral
        val strings = instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        if ("indicatorRipple" !in strings || "label" !in strings) return emptyList()
        val tall = instructions.indices.firstOrNull { literal(it) == 80f.toRawBits() } ?: return emptyList()
        return (tall + 1 until instructions.size).filter { literal(it) == 4f.toRawBits() }
    }
    val found = mutableListOf<Pair<String, String>>()
    classDefByStrings("indicatorRipple").distinctBy { it.type }.forEach { classDef ->
        for (method in classDef.methods) if (method.gapIndices().isNotEmpty()) found += classDef.type to method.name
    }
    if (found.size != 1) throw PatchException("Tab label gap not found: $found")
    val method = mutableClassDefBy(found.single().first).methods.first {
        it.name == found.single().second && it.gapIndices().isNotEmpty()
    }
    val indices = method.gapIndices()
    val instructions = method.implementation!!.instructions.toList()
    indices.asReversed().forEach { index ->
        val register = (instructions[index] as OneRegisterInstruction).registerA
        method.addInstructions(
            index + 1,
            """
                invoke-static/range { v$register .. v$register }, $NAVIGATION_BAR->labelGap(F)F
                move-result v$register
            """,
        )
    }
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
private fun tintLabels(colors: String) {
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
    val fontSize = range.startRegister + 3
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
            invoke-static/range { v$fontSize .. v${fontSize + 1} }, $NAVIGATION_BAR->labelFontSize(J)J
            move-result-wide v$fontSize
            invoke-static/range { v$mask .. v$mask }, $NAVIGATION_BAR->labelStyleMask(I)I
            move-result v$mask
        """,
    )
}

/**
 * Has every activity's bottom bar shaped once it comes to the front, through [NAVIGATION_BAR]'s watch at the start of
 * attachBaseContext. Both the glass and the landscape position patches need it, and neither leans on Material You.
 */
private fun watchActivities() {
    appCompatActivity().methods.first { it.name == "attachBaseContext" }.addInstructions(
        0,
        "invoke-static/range { p1 .. p1 }, $NAVIGATION_BAR->watch(Landroid/content/Context;)V",
    )
}
