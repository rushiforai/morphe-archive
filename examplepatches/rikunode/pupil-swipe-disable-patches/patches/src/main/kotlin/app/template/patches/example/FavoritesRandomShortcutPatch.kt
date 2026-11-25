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

private object GalleryTypeListShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/GalleryDetailKt;",
    name = "GalleryDetail\$lambda\$3\$0",
    parameters = listOf(
        "Ljava/util/List;",
        "Lxyz/quaver/pupil/hitomi/Gallery;",
        "Lkotlin/jvm/functions/Function1;",
        "I",
        "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function1;",
        "Landroidx/compose/runtime/State;",
        "Lkotlin/jvm/functions/Function1;",
        "Landroidx/compose/foundation/lazy/LazyListScope;",
    ),
    returnType = "Lkotlin/Unit;",
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

private object NavigationClickShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/PupilAppKt;",
    name = "PupilApp\$lambda\$9\$0\$0\$0\$0\$0",
    parameters = listOf(
        "Lxyz/quaver/pupil/ui/compose/Destination;",
        "Lkotlin/jvm/functions/Function0;",
        "Ljava/lang/String;",
        "Lxyz/quaver/pupil/ui/viewmodel/SearchViewModel;",
        "Landroidx/navigation/NavHostController;",
    ),
    returnType = "Lkotlin/Unit;",
)

private object NavigationIconShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/PupilAppKt;",
    name = "PupilApp\$lambda\$9\$0\$0\$0\$1",
    parameters = listOf(
        "Lxyz/quaver/pupil/ui/compose/Destination;",
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
    returnType = "Lkotlin/Unit;",
)

private object NavigationLabelShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/PupilAppKt;",
    name = "PupilApp\$lambda\$9\$0\$0\$0\$2",
    parameters = listOf(
        "Lxyz/quaver/pupil/ui/compose/Destination;",
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
    returnType = "Lkotlin/Unit;",
)

private object NavigationContentShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/PupilAppKt;",
    name = "PupilApp\$lambda\$9\$2",
    parameters = listOf(
        "Landroidx/compose/runtime/snapshots/SnapshotStateList;",
        "Landroidx/navigation/NavHostController;",
        "Lkotlin/jvm/functions/Function1;",
        "Lxyz/quaver/pupil/ui/viewmodel/SearchViewModel;",
        "Lkotlin/jvm/functions/Function1;",
        "Landroidx/compose/material3/SnackbarHostState;",
        "Landroidx/compose/foundation/layout/PaddingValues;",
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
    returnType = "Lkotlin/Unit;",
)

