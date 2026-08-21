package app.morphe.patches.tildes.boostforlemmy

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val BoostForLemmyCompatible = arrayOf(
    Compatibility(
        name = "Boost for Lemmy",
        packageName = "com.rubenmayayo.lemmy",
        // Both are known to carry the same fingerprint strings, verified
        // against 1.0.32 pulled off a device and the 1.0.33 release APK.
        //
        // 1.0.32 is the one to install: it is what the patch was written
        // against and what has the hours on a phone. 1.0.33 applies cleanly and
        // was walked too, just not as far, so Manager marks it experimental
        // rather than offering the two as equals.
        targets = listOf(
            AppTarget(version = "1.0.32"),
            AppTarget(version = "1.0.33", isExperimental = true),
        ),
    )
)

/** The interceptor that answers Boost's API calls from tildes.net. */
internal const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/boostforlemmy/tildes/TildesInterceptor;"

/*
 * Boost's own classes keep their names, though their fields are down to single
 * letters, and the same letter means different things on different classes.
 * Every one below held its letter across 1.0.31, 1.0.32 and 1.0.33, and the
 * assumption tests check each against the app rather than trusting that.
 */

/**
 * `creator_blocked`, which is what Boost's comment fold triggers on. It sits on
 * `PublicContributionModel` and `CommentModel.m(CommentView)` fills it straight
 * off the Lemmy JSON.
 */
internal const val CREATOR_BLOCKED_FIELD = "B"

/** What draws a Boost menu, given rows carrying an id, a title and an icon. */
internal const val MENU_VIEW_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/menu/MenuView;"

/** The rows it draws, which keep their class name where their fields do not. */
internal const val MENU_OPTION_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/menu/MenuOption;"

/**
 * What a screen implements to be told which row was tapped. The extension finds
 * it on the view and hands it a row of Boost's own, which is how **other
 * period** sorts by a window once one has been typed.
 */
internal const val MENU_CALLBACK_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/menu/MenuView${'$'}a;"

/**
 * The row field that menu draws when it holds anything, in front of the title
 * resource beside it. The extension writes Tildes' sort words there, which is
 * what makes them per account where a resource cannot be.
 */
internal const val MENU_TITLE_TEXT_FIELD = "e"

/** The title resource under it, which is what says a row is a sort. */
internal const val MENU_TITLE_FIELD = "d"

/** The enum Boost puts in the `sort` query parameter. */
internal const val SORT_TYPE_CLASS =
    "Lcom/rubenmayayo/lemmy/datatypes/enums/SortType;"

/** The one it puts there for a comment tree, which has four values, not sixteen. */
internal const val COMMENT_SORT_TYPE_CLASS =
    "Lcom/rubenmayayo/lemmy/datatypes/enums/CommentSortType;"

/** A topic's comments, and the toolbar line naming the order they are in. */
internal const val COMMENTS_FRAGMENT_CLASS =
    "Lcom/rubenmayayo/reddit/ui/comments/CommentsFragment;"

/**
 * Where Tildes' wording is filed, under the highest priority qualifier Android
 * has. The extension asks for it by setting `mcc` to 999 on the configuration a
 * screen is built from, and everything it says nothing about falls through to
 * the strings Boost shipped, in whatever language the phone is in.
 */
internal const val TILDES_VALUES = "res/values-mcc999"

/** A profile, whose tab count and tab order both live in `onCreate`. */
internal const val USER_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/reddit/ui/profile/UserActivity;"

/** The pager behind it, whose class is one obfuscated letter off that. */
internal const val USER_ACTIVITY_INNER_CLASS =
    "Lcom/rubenmayayo/reddit/ui/profile/UserActivity${'$'}"

/**
 * The two tab keys Tildes has nothing behind, and the anchor that says an array
 * of strings is the keys rather than the words beside them. Boost passes these
 * to its own API, so they are spelled the way Lemmy spells them and no
 * obfuscator touches them.
 */
internal val DROPPED_TAB_KEYS = setOf("info", "uploads")

/** The first of the seven, and the one every profile has. */
internal const val SUBMITTED_TAB_KEY = "submitted"

/**
 * The one Boost calls **Upvoted** and this words as **Votes**, which is the
 * only tab of the seven whose paginator is picked by name rather than by shape.
 */
internal const val LIKED_TAB_KEY = "liked"

/** The panel above those tabs, holding the name, the avatar and the counts. */
internal const val USER_INFO_VIEW_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/UserInfoView;"

