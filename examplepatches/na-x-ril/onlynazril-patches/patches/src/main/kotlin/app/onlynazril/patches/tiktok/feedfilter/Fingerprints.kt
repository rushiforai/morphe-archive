package app.onlynazril.patches.tiktok.feedfilter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

internal const val FEED_FILTER_CLASS =
    "Lapp/onlynazril/extension/tiktok/feedfilter/FeedFilter;"
internal const val FEED_ITEM_LIST = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"

/**
 * Every list that becomes a page's items , the generic model, shared by the profile, search and
 * repost lists as well as the feed. Only the ad filter runs here; a count range would hide a
 * profile owner's own posts, but an item marked as an ad belongs nowhere.
 *
 * Matched on the field it writes as well as on its name: this is a real-named model accessor, and
 * the write to `items` is what makes it the setter being hooked rather than a namesake.
 */
internal val FeedItemListSetItemsFingerprint = Fingerprint(
    definingClass = FEED_ITEM_LIST,
    name = "setItems",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        fieldAccess(
            definingClass = FEED_ITEM_LIST,
            name = "items",
            opcode = Opcode.IPUT_OBJECT,
        ),
    ),
)

/**
 * The page's copy , the write to `items` that is not a setter call. Hooked for the ad filter only,
 * for the same reason as the setter above.
 */
internal val FeedItemListCloneFingerprint = Fingerprint(
    definingClass = FEED_ITEM_LIST,
    name = "clone",
    returnType = FEED_ITEM_LIST,
    parameters = emptyList(),
)

/**
 * The feed panel's insert callback: `(int, String, List)`. The name moves between builds
 * (`yX2` on 47.7.1, `xX2` on 47.7.2, `zX2` on 47.7.3), so only the real-named panel class and the
 * shape are matched. The list is what `DataLayerAbility` hands over for an insert, including ads.
 */
internal val FeedPanelInsertFingerprint = Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Ljava/util/List;"),
    custom = { method, _ -> method.implementation != null },
)

/**
 * The direct survey-card insert on the same panel. It does not pass through the callback above:
 * it builds the event itself and inserts a singleton list whose source is the literal
 * `"survey_card"`. The method name moves, so the literal is the anchor.
 */
internal val FeedPanelSurveyFingerprint = Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;",
    returnType = "V",
    parameters = listOf("I", "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"),
    strings = listOf("survey_card"),
)

/**
 * The home pager model's own method names. The class that carries all four is the recommend feed's
 * presenter/model, and its page entry is the only one the filter may hook; the shared base class is
 * used by every presenter in the app, and hooking that filtered screens it has nothing to do with.
 */
internal const val PAGER_MODEL_GET_ITEMS = "getItems"
internal const val PAGER_MODEL_GET_COUNT = "getListCount"
internal const val PAGER_MODEL_INSERT = "insertItemList"
internal const val PAGER_MODEL_SET = "setItems"
internal val PAGER_MODEL_METHODS = listOf(
    PAGER_MODEL_GET_ITEMS,
    PAGER_MODEL_GET_COUNT,
    PAGER_MODEL_INSERT,
    PAGER_MODEL_SET,
)
