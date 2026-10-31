package app.syncpatches.patches.titlefont

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for every site of a hardcoded `t7.r0` typeface manager call.
 *
 * The typeface manager `Lt7/r0;` (decompiles to `TypefaceManager`) provides:
 * - `d(I)Landroid/graphics/Typeface;` - typeface by font id (the patches replace these calls),
 * - `a()Landroid/graphics/Typeface;` and `c()Landroid/graphics/Typeface;` - hardwired
 *   combinations used by some views.
 *
 * Class fingerprints without a method name are intentional: every matching
 * `Lt7/r0;` call in the class is replaced, and the patch asserts the number of
 * replacements against the expected count, so a mismatched app version fails
 * loudly instead of silently skipping sites.
 */

// region Toolbar and navigation

object MaterialYouToolbarFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/core/MaterialYouToolbar;",
)

// endregion

// region Preference screens

object PreferenceWrapperFragmentFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/fragments/preferences/PreferenceWrapperFragment;",
)

object RootPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/custom/RootPreference;",
)

object ColorPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/defaults/ColorPreference;",
)

object SyncPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/defaults/SyncPreference;",
)

object SyncListPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/defaults/SyncListPreference;",
)

object SyncCheckBoxPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/defaults/SyncCheckBoxPreference;",
)

object SyncRadioButtonPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/defaults/SyncRadioButtonPreference;",
)

object CategoryHeaderPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/defaults/CategoryHeaderPreference;",
)

object CategoryInfoHeaderPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/CategoryInfoHeaderPreference;",
)

object PushPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/PushPreference;",
)

object MonetDarkColorOverridePreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/defaults/monet/MonetDarkColorOverridePreference;",
)

// endregion

// region Other screens

/** Theme editor preview. */
object SingleThemePreferencePreviewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/preferences/SingleThemePreferencePreview;",
)

/** Filter and Bypass settings page headers. */
object FilterFragmentHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/fragments/preferences/filters/FilterFragment\$d;",
)

object BypassFragmentHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/fragments/preferences/bypass/BypassFragment\$d;",
)

// endregion

// region Drawer

object DrawerHeaderHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/drawer/DrawerHeaderHolder;",
)

/** Subreddit view holder, replaced with a different instruction pattern. */
object SubredditHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/sections/subreddits/SubredditHolder;",
    name = "o",
    parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;"),
)

// endregion

// region Subreddit ("explore") sheet

/**
 * Sheet section headers ("Recently viewed", "Search all subs") and search
 * results. Their BaseTextViews hardcode Roboto through the stock
 * `app:typeface` layout attribute and apply it inside their own
 * constructor, so there is no `t7.r0` call to replace. Instead the
 * ButterKnife-bound views are re-targeted after the holder binding.
 */
object SubredditHeaderHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/sections/subreddits/SubredditHeaderHolder;",
    name = "<init>",
    parameters = listOf("Landroid/view/View;"),
)

object SearchItemHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/sections/search/SearchItemHolder;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/view/View;"),
)

/**
 * Subreddit row holder constructor; re-targets the row's secondary
 * "Default" label, which defaults to font id 9 (Roboto Regular).
 */
object SubredditHolderInitFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/sections/subreddits/SubredditHolder;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/view/View;"),
)

// region Profile pages

/**
 * Profile "About" sheet. The header line above the sheet content (large
 * username, link/comment karma counts and cake day) is a
 * LargeToolbarDescription constructed programmatically at the single call
 * site in `o2`, which passes font id 9 (Roboto Regular) — see the const
 * swap executed for this fingerprint.
 */
object AboutFragmentFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/fragments/sidebar/AboutFragment;",
    name = "o2",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
)

/**
 * Large toolbar above subreddit / profile post feeds. The small line above
 * the large title (`toolbar_title_description`, a LargeToolbarDescription
 * without a typeface attribute) is inflated from XML, so its BaseTextView
 * defaults to font id 9 (Roboto Regular). The view binds its own children
 * via findViewById inside this constructor, so the hook is inserted after
 * the binding at the method's single trailing return.
 */
object PostsLargeSubredditToolbarViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/sections/posts/toolbar/PostsLargeSubredditToolbarView;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
)

// endregion

// endregion

// region Dialogs, pickers and inbox

/**
 * The generic dialog / selection row used by every picker (subscriptions,
 * custom feeds, accounts, post actions). Its `view_material_row` layout
 * hardcodes `app:typeface="roboto"` on both the title and secondary text
 * views, so the ButterKnife-bound views are re-targeted inside the internal
 * inflate helper, which runs for every construction path.
 */
object MaterialRowFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/core/MaterialRow;",
    name = "a",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
)