/**
 * Where Boost keeps every site it has been pointed at but does not ship a name
 * for. The account screen's list starts from this and merges its own in behind,
 * so it is the seam the Tildes row is added at.
 */
internal const val UNKNOWN_INSTANCES_CLASS =
    "Lcom/rubenmayayo/lemmy/datatypes/server/UnknownInstancesManager;"

/**
 * The downvote button. `UpActiveImageButton` and `BeatActiveImageButton` are
 * its siblings and carry the vote up and the bookmark, so this class is drawn
 * for one thing only.
 */
internal const val DOWNVOTE_BUTTON_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/buttons/DownActiveImageButton;"

/**
 * The list every feed is drawn in, and the one Boost gives no bottom padding.
 * It is a `RecyclerView` of Boost's own with an empty state on it, drawn in
 * eleven layouts, so hooking the view reaches every one of them where hooking
 * a screen would reach one.
 */
internal const val FEED_LIST_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/EmptyRecyclerView;"

/**
 * The navigation drawer's root, and the one view every screen's drawer is drawn
 * inside. Boost gives it no bottom padding either, so the Settings row along the
 * bottom of the drawer is under the navigation bar.
 *
 * A MaterialDrawer class, and one of the two in that library that survived R8
 * with its name: a layout file names it, so it could not be renamed. Everything
 * else of theirs is a letter in a two-letter package.
 */
internal const val DRAWER_SLIDER_CLASS =
    "Lcom/mikepenz/materialize/view/ScrimInsetsRelativeLayout;"

/**
 * The local broadcast Boost sends when its unread counts change, and the one
 * `DrawerActivity` listens for to redraw the badge. The app's own string, so it
 * survives obfuscation where everything around it does not.
 */
internal const val INBOX_COUNT_CHANGED = "inbox_count_changed_event"

/**
 * The extension method whose body the patch writes, since what it does cannot
 * be named from outside the app. It is compiled as a bare `return-void` and the
 * broadcast goes in front of that.
 */
internal const val REPAINT_BADGE_STUB = "repaintBadge"

/** Fills in the parent a comment opens under, where Boost left it empty. */
internal const val COMMENT_PARENT_HOOK =
    "commentParent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"

/**
 * The swipe-to-refresh layout, whose listener is what says a fetch was asked
 * for rather than decided on.
 *
 * The layout keeps its name because a layout file names it. Everything inside
 * it is down to a letter -- the interface is `SwipeRefreshLayout$f` and its one
 * method is `a` -- so both are found by shape rather than named: the only inner
 * type of this one that is an interface with a single void method taking
 * nothing. `onRefresh` is what the source calls that method and what a
 * decompiler prints, and neither is what the dex says.
 */
internal const val SWIPE_REFRESH_INNER =
    "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout${'$'}"

/** What binds a Boost view to the layout it was inflated from. */
internal const val BUTTERKNIFE_CLASS = "Lbutterknife/ButterKnife;"

/**
 * What Boost asks whether a field has anything in it. Four of those questions
 * are answered by this patch, and each of them is a branch the app takes on
 * something Tildes fills in differently.
 */
internal const val TEXT_UTILS_CLASS = "Landroid/text/TextUtils;"

/**
 * The markdown toolbar, drawn under every markdown field in the app. One of its
 * buttons uploads an image to the instance's own host, which Tildes has not
 * got.
 */
internal const val FORMATTING_BAR_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/FormattingBar;"

/**
 * ButterKnife's binding for a group's sidebar, which is where the Moderators
 * heading is reached from. The generated binding keeps the fragment's own name
 * with `_ViewBinding` on the end, so both survive obfuscation together.
 */
internal const val SIDEBAR_BINDING_CLASS =
    "Lcom/rubenmayayo/reddit/ui/sidebar/subreddit/SidebarFragmentV2_ViewBinding;"

/** The fragment it binds, which is the binding's first parameter. */
internal const val SIDEBAR_FRAGMENT_CLASS =
    "Lcom/rubenmayayo/reddit/ui/sidebar/subreddit/SidebarFragmentV2;"

/**
 * The composer Boost opens on a Lemmy instance. The `Submit*Fragment` family
 * next to it is the Reddit ancestry, and `SubmitLemmyFragment` is never
 * constructed in 1.0.33 at all.
 */
internal const val POST_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/reddit/ui/post/PostActivity;"

