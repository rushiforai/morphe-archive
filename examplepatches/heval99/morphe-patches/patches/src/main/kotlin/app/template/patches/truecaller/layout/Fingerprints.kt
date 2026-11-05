package app.template.patches.truecaller.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal const val BOTTOM_BAR_BUTTON_TYPE = "Lcom/truecaller/bottombar/BottomBarButtonType;"
internal const val BOTTOM_BAR_VIEW = "Lcom/truecaller/bottombar/BottomBarView;"
internal const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"

// Feature toggles are read as isEnabled("<key>", default state) in small R8-renamed getters. The
// keys are exact-matched: both are prefixes of other toggles ("featureCallAssistantNumberSync",
// "featureScamFeedBottomTab", ...), which a plain `strings` match would also accept.

// Master switch of the Call Assistant: about 30 call sites check it, among them the Assistant
// tab, its deep links, FCM message handling and the assistant auth token worker.
internal object CallAssistantFeatureFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(string("featureCallAssistant")),
)

// Master switch of the Scam Feed: the bottom tab, the drawer menu entry, its deep link, the
// call-history hook and the Scam Feed notification worker all check it first.
internal object ScamFeedFeatureFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(string("featureScamFeed")),
)

// The bottom bar builder (xm6.g(SparseIntArray) in 26.39.6, cp6.g in 26.40.5): reads the CALLS /
// MESSAGES / SCAM_FEED badge counts, fills an array with one tab item per slot (null when a slot
// has no tab), then filterNotNull(array).take(n) and hands the list to BottomBarView (inlined in
// 26.40.5), which ignores lists with fewer than two tabs. The tab items share an obfuscated base
// class whose only no-argument getter returning BottomBarButtonType (kept enum) gives each tab's
// type.
internal object BottomBarTabsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/util/SparseIntArray;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = BOTTOM_BAR_BUTTON_TYPE, name = "CALLS"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = BOTTOM_BAR_BUTTON_TYPE, name = "MESSAGES"),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            parameters = listOf("[Ljava/lang/Object;"),
            returnType = "Ljava/util/List;",
        ),
        methodCall(
            definingClass = "Lkotlin/collections/CollectionsKt;",
            parameters = listOf("Ljava/lang/Iterable;", "I"),
            returnType = "Ljava/util/List;",
        ),
    ),
)

// The builder class's default tab getter (cp6.c() in 26.40.5): "default_tab_on_launch" == 0 ?
// CALLS : MESSAGES. The back button reads it ("return to the default tab before leaving"); the
// launch-tab helper reads the pref itself, but its choice then goes through selectTab below.
internal object DefaultTabFingerprint : Fingerprint(
    classFingerprint = BottomBarTabsFingerprint,
    returnType = BOTTOM_BAR_BUTTON_TYPE,
    parameters = listOf(),
    filters = listOf(string("default_tab_on_launch")),
)

// toString() of the main Settings screen's state (a7a in 26.40.5), a Kotlin data class whose
// isPremiumItemVisible / isWatchItemVisible / ... flags CategoriesFragment applies to its fixed
// rows (item_premium, item_watch, ... plus their dividers). Only the stable prefix is matched.
internal object CategoriesSettingsStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("CategoriesSettingsState(", StringComparisonType.STARTS_WITH)),
)

// The builder class's selectTab(type, fromUser) (cp6.e in 26.40.5): every programmatic tab switch
// (launch tab, notification and deep-link intents, back button) goes through it. It calls the
// fragment switch directly for CALLS on a fresh bar, otherwise NavigationBarView.setSelectedItemId,
// which does nothing for a tab that is not in the bar.
internal object SelectTabFingerprint : Fingerprint(
    classFingerprint = BottomBarTabsFingerprint,
    returnType = "V",
    parameters = listOf(BOTTOM_BAR_BUTTON_TYPE, "Z"),
    filters = listOf(methodCall(name = "setSelectedItemId", parameters = listOf("I"))),
)

// The classic call lists' shared RecyclerView setup (g68.I() in 26.40.5, called by the call history
// tab and the dialer's list): adapter, layout manager, scroll listener, then, unless
// "featureFavouriteContacts" is on, the swipe-to-call/SMS helper as touch listener and item
// decoration, then setItemAnimator(null) and setHasFixedSize(true). Only the kept RecyclerView method names are
// matched, not the obfuscated argument types; the patch checks the guard and the swipe helper.
internal object CallLogSwipeSetupFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = RECYCLER_VIEW, name = "addOnItemTouchListener"),
        methodCall(definingClass = RECYCLER_VIEW, name = "addItemDecoration"),
        methodCall(definingClass = RECYCLER_VIEW, name = "setItemAnimator"),
        methodCall(definingClass = RECYCLER_VIEW, name = "setHasFixedSize"),
    ),
)

