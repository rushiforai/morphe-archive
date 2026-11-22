package dev.rikunode.pupil

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val SHORTCUT_CLASS = "Ldev/rikunode/pupil/FavoritesRandomShortcut;"

private object GalleryListShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/GalleryListKt;",
    name = "GalleryList",
    parameters = listOf(
        "Lxyz/quaver/pupil/ui/viewmodel/GalleryListViewModel;",
        "Landroidx/compose/ui/Modifier;",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function4;",
        "Lkotlin/jvm/functions/Function3;",
        "Landroidx/compose/runtime/Composer;",
        "I",
        "I",
    ),
    returnType = "V",
)

private object GalleryDetailShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/GalleryDetailKt;",
    name = "GalleryDetailPage",
    parameters = listOf(
        "I",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
    returnType = "V",
)

private object SettingsScreenShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/settings/SettingsScreenKt;",
    name = "SettingsScreen\$lambda\$7",
    parameters = listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Lxyz/quaver/pupil/util/Settings;",
        "Landroidx/compose/runtime/MutableState;",
        "Landroidx/compose/runtime/MutableState;",
        "Lkotlin/jvm/functions/Function0;",
        "Landroid/content/Context;",
        "Landroidx/activity/compose/ManagedActivityResultLauncher;",
        "Lkotlin/jvm/functions/Function0;",
        "Landroidx/compose/foundation/layout/ColumnScope;",
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
    returnType = "Lkotlin/Unit;",
)

private object MainResumeShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/MainComposeActivity;",
    name = "onResume",
    parameters = emptyList(),
    returnType = "V",
)

@Suppress("unused")
val favoritesRandomShortcutPatch = bytecodePatch(
    name = "Favorites random shortcut",
    description = "Show one random gallery button on the Favorites tab, with its right/left position selectable in Pupil settings.",
    default = false,
) {
    compatibleWith(PupilCompatibility)

    extendWith("extensions/extension.mpe")

    execute {
        val listMethod = GalleryListShortcutFingerprint.method
        val listInstructions = listMethod.implementation?.instructions
            ?: error("Pupil 6.1.1 GalleryList bytecode is missing")
        // Verified against original Pupil 6.1.1 classes.dex, not the Java decompiler's
        // simplified statement ordering. The first three dex ops move parameters.
        require(listInstructions.size == 577 &&
            listMethod.implementation?.registerCount == 45 &&
            listInstructions[0].opcode == Opcode.MOVE_OBJECT_FROM16 &&
            (listInstructions[3] as? ReferenceInstruction)?.reference?.toString() ==
                "Ljava/lang/Object;->getClass()Ljava/lang/Class;"
        ) { "Unexpected Pupil 6.1.1 GalleryList layout; refusing random shortcut patch" }

        val detailMethod = GalleryDetailShortcutFingerprint.method
        val detailInstructions = detailMethod.implementation?.instructions
            ?: error("Pupil 6.1.1 GalleryDetailPage bytecode is missing")
        require(detailInstructions.size == 176 &&
            detailMethod.implementation?.registerCount == 32 &&
            detailInstructions[0].opcode == Opcode.MOVE_FROM16
        ) {
            "Unexpected Pupil 6.1.1 GalleryDetailPage layout; refusing random shortcut patch"
        }

        val resumeMethod = MainResumeShortcutFingerprint.method
        val resumeInstructions = resumeMethod.implementation?.instructions
            ?: error("Pupil 6.1.1 MainComposeActivity.onResume bytecode is missing")
        require(resumeInstructions.size == 6 &&
            resumeMethod.implementation?.registerCount == 4 &&
            resumeInstructions[0].opcode == Opcode.INVOKE_SUPER &&
            resumeInstructions.last().opcode == Opcode.RETURN_VOID &&
            resumeInstructions.any {
                it.opcode == Opcode.INVOKE_STATIC &&
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains(
                        "Lxyz/quaver/pupil/util/UpdateKt;->checkUpdate\$default"
                    ) == true
            }
        ) { "Unexpected Pupil 6.1.1 MainComposeActivity.onResume layout" }

        val settingsMethod = SettingsScreenShortcutFingerprint.method
        val settingsInstructions = settingsMethod.implementation?.instructions
            ?: error("Pupil 6.1.1 settings bytecode is missing")
        // Original Pupil 6.1.1 classes.dex: 900 instructions, 46 registers.
        // Index 866 is Favorites-management Preference, followed by
        // const/4 and UserIdPreference. v2=Context and v5=ComposerImpl
        // remain live here; the injected call reads but does not clobber either.
        require(settingsInstructions.size == 900 &&
            settingsMethod.implementation?.registerCount == 46 &&
            settingsInstructions[853].opcode == Opcode.SGET &&
            (settingsInstructions[853] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/R\$string;->settings_manage_favorites:I" &&
            settingsInstructions[865].opcode == Opcode.MOVE_OBJECT_FROM16 &&
            settingsInstructions[866].opcode == Opcode.INVOKE_STATIC_RANGE &&
            (settingsInstructions[866] as? ReferenceInstruction)?.reference?.toString()?.startsWith(
                "Lxyz/quaver/pupil/ui/compose/settings/PreferenceKt;->Preference("
            ) == true &&
            settingsInstructions[867].opcode == Opcode.CONST_4 &&
            settingsInstructions[868].opcode == Opcode.INVOKE_STATIC &&
            (settingsInstructions[868] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/settings/SettingsScreenKt;->UserIdPreference(Landroidx/compose/runtime/Composer;I)V"
        ) { "Unexpected Pupil 6.1.1 SettingsScreen layout; refusing settings shortcut patch" }

        listMethod.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p3
                invoke-static {v0, v1}, $SHORTCUT_CLASS->bind(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )
        detailMethod.addInstructions(
            0,
            """
                move-object/from16 v0, p1
                invoke-static {v0}, $SHORTCUT_CLASS->wrapOnDismiss(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                move-result-object v0
                move-object/16 p1, v0
                invoke-static {}, $SHORTCUT_CLASS->hideForDetail()V
            """.trimIndent(),
        )
        settingsMethod.addInstructions(
            867,
            "invoke-static {v2, v5}, $SHORTCUT_CLASS->renderPositionPreference(Landroid/content/Context;Ljava/lang/Object;)V",
        )
        resumeMethod.addInstructions(
            1,
            "invoke-static {p0}, $SHORTCUT_CLASS->install(Landroid/app/Activity;)V",
        )
    }
}