/**
 * The Local tab's own fragment on the Groups page, and the one thing on that
 * pager with a name of its own: the class holding the tabs is two obfuscated
 * letters, its three methods are one each, and the titles are resource ids that
 * renumber every release. So the pager is found by which fragment it builds.
 */
internal const val COMMUNITIES_LOCAL_FRAGMENT_CLASS =
    "Lcom/rubenmayayo/lemmy/ui/communities/CommunitiesLocalFragment;"

/**
 * The Groups page itself, which is what tells its pager from the site screen's:
 * both hold a Local tab and both build the same fragment for it. It keeps its
 * name where the two pagers are down to a letter each.
 */
internal const val COMMUNITIES_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/lemmy/ui/communities/CommunitiesActivity;"

/**
 * What all three of the Groups page's tabs are, and the only class in the app
 * that extends it. Its `showDialogMenu` is where that page's sort rows are on
 * their way to the view, which is the one place the screen is still known.
 */
internal const val COMMUNITIES_FRAGMENT_CLASS =
    "Lcom/rubenmayayo/lemmy/ui/communities/CommunitiesFragment;"

/** What a pager hands back for a page, and the shape of the method that does. */
internal const val FRAGMENT_CLASS = "Landroidx/fragment/app/Fragment;"

/**
 * The switch behind the drawer's Local row, under Settings and on out of the
 * box. Every row in that drawer has one, and a preference key is a good anchor
 * because renaming it would lose whatever the user had set.
 */
internal const val DRAWER_LOCAL_PREF = "pref_drawer_show_local"

/**
 * And the switch behind the All row eight lines below it, in the same method
 * and the same shape.
 *
 * Its own row among the subscriptions came off with Local's on the first pass
 * and this one did not, so the drawer kept an All at the top while the list
 * under it had none. Both point at the same listing here.
 */
internal const val DRAWER_ALL_PREF = "pref_drawer_show_all"

/**
 * The model behind a row in the drawer's subscriptions list, which is where
 * Boost's second Local row lives. Those rows are the app's own database rather
 * than preferences, so the switch above reaches none of them.
 */
internal const val SUBSCRIPTION_VIEW_MODEL_CLASS =
    "Lcom/rubenmayayo/reddit/models/reddit/SubscriptionViewModel;"

/** A profile's own listing, which filters posts separately from a feed. */
internal const val USER_CONTRIBUTION_LIST_CLASS =
    "Lcom/rubenmayayo/reddit/ui/profile/UserContributionListFragment;"

/**
 * The home screen, which is the one screen with a spinner over its feed. It
 * keeps the account's subscriptions in a list its own adapter, the drawer's rows
 * and the launcher shortcuts all read.
 */
internal const val MAIN_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/reddit/ui/submissions/subreddit/MainActivity;"

/**
 * What that screen's own `W1(ArrayList)` logs, which is what tells it from its
 * siblings.
 *
 * No fingerprint uses it any more -- the list is taken over on the base method
 * every screen's drawer goes through rather than on this override -- and
 * `PatchAssumptionsTest` still does: the move rests on this override handing
 * its argument straight on and the half underneath keeping that same object.
 */
internal const val SUBSCRIPTIONS_SET = "Set subreddits"

/**
 * Which field on Boost's post model holds a topic's id, as the string
 * `SubmissionModel.m(Post)` leaves there. The composer reads it off the model
 * Boost hands the editor, to know whose tags to fill in, and the patch checks
 * the letter has not moved rather than trusting it.
 */
internal const val TOPIC_ID_FIELD = "b"

/** Boost's post model, which is where a Lemmy post lands. */
internal const val SUBMISSION_MODEL_CLASS =
    "Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;"

/**
 * The holder that draws a post, on a listing row and on a topic's own screen
 * alike. One method binds a model to it, and which of its two body views is
 * there says which of the two it is drawing.
 */
internal const val SUBMISSION_VIEW_HOLDER_CLASS =
    "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;"

/**
 * Which field on the post model holds the body as it is drawn.
 *
 * A Lemmy post's `body` is copied into two fields, `N` and `M`, and `M` is the
 * one the renderer is handed. So this is the display copy: the tags come off it
 * where they are drawn as chips instead, and `N` is left alone, which is what
 * keeps every edit path reading the body the way it always did.
 */
internal const val BODY_FIELD = "M"

/** Boost's comment model, which is where a Lemmy comment lands. */
internal const val COMMENT_MODEL_CLASS =
    "Lcom/rubenmayayo/reddit/models/reddit/CommentModel;"

