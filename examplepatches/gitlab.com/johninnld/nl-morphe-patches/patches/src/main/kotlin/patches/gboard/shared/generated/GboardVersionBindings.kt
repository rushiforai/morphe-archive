package patches.gboard.shared.generated

import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.GboardTypeTarget

internal object GboardVersionBindings {
    const val targetVersion = "18.6.3"
    const val profileVersion = "1.7.0"
    const val sourceSha256 = "ported-from-18.5.11"

    val `apCatalogCopy` = GboardMethodTarget(
        classType = "Lwim;",
        name = "n",
        parameterTypes = listOf("Ljava/util/Collection;"),
        returnType = "Lwim;",
    )

    val `apControllerOrderField` = GboardFieldTarget(
        classType = "Lmpq;",
        name = "g",
        type = "Lmpb;",
    )

    val `apDescriptorAction` = GboardMethodTarget(
        classType = "Lmmh;",
        name = "q",
        parameterTypes = listOf("Ljava/lang/Runnable;"),
        returnType = "V",
    )

    val `apDescriptorActions` = GboardFieldTarget(
        classType = "Lmmh;",
        name = "e",
        type = "Lwhl;",
    )

    val `apDescriptorBuild` = GboardMethodTarget(
        classType = "Lmmh;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "Lmmm;",
    )

    val `apDescriptorFactory` = GboardMethodTarget(
        classType = "Lmmm;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = "Lmmh;",
    )

    val `apDescriptorIcon` = GboardMethodTarget(
        classType = "Lmmh;",
        name = "i",
        parameterTypes = listOf("I"),
        returnType = "V",
    )

    val `apDescriptorLabel` = GboardFieldTarget(
        classType = "Lmmh;",
        name = "d",
        type = "Ljava/lang/String;",
    )

    val `apDescriptorRegister` = GboardMethodTarget(
        classType = "Lmpq;",
        name = "g",
        parameterTypes = listOf("Lmmm;", "Z"),
        returnType = "V",
    )

    val `apDescriptorToken` = GboardMethodTarget(
        classType = "Lmmh;",
        name = "l",
        parameterTypes = listOf("Ljava/lang/String;"),
        returnType = "V",
    )

    val `apMasterCatalogSet` = GboardFieldTarget(
        classType = "Lmpb;",
        name = "b",
        type = "Lwim;",
    )

    val `calculatorHidden` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `calculatorInputStart` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onStartInputView",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )

    val `calculatorInputView` = GboardFieldTarget(
        classType = "Lpbk;",
        name = "i",
        type = "Lcom/google/android/libraries/inputmethod/inputview/InputView;",
    )

