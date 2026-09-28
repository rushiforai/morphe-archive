/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.settings

import app.morphe.patches.facebook.misc.extension.FACEBOOK_APPLICATION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * Stand-ins for the Facebook classes the settings patch hooks, for a test that runs the whole patch
 * over a few classes instead of an APK.
 */
internal object SettingsPatchHosts {
    const val VIEW = "Landroid/view/View;"

    fun parameters(vararg types: String) = types.map { ImmutableMethodParameter(it, null, null) }

    fun body(registers: Int, vararg instructions: Instruction) =
        ImmutableMethodImplementation(registers, instructions.toList(), null, null)

    fun viewCall(name: String, parameter: String) = ImmutableMethodReference(VIEW, name, listOf(parameter), "V")

    val setOnClickListener = viewCall("setOnClickListener", "Landroid/view/View\$OnClickListener;")
    val setOnTouchListener = viewCall("setOnTouchListener", "Landroid/view/View\$OnTouchListener;")
    val setContentDescription = viewCall("setContentDescription", "Ljava/lang/CharSequence;")

    /** A call on the view in [view] with the argument in [argument], as Facebook's code makes it. */
    fun on(view: Int, argument: Int, call: ImmutableMethodReference): Instruction =
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, view, argument, 0, 0, 0, call)

    fun loads(register: Int, string: String): Instruction =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(string))

    /**
     * The top bar, whose one method holding the logo trace section builds the logo the way 573, 577
     * and 580 do: a container given a touch listener of its own, then the logo (v1) given its tap,
     * its touch listener and its content description, in that order. [instructions] replaces that
     * body when a test needs another shape.
     */
    fun bar(vararg instructions: Instruction): ClassDef {
        val body = if (instructions.isNotEmpty()) instructions.toList() else listOf(
            loads(0, CREATE_WORDMARK_VIEW),
            on(2, 3, setOnTouchListener),
            on(1, 2, setOnClickListener),
            on(1, 3, setOnTouchListener),
            on(1, 0, setContentDescription),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
        return barWith(builder("initContents", ImmutableMethodImplementation(6, body, null, null)))
    }

    /** A static method of the bar taking the context and the bar, the logo builder's shape. */
    fun builder(name: String, implementation: ImmutableMethodImplementation) = ImmutableMethod(
        WORDMARK_NAVIGATION_BAR, name, parameters("Landroid/content/Context;", WORDMARK_NAVIGATION_BAR), "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null, implementation,
    )

    fun barWith(vararg methods: ImmutableMethod): ClassDef = ImmutableClassDef(
        WORDMARK_NAVIGATION_BAR, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Landroid/widget/LinearLayout;",
        null, null, null, null, methods.toList(),
    )

    /** The application and the main activity, each with the method one of the patch's other hooks goes into. */
    fun appAndMainTab(): List<ClassDef> {
        val mainTab = "Lcom/facebook/katana/activity/FbMainTabActivity;"
        val returns = ImmutableInstruction10x(Opcode.RETURN_VOID)
        return listOf(
            ImmutableClassDef(
                FACEBOOK_APPLICATION, AccessFlags.PUBLIC.value, "Landroid/app/Application;", null, null, null, null,
                listOf(ImmutableMethod(FACEBOOK_APPLICATION, "onCreate", parameters(), "V", AccessFlags.PUBLIC.value, null, null, body(1, returns))),
            ),
            ImmutableClassDef(
                mainTab, AccessFlags.PUBLIC.value, "Landroid/app/Activity;", null, null, null, null,
                listOf(
                    ImmutableMethod(mainTab, "onCreate", parameters("Landroid/os/Bundle;"), "V", AccessFlags.PUBLIC.value, null, null, body(2, returns)),
                    ImmutableMethod(mainTab, "onNewIntent", parameters("Landroid/content/Intent;"), "V", AccessFlags.PUBLIC.value, null, null, body(2, returns)),
                ),
            ),
        )
    }

    /** Every class the settings patch hooks, the top bar a plain one. */
    fun all(): List<ClassDef> = appAndMainTab() + bar()
}
