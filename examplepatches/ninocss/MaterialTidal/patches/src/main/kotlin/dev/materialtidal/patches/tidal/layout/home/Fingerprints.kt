package dev.materialtidal.patches.tidal.layout.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal object AlbumGridItemCellFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.catalogue.ui.composables.AlbumGridItemCell (GridItemCell.kt:243)"),
    ),
)

internal object ShortcutListModuleClinitFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/android/feature/home/ui/composables/shortcutlist/ShortcutListModuleKt;",
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/compose/ui/unit/Dp;",
            name = "constructor-impl",
            parameters = listOf("F"),
            returnType = "F",
        ),
    ),
)

internal object ShortcutCardFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/android/feature/home/ui/composables/shortcutlist/ShortcutListModuleKt;",
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.home.ui.composables.shortcutlist.ShortcutCard (ShortcutListModule.kt:440)"),
    ),
)

internal object ShortcutPlayableItemFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/android/feature/home/ui/composables/shortcutlist/ShortcutListModuleKt;",
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.home.ui.composables.shortcutlist.ShortcutListPlayableContentItem (ShortcutListModule.kt:317)"),
    ),
)

internal object VibeCellFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.home.ui.composables.vibepicker.VibeCell (VibePickerRow.kt:51)"),
    ),
)

internal object HomeAppBarFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.home.ui.composables.AppBarWithActions (AppBar.kt:43)"),
    ),
)

internal object HomeScreenScaffoldFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("com.tidal.android.feature.home.ui.HomeScreen.<anonymous> (HomeScreen.kt:98)"),
    ),
)

internal object HomeScreenScrollableContentLazyColumnFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("com.tidal.android.feature.home.ui.composables.HomeScreenScrollableContent.<anonymous>.<anonymous> (HomeScreenScrollableContent.kt:77)"),
        methodCall(
            definingClass = "Landroidx/compose/foundation/lazy/LazyDslKt;",
            name = "LazyColumn",
        ),
    ),
)

internal object HomePullToRefreshFlagFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        string("home-page-pull-to-refresh"),
        string("Pull to refresh feature flag"),
    ),
)

internal object HomeUiStateSuccessInitFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/android/feature/home/ui/a\$d;",
    name = "<init>",
    parameters = listOf(
        "Ljava/lang/String;",
        "L",
        "Lcom/tidal/android/feature/home/ui/a\$d\$a;",
        "Z",
        "Z",
    ),
    returnType = "V",
)

internal object HeadlinersBannerFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.upload.ui.headliners.HeadlinersBanner (HeadlinersBanner.kt:41)"),
    ),
)

internal object PromoModuleRowFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/android/dynamicpages/ui/composables/promo/PromoModuleRowKt;",
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.dynamicpages.ui.composables.promo.PromoModuleRow (PromoModuleRow.kt:10)"),
    ),
)

internal object MerchModuleRowFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/android/dynamicpages/ui/composables/merch/MerchModuleRowKt;",
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.dynamicpages.ui.composables.merch.MerchModuleRow (MerchModuleRow.kt:42)"),
    ),
)
