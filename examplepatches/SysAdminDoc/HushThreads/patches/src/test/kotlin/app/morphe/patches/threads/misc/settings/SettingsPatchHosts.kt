/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.threads.misc.settings

import app.morphe.patches.threads.misc.extension.THREADS_APPLICATION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x

/**
 * Stand-ins for the Threads classes the settings patch hooks, for a test that runs the whole patch
 * over a few classes instead of an APK.
 */
internal object SettingsPatchHosts {
    fun parameters(vararg types: String) = types.map { ImmutableMethodParameter(it, null, null) }

    fun body(registers: Int, vararg instructions: Instruction) =
        ImmutableMethodImplementation(registers, instructions.toList(), null, null)

    /** The application and the launcher activity, each with the method one of the patch's hooks goes into. */
    fun appAndMainActivity(): List<ClassDef> {
        val returns = ImmutableInstruction10x(Opcode.RETURN_VOID)
        return listOf(
            ImmutableClassDef(
                THREADS_APPLICATION, AccessFlags.PUBLIC.value, "Landroid/app/Application;", null, null, null, null,
                listOf(ImmutableMethod(THREADS_APPLICATION, "onCreate", parameters(), "V", AccessFlags.PUBLIC.value, null, null, body(1, returns))),
            ),
            ImmutableClassDef(
                MAIN_ACTIVITY, AccessFlags.PUBLIC.value, "Landroid/app/Activity;", null, null, null, null,
                listOf(
                    ImmutableMethod(MAIN_ACTIVITY, "onCreate", parameters("Landroid/os/Bundle;"), "V", AccessFlags.PUBLIC.value, null, null, body(2, returns)),
                    ImmutableMethod(MAIN_ACTIVITY, "onNewIntent", parameters("Landroid/content/Intent;"), "V", AccessFlags.PUBLIC.value, null, null, body(2, returns)),
                ),
            ),
        )
    }

    /** Every class the settings patch hooks. */
    fun all(): List<ClassDef> = appAndMainActivity()
}