/**
 * And the holder that draws one, everywhere a comment is drawn but the inbox:
 * the tree, a profile, the bookmarks, a search and the moderation queue all go
 * through holders that extend this one, and none of them overrides the bind.
 */
internal const val COMMENT_VIEW_HOLDER_CLASS =
    "Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;"

/**
 * What the markdown helper's render call takes, which is how that call is
 * found inside the bind: a view to draw into and the text to draw.
 *
 * The helper's own class and method are both one letter after R8 while this
 * pair is two framework types, and it is the only call in the bind taking
 * them.
 */
internal val RENDER_MARKDOWN_PARAMETERS =
    listOf("Landroid/widget/TextView;", "Ljava/lang/String;")

/**
 * Three strings joined and handed back, which is the whole of `a6.z1.d` and
 * the only call in Boost's quote button.
 */
internal val CONCAT_PARAMETERS = List(3) { "Ljava/lang/String;" }

/**
 * The byline view a comment's labels are drawn in, which is the one Boost
 * paints its own `OP` and `M` marks into.
 *
 * Nothing here writes it -- the extension looks it up by name as the comment is
 * bound, and carries its own copy of the string. It is here so the assumption
 * tests can say the name is still in the app, since the extension's answer to
 * losing it is to leave the label in the body and say nothing.
 */
internal const val LABEL_SLOT_VIEW = "item_comment_distinguished"

/**
 * How a profile tab says which one it is, and the bookmarks one's answer.
 *
 * The pager puts the key in the bundle it builds a tab's fragment with, and the
 * extension reads it back off `getArguments` to know whether the page it is
 * being handed is one that can draw comments. All three are Boost's own strings
 * rather than names an obfuscator touches, and the extension carries its own
 * copies, being a module of its own. The tests pin them against the app.
 */
internal const val CONTRIBUTION_TYPE_KEY = "contribution_type"
internal const val ARGUMENTS_GETTER = "getArguments"
internal const val BOOKMARKS_TAB = "saved"

/**
 * And what the tab's own **Show topics** row sets behind it, which is the word
 * that says a bookmarks page was asked for without its comments. It never
 * reaches a request -- it picks which paginator is built, and the one it picks
 * sends the same query as no filter at all -- so the extension reads it off the
 * screen by its value.
 */
internal const val ONLY_TOPICS = "only_posts"

/**
 * What Lemmy answers a profile with, and what a bookmarks page comes back as.
 *
 * It carries a `posts` array and a `comments` array together, and Boost reads
 * one or the other off it: two paginators over the same response, one per tab.
 * The bookmarks tab is wired to the posts one, which is where the comments a
 * page was fetched for go missing.
 */
internal const val PERSON_DETAILS_RESPONSE_CLASS =
    "Lcom/rubenmayayo/lemmy/datatypes/GetPersonDetailsResponse;"

/**
 * Which field says the app may not vote on something. Boost inherited it from
 * Reddit's archived posts, where voting closes after six months, and Lemmy has
 * nothing for it, so nothing on that path writes it. It sits on
 * `PublicContributionModel`, above the topic and the comment alike, and every
 * place a vote can be cast reads it first.
 */
internal const val ARCHIVED_FIELD = "n"

/** What the two models it sits on are, for the test that pins it. */
internal const val PUBLIC_CONTRIBUTION_CLASS =
    "Lcom/rubenmayayo/reddit/models/reddit/PublicContributionModel;"

/**
 * Which field says a thing takes no more comments, off Lemmy's `locked`. It
 * sits beside [ARCHIVED_FIELD] on the same model, so a topic and a comment each
 * carry one, and the reply gate reads both:
 *
 * ```java
 * if ((submissionModel.o || publicContributionModel.o) && !submissionModel.r) {
 * ```
 *
 * `r` is `can_auth_user_moderate`, which is how a moderator still answers a
 * locked thread. This end never says yes to that, so the gate turns on the two
 * reads alone, which is what makes hooking them enough.
 */
internal const val LOCKED_FIELD = "o"

/**
 * Which field on that model says a topic is a spoiler, which Boost inherited
 * from its Reddit ancestry and Lemmy has nothing for. The extension fills it in
 * from Tildes' tag of the same name, and the patch checks nothing on the Lemmy
 * path writes it first.
 */
internal const val SPOILER_FIELD = "W"

/**
 * Boost's account editor, which is what the edit chip on your own profile
 * opens. Tildes has one editable thing on an account, the bio, against the
 * avatar, banner, display name, email and eight switches drawn here, so the
 * screen comes down to the one field it can answer for.
 *
 * `PreferenceFragmentCompat` by name and a plain ButterKnife view underneath:
 * nothing on it is an Android preference, which is why the fields are reached
 * as views rather than by key.
 */
