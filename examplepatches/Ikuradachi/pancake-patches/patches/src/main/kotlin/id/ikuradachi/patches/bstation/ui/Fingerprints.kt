package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object MainNavigationInfoFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(
        string("bstar://pegasus/channel"),
        string("bstar://main/explore"),
        methodCall(
            definingClass = "Ltv/danmaku/bili/ui/main2/resource/MainResourceManager;",
            name = "u",
            returnType = "Ltv/danmaku/bili/ui/main2/resource/MainResourceManager;",
        ),
    ),
    custom = { _, classDef ->
        classDef.interfaces.contains("Ltv/danmaku/bili/ui/main2/basic/BaseMainFrameFragment\$b;")
    },
)

object HomeNavigationInfoFingerprint : Fingerprint(
    definingClass = "Ltv/danmaku/bili/ui/main2/HomeFragmentV2;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        newInstance("Lcom/bilibili/lib/homepage/startdust/secondary/BasePrimaryMultiPageFragment\$b;"),
        methodCall(
            definingClass = "Lcom/bilibili/lib/homepage/startdust/secondary/BasePrimaryMultiPageFragment\$b;",
            name = "<init>",
        ),
    ),
    custom = { _, classDef ->
        classDef.type == "Ltv/danmaku/bili/ui/main2/HomeFragmentV2;"
    },
)

object HomeViewCreatedFingerprint : Fingerprint(
    definingClass = "Ltv/danmaku/bili/ui/main2/HomeFragmentV2;",
    accessFlags = listOf(AccessFlags.PUBLIC),
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    filters = listOf(
        string("bstar-main.homepage.tab.all.show"),
    ),
    custom = { _, classDef ->
        classDef.type == "Ltv/danmaku/bili/ui/main2/HomeFragmentV2;"
    },
)

object UserCenterInfoFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf("Ltv/danmaku/bili/ui/main2/api/AccountMineV2;"),
    filters = listOf(
        string("single_item"),
        string("creator_center"),
    ),
    custom = { _, classDef ->
        classDef.type == "Ltv/danmaku/bili/ui/main2/mine/HomeUserCenterViewModel;"
    },
)

object HomeDiscoverFragmentFingerprint : Fingerprint(
    name = "getPvEventId",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("bstar-search.discovery-tab.0.0.pv"),
    ),
)

object DiscoverInitTabsFingerprint : Fingerprint(
    classFingerprint = HomeDiscoverFragmentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        newInstance("Lbg0/h;"),
        fieldAccess(
            definingClass = "Lcom/bilibili/widget/search/SearchSectionPageType;",
            name = "DISCOVERY",
        ),
    ),
)

object DiscoverTrendingSearchFingerprint : Fingerprint(
    classFingerprint = HomeDiscoverFragmentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        string("bstar-search.discovery-tab.hot-word-refresh.0.show"),
    ),
)

object DiscoverLoadingStateFingerprint : Fingerprint(
    classFingerprint = HomeDiscoverFragmentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lb61/t;",
    parameters = listOf(
        "Lcom/bilibili/bangumi/ui/page/discover/HomeDiscoverFragment;",
        "Ljava/lang/Boolean;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/biliintl/framework/widget/LoadingImageView;",
            name = "I",
        ),
    ),
)

object TrendingSearchHotWordsFingerprint : Fingerprint(
    definingClass = "Lcom/bilibili/search/history/TrendingSearchViewModel;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        newInstance("Lcom/bilibili/search/history/TrendingSearchViewModel\$getTrendingSearchList\$1;"),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/bilibili/search/history/TrendingSearchViewModel;"
    },
)

object TrendingSearchModulesFingerprint : Fingerprint(
    definingClass = "Lcom/bilibili/search/history/TrendingSearchViewModel;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        newInstance("Lcom/bilibili/search/history/TrendingSearchViewModel\$getSearchModules\$1;"),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/bilibili/search/history/TrendingSearchViewModel;"
    },
)

object SearchDefaultWordIntentFingerprint : Fingerprint(
    definingClass = "Lcom/bilibili/search/main/BiliMainSearchActivity;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Intent;"),
    filters = listOf(
        string("search_default_word"),
        methodCall(
            definingClass = "Landroid/content/Intent;",
            name = "getStringExtra",
        ),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/bilibili/search/main/BiliMainSearchActivity;"
    },
)

object SearchControllerDefaultHintFingerprint : Fingerprint(
    definingClass = "Lcom/bilibili/search/main/j;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/bilibili/search/main/t;",
        "Landroid/app/Activity;",
        "Lcom/bilibili/search/api/model/DefaultKeyword;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/bilibili/search/main/t;",
            name = "u",
        ),
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/bilibili/search/main/j;"
    },
)