// toString() of the business contact details model (q27 in 26.40.5), a Kotlin data class holding
// the description, tcId, business number, contact type, display name and brandMedia (the
// ArrayList of brand images the details screen shows in its media carousel). Only the stable
// prefix and the brandMedia label are matched.
internal object BusinessDetailsModelToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("BusinessDetailsModel(description=", StringComparisonType.STARTS_WITH),
        string(", brandMedia="),
    ),
)

// The Compose BusinessDetailsScreen (static n27.a in 26.40.5): (modifier, model, onMediaClick,
// onVideoClick, videoThumbnail, composer, changed). It lays out the media carousel (brand images
// plus, when the nullable Function2 slot is set, the "BusinessVideoThumbnail" promo video item)
// only when brandMedia is not empty or the video slot is set, then the "BusinessDesTitle" /
// "BusinessDescription" texts. The website and call/message/save/block buttons are not part of it.
internal object BusinessDetailsScreenFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L", "L", "Lkotlin/jvm/functions/Function1;", "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function2;", "L", "I",
    ),
    strings = listOf(
        string("BusinessDetailsScreen", StringComparisonType.CONTAINS),
        string("BusinessDesTitle", StringComparisonType.CONTAINS),
    ),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

internal const val CALL_LOG_FILTER_TYPE = "Lcom/truecaller/calllog/api/FilterType;"

// The revamped call log's filter row (static a050.e in 26.41.5), the only renderer of the filter chips
// (All / Missed / Not spam / Spam / ...) and the SIM selector next to them (shown with two or more
// SIMs): (modifier, filter chips, chip click, SIMs, selected SIM index, ..., composer, changed). The
// call log screen draws it pinned above the list or as the LazyColumn item "call_log_filters"; its
// restart lambda calls it again. "filtersStartPadding" is its padding animation label.
internal object CallLogFiltersRowFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        "L", "L", "Lkotlin/jvm/functions/Function1;", "L", "I", "Lkotlin/jvm/functions/Function1;",
        "Lkotlin/jvm/functions/Function0;", "Z", "Lkotlin/jvm/functions/Function1;", "L", "I",
    ),
    strings = listOf("filtersStartPadding"),
)

// TruecallerInit.onNewIntent: the "set_missed_filter" extra (missed call notifications) selects the
// MISSED filter through the call log's filter setter (ud8.f(FilterType) in 26.41.5); the voicemail and
// assistant extras and onCreate use the same setter. The matched call names the setter.
internal object CallLogFilterIntentFingerprint : Fingerprint(
    definingClass = "Lcom/truecaller/ui/TruecallerInit;",
    name = "onNewIntent",
    parameters = listOf("Landroid/content/Intent;"),
    filters = listOf(
        string("set_missed_filter"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = CALL_LOG_FILTER_TYPE, name = "MISSED"),
        methodCall(returnType = "V", parameters = listOf(CALL_LOG_FILTER_TYPE)),
    ),
)

internal const val CALL_LOG_HISTORY_ENTRY = "Lcom/truecaller/calllog/presentation/ui/screen/model/CallLogHistoryItem\$HistoryEntry"

// toString() of the call log's source model (CallLogHistoryEntryData, ch8 in 26.41.5), a Kotlin data
// class with phonebookId (0 for numbers not in the phonebook), normalisedNumber (E.164), countryCode,
// name, isSpam, spamScoreLabel, isBlocked, blockReasonLabel and more. Parts of it are R8-outlined;
// the patch maps the fields through the replayed append order.
internal object CallLogHistoryEntryDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("CallLogHistoryEntryData(primaryHistoryEventId=", StringComparisonType.STARTS_WITH)),
    strings = listOf(
        string(", phonebookId=", StringComparisonType.CONTAINS),
        string(", normalisedNumber=", StringComparisonType.CONTAINS),
        string(", blockReasonLabel=", StringComparisonType.CONTAINS),
    ),
)

// toString() of the revamped call log's row model (CallLogHistoryItem.HistoryEntry, mh8 in 26.41.5),
// whose subtitleLabel (an R8-merged base class) is the text or resource label under the name.
internal object CallLogHistoryRowToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("HistoryEntry(id=", StringComparisonType.STARTS_WITH)),
    strings = listOf(
        string(", subtitleLabel=", StringComparisonType.CONTAINS),
        string(", normalisedNumber=", StringComparisonType.CONTAINS),
    ),
)

