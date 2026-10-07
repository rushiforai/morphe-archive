/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.threads.misc.settings

import app.morphe.ExtensionDex
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.threads.misc.extension.THREADS_APPLICATION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
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

    /** A method whose body is [code], in smali. */
    fun smali(type: String, name: String, parameters: List<String>, returns: String, flags: Int, registers: Int, code: String): Method =
        ImmutableMethod(type, name, parameters(*parameters.toTypedArray()), returns, flags, null, null, MutableMethodImplementation(registers))
            .toMutable().apply { addInstructionsWithLabels(0, code) }

    /**
     * Threads' settings screen as the settings row patch reads it on 449 and 448, cut down to two
     * entries: the settings row, the Accounts Center row, the entry enum, Kotlin's Function0, and
     * the list lambda whose More case starts its group on the composer, sets its click, label and
     * icon and goes to the shared run that calls the settings row. The extension's row and its
     * click come from the real payload.
     */
    fun settingsList(): List<ClassDef> {
        val screen = "Lfixture/SettingsScreen;"
        val entry = "Lfixture/Entry;"
        val composer = "Lfixture/Composer;"
        val modifier = "Lfixture/Modifier;"
        val static = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        val rowParameters = listOf(composer, modifier, "Ljava/lang/Integer;", FUNCTION0, "I", "I", "I", "I", "Z")
        val row = "$screen->row(${rowParameters.joinToString("")})V"
        val accountsParameters = listOf(composer, modifier, "Ljava/lang/String;", "Ljava/lang/String;", FUNCTION0, "I", "I", "I", "Z")
        return listOf(
            ImmutableClassDef(
                FUNCTION0, AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value,
                "Ljava/lang/Object;", null, null, null, null,
                listOf(ImmutableMethod(FUNCTION0, "invoke", parameters(), "Ljava/lang/Object;",
                    AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)),
            ),
            ImmutableClassDef(
                entry, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.ENUM.value, "Ljava/lang/Enum;",
                null, null, null, null,
                listOf(
                    smali(entry, "<clinit>", listOf(), "V", AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value, 3, """
                        const-string v0, "ACCOUNT_CENTER"
                        const/4 v1, 0x0
                        new-instance v2, $entry
                        invoke-direct { v2, v0, v1 }, $entry-><init>(Ljava/lang/String;I)V
                        const-string v0, "$MORE_ENTRY"
                        const/4 v1, 0x1
                        new-instance v2, $entry
                        invoke-direct { v2, v0, v1 }, $entry-><init>(Ljava/lang/String;I)V
                        return-void
                    """),
                ),
            ),
            ImmutableClassDef(
                screen, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
                listOf(
                    smali(screen, "row", rowParameters, "V", static, 10, """
                        const-string v0, "${ROW_NOTE}1)"
                        return-void
                    """),
                    smali(screen, "accounts", accountsParameters, "V", static, 10, """
                        const-string v0, "${ACCOUNTS_ROW_NOTE}1)"
                        return-void
                    """),
                    smali(screen, "list", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V", static, 20, """
                        const-string v0, "$LIST_NOTE (SettingsScreen.kt:1)"
                        move-object/from16 v2, p0
                        check-cast v2, $entry
                        move-object/from16 v1, p1
                        check-cast v1, $composer
                        invoke-virtual { v2 }, Ljava/lang/Enum;->ordinal()I
                        move-result v2
                        const/4 v3, 0x0
                        packed-switch v2, :entries
                        return-void
                        :account
                        const v4, 0x10
                        invoke-interface { v1, v4 }, $composer->start(I)V
                        const/4 v5, 0x0
                        const v6, 0x7f010001
                        const v7, 0x7f020001
                        goto :row
                        :more
                        const v4, 0x11
                        invoke-interface { v1, v4 }, $composer->start(I)V
                        const/4 v5, 0x0
                        const v6, 0x7f010002
                        const v7, 0x7f020002
                        goto :row
                        :row
                        sget-object v9, $modifier->companion:$modifier
                        const/16 v14, 0xc00
                        const/16 v15, 0x30
                        move-object v8, v1
                        move-object v10, v3
                        move-object v11, v5
                        move v12, v6
                        move v13, v7
                        move/from16 v16, v3
                        invoke-static/range { v8 .. v16 }, $row
                        return-void
                        :entries
                        .packed-switch 0x0
                            :account
                            :more
                        .end packed-switch
                    """),
                ),
            ),
            ExtensionDex.classDef(SETTINGS_ROW),
            ExtensionDex.classDef(SETTINGS_ROW_CLICK),
        )
    }

    /** Every class the settings patch hooks. */
    fun all(): List<ClassDef> = appAndMainActivity() + settingsList()
}