    val `calculatorSelection` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onUpdateSelection",
        parameterTypes = listOf("I", "I", "I", "I", "I", "I"),
        returnType = "V",
    )

    val `clipboardAdapterContext` = GboardFieldTarget(
        classType = "Lfob;",
        name = "e",
        type = "Landroid/content/Context;",
    )

    val `clipboardAdapterItems` = GboardFieldTarget(
        classType = "Lfob;",
        name = "n",
        type = "Ljava/util/List;",
    )

    val `clipboardAdapterRecycler` = GboardFieldTarget(
        classType = "Lfob;",
        name = "j",
        type = "Landroid/support/v7/widget/RecyclerView;",
    )

    val `clipboardCleanupCursor` = GboardMethodTarget(
        classType = "Lfok;",
        name = "t",
        parameterTypes = listOf("Landroid/database/Cursor;"),
        returnType = "V",
    )

    val `clipboardClipId` = GboardFieldTarget(
        classType = "Lfmy;",
        name = "d",
        type = "J",
    )

    val `clipboardClipModel` = GboardFieldTarget(
        classType = "Lfmy;",
        name = "g",
        type = "Lfna;",
    )

    val `clipboardClipTimestamp` = GboardFieldTarget(
        classType = "Lfmy;",
        name = "e",
        type = "Lj${'$'}/time/Instant;",
    )

    val `clipboardColumns` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;",
        name = "l",
        parameterTypes = emptyList(),
        returnType = "I",
    )

    val `clipboardDelete` = GboardMethodTarget(
        classType = "Lfof;",
        name = "h",
        parameterTypes = listOf("Landroid/content/Context;", "Ljava/util/List;"),
        returnType = "V",
    )

    val `clipboardGridManagerConstructor` = GboardMethodTarget(
        classType = "Lfos;",
        name = "<init>",
        parameterTypes = listOf("Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;", "I", "Landroid/support/v7/widget/RecyclerView;"),
        returnType = "V",
    )

    val `clipboardHolderText` = GboardFieldTarget(
        classType = "Lfnz;",
        name = "t",
        type = "Landroid/widget/TextView;",
    )

    val `clipboardIsPinned` = GboardMethodTarget(
        classType = "Lfmy;",
        name = "n",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val `clipboardIsSensitive` = GboardMethodTarget(
        classType = "Lfmy;",
        name = "m",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val `clipboardIsSpecial` = GboardMethodTarget(
        classType = "Lfmy;",
        name = "o",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val `clipboardItemBind` = GboardMethodTarget(
        classType = "Lfob;",
        name = "p",
        parameterTypes = listOf("Lks;", "I"),
        returnType = "V",
    )

    val `clipboardKeyboardAdapter` = GboardFieldTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;",
        name = "c",
        type = "Lfob;",
    )

    val `clipboardKeyboardContext` = GboardFieldTarget(
        classType = "Lcom/google/android/libraries/inputmethod/keyboard/impl/AbstractKeyboard;",
        name = "z",
        type = "Landroid/content/Context;",
    )

    val `clipboardLayoutBuilt` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;",
        name = "e",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Ljava/lang/Object;"),
        returnType = "V",
    )

    val `clipboardLoader` = GboardMethodTarget(
        classType = "Lfnb;",
        name = "call",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )

    val `clipboardLoaderContext` = GboardFieldTarget(
        classType = "Lfnc;",
        name = "b",
        type = "Landroid/content/Context;",
    )

    val `clipboardLoaderOwner` = GboardFieldTarget(
        classType = "Lfnb;",
        name = "a",
        type = "Lfnc;",
    )

    val `clipboardModelSensitive` = GboardFieldTarget(
        classType = "Lfna;",
        name = "h",
        type = "Z",
    )

    val `clipboardModelText` = GboardFieldTarget(
        classType = "Lfna;",
        name = "a",
        type = "Ljava/lang/String;",
    )

    val `clipboardModelType` = GboardFieldTarget(
        classType = "Lfna;",
        name = "c",
        type = "I",
    )

    val `clipboardNotifyRemoved` = GboardMethodTarget(
        classType = "Lju;",
        name = "n",
        parameterTypes = listOf("I"),
        returnType = "V",
    )

    val `clipboardPinnedCount` = GboardFieldTarget(
        classType = "Lfob;",
        name = "z",
        type = "I",
    )

    val `clipboardPinnedHeader` = GboardFieldTarget(
        classType = "Lfmy;",
        name = "b",
        type = "Lfmy;",
    )

    val `clipboardPreferences` = GboardMethodTarget(
        classType = "Lqpn;",
        name = "I",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Lqpn;",
    )

    val `clipboardPrimaryTimestamp` = GboardMethodTarget(
        classType = "Lfok;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "J",
    )

    val `clipboardPrune` = GboardMethodTarget(
        classType = "Lfok;",
        name = "g",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `clipboardPruneContext` = GboardFieldTarget(
        classType = "Lfok;",
        name = "c",
        type = "Landroid/content/Context;",
    )

    val `clipboardPruneCount` = GboardFieldTarget(
        classType = "Lfok;",
        name = "g",
        type = "Ljava/util/concurrent/atomic/AtomicInteger;",
    )

    val `clipboardPruneDisabled` = GboardFieldTarget(
        classType = "Lfok;",
        name = "f",
        type = "Z",
    )

    val `clipboardQuery` = GboardMethodTarget(
        classType = "Lfof;",
        name = "j",
        parameterTypes = listOf("Landroid/content/Context;", "Ljava/lang/String;", "[Ljava/lang/String;", "Ljava/lang/String;"),
        returnType = "Lwhe;",
    )

    val `clipboardQueryType` = GboardMethodTarget(
        classType = "Lfok;",
        name = "s",
        parameterTypes = listOf("Landroid/net/Uri;", "I"),
        returnType = "Landroid/database/Cursor;",
    )

    val `clipboardReadTimestamp` = GboardMethodTarget(
        classType = "Lcei;",
        name = "m",
        parameterTypes = listOf("I", "J"),
        returnType = "J",
    )

    val `clipboardRecentCount` = GboardFieldTarget(
        classType = "Lfob;",
        name = "o",
        type = "I",
    )

    val `clipboardRecentHeader` = GboardFieldTarget(
        classType = "Lfmy;",
        name = "a",
        type = "Lfmy;",
    )

    val `clipboardRecyclerManager` = GboardFieldTarget(
        classType = "Landroid/support/v7/widget/RecyclerView;",
        name = "l",
        type = "Lkb;",
    )

    val `clipboardRefresh` = GboardMethodTarget(
        classType = "Lfob;",
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
        classType = "Lfmy;",
        name = "c",
        type = "Lfmy;",
    )

    val `clipboardTrim` = GboardMethodTarget(
        classType = "Lfob;",
        name = "F",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `clipboardUri` = GboardMethodTarget(
        classType = "Lfof;",
        name = "d",
        parameterTypes = listOf("Landroid/content/Context;", "I", "J"),
        returnType = "Landroid/net/Uri;",
    )

    val `clipboardWriteTimestamp` = GboardMethodTarget(
        classType = "Lcei;",
        name = "s",
        parameterTypes = listOf("I", "J"),
        returnType = "V",
    )

    val `cursorResourcePreference` = GboardMethodTarget(
        classType = "Lcei;",
        name = "x",
        parameterTypes = listOf("I", "Z"),
        returnType = "Z",
    )

    val `cursorStringPreference` = GboardMethodTarget(
        classType = "Lqpn;",
        name = "am",
        parameterTypes = listOf("Ljava/lang/String;", "Z", "Z"),
        returnType = "Z",
    )

    val `customSymbolsAdapterBind` = GboardMethodTarget(
        classType = "Ljci;",
        name = "p",
        parameterTypes = listOf("Lks;", "I"),
        returnType = "V",
    )

    val `customSymbolsAdapterConstructor` = GboardMethodTarget(
        classType = "Ljci;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Ljdb;", "Ljava/util/function/Consumer;", "I", "I"),
        returnType = "V",
    )

    val `customSymbolsAdapterCreate` = GboardMethodTarget(
        classType = "Ljci;",
        name = "d",
        parameterTypes = listOf("Landroid/view/ViewGroup;", "I"),
        returnType = "Lks;",
    )

    val `customSymbolsAdapterViewType` = GboardMethodTarget(
        classType = "Lju;",
        name = "b",
        parameterTypes = listOf("I"),
        returnType = "I",
    )

    val `customSymbolsBodyReady` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "eQ",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardViewDef;"),
        returnType = "V",
    )

    val `customSymbolsCategoryBind` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "D",
        parameterTypes = listOf("Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonRecyclerView;", "Ljava/lang/String;"),
        returnType = "V",
    )

    val `customSymbolsCategoryChange` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "E",
        parameterTypes = listOf("I", "I"),
        returnType = "V",
    )

    val `customSymbolsCategoryName` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "l",
        parameterTypes = listOf("I"),
        returnType = "Ljava/lang/String;",
    )

    val `customSymbolsCorpus` = GboardMethodTarget(
        classType = "Lgva;",
        name = "a",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "Lwhe;",
    )

    val `customSymbolsCorpusItemExtension` = GboardFieldTarget(
        classType = "Loat;",
        name = "g",
        type = "Ljava/lang/Class;",
    )

    val `customSymbolsCorpusItemKeyboard` = GboardFieldTarget(
        classType = "Loat;",
        name = "c",
        type = "Lpwf;",
    )

    val `customSymbolsFooterClick` = GboardMethodTarget(
        classType = "Lgve;",
        name = "accept",
        parameterTypes = listOf("Ljava/lang/Object;"),
        returnType = "V",
    )

    val `customSymbolsHeaderCallback` = GboardMethodTarget(
        classType = "Lgle;",
        name = "accept",
        parameterTypes = listOf("Ljava/lang/Object;"),
        returnType = "V",
    )

    val `customSymbolsHeaderGuard` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/expression/header/ConstraintHeaderViewImpl;",
        name = "n",
        parameterTypes = listOf("Lgmp;"),
        returnType = "V",
    )

    val `customSymbolsHistoryCase` = GboardFieldTarget(
        classType = "Ljsk;",
        name = "${'$'}cid",
        type = "I",
    )

    val `customSymbolsHistoryConsumer` = GboardMethodTarget(
        classType = "Ljsk;",
        name = "accept",
        parameterTypes = listOf("Ljava/lang/Object;"),
        returnType = "V",
    )

    val `customSymbolsHistoryReceiver` = GboardFieldTarget(
        classType = "Ljsk;",
        name = "a",
        type = "Ljava/lang/Object;",
    )

    val `customSymbolsHistorySink` = GboardMethodTarget(
        classType = "Lgoc;",
        name = "b",
        parameterTypes = listOf("Ljava/lang/String;"),
        returnType = "V",
    )

    val `customSymbolsIdentityFactory` = GboardMethodTarget(
        classType = "Lpjp;",
        name = "ag",
        parameterTypes = listOf("Ljava/lang/Object;"),
        returnType = "Lpkx;",
    )

    val `customSymbolsKeyboardReady` = GboardMethodTarget(
        classType = "Lovs;",
        name = "a",
        parameterTypes = listOf("Lpeq;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;", "Lpwf;"),
        returnType = "V",
    )

    val `customSymbolsM2Constructor` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Lper;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;", "Lcom/google/android/libraries/inputmethod/metadata/ImeDef;", "Lpwf;"),
        returnType = "V",
    )

    val `customSymbolsM2HistoryField` = GboardFieldTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "b",
        type = "Lgoc;",
    )

    val `customSymbolsMetrics` = GboardMethodTarget(
        classType = "Lidl;",
        name = "b",
        parameterTypes = listOf("Lpwf;"),
        returnType = "Lxai;",
    )

    val `customSymbolsNavigation` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/expression/navbar/ScrollableNavigationView;",
        name = "a",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Lpwf;", "Z", "Ljava/util/function/Consumer;", "Landroid/os/Parcelable;", "Ljava/util/function/Supplier;", "Ljava/util/function/Supplier;"),
        returnType = "V",
    )

    val `customSymbolsProviderBefore` = GboardMethodTarget(
        classType = "Lpey;",
        name = "b",
        parameterTypes = listOf("Lpwf;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;"),
        returnType = "Lpeq;",
    )

    val `customSymbolsProviderCreated` = GboardMethodTarget(
        classType = "Lpey;",
        name = "a",
        parameterTypes = listOf("Lpwf;", "Lpeq;", "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;"),
        returnType = "V",
    )

    val `customSymbolsProviderValid` = GboardMethodTarget(
        classType = "Lpey;",
        name = "c",
        parameterTypes = listOf("Lpwf;"),
        returnType = "Z",
    )

    val `customSymbolsRecyclerAttach` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonRecyclerView;",
        name = "aK",
        parameterTypes = listOf("Ljdb;", "Ljava/util/function/Consumer;"),
        returnType = "V",
    )

    val `customSymbolsSelectedIndex` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;",
        name = "k",
        parameterTypes = listOf("Lwhe;"),
        returnType = "I",
    )

    val `customSymbolsViewTransform` = GboardMethodTarget(
        classType = "Ltgb;",
        name = "j",
        parameterTypes = listOf("Landroid/graphics/Matrix;", "Landroid/view/View;", "Landroid/view/View;"),
        returnType = "Landroid/view/View;",
    )

    val `customThemeFragmentPeerField` = GboardFieldTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/theme/listing/ThemeListingFragment;",
        name = "a",
        type = "Lkbf;",
    )

    val `customThemeLauncherLaunch` = GboardMethodTarget(
        classType = "Lquw;",
        name = "E",
        parameterTypes = listOf("Landroid/content/Intent;", "I", "Landroid/os/Bundle;"),
        returnType = "V",
    )

    val `customThemePeerContextField` = GboardFieldTarget(
        classType = "Lkbf;",
        name = "b",
        type = "Landroid/content/Context;",
    )

    val `customThemePeerLauncherField` = GboardFieldTarget(
        classType = "Lkbf;",
        name = "t",
        type = "Lquw;",
    )

    val `customThemePeerResultHandler` = GboardMethodTarget(
        classType = "Lkbf;",
        name = "j",
        parameterTypes = listOf("Landroid/content/Intent;"),
        returnType = "V",
    )

    val `customThemePlusHandler` = GboardMethodTarget(
        classType = "Lkbl;",
        name = "f",
        parameterTypes = listOf("Lkbf;", "Lkbo;", "I"),
        returnType = "V",
    )

    val `customThemeResultHandler` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/theme/listing/ThemeListingFragment;",
        name = "W",
        parameterTypes = listOf("I", "I", "Landroid/content/Intent;"),
        returnType = "V",
    )

    val `customThemeValidator` = GboardMethodTarget(
        classType = "Lrhw;",
        name = "h",
        parameterTypes = listOf("Ljava/io/File;"),
        returnType = "Z",
    )

    val `dynamicDarkPaletteConstructor` = GboardMethodTarget(
        classType = "Lrgr;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Z"),
        returnType = "V",
    )

    val `dynamicDarkPaletteIsLightField` = GboardFieldTarget(
        classType = "Lrgr;",
        name = "a",
        type = "Z",
    )

    val `dynamicDarkPaletteSurfaceContainerField` = GboardFieldTarget(
        classType = "Lrgr;",
        name = "Q",
        type = "I",
    )

    val `dynamicDarkPaletteSurfaceContainerLowField` = GboardFieldTarget(
        classType = "Lrgr;",
        name = "R",
        type = "I",
    )

    val `dynamicDarkPaletteSurfaceContainerLowestField` = GboardFieldTarget(
        classType = "Lrgr;",
        name = "S",
        type = "I",
    )

    val `dynamicDarkPaletteSurfaceDimField` = GboardFieldTarget(
        classType = "Lrgr;",
        name = "P",
        type = "I",
    )

    val `editingAccessPointsApController` = GboardMethodTarget(
        classType = "Lmpq;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Lmqw;"),
        returnType = "V",
    )

    val `editingAccessPointsApOrderFactory` = GboardMethodTarget(
        classType = "Lmob;",
        name = "m",
        parameterTypes = listOf("Landroid/content/Context;", "Lnbt;", "Lnru;", "Lwim;", "Lwim;"),
        returnType = "Lmob;",
    )

    val `editingApOndestroy` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "an",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `editingApOnfinishinput` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onFinishInput",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `editingApOnfinishinputview` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onFinishInputView",
        parameterTypes = listOf("Z"),
        returnType = "V",
    )

    val `editingApOnstartinput` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onStartInput",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )

    val `editingApOnstartinputview` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onStartInputView",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )

    val `editingApOnwindowhidden` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `flagBoolGetter` = GboardMethodTarget(
        classType = "Lodo;",
        name = "g",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )

    val `flagNameField` = GboardFieldTarget(
        classType = "Lodo;",
        name = "a",
        type = "Ljava/lang/String;",
    )

    val `frostedConfigure` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onConfigureWindow",
        parameterTypes = listOf("Landroid/view/Window;", "Z", "Z"),
        returnType = "V",
    )

    val `frostedHidden` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `frostedNavApply` = GboardMethodTarget(
        classType = "Lrlc;",
        name = "g",
        parameterTypes = listOf("Landroid/view/Window;", "Lrlb;"),
        returnType = "V",
    )

    val `frostedNavBody` = GboardFieldTarget(
        classType = "Lrlb;",
        name = "c",
        type = "Lj${'$'}/util/OptionalInt;",
    )

    val `frostedNavColor` = GboardFieldTarget(
        classType = "Lrlb;",
        name = "a",
        type = "I",
    )

    val `frostedNavDivider` = GboardFieldTarget(
        classType = "Lrlb;",
        name = "b",
        type = "I",
    )

    val `frostedNavHeader` = GboardFieldTarget(
        classType = "Lrlb;",
        name = "d",
        type = "Lj${'$'}/util/OptionalInt;",
    )

    val `frostedNavLight` = GboardFieldTarget(
        classType = "Lrlb;",
        name = "e",
        type = "Z",
    )

    val `frostedNavParamsConstructor` = GboardMethodTarget(
        classType = "Lrlb;",
        name = "<init>",
        parameterTypes = listOf("I", "I", "Lj${'$'}/util/OptionalInt;", "Lj${'$'}/util/OptionalInt;", "Z"),
        returnType = "V",
    )

    val `frostedShown` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onWindowShown",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `gestureDispatch` = GboardMethodTarget(
        classType = "Lqch;",
        name = "f",
        parameterTypes = listOf("Lqck;", "Lpuc;", "Lpva;", "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
    )

    val `gestureDispatcherType` = GboardTypeTarget("Lqch;")

    val `gestureStockDelegateField` = GboardFieldTarget(
        classType = "Lqch;",
        name = "n",
        type = "Lqcf;",
    )

    val `gestureStockDispatch` = GboardMethodTarget(
        classType = "Lqcf;",
        name = "h",
        parameterTypes = listOf("Lqck;", "Lpuc;", "Lpva;", "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;", "J", "Z", "Z", "I", "Z", "J", "I"),
        returnType = "V",
    )

    val `incognitoDictationFlag` = GboardFieldTarget(
        classType = "Leqh;",
        name = "v",
        type = "Z",
    )

    val `incognitoModeToggleApController` = GboardMethodTarget(
        classType = "Lmpq;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Lmqw;"),
        returnType = "V",
    )

    val `incognitoModeToggleApOrderFactory` = GboardMethodTarget(
        classType = "Lmob;",
        name = "m",
        parameterTypes = listOf("Landroid/content/Context;", "Lnbt;", "Lnru;", "Lwim;", "Lwim;"),
        returnType = "Lmob;",
    )

    val `keyboardCompletionCallbackType` = GboardTypeTarget("Lpes;")

    val `keyboardDefinitionType` = GboardTypeTarget("Lpwf;")

    val `keyboardExtensionManager` = GboardMethodTarget(
        classType = "Lobd;",
        name = "c",
        parameterTypes = listOf("Lpwf;"),
        returnType = "Lpet;",
    )

    val `keyboardProviderRequest` = GboardMethodTarget(
        classType = "Ljcc;",
        name = "H",
        parameterTypes = listOf("Landroid/content/Context;", "Lper;", "Lcom/google/android/libraries/inputmethod/metadata/ImeDef;", "Lpwf;", "Ljava/lang/String;", "Luio;", "Lpes;"),
        returnType = "V",
    )

    val `languageModelsBakedGetter` = GboardMethodTarget(
        classType = "Lodo;",
        name = "d",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )

    val `languageModelsDecoderAddEngine` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "addEngine",
        parameterTypes = listOf("Lyiu;"),
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
        parameterTypes = listOf("Lyqo;"),
        returnType = "Z",
    )

    val `languageModelsDecoderRemoveEngine` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "removeEngine",
        parameterTypes = listOf("Lyiu;"),
        returnType = "V",
    )

    val `languageModelsDecoderReset` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "createOrResetDecoder",
        parameterTypes = listOf("Lynp;"),
        returnType = "Z",
    )

    val `languageModelsDecoderUnload` = GboardMethodTarget(
        classType = "Lcom/google/android/keyboard/client/delight5/Decoder;",
        name = "unloadLanguageModel",
        parameterTypes = listOf("Lyqo;"),
        returnType = "Z",
    )

    val `languageModelsDescriptor` = GboardFieldTarget(
        classType = "Lyji;",
        name = "c",
        type = "Lyjh;",
    )

    val `languageModelsEngineModelFile` = GboardFieldTarget(
        classType = "Lyqq;",
        name = "c",
        type = "Ljava/lang/String;",
    )

    val `languageModelsEngineModelVersion` = GboardFieldTarget(
        classType = "Lyqq;",
        name = "d",
        type = "J",
    )

    val `languageModelsEngineModels` = GboardFieldTarget(
        classType = "Lyiu;",
        name = "d",
        type = "Laaez;",
    )

    val `languageModelsEngineType` = GboardFieldTarget(
        classType = "Lyiu;",
        name = "c",
        type = "I",
    )

    val `languageModelsHmmEnroll` = GboardMethodTarget(
        classType = "Lhgq;",
        name = "d",
        parameterTypes = listOf("Ljava/lang/String;", "Lcom/google/android/apps/inputmethod/libs/hmm/DataManagerImpl;"),
        returnType = "Z",
    )

    val `languageModelsHmmPack` = GboardFieldTarget(
        classType = "Lhgq;",
        name = "d",
        type = "Ljava/io/File;",
    )

    val `languageModelsHmmProvider` = GboardFieldTarget(
        classType = "Lhgq;",
        name = "a",
        type = "Lhfc;",
    )

    val `languageModelsHmmVersion` = GboardFieldTarget(
        classType = "Lhfc;",
        name = "b",
        type = "I",
    )

    val `languageModelsModelCountry` = GboardFieldTarget(
        classType = "Lyqn;",
        name = "j",
        type = "Ljava/lang/String;",
    )

    val `languageModelsModelFile` = GboardFieldTarget(
        classType = "Lyqn;",
        name = "f",
        type = "Ljava/lang/String;",
    )

    val `languageModelsModelLanguage` = GboardFieldTarget(
        classType = "Lyqn;",
        name = "i",
        type = "Ljava/lang/String;",
    )

    val `languageModelsModelType` = GboardFieldTarget(
        classType = "Lyqn;",
        name = "e",
        type = "I",
    )

    val `languageModelsModelVersion` = GboardFieldTarget(
        classType = "Lyqn;",
        name = "l",
        type = "J",
    )

    val `languageModelsNwpManagerFactory` = GboardMethodTarget(
        classType = "Lftm;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Lftm;",
    )

    val `languageModelsNwpOpen` = GboardMethodTarget(
        classType = "Lftj;",
        name = "j",
        parameterTypes = listOf("Ljava/util/Locale;", "Ljava/lang/String;"),
        returnType = "Lfui;",
    )

    val `languageModelsPackMetadata` = GboardMethodTarget(
        classType = "Lfui;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "Ltzi;",
    )

    val `languageModelsPackParent` = GboardMethodTarget(
        classType = "Ltzi;",
        name = "e",
        parameterTypes = emptyList(),
        returnType = "Ltyx;",
    )

    val `languageModelsParentVersion` = GboardMethodTarget(
        classType = "Ltyx;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "I",
    )

    val `latinGlobeFactory` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/libs/latin5/LatinIme;",
        name = "Q",
        parameterTypes = emptyList(),
        returnType = "Lykz;",
    )

    val `latinGlobeIntervalField` = GboardFieldTarget(
        classType = "Lykz;",
        name = "h",
        type = "F",
    )

    val `longPressQuickActionsInputEvent` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "ay",
        parameterTypes = listOf("Loak;"),
        returnType = "Z",
    )

    val `manualIncognitoClipboard` = GboardMethodTarget(
        classType = "Lfok;",
        name = "onPrimaryClipChanged",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `manualIncognitoDictation` = GboardMethodTarget(
        classType = "Lsnd;",
        name = "b",
        parameterTypes = listOf("Leqh;", "Z", "Z"),
        returnType = "Lkql;",
    )

    val `manualIncognitoHide` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `manualIncognitoPredicate` = GboardMethodTarget(
        classType = "Lesj;",
        name = "I",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val `manualIncognitoStart` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onStartInput",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )

    val `manualIncognitoStartView` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onStartInputView",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "V",
    )

    val `manualIncognitoVoice` = GboardMethodTarget(
        classType = "Luya;",
        name = "aQ",
        parameterTypes = listOf("Landroid/content/Context;", "Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "Z",
    )

    val `menuBodyProviderSelect` = GboardMethodTarget(
        classType = "Lpgm;",
        name = "f",
        parameterTypes = listOf("I"),
        returnType = "V",
    )

    val `menuControllerBind` = GboardMethodTarget(
        classType = "Lmpq;",
        name = "k",
        parameterTypes = listOf("Lmlt;"),
        returnType = "V",
    )

    val `menuControllerOpen` = GboardMethodTarget(
        classType = "Lmpq;",
        name = "F",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `menuDragInflate` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/accesspoint/impl/AccessPointDragPopupView;",
        name = "onFinishInflate",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `menuDragSetup` = GboardMethodTarget(
        classType = "Lmpw;",
        name = "z",
        parameterTypes = listOf("Ljava/lang/String;", "Z"),
        returnType = "V",
    )

    val `menuNativeView` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/keyboard/impl/Keyboard;",
        name = "F",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/metadata/KeyboardViewDef;", "Lpfu;"),
        returnType = "Lpfv;",
    )

    val `ocrConfigAvailability` = GboardMethodTarget(
        classType = "Laaby;",
        name = "g",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val `ocrConfigLabel` = GboardMethodTarget(
        classType = "Laaby;",
        name = "b",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )

    val `ocrConfigLanguageHint` = GboardMethodTarget(
        classType = "Laaby;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )

    val `ocrConfigLoggingLibrary` = GboardMethodTarget(
        classType = "Laaby;",
        name = "d",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )

    val `ocrConfigModuleId` = GboardMethodTarget(
        classType = "Laaby;",
        name = "f",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )

    val `ocrConfigOptionalModule` = GboardMethodTarget(
        classType = "Laaby;",
        name = "e",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/String;",
    )

    val `ocrManagerRequest` = GboardMethodTarget(
        classType = "Laabt;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "[Lkzf;",
    )

    val `ocrOptionalRequest` = GboardMethodTarget(
        classType = "Lzej;",
        name = "a",
        parameterTypes = listOf("Laabb;"),
        returnType = "[Lkzf;",
    )

    val `ocrThinInit` = GboardMethodTarget(
        classType = "Laabn;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `pointerCancel` = GboardMethodTarget(
        classType = "Lqck;",
        name = "s",
        parameterTypes = listOf("J"),
        returnType = "V",
    )

    val `pointerFinish` = GboardMethodTarget(
        classType = "Lqck;",
        name = "r",
        parameterTypes = listOf("J", "I"),
        returnType = "V",
    )

    val `pointerOwner` = GboardMethodTarget(
        classType = "Lqck;",
        name = "B",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;", "F", "F", "J", "I"),
        returnType = "V",
    )

    val `pointerOwnerType` = GboardTypeTarget("Lqck;")

    val `pointerPreReset` = GboardMethodTarget(
        classType = "Lqck;",
        name = "ac",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `pointerReset` = GboardMethodTarget(
        classType = "Lqck;",
        name = "C",
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
        classType = "Lffh;",
        name = "hV",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `ramblerSelectorLayout` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/VoiceSettingsFragment;",
        name = "aA",
        parameterTypes = emptyList(),
        returnType = "I",
    )

    val `ramblerSelectorRead` = GboardMethodTarget(
        classType = "Lmut;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Z",
    )

    val `ramblerSelectorSetup` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/VoiceSettingsFragment;",
        name = "aa",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `ramblerSelectorWrite` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/VoiceSettingsFragment;",
        name = "aC",
        parameterTypes = listOf("Z", "Lqpn;", "Lcom/google/android/libraries/inputmethod/preferencewidgets/CustomSelectorWithWidgetPreference;", "Lcom/google/android/libraries/inputmethod/preferencewidgets/CustomSelectorWithWidgetPreference;"),
        returnType = "V",
    )

    val `roundedKeyboardAdmission` = GboardMethodTarget(
        classType = "Lrgl;",
        name = "b",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Z",
    )

    val `roundedKeyboardRadiiConstructor` = GboardMethodTarget(
        classType = "Lrjv;",
        name = "<init>",
        parameterTypes = listOf("F", "F", "F", "F"),
        returnType = "V",
    )

    val `roundedKeyboardRadiiType` = GboardTypeTarget("Lrjv;")

    val `roundedKeyboardRadiiValuesField` = GboardFieldTarget(
        classType = "Lrjv;",
        name = "a",
        type = "[F",
    )

    val `roundedKeyboardRadiiWrapperFirstParameterField` = GboardFieldTarget(
        classType = "Lriu;",
        name = "b",
        type = "Ljava/lang/Float;",
    )

    val `roundedKeyboardRadiiWrapperParameterizedConstructor` = GboardMethodTarget(
        classType = "Lriu;",
        name = "<init>",
        parameterTypes = listOf("Lrjv;", "F", "F"),
        returnType = "V",
    )

    val `roundedKeyboardRadiiWrapperRadiiField` = GboardFieldTarget(
        classType = "Lriu;",
        name = "a",
        type = "Lrjv;",
    )

    val `roundedKeyboardRadiiWrapperSecondParameterField` = GboardFieldTarget(
        classType = "Lriu;",
        name = "c",
        type = "Ljava/lang/Float;",
    )

    val `roundedKeyboardRadiiWrapperSimpleConstructor` = GboardMethodTarget(
        classType = "Lriu;",
        name = "<init>",
        parameterTypes = listOf("Lrjv;"),
        returnType = "V",
    )

    val `roundedKeyboardRadiiWrapperType` = GboardTypeTarget("Lriu;")

    val `roundedKeyboardStyleResolver` = GboardMethodTarget(
        classType = "Lrgz;",
        name = "b",
        parameterTypes = listOf("Ljava/lang/String;", "Ljava/util/List;"),
        returnType = "Ljava/util/List;",
    )

    val `settingsHomepageMode` = GboardFieldTarget(
        classType = "Ldqo;",
        name = "a",
        type = "I",
    )

    val `settingsHomepageOnCreate` = GboardMethodTarget(
        classType = "Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;",
        name = "onCreate",
        parameterTypes = listOf("Landroid/os/Bundle;"),
        returnType = "V",
    )

    val `settingsHomepageSelector` = GboardMethodTarget(
        classType = "Ldqo;",
        name = "a",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Z",
    )

    val `signatureCheck` = GboardMethodTarget(
        classType = "Lrzu;",
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

    val `splitAccessPointName` = GboardFieldTarget(
        classType = "Lsze;",
        name = "d",
        type = "Ljava/lang/Object;",
    )

    val `splitDeviceEligibility` = GboardMethodTarget(
        classType = "Lpmm;",
        name = "w",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val `splitEligibility` = GboardMethodTarget(
        classType = "Lpks;",
        name = "av",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val `splitModeAttach` = GboardMethodTarget(
        classType = "Lpks;",
        name = "F",
        parameterTypes = listOf("Lpjq;", "Loyq;", "Lpdr;", "Z"),
        returnType = "V",
    )

    val `splitModeCurrent` = GboardMethodTarget(
        classType = "Lpks;",
        name = "H",
        parameterTypes = emptyList(),
        returnType = "I",
    )

    val `splitModeManual` = GboardMethodTarget(
        classType = "Lpks;",
        name = "X",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `splitModeReload` = GboardMethodTarget(
        classType = "Lpks;",
        name = "R",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `splitModeRestore` = GboardMethodTarget(
        classType = "Lpks;",
        name = "P",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `splitModeTransition` = GboardMethodTarget(
        classType = "Lpks;",
        name = "ah",
        parameterTypes = listOf("I", "Z", "Z"),
        returnType = "Z",
    )

    val `splitOrder` = GboardMethodTarget(
        classType = "Lmpb;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = "Lwhe;",
    )

    val `splitState` = GboardMethodTarget(
        classType = "Lsze;",
        name = "e",
        parameterTypes = listOf("I"),
        returnType = "V",
    )

    val `splitWidthEligibility` = GboardMethodTarget(
        classType = "Lpmm;",
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
        classType = "Lgva;",
        name = "a",
        parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
        returnType = "Lwhe;",
    )

    val `voiceEligibilityConstructor` = GboardMethodTarget(
        classType = "Lsmz;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Lkye;", "Lusl;", "Laavc;", "Ltqb;", "Ltqb;", "Lswr;", "Ltqb;", "Laavc;", "Laavc;", "Lkye;", "Laavc;", "Laavc;", "Luya;", "Lsth;", "Lsxc;", "Laavc;", "Laavc;", "Lsno;", "Lsmm;", "Laavc;", "Lacdy;", "Ljava/util/Set;"),
        returnType = "V",
    )

    val `voiceFormatterConstructor` = GboardMethodTarget(
        classType = "Lsgm;",
        name = "<init>",
        parameterTypes = listOf("Ljava/util/Locale;", "Leqn;", "Lsta;", "I", "Z", "Lsgp;", "Lsyp;", "Luya;", "Ljava/util/concurrent/Executor;"),
        returnType = "V",
    )

    val `voiceMddConstructor` = GboardMethodTarget(
        classType = "Lsdy;",
        name = "<init>",
        parameterTypes = listOf("Landroid/content/Context;", "Lsvb;", "Lsdr;", "Lacdy;"),
        returnType = "V",
    )

    val `voiceNativeReadiness` = GboardMethodTarget(
        classType = "Lsmi;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val `webClipboardCreate` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "onCreate",
        parameterTypes = emptyList(),
        returnType = "V",
    )

    val `writingOfficialPreference` = GboardMethodTarget(
        classType = "Lcei;",
        name = "x",
        parameterTypes = listOf("I", "Z"),
        returnType = "Z",
    )

    val `zhuyinTogglePopupAction` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;",
        name = "b",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;", "Landroid/view/View;", "F", "F", "Lcom/google/android/libraries/inputmethod/metadata/ActionDef;", "[I", "Z"),
        returnType = "Lpva;",
    )

    val `zhuyinTogglePopupTarget` = GboardMethodTarget(
        classType = "Lcom/google/android/libraries/inputmethod/popup/BasicPopupView;",
        name = "b",
        parameterTypes = listOf("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;", "Landroid/view/View;", "F", "F", "Lcom/google/android/libraries/inputmethod/metadata/ActionDef;", "[I", "Z"),
        returnType = "Lpva;",
    )

    val `zhuyinTogglePreferenceFactory` = GboardMethodTarget(
        classType = "Lqpn;",
        name = "I",
        parameterTypes = listOf("Landroid/content/Context;"),
        returnType = "Lqpn;",
    )

    val `zhuyinTogglePreferenceWrite` = GboardMethodTarget(
        classType = "Lqpn;",
        name = "f",
        parameterTypes = listOf("Ljava/lang/String;", "Z"),
        returnType = "V",
    )

    val `zhuyinToggleReset` = GboardMethodTarget(
        classType = "Lpbk;",
        name = "au",
        parameterTypes = listOf("Z"),
        returnType = "V",
    )
}