internal const val ACCOUNT_FRAGMENT_CLASS =
    "Lcom/rubenmayayo/reddit/ui/preferences/v2/PreferenceFragmentAccountCompat;"

/**
 * The body that editor's save sends. The task carrying it is two obfuscated
 * letters with no strings of its own, so this field type is what finds it.
 */
internal const val SAVE_USER_SETTINGS_CLASS =
    "Lcom/rubenmayayo/lemmy/datatypes/SaveUserSettings;"

/** What that task toasts with, and what a toast is asked for by. */
internal const val TOAST_CLASS = "Landroid/widget/Toast;"

/**
 * The composer's thumbnail input, which is the tags field on Tildes. Boost
 * binds its views with ButterKnife and those fields keep their names where the
 * rest of the class does not, so this one is named rather than found.
 */
internal const val THUMBNAIL_FIELD = "optionalThumbnailEditText"

/**
 * The screen a community is drawn on, which is the only screen Boost has that
 * scrolls a listing of topics and pages it. A tag opens on it, started by name
 * rather than by model, and the extension names the class rather than the patch
 * -- nothing here is rewritten, so this is only what the assumption test reads.
 */
internal const val SUBREDDIT_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/reddit/ui/submissions/subreddit/SubredditActivity;"

/**
 * The extra that screen takes a community name on, rather than a model. It is
 * how Boost's own home screen shortcuts open one, and the one way in that
 * carries a name the extension can make up.
 */
internal const val SHORTCUT_EXTRA = "shortcut"

/**
 * The wiki screen's fragment, kept whole from Boost's Reddit ancestor while the
 * presenter under it was shrunk down to nothing. It keeps its own name, and the
 * layout it inflates keeps its view ids, so both are reachable by name where the
 * presenter's two remaining methods are a letter each.
 */
internal const val WIKI_FRAGMENT_CLASS =
    "Lcom/rubenmayayo/reddit/ui/wiki/WikiFragment;"

/**
 * The **Go to...** screen, which is the other place a subscription list is
 * drawn: the drawer's rows again, on a screen of their own with a filter over
 * them. It keeps its name where the method that builds a row is two characters.
 */
internal const val GO_TO_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/reddit/ui/search/GoToGenericActivity;"

/**
 * The **Edit subscriptions** screen, which is the third place those rows are
 * drawn and the only one that reads them out of the database itself. The drawer
 * and **Go to...** both take the same list off `yg.h.x()`; this one asks
 * ActiveAndroid for the rows and sorts them, so nothing either of those is
 * hooked at can reach it.
 *
 * It keeps its name, where the method the list arrives through is two
 * characters.
 */
internal const val SUBSCRIPTIONS_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/reddit/ui/subscriptions/SubscriptionsActivity;"

/**
 * Boost's model of a person, which keeps its name where the two methods that
 * name one are a letter each.
 */
internal const val PERSON_MODEL_CLASS =
    "Lcom/rubenmayayo/lemmy/ui/person/PersonModel;"

/**
 * How many ways it names one: the short form a byline reads and the long form
 * everything compares. Both take nothing and answer a String, and nothing else
 * on the class does.
 */
internal const val PERSON_NAME_METHODS = 2

/**
 * The **Filters & blocks** settings screen, a `PreferenceFragmentCompat` built
 * from `res/xml/pref_filters_v2.xml`. It keeps its name, and androidx's own
 * preference classes keep theirs too, which is what lets the extension reach
 * them by reflection.
 */
internal const val FILTERS_FRAGMENT_CLASS =
    "Lcom/rubenmayayo/reddit/ui/preferences/v2/PreferenceFragmentFiltersCompat;"

/**
 * The one row under that screen's **Blocking** heading, which opens the Blocked
 * screen. The heading itself is a `PreferenceCategory` with no key, so this is
 * what the extension finds it by.
 */
internal const val BLOCK_PREFERENCE = "block"

/**
 * The XML that screen is built from, and the two other rows on it the
 * extension has something to say about.
 *
 * `pref_filter_flair` is a filter for a thing Lemmy does not have. Boost draws
 * the row hidden, stores a list for it and reads that list from nothing that
 * filters -- so it is a control the app already has and does not use, which is
 * where this site's **filtered tags** go. `pref_filter_instance` is a filter
 * for a thing this site does not have, there being one of it, so that row comes
 * off the way the Blocking section above it does.
 *
 * Both are `FilterPreference` rows, which is the class the screen picks its
 * list editor by rather than by key -- so the hidden one works the moment it is
 * shown.
 */
