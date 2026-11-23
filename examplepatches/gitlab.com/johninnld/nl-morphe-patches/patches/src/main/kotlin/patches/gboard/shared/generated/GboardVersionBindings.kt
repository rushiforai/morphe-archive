package patches.gboard.shared.generated

import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.GboardTypeTarget

internal object GboardVersionBindings {
    const val targetVersion = "18.8.0-beta"
    const val profileVersion = "1.7.0"
    const val sourceSha256 = "ported-from-18.5.11"

    val `apCatalogCopy` = GboardMethodTarget(
        classType = "Lauco;",
        name = "n",
        parameterTypes = listOf("Ljava/util/Collection;"),
        returnType = "Lauco;",
    )
    val `apControllerOrderField` = GboardFieldTarget(
        classType = "Laajh;",
        name = "g",
        type = "Laaia;",
    )
    val `apDescriptorBuild` = GboardMethodTarget(
        classType = "Laaej;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "Laadr;",
    )
    val `apDescriptorFactory` = GboardMethodTarget(
        classType = "Laadr;",
        name = "m",
        parameterTypes = emptyList(),
        returnType = "Laadm;",
    )
    val `apDescriptorLabel` = GboardFieldTarget(
        classType = "Laaej;",
        name = "d",
        type = "Ljava/lang/String;",
    )
    val `apDescriptorRegister` = GboardMethodTarget(
        classType = "Laajh;",
        name = "g",
        parameterTypes = listOf("Laadr;", "Z"),
        returnType = "V",
    )
    val `apDescriptorToken` = GboardMethodTarget(
        classType = "Laaej;",
        name = "q",
        parameterTypes = listOf("Ljava/lang/String;"),
        returnType = "V",
    )
    val `apMasterCatalogSet` = GboardFieldTarget(
        classType = "Laaia;",
        name = "b",
        type = "Lauco;",
    )
    val `calculatorHidden` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `calculatorInputStart` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onStartInputView",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )
    val `calculatorInputView` = GboardFieldTarget(
        classType = "Lafae;",
        name = "k",
        type = "Lcom/google/android/libraries/inputmethod/inputview/InputView;",
    )
    val `calculatorSelection` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onUpdateSelection",
        parameterTypes = listOf("I", "I", "I", "I", "I", "I"),
        returnType = "V",
    )
    val `clipboardAdapterContext` = GboardFieldTarget(
        classType = "Llii;",
        name = "e",
        type = "Landroid/content/Context;",
    )
    val `clipboardAdapterItems` = GboardFieldTarget(
        classType = "Llii;",
        name = "o",
        type = "Ljava/util/List;",
    )
    val `clipboardAdapterRecycler` = GboardFieldTarget(
        classType = "Llii;",
        name = "j",
        type = "Landroid/support/v7/widget/RecyclerView;",
    )
    val `clipboardCleanupCursor` = GboardMethodTarget(
        classType = "Lljp;",
        name = "B",
        parameterTypes = listOf("Landroid/database/Cursor;"),
        returnType = "V",
    )
    val `clipboardClipId` = GboardFieldTarget(
        classType = "Llgl;",
        name = "d",
        type = "J",
    )
    val `clipboardClipModel` = GboardFieldTarget(
        classType = "Llgl;",
        name = "g",
        type = "Llgn;",
    )
    val `clipboardColumns` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;",
        name = "b",
        parameterTypes = emptyList(),
        returnType = "I",
    )
    val `clipboardDelete` = GboardMethodTarget(
        classType = "Llip;",
        name = "h",
        parameterTypes = listOf("Landroid/content/Context;", "Ljava/util/List;"),
        returnType = "V",
    )
    val `clipboardGridManagerConstructor` = GboardMethodTarget(
        classType = "Llkm;",
        name = "<init>",
        parameterTypes = listOf("Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;", "I", "Landroid/support/v7/widget/RecyclerView;"),
        returnType = "V",
    )
    val `clipboardHolderText` = GboardFieldTarget(
        classType = "Llif;",
        name = "t",
        type = "Landroid/widget/TextView;",
    )
    val `clipboardIsPinned` = GboardMethodTarget(
        classType = "Llgl;",
        name = "n",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val `clipboardIsSensitive` = GboardMethodTarget(
        classType = "Llgl;",
        name = "m",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val `clipboardIsSpecial` = GboardMethodTarget(
        classType = "Llgl;",
        name = "o",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val `clipboardItemBind` = GboardMethodTarget(
        classType = "Llii;",
        name = "p",
        parameterTypes = listOf("Lra;", "I"),
        returnType = "V",
    )
    val `clipboardKeyboardAdapter` = GboardFieldTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;",
        name = "b",
        type = "Llii;",
    )
    val `clipboardKeyboardContext` = GboardFieldTarget(
        classType = "Lcom/google/android/libraries/inputmethod/keyboard/impl/AbstractKeyboard;",
        name = "x",
        type = "Landroid/content/Context;",
    )
    val `clipboardLayoutBuilt` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;",
        name = "e",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Ljava/lang/Object;"),
        returnType = "V",
    )
    val `clipboardLoader` = GboardMethodTarget(
        classType = "Llgo;",
        name = "call",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )
    val `clipboardLoaderContext` = GboardFieldTarget(
        classType = "Llgr;",
        name = "b",
        type = "Landroid/content/Context;",
    )
    val `clipboardLoaderOwner` = GboardFieldTarget(
        classType = "Llgo;",
        name = "a",
        type = "Llgr;",
    )
    val `clipboardModelSensitive` = GboardFieldTarget(
        classType = "Llgn;",
        name = "h",
        type = "Z",
    )
    val `clipboardModelText` = GboardFieldTarget(
        classType = "Llgn;",
        name = "a",
        type = "Ljava/lang/String;",
    )
    val `clipboardModelType` = GboardFieldTarget(
        classType = "Llgn;",
        name = "c",
        type = "I",
    )
    val `clipboardNotifyRemoved` = GboardMethodTarget(
        classType = "Lpu;",
        name = "n",
        parameterTypes = listOf("I"),
        returnType = "V",
    )
    val `clipboardPinnedCount` = GboardFieldTarget(
        classType = "Llii;",
        name = "z",
        type = "I",
    )
    val `clipboardPinnedHeader` = GboardFieldTarget(
        classType = "Llgl;",
        name = "b",
        type = "Llgl;",
    )
    val `clipboardPreferences` = GboardMethodTarget(
        classType = "Lahws;",
        name = "I",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Lahws;",
    )
    val `clipboardPrune` = GboardMethodTarget(
        classType = "Lljp;",
        name = "m",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `clipboardPruneContext` = GboardFieldTarget(
        classType = "Lljp;",
        name = "b",
        type = "Landroid/content/Context;",
    )
    val `clipboardPruneCount` = GboardFieldTarget(
        classType = "Lljp;",
        name = "f",
        type = "Ljava/util/concurrent/atomic/AtomicInteger;",
    )
    val `clipboardPruneDisabled` = GboardFieldTarget(
        classType = "Lljp;",
        name = "e",
        type = "Z",
    )
    val `clipboardQuery` = GboardMethodTarget(
        classType = "Llip;",
        name = "j",
        parameterTypes = listOf("Landroid/content/Context;", "Ljava/lang/String;", "[Ljava/lang/String;", "Ljava/lang/String;"),
        returnType = "Lauaz;",
    )
    val `clipboardQueryType` = GboardMethodTarget(
        classType = "Lljp;",
        name = "A",
        parameterTypes = listOf("Landroid/net/Uri;", "I"),
        returnType = "Landroid/database/Cursor;",
    )
    val `clipboardReadTimestamp` = GboardMethodTarget(
        classType = "Lahvo;",
        name = "m",
        parameterTypes = listOf("I", "J"),
        returnType = "J",
    )
    val `clipboardRecentCount` = GboardFieldTarget(
        classType = "Llii;",
        name = "p",
        type = "I",
    )
    val `clipboardRecentHeader` = GboardFieldTarget(
        classType = "Llgl;",
        name = "a",
        type = "Llgl;",
    )
    val `clipboardRecyclerManager` = GboardFieldTarget(
        classType = "Landroid/support/v7/widget/RecyclerView;",
        name = "n",
        type = "Lqg;",
    )
    val `clipboardRefresh` = GboardMethodTarget(
        classType = "Llii;",
        name = "R",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `clipboardSetSpan` = GboardMethodTarget(
        classType = "Landroid/support/v7/widget/StaggeredGridLayoutManager;",
        name = "O",
        parameterTypes = listOf("I"),
        returnType = "V",
    )
    val `clipboardSpanCount` = GboardFieldTarget(
        classType = "Landroid/support/v7/widget/StaggeredGridLayoutManager;",
        name = "a",
        type = "I",
    )
    val `clipboardSpecialHeader` = GboardFieldTarget(
        classType = "Llgl;",
        name = "c",
        type = "Llgl;",
    )
    val `clipboardTrim` = GboardMethodTarget(
        classType = "Llii;",
        name = "F",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `clipboardUri` = GboardMethodTarget(
        classType = "Llip;",
        name = "d",
        parameterTypes = listOf("Landroid/content/Context;", "I", "J"),
        returnType = "Landroid/net/Uri;",
    )
    val `clipboardWriteTimestamp` = GboardMethodTarget(
        classType = "Lahvo;",
        name = "s",
        parameterTypes = listOf("I", "J"),
        returnType = "V",
    )
    val `cursorResourcePreference` = GboardMethodTarget(
        classType = "Lahvo;",
        name = "x",
        parameterTypes = listOf("I", "Z"),
        returnType = "Z",
    )
    val `cursorStringPreference` = GboardMethodTarget(
        classType = "Lahws;",
        name = "am",
        parameterTypes = listOf("Ljava/lang/String;", "Z", "Z"),
        returnType = "Z",
    )
    val `customSymbolsAdapterBind` = GboardMethodTarget(
        classType = "Ltjl;",
        name = "p",
        parameterTypes = listOf("Lra;", "I"),
        returnType = "V",
    )
    val `customSymbolsAdapterConstructor` = GboardMethodTarget(
        classType = "Ltjl;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Ltld;", "Ljava/util/function/Consumer;", "I", "I"),
        returnType = "V",
    )
    val `customSymbolsAdapterCreate` = GboardMethodTarget(
        classType = "Ltjl;",
        name = "d",
        parameterTypes = listOf("Landroid/view/ViewGroup;", "I"),
        returnType = "Lra;",
    )
    val `customSymbolsAdapterViewType` = GboardMethodTarget(
        classType = "Lpu;",
        name = "b",
        parameterTypes = listOf("I"),
        returnType = "I",
    )
    val `customSymbolsBodyReady` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "ep",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardViewDef;"),
        returnType = "V",
    )
    val `customSymbolsCategoryBind` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "E",
        parameterTypes = listOf("Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonRecyclerView;", "Ljava/lang/String;"),
        returnType = "V",
    )
    val `customSymbolsCategoryChange` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "G",
        parameterTypes = listOf("I", "I"),
        returnType = "V",
    )
    val `customSymbolsCategoryName` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "A",
        parameterTypes = listOf("I"),
        returnType = "Ljava/lang/String;",
    )
    val `customSymbolsCorpus` = GboardMethodTarget(
        classType = "Lnxt;",
        name = "a",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "Lauaz;",
    )
    val `customSymbolsCorpusItemExtension` = GboardFieldTarget(
        classType = "Ladaz;",
        name = "g",
        type = "Ljava/lang/Class;",
    )
    val `customSymbolsCorpusItemKeyboard` = GboardFieldTarget(
        classType = "Ladaz;",
        name = "c",
        type = "Lagoo;",
    )
    val `customSymbolsFooterClick` = GboardMethodTarget(
        classType = "Lnyc;",
        name = "accept",
        parameterTypes = listOf("Ljava/lang/Object;"),
        returnType = "V",
    )
    val `customSymbolsHeaderGuard` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/expression/header/ConstraintHeaderViewImpl;",
        name = "n",
        parameterTypes = listOf("Lnji;"),
        returnType = "V",
    )
    val `customSymbolsHistorySink` = GboardMethodTarget(
        classType = "Lnmn;",
        name = "c",
        parameterTypes = listOf("Ljava/lang/String;"),
        returnType = "V",
    )
    val `customSymbolsKeyboardReady` = GboardMethodTarget(
        classType = "Laepb;",
        name = "a",
        parameterTypes = listOf("Lafez;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;", "Lagoo;"),
        returnType = "V",
    )
    val `customSymbolsM2Constructor` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Laffa;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;", "Lcom/google/android/libraries/inputmethod/metadata/ImeDef;", "Lagoo;"),
        returnType = "V",
    )
    val `customSymbolsM2HistoryField` = GboardFieldTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "b",
        type = "Lnmn;",
    )
    val `customSymbolsMetrics` = GboardMethodTarget(
        classType = "Lqzf;",
        name = "b",
        parameterTypes = listOf("Lagoo;"),
        returnType = "Lavcy;",
    )
    val `customSymbolsNavigation` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/expression/navbar/ScrollableNavigationView;",
        name = "a",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Lagoo;", "Z", "Ljava/util/function/Consumer;", "Landroid/os/Parcelable;", "Ljava/util/function/Supplier;", "Ljava/util/function/Supplier;"),
        returnType = "V",
    )
    val `customSymbolsProviderBefore` = GboardMethodTarget(
        classType = "Laffi;",
        name = "b",
        parameterTypes = listOf("Lagoo;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;"),
        returnType = "Lafez;",
    )
    val `customSymbolsProviderCreated` = GboardMethodTarget(
        classType = "Laffi;",
        name = "a",
        parameterTypes = listOf("Lagoo;", "Lafez;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;"),
        returnType = "V",
    )
    val `customSymbolsProviderValid` = GboardMethodTarget(
        classType = "Laffi;",
        name = "c",
        parameterTypes = listOf("Lagoo;"),
        returnType = "Z",
    )
    val `customSymbolsRecyclerAttach` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonRecyclerView;",
        name = "aK",
        parameterTypes = listOf("Ltld;", "Ljava/util/function/Consumer;"),
        returnType = "V",
    )
    val `customSymbolsSelectedIndex` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "o",
        parameterTypes = listOf("Lauaz;"),
        returnType = "I",
    )
    val `customSymbolsViewTransform` = GboardMethodTarget(
        classType = "Lantd;",
        name = "i",
        parameterTypes = listOf("Landroid/graphics/Matrix;", "Landroid/view/View;", "Landroid/view/View;"),
        returnType = "Landroid/view/View;",
    )
    val `customThemeFragmentPeerField` = GboardFieldTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/theme/listing/ThemeListingFragment;",
        name = "a",
        type = "Lvmb;",
    )
    val `customThemeLauncherLaunch` = GboardMethodTarget(
        classType = "Lvku;",
        name = "b",
        parameterTypes = listOf("Landroid/content/Intent;", "I", "Landroid/os/Bundle;"),
        returnType = "V",
    )
    val `customThemePeerContextField` = GboardFieldTarget(
        classType = "Lvmb;",
        name = "b",
        type = "Landroid/content/Context;",
    )
    val `customThemePeerLauncherField` = GboardFieldTarget(
        classType = "Lvmb;",
        name = "t",
        type = "Lvku;",
    )
    val `customThemePeerResultHandler` = GboardMethodTarget(
        classType = "Lvmb;",
        name = "j",
        parameterTypes = listOf("Landroid/content/Intent;"),
        returnType = "V",
    )
    val `customThemePlusHandler` = GboardMethodTarget(
        classType = "Lvmj;",
        name = "c",
        parameterTypes = listOf("Lvmh;", "Lvmn;", "I"),
        returnType = "V",
    )
    val `customThemeResultHandler` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/theme/listing/ThemeListingFragment;",
        name = "X",
        parameterTypes = listOf("I", "I", "Landroid/content/Intent;"),
        returnType = "V",
    )
    val `customThemeValidator` = GboardMethodTarget(
        classType = "Lajgb;",
        name = "h",
        parameterTypes = listOf("Ljava/io/File;"),
        returnType = "Z",
    )
    val `dynamicDarkPaletteConstructor` = GboardMethodTarget(
        classType = "Lajeb;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Z"),
        returnType = "V",
    )
    val `dynamicDarkPaletteIsLightField` = GboardFieldTarget(
        classType = "Lajeb;",
        name = "a",
        type = "Z",
    )
    val `dynamicDarkPaletteSurfaceContainerField` = GboardFieldTarget(
        classType = "Lajeb;",
        name = "Q",
        type = "I",
    )
    val `dynamicDarkPaletteSurfaceContainerLowField` = GboardFieldTarget(
        classType = "Lajeb;",
        name = "R",
        type = "I",
    )
    val `dynamicDarkPaletteSurfaceContainerLowestField` = GboardFieldTarget(
        classType = "Lajeb;",
        name = "S",
        type = "I",
    )
    val `dynamicDarkPaletteSurfaceDimField` = GboardFieldTarget(
        classType = "Lajeb;",
        name = "P",
        type = "I",
    )
    val `editingAccessPointsApController` = GboardMethodTarget(
        classType = "Laajh;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Laalq;"),
        returnType = "V",
    )
    val `editingAccessPointsApOrderFactory` = GboardMethodTarget(
        classType = "Laagb;",
        name = "m",
        parameterTypes = listOf("Landroid/content/Context;", "Laaiz;", "Lackz;", "Lauco;", "Lauco;"),
        returnType = "Laagb;",
    )
    val `editingApOndestroy` = GboardMethodTarget(
        classType = "Lafae;",
        name = "an",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `editingApOnfinishinput` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onFinishInput",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `editingApOnfinishinputview` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onFinishInputView",
        parameterTypes = listOf("Z"),
        returnType = "V",
    )
    val `editingApOnstartinput` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onStartInput",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )
    val `editingApOnstartinputview` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onStartInputView",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )
    val `editingApOnwindowhidden` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `flagBoolGetter` = GboardMethodTarget(
        classType = "Ladfs;",
        name = "g",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )
    val `flagNameField` = GboardFieldTarget(
        classType = "Ladfs;",
        name = "a",
        type = "Ljava/lang/String;",
    )
    val `frostedConfigure` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onConfigureWindow",
        parameterTypes = listOf("Landroid/view/Window;", "Z", "Z"),
        returnType = "V",
    )
    val `frostedHidden` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `frostedNavApply` = GboardMethodTarget(
        classType = "Lajlf;",
        name = "g",
        parameterTypes = listOf("Landroid/view/Window;", "Lajle;"),
        returnType = "V",
    )
    val `frostedNavBody` = GboardFieldTarget(
        classType = "Lajle;",
        name = "c",
        type = "Lj$/util/OptionalInt;",
    )
    val `frostedNavColor` = GboardFieldTarget(
        classType = "Lajle;",
        name = "a",
        type = "I",
    )
    val `frostedNavDivider` = GboardFieldTarget(
        classType = "Lajle;",
        name = "b",
        type = "I",
    )
    val `frostedNavHeader` = GboardFieldTarget(
        classType = "Lajle;",
        name = "d",
        type = "Lj$/util/OptionalInt;",
    )
    val `frostedNavLight` = GboardFieldTarget(
        classType = "Lajle;",
        name = "e",
        type = "Z",
    )
    val `frostedNavParamsConstructor` = GboardMethodTarget(
        classType = "Lajle;",
        name = "<init>",
        parameterTypes = listOf("I", "I", "Lj$/util/OptionalInt;", "Lj$/util/OptionalInt;", "Z"),
        returnType = "V",
    )
    val `frostedShown` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowShown",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `gestureDispatch` = GboardMethodTarget(
        classType = "Lagyn;",
        name = "f",
        parameterTypes = listOf("Lagyw;", "Lagkl;", "Lagmb;", "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
    )
    val `gestureDispatcherType` = GboardTypeTarget("Lagyn;")
    val `gestureStockDelegateField` = GboardFieldTarget(
        classType = "Lagyn;",
        name = "n",
        type = "Lagyl;",
    )
    val `gestureStockDispatch` = GboardMethodTarget(
        classType = "Lagyl;",
        name = "h",
        parameterTypes = listOf("Lagyw;", "Lagkl;", "Lagmb;", "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
    )
    val `incognitoDictationFlag` = GboardFieldTarget(
        classType = "Lidr;",
        name = "v",
        type = "Z",
    )
    val `incognitoModeToggleApController` = GboardMethodTarget(
        classType = "Laajh;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Laalq;"),
        returnType = "V",
    )
    val `incognitoModeToggleApOrderFactory` = GboardMethodTarget(
        classType = "Laagb;",
        name = "m",
        parameterTypes = listOf("Landroid/content/Context;", "Laaiz;", "Lackz;", "Lauco;", "Lauco;"),
        returnType = "Laagb;",
    )
    val `keyboardCompletionCallbackType` = GboardTypeTarget("Laffb;")
    val `keyboardDefinitionType` = GboardTypeTarget("Lagoo;")
    val `keyboardExtensionManager` = GboardMethodTarget(
        classType = "Ladbo;",
        name = "c",
        parameterTypes = listOf("Lagoo;"),
        returnType = "Laffc;",
    )
    val `keyboardProviderRequest` = GboardMethodTarget(
        classType = "Ltil;",
        name = "fh",
        parameterTypes = listOf("Landroid/content/Context;", "Laffa;", "Lcom/google/android/libraries/inputmethod/metadata/ImeDef;", "Lagoo;", "Ljava/lang/String;", "Lanyg;", "Laffb;"),
        returnType = "V",
    )
    val `languageModelsBakedGetter` = GboardMethodTarget(
        classType = "Ladfs;",
        name = "d",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )
    val `languageModelsDecoderAddEngine` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "addEngine",
        parameterTypes = listOf("Laxqn;"),
        returnType = "V",
    )
    val `languageModelsDecoderDump` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "dump",
        parameterTypes = listOf("Landroid/util/Printer;", "Z"),
        returnType = "V",
    )
    val `languageModelsDecoderLoad` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "loadLanguageModel",
        parameterTypes = listOf("Layhg;"),
        returnType = "Z",
    )
    val `languageModelsDecoderRemoveEngine` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "removeEngine",
        parameterTypes = listOf("Laxqn;"),
        returnType = "V",
    )
    val `languageModelsDecoderReset` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "createOrResetDecoder",
        parameterTypes = listOf("Layao;"),
        returnType = "Z",
    )
    val `languageModelsDecoderUnload` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "unloadLanguageModel",
        parameterTypes = listOf("Layhg;"),
        returnType = "Z",
    )
    val `languageModelsDescriptor` = GboardFieldTarget(
        classType = "Laxrs;",
        name = "c",
        type = "Laxrq;",
    )
    val `languageModelsEngineModelFile` = GboardFieldTarget(
        classType = "Layhk;",
        name = "c",
        type = "Ljava/lang/String;",
    )
    val `languageModelsEngineModelVersion` = GboardFieldTarget(
        classType = "Layhk;",
        name = "d",
        type = "J",
    )
    val `languageModelsEngineModels` = GboardFieldTarget(
        classType = "Laxqn;",
        name = "d",
        type = "Lbaol;",
    )
    val `languageModelsEngineType` = GboardFieldTarget(
        classType = "Laxqn;",
        name = "c",
        type = "I",
    )
    val `languageModelsHmmEnroll` = GboardMethodTarget(
        classType = "Lovj;",
        name = "e",
        parameterTypes = listOf("Ljava/lang/String;", "Lcom/google/android/apps/inputmethod/libs/hmm/DataManagerImpl;"),
        returnType = "Z",
    )
    val `languageModelsHmmPack` = GboardFieldTarget(
        classType = "Lovj;",
        name = "d",
        type = "Ljava/io/File;",
    )
    val `languageModelsHmmProvider` = GboardFieldTarget(
        classType = "Lovj;",
        name = "a",
        type = "Losz;",
    )
    val `languageModelsHmmVersion` = GboardFieldTarget(
        classType = "Losz;",
        name = "b",
        type = "I",
    )
    val `languageModelsModelCountry` = GboardFieldTarget(
        classType = "Layhe;",
        name = "j",
        type = "Ljava/lang/String;",
    )
    val `languageModelsModelFile` = GboardFieldTarget(
        classType = "Layhe;",
        name = "f",
        type = "Ljava/lang/String;",
    )
    val `languageModelsModelLanguage` = GboardFieldTarget(
        classType = "Layhe;",
        name = "i",
        type = "Ljava/lang/String;",
    )
    val `languageModelsModelType` = GboardFieldTarget(
        classType = "Layhe;",
        name = "e",
        type = "I",
    )
    val `languageModelsModelVersion` = GboardFieldTarget(
        classType = "Layhe;",
        name = "l",
        type = "J",
    )
    val `languageModelsNwpManagerFactory` = GboardMethodTarget(
        classType = "Llut;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Llut;",
    )
    val `languageModelsNwpOpen` = GboardMethodTarget(
        classType = "Lluq;",
        name = "j",
        parameterTypes = listOf("Ljava/util/Locale;", "Ljava/lang/String;"),
        returnType = "Llwd;",
    )
    val `languageModelsPackMetadata` = GboardMethodTarget(
        classType = "Llwd;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "Lapnn;",
    )
    val `languageModelsPackParent` = GboardMethodTarget(
        classType = "Lapnn;",
        name = "e",
        parameterTypes = emptyList(),
        returnType = "Lapmv;",
    )
    val `languageModelsParentVersion` = GboardMethodTarget(
        classType = "Lapmv;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "I",
    )
    val `latinGlobeFactory` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/latin5/LatinIme;",
        name = "Q",
        parameterTypes = emptyList(),
        returnType = "Laxvc;",
    )
    val `longPressQuickActionsInputEvent` = GboardMethodTarget(
        classType = "Lafae;",
        name = "ay",
        parameterTypes = listOf("Ladan;"),
        returnType = "Z",
    )
    val `manualIncognitoClipboard` = GboardMethodTarget(
        classType = "Lljp;",
        name = "n",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `manualIncognitoDictation` = GboardMethodTarget(
        classType = "Lalzr;",
        name = "b",
        parameterTypes = listOf("Lidr;", "Z", "Z"),
        returnType = "Lwrq;",
    )
    val `manualIncognitoHide` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `manualIncognitoPredicate` = GboardMethodTarget(
        classType = "Lihw;",
        name = "K",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val `manualIncognitoStart` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onStartInput",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )
    val `manualIncognitoStartView` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onStartInputView",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )
    val `manualIncognitoVoice` = GboardMethodTarget(
        classType = "Lanip;",
        name = "e",
        parameterTypes = listOf("Landroid/content/Context;", "Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "Z",
    )
    val `menuBodyProviderSelect` = GboardMethodTarget(
        classType = "Lafhp;",
        name = "f",
        parameterTypes = listOf("I"),
        returnType = "V",
    )
    val `menuControllerBind` = GboardMethodTarget(
        classType = "Laajh;",
        name = "k",
        parameterTypes = listOf("Laacw;"),
        returnType = "V",
    )
    val `menuControllerOpen` = GboardMethodTarget(
        classType = "Laajh;",
        name = "r",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `menuDragInflate` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/accesspoint/impl/AccessPointDragPopupView;",
        name = "onFinishInflate",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `menuNativeView` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/keyboard/impl/Keyboard;",
        name = "eD",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/metadata/KeyboardViewDef;", "Lafgs;"),
        returnType = "Lafgt;",
    )
    val `ocrConfigAvailability` = GboardMethodTarget(
        classType = "Lbaks;",
        name = "g",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val `ocrConfigLabel` = GboardMethodTarget(
        classType = "Lbaks;",
        name = "b",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )
    val `ocrConfigLanguageHint` = GboardMethodTarget(
        classType = "Lbaks;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )
    val `ocrConfigLoggingLibrary` = GboardMethodTarget(
        classType = "Lbaks;",
        name = "d",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )
    val `ocrConfigModuleId` = GboardMethodTarget(
        classType = "Lbaks;",
        name = "f",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )
    val `ocrConfigOptionalModule` = GboardMethodTarget(
        classType = "Lbaks;",
        name = "e",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )
    val `ocrManagerRequest` = GboardMethodTarget(
        classType = "Lbakk;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "[Lxli;",
    )
    val `ocrThinInit` = GboardMethodTarget(
        classType = "Lbajx;",
        name = "b",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `pointerCancel` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "u",
        parameterTypes = listOf("J"),
        returnType = "V",
    )
    val `pointerFinish` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "t",
        parameterTypes = listOf("J", "I"),
        returnType = "V",
    )
    val `pointerOwner` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "D",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;", "F", "F", "J", "I"),
        returnType = "V",
    )
    val `pointerOwnerType` = GboardTypeTarget("Lagyw;")
    val `pointerPreReset` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "ad",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `pointerReset` = GboardMethodTarget(
        classType = "Lagyw;",
        name = "E",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `ramblerSelectorCreate` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/VoiceSettingsFragment;",
        name = "e",
        parameterTypes = listOf("Landroid/os/Bundle;"),
        returnType = "V",
    )
    val `ramblerSelectorDefault` = GboardMethodTarget(
        classType = "Lkov;",
        name = "gg",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `ramblerSelectorLayout` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/VoiceSettingsFragment;",
        name = "aE",
        parameterTypes = emptyList(),
        returnType = "I",
    )
    val `ramblerSelectorRead` = GboardMethodTarget(
        classType = "Laask;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Z",
    )
    val `ramblerSelectorSetup` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/VoiceSettingsFragment;",
        name = "ab",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `ramblerSelectorWrite` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/VoiceSettingsFragment;",
        name = "aG",
        parameterTypes = listOf("Z", "Lahws;", "Lcom/google/android/libraries/inputmethod/preferencewidgets/CustomSelectorWithWidgetPreference;", "Lcom/google/android/libraries/inputmethod/preferencewidgets/CustomSelectorWithWidgetPreference;"),
        returnType = "V",
    )
    val `roundedKeyboardAdmission` = GboardMethodTarget(
        classType = "Lajdt;",
        name = "b",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Z",
    )
    val `roundedKeyboardRadiiConstructor` = GboardMethodTarget(
        classType = "Lajje;",
        name = "<init>",
        parameterTypes = listOf("F", "F", "F", "F"),
        returnType = "V",
    )
    val `roundedKeyboardRadiiType` = GboardTypeTarget("Lajje;")
    val `roundedKeyboardRadiiValuesField` = GboardFieldTarget(
        classType = "Lajje;",
        name = "a",
        type = "[F",
    )
    val `roundedKeyboardRadiiWrapperFirstParameterField` = GboardFieldTarget(
        classType = "Lajhm;",
        name = "b",
        type = "Ljava/lang/Float;",
    )
    val `roundedKeyboardRadiiWrapperParameterizedConstructor` = GboardMethodTarget(
        classType = "Lajhm;",
        name = "<init>",
        parameterTypes = listOf("Lajje;", "F", "F"),
        returnType = "V",
    )
    val `roundedKeyboardRadiiWrapperRadiiField` = GboardFieldTarget(
        classType = "Lajhm;",
        name = "a",
        type = "Lajje;",
    )
    val `roundedKeyboardRadiiWrapperSecondParameterField` = GboardFieldTarget(
        classType = "Lajhm;",
        name = "c",
        type = "Ljava/lang/Float;",
    )
    val `roundedKeyboardRadiiWrapperSimpleConstructor` = GboardMethodTarget(
        classType = "Lajhm;",
        name = "<init>",
        parameterTypes = listOf("Lajje;"),
        returnType = "V",
    )
    val `roundedKeyboardRadiiWrapperType` = GboardTypeTarget("Lajhm;")
    val `roundedKeyboardStyleResolver` = GboardMethodTarget(
        classType = "Lajeo;",
        name = "b",
        parameterTypes = listOf("Ljava/lang/String;", "Ljava/util/List;"),
        returnType = "Ljava/util/List;",
    )
    val `settingsHomepageMode` = GboardFieldTarget(
        classType = "Lgpv;",
        name = "a",
        type = "I",
    )
    val `settingsHomepageSelector` = GboardMethodTarget(
        classType = "Lgpv;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Z",
    )
    val `signatureCheck` = GboardMethodTarget(
        classType = "Lakqp;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
        returnType = "Z",
    )
    val `softKeyBind` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;",
        name = "s",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;", "J"),
        returnType = "Z",
    )
    val `softKeyMetadataType` = GboardTypeTarget("Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;")
    val `softKeyViewType` = GboardTypeTarget("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;")
    val `splitDeviceEligibility` = GboardMethodTarget(
        classType = "Lafvk;",
        name = "w",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val `splitEligibility` = GboardMethodTarget(
        classType = "Lafri;",
        name = "aJ",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val `splitModeAttach` = GboardMethodTarget(
        classType = "Lafri;",
        name = "T",
        parameterTypes = listOf("Lafoo;", "Laeuj;", "Lafdi;", "Z"),
        returnType = "V",
    )
    val `splitModeCurrent` = GboardMethodTarget(
        classType = "Lafri;",
        name = "ad",
        parameterTypes = emptyList(),
        returnType = "I",
    )
    val `splitModeManual` = GboardMethodTarget(
        classType = "Lafri;",
        name = "X",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `splitModeReload` = GboardMethodTarget(
        classType = "Lafri;",
        name = "ai",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `splitModeRestore` = GboardMethodTarget(
        classType = "Lafri;",
        name = "A",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `splitOrder` = GboardMethodTarget(
        classType = "Laaia;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = "Lauaz;",
    )
    val `splitState` = GboardMethodTarget(
        classType = "Laadv;",
        name = "b",
        parameterTypes = listOf("I"),
        returnType = "V",
    )
    val `splitWidthEligibility` = GboardMethodTarget(
        classType = "Lafvk;",
        name = "q",
        parameterTypes = listOf("Landroid/content/Context;", "I", "Z"),
        returnType = "Z",
    )
    val `swipeDismissHeaderDispatch` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/keyboard/impl/KeyboardViewHolder;",
        name = "dispatchTouchEvent",
        parameterTypes = listOf("Landroid/view/MotionEvent;"),
        returnType = "Z",
    )
    val `symbolFooterCorpus` = GboardMethodTarget(
        classType = "Lnxt;",
        name = "a",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "Lauaz;",
    )
    val `voiceEligibilityConstructor` = GboardMethodTarget(
        classType = "Lalzk;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Lalyr;", "Langx;", "Lbctl;", "Lanen;", "Lamzh;", "Lanbg;", "Lamxa;", "Lbctl;", "Lbctl;", "Lalzp;", "Lbctl;", "Lbctl;", "Laned;", "Lampk;", "Lance;", "Lbctl;", "Lbctl;", "Lamat;", "Lalyu;", "Lbctl;", "Lbete;", "Ljava/util/Set;"),
        returnType = "V",
    )
    val `voiceFormatterConstructor` = GboardMethodTarget(
        classType = "Lalhf;",
        name = "<init>",
        parameterTypes = listOf("Ljava/util/Locale;", "Liee;", "Lamot;", "I", "Z", "Lalhn;", "Lanfy;", "Laned;", "Ljava/util/concurrent/Executor;"),
        returnType = "V",
    )
    val `voiceNativeReadiness` = GboardMethodTarget(
        classType = "Lalyi;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "Z",
    )
    val `webClipboardCreate` = GboardMethodTarget(
        classType = "Lafae;",
        name = "onCreate",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val `writingOfficialPreference` = GboardMethodTarget(
        classType = "Lahvo;",
        name = "x",
        parameterTypes = listOf("I", "Z"),
        returnType = "Z",
    )
    val `zhuyinTogglePopupAction` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;",
        name = "b",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;", "Landroid/view/View;", "F", "F", "Lcom/google/android/libraries/inputmethod/metadata/ActionDef;", "[I", "Z"),
        returnType = "Lagmb;",
    )
    val `zhuyinTogglePopupTarget` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;",
        name = "b",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;", "Landroid/view/View;", "F", "F", "Lcom/google/android/libraries/inputmethod/metadata/ActionDef;", "[I", "Z"),
        returnType = "Lagmb;",
    )
    val `zhuyinTogglePreferenceFactory` = GboardMethodTarget(
        classType = "Lahws;",
        name = "I",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Lahws;",
    )
    val `zhuyinTogglePreferenceWrite` = GboardMethodTarget(
        classType = "Lahws;",
        name = "f",
        parameterTypes = listOf("Ljava/lang/String;", "Z"),
        returnType = "V",
    )
    val `zhuyinToggleReset` = GboardMethodTarget(
        classType = "Lafae;",
        name = "showWindow",
        parameterTypes = listOf("Z"),
        returnType = "V",
    )

}