/** Row of radio selection pickers (`app:typeface="roboto"` in its layout). */
object RadioSelectionItemHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/material_dialogs/base/AbstractRadioSelectionDialogBottomSheet\$AbstractRadioSelectionDialogBottomSheetItemHolder;",
    name = "<init>",
    parameters = listOf(
        "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/material_dialogs/base/AbstractRadioSelectionDialogBottomSheet;",
        "Landroid/view/View;",
    ),
)

/** Inbox message rows, hardcoded Roboto through `holder_message_slide`. */
object MessageHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/messaging/MessageHolder;",
    name = "<init>",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lya/e;",
        "Landroid/view/View;",
    ),
)

/**
 * Base of every material alert dialog bottom sheet. Its message text view is
 * hardwired to font id 9 (Roboto Regular) before a `t7.r0` call, so the call
 * itself is replaced with the dynamic title typeface like the other sites.
 */
object AbstractAlertDialogBottomSheetFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/material_dialogs/base/AbstractAlertDialogBottomSheet;",
)

// endregion

// region Remaining hardcoded layout sites

/**
 * Detailed subreddit search rows (used by the post adapters' search
 * sections); `holder_search_subs_detailed` hardcodes the title to
 * Google Sans. The ButterKnife binding happens in the `tb/a` super
 * constructor, so the fields are resolved once that returns.
 */
object SearchSubsDetailedHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/SearchSubsDetailedHolder;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/view/View;"),
)

/**
 * Simple swipe post rows; `holder_simple_swipe` hardcodes the title to
 * Google Sans. Same super-constructor binding as above.
 */
object SimpleSwipeHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/posts/simple_swipe/SimpleSwipeHolder;",
    name = "<init>",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lya/a;",
        "Landroid/view/View;",
        "I",
    ),
)

/**
 * The italic "view comments" row shown under posts in the five
 * `holder_post_comment_*` layouts; the title is hardcoded to Roboto Italic.
 * Same super-constructor binding as above.
 */
object PostCommentHolderFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/viewholders/posts/PostCommentHolder;",
    name = "<init>",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lya/a;",
        "Landroid/view/View;",
        "I",
    ),
)

/**
 * Account switcher rows (`view_account_row` hardcodes the title to Roboto).
 * The row binds its own child views inside the internal inflate helper, the
 * same pattern as MaterialRow, which every construction path goes through.
 */
object AccountRowFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/accounts/AccountRow;",
    name = "a",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
)

/**
 * Tooltips (`view_tooltip` hardcodes the text to Google Sans). The view
 * inflates and self-binds inside onFinishInflate, which has no parameters,
 * so the generic hook picks a dead local as scratch register instead.
 */
object TooltipViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/tooltips/TooltipView;",
    name = "onFinishInflate",
    returnType = "V",
)

/**
 * Ultra manage screen. The views are bound lazily in the preference bind
 * method via findViewById, so the title typeface hook is inserted after
 * every assignment into the description field `j0` instead of after
 * ButterKnife binding.
 */
object UltraManagePreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/custom/ultra/UltraManagePreference;",
    name = "S",
    parameters = listOf("Landroidx/preference/h;"),
    returnType = "V",
)

/**
 * Ultra signup screen; same lazy binding, with the description (`h0`) and
 * error description (`i0`) fields.
 */
object UltraSignupPreferenceFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/preferences/custom/ultra/UltraSignupPreference;",
    name = "S",
    parameters = listOf("Landroidx/preference/h;"),
    returnType = "V",
)

// endregion

// region Views hardcoded to Product Sans and friends

object AltUrlViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/posts/cards/AltUrlView;",
)

object UrlViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/posts/simple/UrlView;",
)

object CommentChipFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/posts/simple/CommentChip;",
)

object VotingChipFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/posts/simple/VotingChip;",
)

object MonetSearchBoxViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/monet/MonetSearchBoxView;",
)

object OnboardingRestoreButtonFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/onboarding/OnboardingRestoreButton;",
)

object ProductSansTextViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/text/basic/ProductSansTextView;",
)

object LinkProductSansTextViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/text/basic/LinkProductSansTextView;",
)

object RobotoTextViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/text/basic/RobotoTextView;",
)

object SecondaryRobotoTextViewFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/text/basic/SecondaryRobotoTextView;",
)

object MaxButtonFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ads/max/MaxButton;",
)

/** Comment section header ("Load ... comments"). */
object CommentHeaderHolderFingerprint : Fingerprint(
    definingClass = "Lpb/a;",
)

// endregion

// region Input fragment

/**
 * Multi input bottom sheet. Only the first `r0.a()` call (title input,
 * field `s0`) is replaced, the URL and subreddit inputs keep their font.
 */
object MultiInputFragmentFingerprint : Fingerprint(
    definingClass = "Lma/n;",
    name = "T1",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;",
    ),
    returnType = "Landroid/view/View;",
)

// endregion