internal const val FILTERS_SCREEN_XML = "res/xml/pref_filters_v2.xml"
internal const val TAG_PREFERENCE = "pref_filter_flair"
internal const val SITE_PREFERENCE = "pref_filter_instance"

internal const val FILTER_PREFERENCE_CLASS_NAME =
    "com.rubenmayayo.reddit.ui.preferences.v2.custom.FilterPreference"
internal const val FILTER_PREFERENCE_CLASS =
    "Lcom/rubenmayayo/reddit/ui/preferences/v2/custom/FilterPreference;"
internal const val FILTER_DIALOG_CLASS =
    "Lcom/rubenmayayo/reddit/ui/preferences/v2/custom/FilterPreferenceDialogFragmentCompat;"

/**
 * androidx's own base row, which the extension writes a title and a summary
 * onto. It keeps its name here, along with the handful of methods Boost's own
 * screens call -- and one it does not call, which is why the test pins both.
 */
internal const val PREFERENCE_CLASS = "Landroidx/preference/Preference;"
internal const val DIALOG_PREFERENCE_CLASS = "Landroidx/preference/DialogPreference;"

/**
 * `com.rubenmayayo.reddit.aa.Draft`, the table behind the Drafts button, and
 * `com.rubenmayayo.reddit.aa.User`, the account a row is filed under.
 *
 * Both keep their names and so do their columns: ActiveAndroid reads a model by
 * reflection at runtime, matching a field to a column through the annotation on
 * it, so obfuscating either would stop the ORM finding it.
 */
internal const val DRAFT_ROW_CLASS = "Lcom/rubenmayayo/reddit/aa/Draft;"

internal const val DRAFT_USER_CLASS = "Lcom/rubenmayayo/reddit/aa/User;"

/**
 * The column a draft's text is in, which is the body except on a topic that has
 * none -- see the drafts section of `ARCHITECTURE.md`. Both the patch and the
 * extension name it: one finds the row the picker draws by it, the other reads
 * and writes it by reflection.
 */
internal const val DRAFT_TEXT_FIELD = "text"

/**
 * `DraftSelectorView$DraftAdapter$MyViewHolder`, one row in the dialog the
 * Drafts button opens.
 *
 * A view holder bound by ButterKnife, which is why the name survives: the
 * generated `_ViewBinding` beside it names the class, so R8 keeps both.
 */
internal const val DRAFT_PICK_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/dialogs/" +
        "DraftSelectorView${'$'}DraftAdapter${'$'}MyViewHolder;"

/**
 * The adapter above it, which draws one row of that dialog. Kept for the same
 * reason: the view holder's generated binding names it, so R8 keeps the whole
 * chain.
 */
internal const val DRAFT_ADAPTER_CLASS =
    "Lcom/rubenmayayo/reddit/ui/customviews/dialogs/DraftSelectorView${'$'}DraftAdapter;"

/**
 * The base activity's "Save draft?" dialog, which is what stands between
 * leaving a composer and losing what is on it.
 *
 * A public method on `com.rubenmayayo.reddit.ui.activities.b` that kept its
 * name, and the anchor for the branch in front of it: the composer asks whether
 * the body is empty one instruction pair before calling this, and the discard
 * dialog is the other arm.
 */
internal const val ASK_SAVE_DRAFT = "askSaveDraft"


/**
 * Which field on the reply screen holds the post it was opened over.
 *
 * The extension reads it to know which comment or topic to ask the site for the
 * markdown of, once that screen has been opened as an edit, and the patch
 * checks the letter has not moved rather than trusting it.
 */
internal const val EDIT_MODEL_FIELD = "g"

/** The type it holds, which is the topic and the comment's shared parent. */
internal const val CONTRIBUTION_MODEL_CLASS =
    "Lcom/rubenmayayo/reddit/models/reddit/ContributionModel;"

/**
 * The box that screen types into. It keeps its name because ButterKnife binds
 * it, and it is declared a class up, which is why the extension walks rather
 * than asking the screen for it.
 */
internal const val EDIT_BOX_FIELD = "inputEditText"

/** The class declaring it, which is the reply screen's parent. */
internal const val FORMAT_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/reddit/ui/compose/FormatActivity;"