// The revamped call log's row mapper (b98.G(List) in 26.41.5): for each CallLogHistoryEntryData it
// picks the context action (SAVE_CONTACT, ...), the name (Resource UNKNOWN when there is no name or
// number) and the subtitle label (Resource RECORDING / VIDEO / WHATSAPP / WHATSAPP_VIDEO / ..., or a
// text label), then builds one HistoryEntry. The kept enum constants are matched in that order.
internal object CallLogRowMapperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "L",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "$CALL_LOG_HISTORY_ENTRY\$ContextAction\$Type;",
            name = "SAVE_CONTACT",
        ),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "$CALL_LOG_HISTORY_ENTRY\$Name\$Resource\$Type;", name = "UNKNOWN"),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "$CALL_LOG_HISTORY_ENTRY\$SubtitleLabel\$Resource\$Type;",
            name = "RECORDING",
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "$CALL_LOG_HISTORY_ENTRY\$SubtitleLabel\$Resource\$Type;",
            name = "WHATSAPP_VIDEO",
        ),
    ),
)

// The revamped call log's LazyColumn builder (an R8-merged Function1 lambda, qh8.invoke in 26.41.5):
// banners, the header ad, then the frequently called contacts row as the item "frequent_contacts_id"
// (only when its show flag is set), the "call_log_filters" item, the history rows and the footers.
internal object FrequentContactsListFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(string("frequent_contacts_id")),
)

// The Messages tab's LazyColumn builder (an R8-merged Function1 lambda, c67.invoke in 26.41.5) for
// BusinessHomeScreenState: the banners, the "available-filters" Categories row, then the Important
// senders grid as the item "important-senders-header" (only with six or more important senders),
// then "recentHeader" and the recent conversations.
internal object ImportantSendersListFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(string("important-senders-header")),
)

// toString() of the Messages tab's screen state (BusinessHomeScreenState, d67 in 26.41.5), a Kotlin
// data class whose importantSenders list feeds the Important senders grid. Only the stable prefix and
// the importantSenders label are matched.
internal object BusinessHomeScreenStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("BusinessHomeScreenState(", StringComparisonType.STARTS_WITH)),
    strings = listOf(string(", importantSenders=", StringComparisonType.CONTAINS)),
)

internal const val PROFILE_MENU_ITEM = "Lcom/truecaller/usershome/presentaion/ui/components/menuitems/MenuItem;"

// toString() of a profile menu row's state (MenuItemUiState, zrr in 26.42.5), a Kotlin data class
// (item: MenuItem, trailingText, isVisible). The users home view model (UsersHomeActivity) builds one
// per MenuItem of its premium and other lists and keeps only the visible ones.
internal object MenuItemUiStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("MenuItemUiState(item=", StringComparisonType.STARTS_WITH)),
    strings = listOf(string(", isVisible=", StringComparisonType.CONTAINS)),
)

// toString() of the profile menu's list state (MenuItemsViewState, esr in 26.42.5): groups, a list of
// row lists. The menu draws a section divider after every group but the last one.
internal object MenuItemsViewStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("MenuItemsViewState(groups=", StringComparisonType.STARTS_WITH)),
)

// toString() of the "Enabled" state of the users home screen's optional rows (fmj in 26.42.5; the
// "Disabled" object is its sibling under the same interface): iconRes, titleRes, subtitleViewState,
// trailingContent and showNewBadge. The Premium banner at the top of the profile menu is one of them.
internal object MenuRowEnabledToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(
        string("Enabled(iconRes=", StringComparisonType.EQUALS),
        string(", titleRes=", StringComparisonType.EQUALS),
        string(", subtitleViewState=", StringComparisonType.EQUALS),
    ),
)

// The incoming call buttons composable (iis.d in 26.42.5): a Box that places the decline and the
// answer swipe buttons (test tags "rejectCallButton" / "answerCallButton", in that order), each
// aligned the same way and pushed sideways by an offset(x) of -/+ width / 3.5. Each button is
// dragged in any direction (the swipe progress is the drag distance), so where it sits does not
// change how it is used.
internal object IncomingCallButtonsFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("rejectCallButton"),
        string("answerCallButton"),
    ),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

// The incoming call notification builder (static m5m.x in 26.42.5): picks the "incoming_calls" or
// "phone_calls" channel, builds the "Answer" and "Decline" PendingIntents, then asks a ()Z check
// (Android 12+, the featureCallStyleNotifications experiment, maker and device not excluded)
// whether to build a system call style notification or Truecaller's own RemoteViews layout. The
// last filter is that check.
internal object IncomingCallNotificationFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    filters = listOf(
        string("incoming_calls"),
        string("Answer"),
        string("Decline"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = listOf(), returnType = "Z"),
    ),
)
