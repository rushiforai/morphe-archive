/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.settings

import app.morphe.patches.instagram.misc.extension.INSTAGRAM_APPLICATION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference

/**
 * Stand-ins for the Instagram classes the settings patch hooks, for a test that runs the whole
 * patch over a few classes instead of an APK: the application with its onCreate, the main
 * activity with its onNewIntent, and the settings screen with its factory and onCreateView.
 */
internal object SettingsPatchHosts {
    const val SETTINGS_SCREEN = "Lfixture/SettingsScreenFragment;"

    fun all(): List<ClassDef> = listOf(application(), mainActivity(), settingsScreen())

    /**
     * A settings screen shaped like Instagram 449's: a static factory that puts the two keys in the
     * arguments and answers an instance, and an onCreateView answering a view from v1, reached
     * from a branch at 1 and falling through from 2 when [branched], or straight after it's made.
     */
    fun settingsScreen(branched: Boolean = false): ClassDef {
        val view = ImmutableTypeReference("Landroid/view/View;")
        val createView = if (branched) {
            listOf(
                ImmutableInstruction21c(Opcode.NEW_INSTANCE, 1, view),
                ImmutableInstruction21t(Opcode.IF_EQZ, 4, 4),
                ImmutableInstruction21c(Opcode.NEW_INSTANCE, 1, view),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1),
            )
        } else {
            listOf(ImmutableInstruction21c(Opcode.NEW_INSTANCE, 1, view), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1))
        }
        return ImmutableClassDef(
            SETTINGS_SCREEN, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Landroidx/fragment/app/Fragment;",
            null, null, null, null,
            listOf(
                ImmutableMethod(
                    SETTINGS_SCREEN, "A01",
                    listOf(ImmutableMethodParameter("LX/0PKz;", null, null), ImmutableMethodParameter("Ljava/lang/String;", null, null)),
                    SETTINGS_SCREEN, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null,
                    ImmutableMethodImplementation(
                        3,
                        listOf(
                            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("screen_id")),
                            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("new_settings_session")),
                            ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(SETTINGS_SCREEN)),
                            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                        ),
                        null, null,
                    ),
                ),
                ImmutableMethod(
                    SETTINGS_SCREEN, "onCreateView",
                    listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;")
                        .map { ImmutableMethodParameter(it, null, null) },
                    "Landroid/view/View;", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
                    ImmutableMethodImplementation(6, createView, null, null),
                ),
            ),
        )
    }

    private fun application(): ClassDef {
        val returns = ImmutableInstruction10x(Opcode.RETURN_VOID)
        return ImmutableClassDef(
            INSTAGRAM_APPLICATION, AccessFlags.PUBLIC.value, "Landroid/app/Application;", null, null, null, null,
            listOf(
                ImmutableMethod(
                    INSTAGRAM_APPLICATION, "onCreate", emptyList(), "V", AccessFlags.PUBLIC.value, null, null,
                    ImmutableMethodImplementation(1, listOf(returns), null, null),
                ),
            ),
        )
    }

    private fun mainActivity(): ClassDef {
        val returns = ImmutableInstruction10x(Opcode.RETURN_VOID)
        return ImmutableClassDef(
            MAIN_ACTIVITY, AccessFlags.PUBLIC.value, "Landroid/app/Activity;", null, null, null, null,
            listOf(
                ImmutableMethod(
                    MAIN_ACTIVITY, "onNewIntent", listOf(ImmutableMethodParameter("Landroid/content/Intent;", null, null)),
                    "V", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
                    ImmutableMethodImplementation(2, listOf(returns), null, null),
                ),
            ),
        )
    }
}
