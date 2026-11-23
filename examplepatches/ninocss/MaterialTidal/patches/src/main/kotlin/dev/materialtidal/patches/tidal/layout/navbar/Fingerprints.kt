package dev.materialtidal.patches.tidal.layout.navbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal object AppScaffoldOuterFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.appscaffold.ui.composable.AppScaffold (AppScaffold.kt:98)"),
    ),
)

internal object AppScaffoldInnerFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.appscaffold.ui.composable.AppScaffold (AppScaffold.kt:206)"),
        methodCall(
            name = "d",
            parameters = listOf("Lwha;"),
            returnType = "J",
        ),
    ),
)

internal object AppScaffoldShapesClinitFingerprint : Fingerprint(
    definingClass = "Lqj0;",
    name = "<clinit>",
    returnType = "V",
)

internal object TabBarComposableFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.appscaffold.ui.composable.TabBar (TabBar.kt:69)"),
    ),
)

internal object MiniPlayerOuterComposableFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.appscaffold.ui.composable.MiniPlayer (MiniPlayer.kt:65)"),
    ),
)

internal object MiniPlayerComposableFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.appscaffold.ui.composable.MiniPlayer (MiniPlayer.kt:71)"),
    ),
)

internal object SheetStateShowFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/SheetState;",
    name = "show",
    returnType = "Ljava/lang/Object;",
)

internal object ModalBottomSheetAnchorsInvokeFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/ModalBottomSheetKt\$ModalBottomSheetContent\$3\$1;",
    name = "invoke-GpV2Q24",
    parameters = listOf("J", "J"),
    returnType = "Lkotlin/Pair;",
)

internal object AnchoredDraggableStateUpdateAnchorsFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/material3/internal/AnchoredDraggableState;",
    name = "updateAnchors",
    parameters = listOf("Landroidx/compose/material3/internal/DraggableAnchors;", "Ljava/lang/Object;"),
    returnType = "V",
)