private object NavigationTopLevelShortcutFingerprint : Fingerprint(
    definingClass = "Lxyz/quaver/pupil/ui/compose/PupilAppKt;",
    name = "navigateToTopLevel",
    parameters = listOf(
        "Landroidx/navigation/NavHostController;",
        "Lxyz/quaver/pupil/ui/compose/Destination;",
    ),
    returnType = "V",
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
    description = "Random Favorites shortcuts on the Favorites tab, gallery details and optional Downloads navigation slot, with runtime settings.",
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

        val typeListMethod = GalleryTypeListShortcutFingerprint.method
        val typeListInstructions = typeListMethod.implementation?.instructions
            ?: error("Pupil 6.1.1 gallery type LazyList bytecode is missing")
        // Original Pupil 6.1.1 DEX: 94 instructions, 14 registers.
        // Index 14 finishes the gallery menu / viewer-download item.
        // Indices 15..19 construct the GalleryTypeIndicator item, registered at 20.
        // Inject at 20, after the menu item and before the type chip.
        require(typeListInstructions.size == 94 &&
            typeListMethod.implementation?.registerCount == 14 &&
            listOf(8, 14, 20, 26).all { index ->
                typeListInstructions[index].opcode == Opcode.INVOKE_STATIC &&
                    (typeListInstructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                    "Landroidx/compose/foundation/lazy/LazyItemScope\$-CC;->item\$default(Landroidx/compose/foundation/lazy/LazyListScope;Lkotlin/jvm/functions/Function3;)V"
            } &&
            typeListInstructions[15].opcode == Opcode.NEW_INSTANCE &&
            (typeListInstructions[15] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/GalleryDetailKt\$\$ExternalSyntheticLambda2;" &&
            typeListInstructions[16].opcode == Opcode.INVOKE_DIRECT &&
            (typeListInstructions[16] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/GalleryDetailKt\$\$ExternalSyntheticLambda2;-><init>(ILkotlin/jvm/functions/Function1;Lxyz/quaver/pupil/hitomi/Gallery;)V" &&
            typeListInstructions[17].opcode == Opcode.NEW_INSTANCE &&
            (typeListInstructions[17] as? ReferenceInstruction)?.reference?.toString() ==
                "Landroidx/compose/runtime/internal/ComposableLambdaImpl;" &&
            typeListInstructions[18].opcode == Opcode.CONST &&
            typeListInstructions[19].opcode == Opcode.INVOKE_DIRECT &&
            (typeListInstructions[19] as? ReferenceInstruction)?.reference?.toString() ==
                "Landroidx/compose/runtime/internal/ComposableLambdaImpl;-><init>(ILjava/lang/Object;Z)V" &&
            typeListInstructions[27].opcode == Opcode.MOVE_OBJECT &&
            typeListInstructions[28].opcode == Opcode.CHECK_CAST &&
            typeListInstructions[29].opcode == Opcode.INVOKE_INTERFACE &&
            (typeListInstructions[29] as? ReferenceInstruction)?.reference?.toString() ==
                "Ljava/util/Collection;->isEmpty()Z" &&
            typeListInstructions[30].opcode == Opcode.MOVE_RESULT &&
            typeListInstructions[31].opcode == Opcode.IF_NEZ &&
            typeListInstructions[32].opcode == Opcode.NEW_INSTANCE &&
            (typeListInstructions[32] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/GalleryDetailKt\$\$ExternalSyntheticLambda4;" &&
            typeListInstructions[33].opcode == Opcode.INVOKE_DIRECT &&
            (typeListInstructions[33] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/GalleryDetailKt\$\$ExternalSyntheticLambda4;-><init>(Ljava/util/List;Lkotlin/jvm/functions/Function1;I)V" &&
            typeListInstructions[34].opcode == Opcode.NEW_INSTANCE &&
            (typeListInstructions[34] as? ReferenceInstruction)?.reference?.toString() ==
                "Landroidx/compose/runtime/internal/ComposableLambdaImpl;" &&
            typeListInstructions[35].opcode == Opcode.CONST &&
            typeListInstructions[36].opcode == Opcode.INVOKE_DIRECT &&
            (typeListInstructions[36] as? ReferenceInstruction)?.reference?.toString() ==
                "Landroidx/compose/runtime/internal/ComposableLambdaImpl;-><init>(ILjava/lang/Object;Z)V" &&
            typeListInstructions[37].opcode == Opcode.INVOKE_STATIC &&
            (typeListInstructions[37] as? ReferenceInstruction)?.reference?.toString() ==
                "Landroidx/compose/foundation/lazy/LazyItemScope\$-CC;->item\$default(Landroidx/compose/foundation/lazy/LazyListScope;Lkotlin/jvm/functions/Function3;)V" &&
            typeListInstructions[38].opcode == Opcode.INVOKE_VIRTUAL &&
            (typeListInstructions[38] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/hitomi/Gallery;->getThumbnails()Ljava/util/List;" &&
            typeListInstructions[41].opcode == Opcode.INVOKE_INTERFACE &&
            (typeListInstructions[41] as? ReferenceInstruction)?.reference?.toString() ==
                "Ljava/util/Collection;->isEmpty()Z" &&
            typeListInstructions[43].opcode == Opcode.IF_NEZ &&
            typeListInstructions[44].opcode == Opcode.SGET_OBJECT &&
            (typeListInstructions[44] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/ComposableSingletons\$GalleryDetailKt;->INSTANCE:Lxyz/quaver/pupil/ui/compose/ComposableSingletons\$GalleryDetailKt;" &&
            typeListInstructions[45].opcode == Opcode.INVOKE_VIRTUAL &&
            (typeListInstructions[45] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/ComposableSingletons\$GalleryDetailKt;->getLambda\$-1638367423\$app()Lkotlin/jvm/functions/Function3;" &&
            typeListInstructions[47].opcode == Opcode.INVOKE_STATIC &&
            (typeListInstructions[47] as? ReferenceInstruction)?.reference?.toString() ==
                "Landroidx/compose/foundation/lazy/LazyItemScope\$-CC;->item\$default(Landroidx/compose/foundation/lazy/LazyListScope;Lkotlin/jvm/functions/Function3;)V"
        ) { "Unexpected Pupil 6.1.1 gallery-menu-to-type boundary; refusing shortcut injection" }
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

        val navClickMethod = NavigationClickShortcutFingerprint.method
        val navClickInstructions = navClickMethod.implementation?.instructions
            ?: error("Missing Pupil 6.1.1 bottom navigation click method")
        require(navClickInstructions.size == 16 &&
            navClickMethod.implementation?.registerCount == 7 &&
            navClickInstructions[0].opcode == Opcode.SGET_OBJECT &&
            (navClickInstructions[0] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/Destination;->Settings:Lxyz/quaver/pupil/ui/compose/Destination;" &&
            navClickInstructions[14].opcode == Opcode.INVOKE_STATIC &&
            (navClickInstructions[14] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/PupilAppKt;->navigateToTopLevel(Landroidx/navigation/NavHostController;Lxyz/quaver/pupil/ui/compose/Destination;)V"
        ) { "Unexpected Pupil 6.1.1 navigation click layout" }

        val navIconMethod = NavigationIconShortcutFingerprint.method
        val navIconInstructions = navIconMethod.implementation?.instructions
            ?: error("Missing Pupil 6.1.1 navigation icon method")
        require(navIconInstructions.size == 27 &&
            navIconMethod.implementation?.registerCount == 12 &&
            navIconInstructions[13].opcode == Opcode.INVOKE_VIRTUAL &&
            (navIconInstructions[13] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/Destination;->getIconRes()I" &&
            navIconInstructions[14].opcode == Opcode.MOVE_RESULT &&
            navIconInstructions[15].opcode == Opcode.INVOKE_STATIC &&
            (navIconInstructions[15] as? ReferenceInstruction)?.reference?.toString()?.startsWith(
                "Landroidx/compose/ui/res/PainterResources_androidKt;->painterResource("
            ) == true
        ) { "Unexpected Pupil 6.1.1 navigation icon layout" }

        val navLabelMethod = NavigationLabelShortcutFingerprint.method
        val navLabelInstructions = navLabelMethod.implementation?.instructions
            ?: error("Missing Pupil 6.1.1 navigation label method")
        require(navLabelInstructions.size == 39 &&
            navLabelMethod.implementation?.registerCount == 25 &&
            navLabelInstructions[13].opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
            (navLabelInstructions[13] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/Destination;->getLabelRes()I" &&
            navLabelInstructions[14].opcode == Opcode.MOVE_RESULT &&
            navLabelInstructions[15].opcode == Opcode.INVOKE_STATIC &&
            (navLabelInstructions[15] as? ReferenceInstruction)?.reference?.toString()?.startsWith(
                "Landroidx/compose/ui/res/StringResources_androidKt;->stringResource("
            ) == true
        ) { "Unexpected Pupil 6.1.1 navigation label layout" }

        val navContentMethod = NavigationContentShortcutFingerprint.method
        val navContentInstructions = navContentMethod.implementation?.instructions
            ?: error("Missing Pupil 6.1.1 navigation content method")
        require(navContentInstructions.size == 55 &&
            navContentMethod.implementation?.registerCount == 19 &&
            navContentInstructions[0].opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
            (navContentInstructions[0] as? ReferenceInstruction)?.reference?.toString() ==
                "Ljava/lang/Object;->getClass()Ljava/lang/Class;" &&
            navContentInstructions[29].opcode == Opcode.INVOKE_STATIC &&
            (navContentInstructions[29] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/ScreenCoverKt;->getLocalScreenCovered()Landroidx/compose/runtime/ProvidableCompositionLocal;"
        ) { "Unexpected Pupil 6.1.1 navigation content layout" }

        val topLevelMethod = NavigationTopLevelShortcutFingerprint.method
        val topLevelInstructions = topLevelMethod.implementation?.instructions
            ?: error("Missing Pupil 6.1.1 top-level navigation method")
        require(topLevelInstructions.size == 31 &&
            topLevelMethod.implementation?.registerCount == 5 &&
            topLevelInstructions[0].opcode == Opcode.INVOKE_VIRTUAL &&
            (topLevelInstructions[0] as? ReferenceInstruction)?.reference?.toString() ==
                "Lxyz/quaver/pupil/ui/compose/Destination;->getRoute()Ljava/lang/String;" &&
            topLevelInstructions.last().opcode == Opcode.RETURN_VOID
        ) { "Unexpected Pupil 6.1.1 native top-level navigation layout" }

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
                move-object/from16 v0, p5
                invoke-static {v0}, $SHORTCUT_CLASS->bindDetail(Lkotlin/jvm/functions/Function1;)V
            """.trimIndent(),
        )
        typeListMethod.addInstructions(
            20,
            "invoke-static {p8}, $SHORTCUT_CLASS->addTypeShortcutItem(Ljava/lang/Object;)V",
        )
        settingsMethod.addInstructions(
            867,
            "invoke-static {v2, v5}, $SHORTCUT_CLASS->renderPositionPreference(Landroid/content/Context;Ljava/lang/Object;)V",
        )
        navContentMethod.addInstructions(
            0,
            "invoke-static {p0, p1}, $SHORTCUT_CLASS->bindNavigation(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        navClickMethod.addInstructions(
            0,
            """
                invoke-static {p0}, $SHORTCUT_CLASS->onDownloadsNavClick(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :pupil_original_nav
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
                :pupil_original_nav
            """.trimIndent(),
        )
        navIconMethod.addInstructions(
            15,
            """
                invoke-static {v9}, $SHORTCUT_CLASS->navIconResource(I)I
                move-result v9
            """.trimIndent(),
        )
        navLabelMethod.addInstructions(
            15,
            """
                invoke-static {v0}, $SHORTCUT_CLASS->navLabelResource(I)I
                move-result v0
            """.trimIndent(),
        )
        resumeMethod.addInstructions(
            1,
            "invoke-static {p0}, $SHORTCUT_CLASS->install(Landroid/app/Activity;)V",
        )
    }
}
