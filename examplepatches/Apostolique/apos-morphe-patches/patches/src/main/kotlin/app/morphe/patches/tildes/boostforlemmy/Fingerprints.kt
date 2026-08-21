package app.morphe.patches.tildes.boostforlemmy

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * `sf.b.d()`, which builds the Retrofit/OkHttp client:
 *
 * ```java
 * StringBuilder sb2 = new StringBuilder(DtbConstants.HTTPS);
 * sb2.append(str);
 * sb2.append(c.d(str) ? "/api/alpha" : "/api/v3");
 * ```
 *
 * Matched on those string constants rather than on the class or method name,
 * both of which are obfuscated and change between releases. In 1.0.33 each of
 * "/api/alpha" and "/api/v3" occurs exactly once in the whole app, so the
 * combination is unambiguous.
 */
internal val apiClientBuilderFingerprint = Fingerprint(
    strings = listOf("https://", "/api/alpha", "/api/v3"),
)

/**
 * `sf.b(String host, String jwt)`, the constructor of the same class, which is
 * where the host comes from when nobody is signed in:
 *
 * ```java
 * public b(String str, String str2) {
 *     this.a = "lemmy.world";
 *     this.b = null;
 *     this.a = TextUtils.isEmpty(str) ? "lemmy.world" : str;
 *     this.b = str2;
 *     this.c = d();
 * }
 * ```
 *
 * The host is a field on one singleton and Boost writes it in three places, all
 * of them checked at the bytecode level: twice here, and once in the account
 * switcher off `User.instance`. So an install with no account keeps whatever
 * this constructor chose, for the life of the process.
 *
 * Two callers reach it. The singleton passes nothing, which is the guest, and
 * the login screen passes the host you typed so it can talk to a site the app
 * is not pointed at yet. Rewriting the argument catches the first and leaves
 * the second alone, because the second is never empty.
 *
 * Matched on the shape rather than the name: the class is one letter and so is
 * the method it calls, while a two-argument constructor holding "lemmy.world"
 * is the only one in the app. `PatchAssumptionsTest` checks that count.
 */
internal val apiHostFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    returnType = "V",
    strings = listOf(BOOSTS_OWN_HOST),
    custom = { method, _ -> method.name == "<init>" },
)

/** Boost's own site, and the one thing a guest was pointed at before this. */
internal const val BOOSTS_OWN_HOST = "lemmy.world"

/**
 * `CommentsFragment.o0(SubmissionModel, ArrayList, boolean, int)`, which runs
 * once a topic's comments have loaded and ends by folding some of them:
 *
 * ```java
 * if (commentModel3.B || (("AutoModerator".equalsIgnoreCase(commentModel3.R) && ...)
 *         || (commentModel3.d0 && ...))) {
 *     commentModel3.O = true;   // collapsed
 *     commentModel3.N = false;  // body hidden
 *     ...                       // hide every reply under it, count them into M
 * }
 * ```
 *
 * Matched on the preference keys and on "AutoModerator", which is the whole
 * app's only occurrence of that literal, in 1.0.31 through 1.0.33. Preference
 * keys make good anchors because they are what a user's saved settings are
 * filed under, so renaming one would lose those settings.
 */
internal val commentsLoadedFingerprint = Fingerprint(
    strings = listOf(
        "AutoModerator",
        "pref_comments_collapse_automoderator",
        "pref_comments_collapse_collapsed",
    ),
)

/**
 * `CommentViewHolder.o(CommentModel, boolean)`, which writes the number under a
 * comment:
 *
 * ```java
 * String valueOf = String.valueOf(commentModel.j);
 * if (commentModel.Z) valueOf = "?";          // Reddit's score_hidden
 * if (commentModel.T) valueOf = o.e("† · ", valueOf);
 * this.scoreTv.setText(valueOf);
 * ```
 *
 * The dagger is what a distinguished comment gets, and it is the whole app's
 * only occurrence of that string, in 1.0.31 through 1.0.33.
 */
internal val commentScoreFingerprint = Fingerprint(
    strings = listOf("† · "),
)

/**
 * `CommentViewHolder.e(CommentModel, boolean, boolean, p)`, the one method that
 * binds a comment to the view drawing it. The line that matters is near the end
 * of it:
 *
 * ```java
 * new ag.c(context, com.bumptech.glide.c.d(context)).a(this.commentTv, commentModel.X);
 * ```
 *
 * That is the comment's body on its way into the markdown renderer, and it is
 * where the label comes off it. The byline view the label is drawn in instead
 * has been filled and made visible two hundred instructions earlier, so by here
 * Boost has finished with it -- which is the whole reason for hooking the render
 * rather than the head of the method the way the post bind is hooked.
 *
 * Matched on the shape of its parameters, since the name is one letter: a
 * `CommentModel` first, two booleans after it, and a fourth that is glide's and
 * so the least stable thing in the signature, which is why only its count is
 * matched. Every comment in the app but an inbox row is drawn through this,
 * including the ones a profile, the bookmarks and a search list: those holders
 * extend this class and none of them overrides the bind.
 */
internal val commentBindFingerprint = Fingerprint(
    definingClass = COMMENT_VIEW_HOLDER_CLASS,
    returnType = "V",
    custom = { method, _ ->
        val types = method.parameterTypes.map(CharSequence::toString)
        types.size == 4 && types[0] == COMMENT_MODEL_CLASS && types[1] == "Z" && types[2] == "Z"
    },
)

/**
 * `CommentModel.g(long)`, the whole of Boost's answer to "was this posted since
 * the last visit":
 *
 * ```java
 * public final boolean g(long j) { return j > 0 && this.e > j; }
 * ```
 *
 * `j` is the watermark Boost keeps per topic and `e` is the comment's published
 * time. Everything that treats a comment as new goes through here: the
 * highlight, the count behind the toast, and jumping to the next new comment.
 *
 * No strings to match on, and a one-letter name, so it is found by its class and
 * signature. Boost's own class names are not obfuscated and `CommentModel` has
 * exactly one `(J)Z` method in 1.0.31 through 1.0.33.
 */
internal val commentIsNewFingerprint = Fingerprint(
    definingClass = "Lcom/rubenmayayo/reddit/models/reddit/CommentModel;",
    parameters = listOf("J"),
    returnType = "Z",
)

/**
 * `CommentModel.n(Comment)`, which copies a Lemmy comment onto the model. It is
 * read to find which field holds the id, rather than naming a single letter that
 * a release could move:
 *
 * ```java
 * this.b = String.valueOf(comment.getId());
 * ```
 *
 * `CommentModel(Comment)` has the same signature and does nothing but call
 * this, so constructors are excluded rather than matched by name.
 */
internal val commentFromLemmyFingerprint = Fingerprint(
    definingClass = "Lcom/rubenmayayo/reddit/models/reddit/CommentModel;",
    parameters = listOf("Lcom/rubenmayayo/lemmy/datatypes/Comment;"),
    returnType = "V",
    custom = { method, _ -> method.name != "<init>" },
)

/**
 * `i0.D(String)`, Boost's list of the listings that are its own rather than a
 * community:
 *
 * ```java
 * public static boolean D(String str) {
 *     return "!local".equals(str) || "!all".equals(str) || "!subscribed".equals(str)
 *         || "!saved".equals(str) || "!popular".equals(str);
 * }
 * ```
 *
 * History is missing from it, which is what leaves the marker over the tab and
 * lets the screen retitle itself after the first row's community.
 *
 * Matched on the signature as well as the strings, since a preferences method
 * carries the same set of names. Exactly one method takes a String, answers a
 * boolean and mentions all five, in 1.0.31 through 1.0.33. Its own class sits
 * in an obfuscated package and is not worth naming.
 */
internal val specialListingFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Z",
    strings = listOf("!local", "!all", "!subscribed", "!saved", "!popular"),
)

/**
 * `MenuView.setMenuOptions(List)`, where every menu in the app is handed to the
 * view that draws it:
 *
 * ```java
 * MenuView view = new MenuView(context);
 * view.setCallback(callback);
 * view.setMenuOptions(sortOptions);
 * new MaterialDialog.Builder(context).customView(view, false).show();
 * ```
 *
 * The rows are `MenuOption` objects carrying an id, a title resource and an
 * icon. This is the seam rather than the methods that build them, because
 * there are four of those -- one per model class the menu can be opened for --
 * and hooking the two that were easy to find left the feed's own menu whole.
 * Forty-seven callers reach this one.
 *
 * `MenuView` keeps its name across 1.0.31, 1.0.32 and 1.0.33, and it is the
 * app's only `setMenuOptions`.
 */
internal val menuOptionsFingerprint = Fingerprint(
    definingClass = MENU_VIEW_CLASS,
    parameters = listOf("Ljava/util/List;"),
    returnType = "V",
    custom = { method, _ -> method.name == "setMenuOptions" },
)

/**
 * `CommunitiesFragment.showDialogMenu(List)`, which is the Groups page holding
 * its own sort rows one call before they stop being its own:
 *
 * ```java
 * public final void showDialogMenu(List<MenuOption> list) {
 *     MenuView menuView = new MenuView(getContext());
 *     menuView.setCallback(new i());
 *     menuView.setMenuOptions(list);        // <- where trimMenu already runs
 *     ...
 * }
 * ```
 *
 * Needed because the rows say nothing about which screen asked for them. One
 * builder makes every sort menu in the app and eight screens call it, and the
 * Groups page and the site browser call it with the same arguments, so the same
 * eleven rows come out of both. Two more screens differ only by rows that are
 * there some of the time, which makes the absence of a row a poor question to
 * ask.
 *
 * The same object reaches `setMenuOptions` four instructions later, so the
 * extension can match on identity rather than on timing.
 *
 * `CommunitiesFragment` keeps its name and is the only class extending it --
 * the Groups page's three tabs are all it, two of them obfuscated to a letter
 * -- and neither the site browser's fragment nor the search screens' are under
 * it, which is what keeps their menus whole.
 */
internal val communitiesMenuFingerprint = Fingerprint(
    definingClass = COMMUNITIES_FRAGMENT_CLASS,
    parameters = listOf("Ljava/util/List;"),
    returnType = "V",
    custom = { method, _ -> method.name == "showDialogMenu" },
)

/**
 * `UserContributionListFragment.onCreateOptionsMenu(Menu, MenuInflater)`, which
 * is the whole of how a profile gets its sort button:
 *
 * ```java
 * public final void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
 *     super.onCreateOptionsMenu(menu, menuInflater);
 *     menuInflater.inflate(R.menu.menu_user_sort, menu);
 * }
 * ```
 *
 * `menu_user_sort.xml` holds one item, `action_sort`, and this is the only place
 * in the app that inflates it. The `Menu` it goes into is the activity's, which
 * has already had nine items of its own put in it, so the extension takes one
 * out by id rather than clearing what it is handed.
 *
 * Three of a profile's six tabs have nothing to sort by and no filter either,
 * and `hj.m` always ends by adding the sort block, so the trim leaves those
 * three with an empty list -- which `MenuView` draws as an empty sheet rather
 * than as nothing. See `profileSortButton`.
 *
 * The one subclass, `UserContributionListVideoFragment`, overrides no menu
 * callback, so the autoplay variant of the same tab comes through here too.
 */
/**
 * `z1.s(Context, String)`, the smaller of that class's two routers: the one that
 * asks whether an address is a shape the app itself draws.
 *
 * ```java
 * public static boolean s(Context context, String url) {
 *     if (sf.c.b(new URL(url).getHost()) == null) return false;   // a site it knows
 *     ...                                                         // four Lemmy shapes
 *     return false;                                               // and the front page
 * }
 * ```
 *
 * It answers whether it handled the address, which is exactly what the extension
 * has to say. **Both ways into the app reach it**: `DeepLinkingActivity.onCreate`
 * calls it before it asks the server to resolve anything, and a link tapped
 * inside the app arrives through `z1.C`, which is this method and a browser call
 * under it. So one hook covers a tap in the app and a tap anywhere else on the
 * phone, and `linkRouterFingerprint` above -- the tapped-link method, where the
 * wiki and tag links are taken -- is a different one that runs earlier and only
 * on the first of those.
 *
 * Matched on the first of its four regexes, which is a literal in the method and
 * the app's only occurrence of that string. The class is a letter and so is the
 * method.
 */
internal val addressShapeFingerprint = Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "Z",
    strings = listOf("http(s)?://([A-Za-z0-9.]+)/c/([A-Za-z0-9.@]+)"),
)

internal val profileSortButtonFingerprint = Fingerprint(
    definingClass = USER_CONTRIBUTION_LIST_CLASS,
    parameters = listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;"),
    returnType = "V",
    custom = { method, _ -> method.name == "onCreateOptionsMenu" },
)

/**
 * `ye.c.a()`, which builds the list of sites the account screen offers:
 *
 * ```java
 * public static Server[] a() {
 *     List<Server> seen = UnknownInstancesManager.getInstance().getAll();
 *     String json = a.f("known_servers");
 *     Server[] known = TextUtils.isEmpty(json) ? null : new Gson().fromJson(json, Server[].class);
 *     if (known == null || known.length == 0) known = c.a;
 *     for (Server s : known) if (!seen.contains(s)) seen.add(s);
 *     return seen.toArray(new Server[0]);
 * }
 * ```
 *
 * `c.a` is 63 hosts baked into the class, and it is only the fallback: the
 * preference wins whenever it holds anything, so a patch that rewrote the
 * baked-in list would reach an app that has never fetched one.
 *
 * Matched on the preference key, which is the whole app's only occurrence in
 * 1.0.31 through 1.0.33, and on the return type, since `Server` is one of the
 * Gson datatypes and keeps its name where the class holding this does not: it
 * is `ye.c` in 1.0.31 and 1.0.32 and `sf.c` in 1.0.33.
 */
internal val knownServersFingerprint = Fingerprint(
    returnType = "[Lcom/rubenmayayo/lemmy/datatypes/server/Server;",
    strings = listOf("known_servers"),
)

/**
 * `i0.x(Context, SortModel)`, the one place a sort becomes something to read:
 *
 * ```java
 * public static String x(Context context, d0 sort) {
 *     if (sort == null) return null;
 *     if (sort.a == SortType.Hot) return context.getString(R.string.sort_hot);
 *     ...                                       // sixteen of them
 * }
 * ```
 *
 * Thirteen callers, and between them every place the app names a sort in
 * words: the toolbar under a feed's name, the "Sort Home topics by" and
 * default-sort preference summaries, the saved sorts screen and the widget
 * configurator. The menu rows are drawn from the same resources but do not
 * come through here, which is why there are two hooks rather than one.
 *
 * No strings of its own and a one-letter name in an obfuscated package, so it
 * is found by what it reads: sixteen constants of `SortType`, which is a Gson
 * datatype and keeps both its name and its constants' names because they are
 * what Boost puts in the `sort` query parameter. Exactly one method in
 * 1.0.31 through 1.0.33 answers a String and reads ten or more of them.
 */
internal val sortNameFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
            method.parameterTypes.first() == "Landroid/content/Context;" &&
            method.readsSortTypes() >= 10
    },
)

/**
 * `CommentsFragment.q0(CommentSortType)`, which writes the line under
 * **Comments** in a topic's toolbar:
 *
 * ```java
 * public final void q0(CommentSortType sort) {
 *     o host = this.u;
 *     if (host != null) {
 *         int i = n.a[sort.ordinal()];
 *         host.A(getString(i != 1 ? i != 2 ? i != 3 ? i != 4
 *             ? R.string.sort_hot : R.string.sort_controversial
 *             : R.string.sort_old : R.string.sort_new : R.string.sort_top));
 *     }
 * }
 * ```
 *
 * The post half of this goes through `i0.x`, which [sortNameFingerprint]
 * finds; a comment sort never reaches it. So this is the second hook rather
 * than a second caller of the first, and without it a menu row reading **most
 * votes** sits over a toolbar still reading Top.
 *
 * Found by its parameter. `CommentSortType` is a Gson datatype and keeps its
 * name, `CommentsFragment` keeps its own, and it is the only method on that
 * class taking one.
 */
internal val commentSortNameFingerprint = Fingerprint(
    definingClass = COMMENTS_FRAGMENT_CLASS,
    parameters = listOf(COMMENT_SORT_TYPE_CLASS),
    returnType = "V",
)

/** How many `SortType` constants a method reads. */
internal fun Method.readsSortTypes(): Int =
    implementation?.instructions?.toList().orEmpty().count {
        it.opcode == Opcode.SGET_OBJECT &&
            ((it as? ReferenceInstruction)?.reference as? FieldReference)
                ?.definingClass == SORT_TYPE_CLASS
    }

/**
 * `CommentsFragment.onPrepareOptionsMenu(Menu)`, which runs each time the
 * toolbar menu over a topic is about to be shown:
 *
 * ```java
 * public void onPrepareOptionsMenu(Menu menu) {
 *     super.onPrepareOptionsMenu(menu);
 *     MenuItem edit = menu.findItem(R.id.action_edit);
 *     this.d0 = edit;
 *     if (edit != null) edit.setVisible(this.d != null && this.d.i());
 * }
 * ```
 *
 * The hook goes at the top rather than at the end, since the menu arrives in
 * the last parameter register and the `findItem` above reuses it for the item.
 *
 * `CommentsFragment` keeps its name and the method's cannot be obfuscated,
 * since it has to keep matching the framework's.
 */
internal val topicMenuFingerprint = Fingerprint(
    definingClass = COMMENTS_FRAGMENT_CLASS,
    parameters = listOf("Landroid/view/Menu;"),
    returnType = "V",
    custom = { method, _ -> method.name == "onPrepareOptionsMenu" },
)

/**
 * `UserActivity.onCreate(Bundle)`, which lays out a profile and decides how
 * much of it there is:
 *
 * ```java
 * if (h.x.c(Integer.parseInt(this.u.b))) {   // your own profile
 *     this.v = 7;
 *     if (c.c()) this.v = 5;                 // piefed
 *     this.s = new String[]{ getString(R.string.profile_submitted), ..., getString(R.string.uploads) };
 *     this.t = new String[]{ "submitted", "comments", "saved", "info", "liked", "disliked", "uploads" };
 * } else {
 *     this.v = 3;
 *     ...
 * }
 * ```
 *
 * The count is what draws the tabs and the keys are what says which is which:
 * `m(int)` reads one out of that array and dispatches on it, so they are the
 * handle the extension drops a tab by. Nothing here is rewritten -- the tabs
 * come off at the pager below -- so this is only read, to check `info` and
 * `uploads` are still among the keys a profile carries.
 *
 * `UserActivity` keeps its name across 1.0.31 through 1.0.33, where its fields
 * are down to single letters.
 */
internal val profileTabsFingerprint = Fingerprint(
    definingClass = USER_ACTIVITY_CLASS,
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    custom = { method, _ -> method.name == "onCreate" },
)

/**
 * `UserActivity$k.c()`, the pager's page count:
 *
 * ```java
 * public final int c() { return this.g.v; }
 * ```
 *
 * Three instructions, a one-letter name on a one-letter class, and no strings
 * of its own, so it is found by shape: no parameters, an `int` back, and an
 * `int` field of `UserActivity` read on the way. Exactly one method in 1.0.31
 * through 1.0.33 does all three, and the other two `int` fields on the class
 * are read from a scroll listener that takes two parameters and answers void.
 */
internal val profileTabCountFingerprint = Fingerprint(
    returnType = "I",
    custom = { method, classDef ->
        classDef.type.startsWith(USER_ACTIVITY_INNER_CLASS) &&
            method.parameterTypes.isEmpty() &&
            method.readsIntFieldOf(USER_ACTIVITY_CLASS)
    },
)

/** Whether a method reads an `int` field of [owner]. */
internal fun Method.readsIntFieldOf(owner: String): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        it.opcode == Opcode.IGET &&
            ((it as? ReferenceInstruction)?.reference as? FieldReference)
                ?.let { field -> field.definingClass == owner && field.type == "I" } == true
    }

/**
 * `UserInfoView.setStats(String)`, the line under a profile's name:
 *
 * ```java
 * private void setStats(String stats) {
 *     if (statsTv != null) {
 *         statsTv.setText(stats);
 *         i0.V(statsTv);        // fades it in from gone
 *     }
 * }
 * ```
 *
 * Two callers, one per platform, and the Lemmy one hands it "12 posts · 34
 * comments" built from the counts on the person. `UserInfoView` is a
 * ButterKnife view and keeps both its name and its methods' names, so this
 * needs nothing cleverer than the signature.
 */
internal val profileStatsFingerprint = Fingerprint(
    definingClass = USER_INFO_VIEW_CLASS,
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
    custom = { method, _ -> method.name == "setStats" },
)

/**
 * `AppCompatActivity.attachBaseContext(Context)`, which every screen in the app
 * goes through:
 *
 * ```java
 * protected void attachBaseContext(Context newBase) {
 *     super.attachBaseContext(getDelegate().attachBaseContext2(newBase));
 * }
 * ```
 *
 * The wording is chosen here, because a context carries the configuration and
 * the configuration picks the resource. Hooked after the delegate rather than
 * before it: AppCompat builds its own override configuration for night mode and
 * locale, and a field set on the way in can be lost in the rebuild, while one
 * set on the way out is the one the activity keeps.
 *
 * The app has three `attachBaseContext(Context)` overrides and this is the only
 * one that changes the context before passing it up -- `ContextThemeWrapper`
 * only calls super, and `MyApplication` installs MultiDex. So it is found by
 * that: an override that calls something answering a `Context`. The name itself
 * cannot be obfuscated, since it has to keep matching the framework's.
 */
internal val attachBaseContextFingerprint = Fingerprint(
    parameters = listOf("Landroid/content/Context;"),
    returnType = "V",
    custom = { method, _ ->
        method.name == "attachBaseContext" && method.transformsAContext()
    },
)

/** Whether a method calls something that answers a `Context`. */
internal fun Method.transformsAContext(): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)
            ?.returnType == "Landroid/content/Context;"
    }

/**
 * `DownActiveImageButton(Context, AttributeSet)`, the downvote button wherever
 * one is drawn.
 *
 * Ten layouts have one -- five kinds of feed row, three kinds of comment row and
 * the two media screens -- and three holders bind it: `SubmissionViewHolder`,
 * `CommentViewHolder` and `BaseFragment`, each optionally, since a layout can
 * leave it out. All three read it into a field of this type and neither they nor
 * anything else in the app ever touches its visibility, so hiding it as it is
 * inflated is one place instead of three and holds for the life of the view.
 *
 * Boost's own class names survive obfuscation, and this one is used for nothing
 * else: `UpActiveImageButton` and `BeatActiveImageButton` are its siblings and
 * carry the vote up and the bookmark. So the constructor is the whole
 * fingerprint.
 */
internal val downvoteButtonFingerprint = Fingerprint(
    definingClass = DOWNVOTE_BUTTON_CLASS,
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    returnType = "V",
    custom = { method, _ -> method.name == "<init>" },
)

/**
 * `FormattingBar(Context, AttributeSet)`, the markdown toolbar.
 *
 * Its constructor inflates `compose_formatting` into itself and binds it, so
 * every button on the bar exists by the time it returns:
 *
 * ```java
 * View.inflate(getContext(), R.layout.compose_formatting, this);
 * ButterKnife.bind(this);
 * ```
 *
 * One bar is drawn under each of the composer, a comment reply and the message
 * editor, and hooking the view is one place against those three. Nothing in the
 * app touches the attach-image button's visibility -- the only other thing
 * naming it is the generated binding that wires its tap -- so hiding it as the
 * bar is built holds for the life of the view, the same argument
 * [downvoteButtonFingerprint] rests on.
 *
 * Boost's own class names survive obfuscation and there is one constructor.
 */
internal val formattingBarFingerprint = Fingerprint(
    definingClass = FORMATTING_BAR_CLASS,
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    returnType = "V",
    custom = { method, _ -> method.name == "<init>" },
)

/**
 * `EmptyRecyclerView(Context, AttributeSet)`, the list a feed is drawn in.
 *
 * Boost lays every listing out edge to edge and applies the window insets at
 * the sides and at the top, and never at the bottom, so a list runs under the
 * system navigation bar and the last row cannot be scrolled clear of it. Eleven
 * layouts draw one of these -- a feed, History, the drafts, a message thread
 * and the rest -- and nothing in the app touches the list's padding, so the
 * constructor is one place against all of them and it holds for the life of the
 * view. The same argument [downvoteButtonFingerprint] rests on.
 *
 * Boost's own class names survive obfuscation and there is one constructor.
 */
internal val feedListFingerprint = Fingerprint(
    definingClass = FEED_LIST_CLASS,
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    returnType = "V",
    custom = { method, _ -> method.name == "<init>" },
)

/**
 * `ScrimInsetsRelativeLayout(Context, AttributeSet)`, the navigation drawer's
 * root.
 *
 * The drawer ends on a Settings row with a light-mode button beside it, and it
 * was under the navigation bar with the rest of the drawer. Padding this covers
 * both places that row can be: a footer pinned along the bottom when
 * `pref_drawer_sticky_settings` is on, and the last row of the drawer's own list
 * when it is off, which is the default.
 *
 * The constructor is one place against the eleven screens that inherit the
 * drawer, and against the second drawer one of them opens from the other edge.
 * Nothing in the app touches this view's padding -- the drawer library pads the
 * list inside it and never its root -- so it holds for the life of the view, the
 * same argument [feedListFingerprint] rests on.
 *
 * The class keeps its name because a layout file names it, and there is one
 * constructor.
 */
internal val drawerSliderFingerprint = Fingerprint(
    definingClass = DRAWER_SLIDER_CLASS,
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    returnType = "V",
    custom = { method, _ -> method.name == "<init>" },
)

/**
 * `pj.i0.Z(Context, cg.b)`, which stores Boost's unread counts and says so:
 *
 * ```java
 * public static void Z(Context context, cg.b bVar) {
 *     yg.h.x.q = bVar;
 *     LocalBroadcastManager.getInstance(context).sendBroadcast(
 *         new Intent("inbox_count_changed_event"));
 * }
 * ```
 *
 * `DrawerActivity` registers for that action in `onCreate` and its receiver
 * redraws the badge off the same static, so this is the one call that makes a
 * screen already on top show a new number. Nothing else in the app sends it,
 * and nothing else asks for the count between resumes.
 *
 * Matched on the action string, which is in three method bodies -- the sender,
 * the registration and the receiver -- and static in only the sender. The class
 * is a bag of statics whose letters move between releases and the string is the
 * app's own, so the string is the thing worth matching on.
 *
 * **Read for its body as well as called.** The two field references it uses --
 * the static holding the counts and the count on it -- are taken out of these
 * instructions rather than spelled out, since both are single letters. See the
 * patch.
 */
/**
 * `kh.t0.f(String, String, String)`, where a topic opened on one comment asks
 * for the topic:
 *
 * ```java
 * public final void f(String post, String comment, String parent) {
 *     HashMap map = new HashMap();
 *     if (TextUtils.isEmpty(comment)) { map.put("id", post); }
 *     else { map.put("id", post); map.put("comment_id", comment); }
 *     ...
 * }
 * ```
 *
 * The third argument is the one that matters and it is usually empty. It rides
 * through this method into the paginator, where an empty one asks by topic and
 * a filled one asks by parent -- and those are two different screens: the second
 * offers **Show context** over the comment and the first cannot. Boost fills it
 * from the inbox and nowhere else.
 *
 * Hooked at the head, where all three are still in the registers they arrived
 * in. Matched on the three strings it puts in the map and on its signature,
 * since the class and the method are single letters. Two of those strings are
 * common and the three together with a three-String signature are not.
 */
internal val commentParentFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
    returnType = "V",
    strings = listOf("id", "comment_id", "auth"),
)

internal val inboxBroadcastFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf(INBOX_COUNT_CHANGED),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.firstOrNull() == "Landroid/content/Context;" &&
            method.parameterTypes.size == 2
    },
)

/**
 * `SidebarFragmentV2_ViewBinding(SidebarFragmentV2, View)`, where a group's
 * sidebar is bound to the view it was inflated into.
 *
 * The Moderators heading is a plain `TextView` nothing in the app ever names,
 * and the container under it is emptied and then left alone when the list is
 * empty, so both are drawn on a site that has no moderators at all. Hooked here
 * because the binding is handed the sidebar's root and runs once per sidebar,
 * where the fragment's own methods are down to single letters.
 *
 * At the start of the constructor rather than the end, since the root arrives
 * in the last parameter register and ButterKnife reuses that register for the
 * last view it binds.
 */
internal val sidebarBindingFingerprint = Fingerprint(
    definingClass = SIDEBAR_BINDING_CLASS,
    parameters = listOf(SIDEBAR_FRAGMENT_CLASS, "Landroid/view/View;"),
    returnType = "V",
    custom = { method, _ -> method.name == "<init>" },
)

/**
 * `PostActivity.onCreate(Bundle)`, the composer Boost opens for a Lemmy
 * instance.
 *
 * Not one of the `Submit*Fragment`s, which are the Reddit ancestry and are
 * reached from `SubmitGenericActivity`: nothing in 1.0.33 constructs
 * `SubmitLemmyFragment` at all. This is the screen, and its `onCreate` binds
 * every field, wires the formatting bar and reads the topic being edited out of
 * the intent, so the end of it is where the composer is finished.
 *
 * `PostActivity` keeps its name where its fields do not, and has one
 * `onCreate`.
 */
internal val composerFingerprint = Fingerprint(
    definingClass = POST_ACTIVITY_CLASS,
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    custom = { method, _ -> method.name == "onCreate" },
)

/**
 * `SubmissionModel.m(Post)`, which copies a Lemmy post onto the model. Read to
 * check which field the id lands in, the same way `commentFromLemmyFingerprint`
 * is for comments:
 *
 * ```java
 * this.b = String.valueOf(post.getId());
 * ```
 *
 * The composer reads that field off the model Boost hands it, to know which
 * topic's tags to fill in. Nothing is rewritten here.
 */
internal val postFromLemmyFingerprint = Fingerprint(
    definingClass = "Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;",
    parameters = listOf("Lcom/rubenmayayo/lemmy/datatypes/Post;"),
    returnType = "V",
    custom = { method, _ -> method.name != "<init>" },
)

/**
 * `SubmissionModel.l(PostView)`, which copies a Lemmy post onto the model. Read
 * twice, and rewritten never: for the field the id lands in, which the composer
 * needs, and for the one `nsfw` lands in, which the two listing filters test.
 *
 * ```java
 * this.b = String.valueOf(post.getId());
 * ...
 * this.G0 = postView.getPost().getNsfw();
 * ```
 *
 * `m(Post)` is where the id is written and `l(PostView)` is where the flag is,
 * so both are matched and the patch reads whichever it needs. Naming either
 * letter here would be naming something free to move between releases.
 */
internal val postViewFromLemmyFingerprint = Fingerprint(
    definingClass = "Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;",
    parameters = listOf("Lcom/rubenmayayo/lemmy/datatypes/PostView;"),
    returnType = "Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;",
)

/**
 * `s.T0(SubmissionModel, boolean)`, the filter every feed runs each post
 * through:
 *
 * ```java
 * if (!j.i && submission.G0) return null;      // "Show NSFW" is off
 * if (!j.l && (submission.L0 == 3 || ...)) return null;
 * ...                                          // six more of the same shape
 * ```
 *
 * Seven static booleans, one per filter the user can set, and the first is
 * NSFW. `U0` on the same class shares the signature exactly, so the two are
 * told apart by this reading a pile of static booleans where `U0` reads a
 * preference list instead.
 */
internal val listingFilterFingerprint = Fingerprint(
    parameters = listOf("Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;", "Z"),
    returnType = "Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;",
    custom = { method, _ -> method.readsStaticBooleans() >= 5 },
)

/** How many distinct static boolean fields a method reads. */
internal fun Method.readsStaticBooleans(): Int =
    implementation?.instructions?.toList().orEmpty()
        .filter { it.opcode == Opcode.SGET_BOOLEAN }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .distinct()
        .size

/**
 * `UserContributionListFragment.Y0(ArrayList, ArrayList)`, the same filter for
 * a profile's own listing:
 *
 * ```java
 * if (j.m().D0() || !submission.G0) list.add(submission);
 * ```
 *
 * A second place rather than a second reading of the first: profiles do not go
 * through the feed's filter. `UserContributionListFragment` keeps its name.
 */
internal val profileFilterFingerprint = Fingerprint(
    definingClass = USER_CONTRIBUTION_LIST_CLASS,
    parameters = listOf("Ljava/util/ArrayList;", "Ljava/util/ArrayList;"),
    returnType = "Ljava/util/ArrayList;",
)

/**
 * `uf.s.h(GetPersonDetailsResponse)`, which is the whole of Boost's
 * person-posts paginator:
 *
 * ```java
 * public final ArrayList h(GetPersonDetailsResponse response) {
 *     return SubmissionModel.n(response.getPosts());
 * }
 * ```
 *
 * Its twin `uf.q.h` has the identical signature and reads `getComments()`
 * instead, so the two are told apart by which model class the body builds its
 * list through. The abstract `h` they both override has no body to read, and
 * `uf.r.d` alongside them takes the same response but answers a `List` rather
 * than an `ArrayList`, so the return type separates that one without help.
 *
 * Everything about the class is obfuscated -- one letter for the package, one
 * for the class and one for the method -- and `GetPersonDetailsResponse` and
 * `SubmissionModel` both keep their names, being a JSON shape and a model
 * Boost's own code names all over. So the method is found by what passes
 * through it.
 */
internal val personPostsPaginatorFingerprint = Fingerprint(
    parameters = listOf(PERSON_DETAILS_RESPONSE_CLASS),
    returnType = "Ljava/util/ArrayList;",
    custom = { method, _ -> method.callsStaticOn(SUBMISSION_MODEL_CLASS) },
)

/** The call that ties a profile's tab strip to its pager. */
internal const val TABS_TO_PAGER = "setupWithViewPager"

/** Whether a method makes that call, which is what tells `onCreate` apart. */
internal fun Method.wires(call: String): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == call
    }

/**
 * `uf.w.h(SearchResponse)`, which turns a search answer into the rows the
 * Comments tab draws:
 *
 * ```java
 * public final ArrayList h(SearchResponse searchResponse) {
 *     List<CommentView> comments = searchResponse.getComments();
 *     ...
 *     arrayList.add(CommentModel.m(it.next()));
 * }
 * ```
 *
 * Four paginators share this shape, one per tab, and they differ only in which
 * array they read. So the call is what tells them apart: `getComments` is the
 * one, and it is the only method in the app taking a `SearchResponse` and
 * answering an `ArrayList` that makes it.
 *
 * Both anchors survive obfuscation because both are Gson's. `SearchResponse` is
 * a datatype filled from JSON, so its field names and their getters are the wire
 * format.
 */
internal val searchCommentResultsFingerprint = Fingerprint(
    parameters = listOf(SEARCH_RESPONSE_CLASS),
    returnType = "Ljava/util/ArrayList;",
    custom = { method, _ -> method.wires("getComments") },
)

/** Boost's search answer, whose getters are the Lemmy JSON. */
internal const val SEARCH_RESPONSE_CLASS = "Lcom/rubenmayayo/lemmy/datatypes/SearchResponse;"

/**
 * `ig.f.e(int)`, the search screen's pager naming a tab:
 *
 * ```java
 * public static final int[] h = {..., R.string.pref_header_comments};
 * public final CharSequence e(int i2) { return this.g.getResources().getString(h[i2]); }
 * ```
 *
 * The Groups page's pager is the same class shape and the same method signature,
 * so neither is enough on its own. What separates them is what the adapter holds
 * on to: this one keeps the `SearchActivity` it was built for, and that class
 * keeps its name.
 *
 * Matching on the field's type rather than on the title ids, which are resource
 * numbers and renumber every release.
 */
internal val searchTabNameFingerprint = Fingerprint(
    parameters = listOf("I"),
    returnType = "Ljava/lang/CharSequence;",
    custom = { _, classDef ->
        classDef.fields.any { it.type == SEARCH_ACTIVITY_CLASS }
    },
)

/** The screen it names the tabs of, which is in the manifest and keeps its name. */
internal const val SEARCH_ACTIVITY_CLASS = "Lcom/rubenmayayo/lemmy/ui/search/SearchActivity;"

/** Whether a method calls a static method on the given class. */
internal fun Method.callsStaticOn(owner: String): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        it.opcode == Opcode.INVOKE_STATIC &&
            ((it as? ReferenceInstruction)?.reference as? MethodReference)
                ?.definingClass == owner
    }

/**
 * `bg.c.m(int)`, the Groups page's pager handing back the fragment for a tab:
 *
 * ```java
 * public final Fragment m(int position) {
 *     int i = ORDER[position];                  // {0, 1, 2, 3, 4}
 *     if (i == 0) return new b();               // Subscribed
 *     if (i == 2) return new g();               // All
 *     ...
 *     return new CommunitiesLocalFragment();    // Local
 * }
 * ```
 *
 * Everything on that class is obfuscated -- two letters for the class, one each
 * for its three methods, and the five titles are resource ids that renumber
 * every release. `CommunitiesLocalFragment` is the one name in reach, so the
 * pager is found by the fragment it builds and the other two methods are read
 * off the same class.
 *
 * That fragment is drawn on two screens, though. The site screen has a pager of
 * the same shape whose first tab is the same Local listing, so the screen behind
 * the pager is what tells them apart: it is held in a field, and
 * `CommunitiesActivity` keeps its name where both pagers are a letter.
 */
internal val communitiesPagerFingerprint = Fingerprint(
    parameters = listOf("I"),
    returnType = FRAGMENT_CLASS,
    custom = { method, classDef ->
        method.builds(COMMUNITIES_LOCAL_FRAGMENT_CLASS) &&
            classDef.fields.any { it.type == COMMUNITIES_ACTIVITY_CLASS }
    },
)

/** Whether a method constructs one of these. */
internal fun Method.builds(type: String): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        it.opcode == Opcode.NEW_INSTANCE &&
            ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == type
    }

/**
 * `com.rubenmayayo.reddit.ui.activities.j.Y1(Bundle)`, which builds every row
 * in the drawer:
 *
 * ```java
 * if (j.m().a.getBoolean("pref_drawer_show_local", true)) {
 *     items.add(r1(R.string.local, R.drawable.ic_local, 250000));
 *     count++;
 * }
 * ```
 *
 * Fifteen rows in the same shape, each behind a switch under Settings. Matched
 * on three of those keys, which is what the user's own settings are filed under,
 * so a rename would lose them, and on the signature, since the four other places
 * naming the same keys answer a preference change or a context rather than a
 * `Bundle`. Exactly one method in 1.0.31 through 1.0.33 has both.
 */
internal val drawerRowsFingerprint = Fingerprint(
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    strings = listOf(
        DRAWER_LOCAL_PREF,
        "pref_drawer_show_subscribed",
        "pref_drawer_show_go_to_subreddit",
    ),
)

/**
 * `yg.h.x()`, which loads the signed-in account's subscriptions out of Boost's
 * own database on their way into the drawer:
 *
 * ```java
 * public final ArrayList<SubscriptionViewModel> x() {
 *     List c2 = eo.c((User) this.a);
 *     ...
 *     g(-2500, "!local", user, -2500, false);   // seeded once per account
 *     g(-2000, "!all", user, -2000, false);
 * }
 * ```
 *
 * The one place the account is in hand before a screen is drawn, which is what
 * the drawer needs: it is rebuilt as the accounts change, and that is before
 * anything has been asked of the new instance, so the flag written by every
 * request is one switch behind at exactly that moment.
 *
 * Matched on the five markers it seeds and on its signature. Everything about
 * the class is a letter -- `yg.h` extending `yg.f`, with the account on the
 * superclass -- while the markers are the app's own strings and no other method
 * takes nothing, answers an `ArrayList` and names all five.
 */
internal val subscriptionListFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "Ljava/util/ArrayList;",
    strings = listOf("!local", "!all", "!subscribed", "!saved", "!popular"),
)

/**
 * `j.T1()`, the user refresh, which is the whole of how Boost rebuilds its
 * drawer for a new account:
 *
 * ```java
 * public void T1() {
 *     qo.a.d("refreshUserUI", new Object[0]);
 *     Y1(null);   // the fifteen rows, Local among them
 *     G1();       // the subscriptions, and the account they belong to
 * }
 * ```
 *
 * Hooked at its return rather than its head, because Boost swaps its own
 * account **between** those two calls. The log says so to five milliseconds:
 *
 * ```
 * account at local row: lemmy.world, tildes was false
 * account at subscriptions: tildes.net, tildes was false
 * ```
 *
 * So the rows are always built for the account being left, and no point inside
 * `Y1` can answer otherwise. What can is running the whole thing again once the
 * account has settled, which is what the injection there does -- `Y1` rebuilds
 * the drawer from scratch, so running it alone would drop the subscriptions
 * `G1` had just added.
 *
 * Matched on its own log tag, which is the one thing about it that is not a
 * letter.
 */
internal val refreshUserFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "V",
    strings = listOf("refreshUserUI"),
)

/**
 * The group info panel filling its own subscriber line:
 *
 * ```java
 * textView.setText(e0.h(accent, "!", model.a, model.L));   // !tech@tildes.net
 * ```
 *
 * That view is `sidebar_subscribers_textview` and on Boost's Reddit ancestor it
 * drew **1,079,925 members · 0 online**. On the Lemmy path it draws a handle
 * instead, which is the name above it said again with an instance on the end.
 *
 * The line is filled by an observer that is an inner class of the fragment,
 * named a letter, so what is matched is the fragment's own name and what the
 * observer does: it takes an `Object`, answers nothing, and builds a
 * `SpannableString` to put in a `TextView`. Nothing else on that class does all
 * four.
 *
 * The builder itself is left alone. Nine call sites reach it and two of them
 * pass the same `"!"` -- the other is the collapsing header's handle, which is a
 * different view whose neighbour already draws the count -- so the hook goes on
 * the one result rather than on the thing producing it.
 */
internal val sidebarSubscribersFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.startsWith(SIDEBAR_FRAGMENT_CLASS.removeSuffix(";")) &&
            method.buildsHandleFor("Landroid/widget/TextView;")
    },
)

/**
 * Whether a method builds a `SpannableString` and puts it in [view], which is
 * the shape of a line drawn from a handle.
 */
private fun Method.buildsHandleFor(view: String): Boolean {
    val instructions = implementation?.instructions?.toList().orEmpty()
    fun called(instruction: Instruction): MethodReference? =
        (instruction as? ReferenceInstruction)?.reference as? MethodReference

    val builds = instructions.any {
        it.opcode == Opcode.INVOKE_STATIC &&
            called(it)?.returnType == "Landroid/text/SpannableString;"
    }
    val draws = instructions.any {
        called(it)?.let { call -> call.definingClass == view && call.name == "setText" } == true
    }
    return builds && draws
}

/**
 * `PostActivity.onOptionsItemSelected(MenuItem)`, which validates the composer
 * before it sends anything:
 *
 * ```java
 * if (!TextUtils.isEmpty(url))       { new URL(url).toURI(); }        // else "Link not valid"
 * if (!TextUtils.isEmpty(thumbnail)) { new URL(thumbnail).toURI(); }  // else the same
 * ```
 *
 * The second of those is the tags field here, so a pair of ordinary tags is
 * refused as a malformed link. `PostActivity` keeps its name and has one of
 * these.
 *
 * **The same method also decides whether leaving is worth a draft**, in its
 * other arm -- the toolbar's X -- and that seam is hooked through this
 * fingerprint too rather than through a second one that would resolve the same
 * method. See [ASK_SAVE_DRAFT] for what the branch is found by.
 */
internal val composerValidationFingerprint = Fingerprint(
    definingClass = POST_ACTIVITY_CLASS,
    parameters = listOf("Landroid/view/MenuItem;"),
    returnType = "Z",
    custom = { method, _ -> method.name == "onOptionsItemSelected" },
)

/**
 * `PreferenceFragmentAccountCompat.onCreateView(LayoutInflater, ViewGroup,
 * Bundle)`, where the account editor is inflated and bound:
 *
 * ```java
 * View inflate = layoutInflater.inflate(R.layout.fragment_account, viewGroup, false);
 * this.unbinder = ButterKnife.bind(this, inflate);
 * ...
 * if (sf.c.c()) { this.display_name.setVisibility(8); ... }   // PieFed
 * return inflate;
 * ```
 *
 * Hooked straight after the bind, like [formattingBarFingerprint], where the
 * root is still in a register and every field is filled. Boost trims this same
 * screen for PieFed a few lines further down, which is the shape being followed
 * here, and nothing after either point sets a field's visibility back --
 * `showLoading` and the `/site` response only enable and fill them.
 *
 * The class keeps its name where its fields are down to single letters, and it
 * has one `onCreateView`.
 */
internal val accountScreenFingerprint = Fingerprint(
    definingClass = ACCOUNT_FRAGMENT_CLASS,
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;",
    ),
    returnType = "Landroid/view/View;",
    custom = { method, _ -> method.name == "onCreateView" },
)

/**
 * `onPostExecute(Object)` on the task that saves the account, which toasts
 * `R.string.saved` when the save comes back:
 *
 * ```java
 * Toast.makeText(fragment.getActivity(), R.string.saved, 0).show();
 * ```
 *
 * That string is **Bookmarks** here, because saving is bookmarking everywhere
 * else in the app and the wording table says so. It is right in the drawer's
 * bookmarks row and in the title over that listing, and wrong in this one
 * place, so the row is left alone and the id is swapped as it is passed.
 *
 * The class is two obfuscated letters with no strings of its own, so it is
 * found by shape: an `AsyncTask` carrying the body Boost's account save sends,
 * which is one class in 1.0.31 through 1.0.33, and the `onPostExecute` on it
 * takes an `Object` because that is the signature `AsyncTask` declares.
 */
internal val accountSavedToastFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "V",
    custom = { method, classDef ->
        method.name == "onPostExecute" &&
            classDef.fields.any { it.type == SAVE_USER_SETTINGS_CLASS }
    },
)

/**
 * `CommentModel.m(CommentView)`, which copies a Lemmy comment onto the model:
 *
 * ```java
 * CommentModel commentModel = new CommentModel();
 * commentModel.n(commentView.getComment());
 * ...
 * return commentModel;
 * ```
 *
 * The comment half of what [postViewFromLemmyFingerprint] is for a topic, and
 * hooked at the same place in it: the one `return`, which nothing jumps to, so
 * the model is finished and still in a register.
 *
 * `CommentModel` keeps its name where its fields are single letters, and one
 * method on it takes a `CommentView`.
 */
internal val commentViewFromLemmyFingerprint = Fingerprint(
    definingClass = COMMENT_MODEL_CLASS,
    parameters = listOf("Lcom/rubenmayayo/lemmy/datatypes/CommentView;"),
    returnType = COMMENT_MODEL_CLASS,
)

/**
 * `WikiFragment.onCreateView`, where the screen's views are bound and the root
 * is handed back:
 *
 * ```java
 * View inflate = layoutInflater.inflate(2131558604, viewGroup, false);
 * this.c = ButterKnife.bind(this, inflate);
 * ...
 * return inflate;
 * ```
 *
 * Hooked at that one `return-object`, which is where both halves the extension
 * needs are in hand: the fragment carries the group and page in its arguments,
 * and the root carries the text view to fill.
 *
 * The class keeps its name, and a fragment has exactly one `onCreateView`.
 */
internal val wikiFragmentFingerprint = Fingerprint(
    definingClass = WIKI_FRAGMENT_CLASS,
    returnType = "Landroid/view/View;",
    custom = { method, _ -> method.name == "onCreateView" },
)

/**
 * `SubmissionViewHolder.g(SubmissionModel, boolean, boolean, boolean, glide)`,
 * the one method that binds a post to the view that draws it:
 *
 * ```
 * 0000: move-object/from16 v0, v25      // this
 * 0002: move-object/from16 v1, v26      // the model
 * ...
 * 0661: invoke-virtual {v8, v9, v3}, Lag/c;.a(TextView, String)   // selfTv, body
 * 06d0: invoke-virtual {v5, v8, v3}, Lag/c;.b(TextView, String)   // selfPreviewTv, body
 * ```
 *
 * Both screens that draw a post come through here, and which of those two body
 * views the holder has says which one it is: a topic's own screen inflates a
 * layout with `submission_header_selftext` on it and a listing row does not.
 *
 * Hooked at the head, where the model has not been read yet. The parameters sit
 * at v25 and v26 of 31 registers, so the call is the range form, and nothing
 * needs saving: the method's own first three instructions write v0, v1 and v2
 * before anything reads them.
 *
 * Found by the shape of its parameters rather than by its name, which is one
 * letter. Five methods on the class take a model first and this is the only one
 * taking five parameters, three of them booleans -- so the glide type, which is
 * a renamed library class and the least stable thing in the signature, is left
 * out of the match.
 */
internal val submissionBindFingerprint = Fingerprint(
    definingClass = SUBMISSION_VIEW_HOLDER_CLASS,
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.size == 5 &&
            method.parameterTypes.first() == SUBMISSION_MODEL_CLASS &&
            method.parameterTypes.subList(1, 4).all { it == "Z" }
    },
)

/**
 * `SubmissionViewHolder.I(SubmissionModel)`, the one method that writes a
 * topic's title, and with it the domain under the link:
 *
 * ```java
 * String str = submissionModel.U;                                    // the title
 * if (submissionModel.h()) {                                         // a plain link
 *     SpannableString s = new SpannableString(h0.e(str, " ", submissionModel.K));
 *     s.setSpan(new ForegroundColorSpan(this.l), str.length() + 1, s.length(), 33);
 *     s.setSpan(new StyleSpan(2), str.length() + 1, s.length(), 33);
 *     s.setSpan(new RelativeSizeSpan(0.8f), str.length() + 1, s.length(), 33);
 *     textView.setText(s);
 * } else {
 *     textView.setText(str);
 * }
 * ```
 *
 * Every card mode and the topic's own screen come through here -- one holder,
 * one method, called from the bind above at `00a3` -- and it is the only place
 * in the app that sets that view's text.
 *
 * Hooked straight after the first of those two `setText` calls, which is the
 * one that just drew a domain. `p0` and `p1` are both still the parameters
 * there: the model's register is reused near the end of the method, twenty
 * instructions further on, and the hook is nowhere near it.
 *
 * Two methods on the class take a model and nothing else -- `F` and this one --
 * and only this one builds a `RelativeSizeSpan`.
 */
internal val submissionTitleFingerprint = Fingerprint(
    definingClass = SUBMISSION_VIEW_HOLDER_CLASS,
    returnType = "V",
    parameters = listOf(SUBMISSION_MODEL_CLASS),
    custom = { method, _ -> method.builds("Landroid/text/style/RelativeSizeSpan;") },
)

/**
 * `SubmissionViewHolder.f(SubmissionViewHolder, View)`, which builds the
 * overflow menu on a topic -- a listing row's and the header of the topic's own
 * screen alike -- and shows it.
 *
 * The part that matters is one guarded block, twenty instructions in:
 *
 * ```java
 * if (submissionViewHolder.n.i() && tVar != null) {   // "the author is me"
 *     // Edit, and under it Edit topic, Mark NSFW and Delete
 *     arrayList2.add(menuOption2);
 * }
 * ```
 *
 * Found by the shape of its parameters, which is the one thing about it that
 * holds still: the name is a single letter and it is not the same letter twice
 * -- `f` in 1.0.31, `e` in 1.0.32, `f` again in 1.0.33 -- while no other method
 * on the class takes a holder and a `View` and answers nothing, in any of the
 * three.
 */
internal val submissionMenuFingerprint = Fingerprint(
    definingClass = SUBMISSION_VIEW_HOLDER_CLASS,
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf(SUBMISSION_VIEW_HOLDER_CLASS, "Landroid/view/View;")
    },
)

/**
 * Whether this is the method on a topic that answers "the signed-in account
 * wrote this".
 *
 * ```java
 * public final boolean i() {
 *     return h.x.c(Integer.parseInt(this.g.b));   // the author's id, against mine
 * }
 * ```
 *
 * Boost gates everything that opens the composer on it, because on Lemmy nobody
 * but an author may touch a post at all. Tildes hands the tag permission out
 * per group instead, so those gates want a second question asked after Boost's
 * own -- see `mayTag`.
 *
 * **Found by what it does, because the name is a letter and the class is full
 * of neighbours with the same signature.** `SubmissionModel` carries eight
 * `()Z` methods and `h()` -- two fields compared to zero -- is asked in the
 * same shape in the same method as this one, so a hook matching on the
 * signature would have found both and had no way to tell them apart. What no
 * other one of the eight does is parse the author's id out of a string and hand
 * it to something answering yes or no about an `int`, which is the whole body
 * of this one.
 */
internal fun Method.isOwnershipPredicate(): Boolean {
    if (returnType != "Z" || parameterTypes.isNotEmpty()) return false
    val instructions = implementation?.instructions?.toList().orEmpty()

    fun calls(instruction: Instruction) =
        (instruction as? ReferenceInstruction)?.reference as? MethodReference

    val reads = instructions.any {
        calls(it)?.let { call ->
            call.definingClass == "Ljava/lang/Integer;" && call.name == "parseInt"
        } == true
    }
    val compares = instructions.any {
        calls(it)?.let { call ->
            call.returnType == "Z" &&
                call.parameterTypes.map(CharSequence::toString) == listOf("I")
        } == true
    }
    return reads && compares
}

/**
 * Where a method asks a topic whether the signed-in account wrote it and skips
 * a block when the answer is no, paired with where the topic came from.
 *
 * [ownedByMe] is [isOwnershipPredicate]'s method, resolved off the app rather
 * than named here. What is matched beyond it is the jump: one taken when the
 * answer is **false**, which is the whole discriminator between the two asks in
 * `SubmissionViewHolder.f`. The second of those is `!i()` -- what to offer on
 * somebody else's topic, compiling to a jump taken when the answer is true --
 * and answering that one differently would put a moderator's rows on every
 * topic in the app.
 *
 * [OwnTopicGuard.load] is the `iget-object` the receiver came from, and the
 * patch needs it: both call sites read the model into the register the answer
 * then takes, so it is gone by the time the jump is reached and has to be read
 * a second time. It is **not** always the instruction in front --
 * `CommentsFragment` null-checks the field between reading it and asking it --
 * so this walks back to the nearest read that filled the register being asked,
 * which is where the model came from whatever sits in between.
 */
internal fun Method.ownTopicGuards(ownedByMe: String): List<OwnTopicGuard> {
    val instructions = implementation?.instructions?.toList().orEmpty()

    fun asksTheModel(instruction: Instruction) =
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == SUBMISSION_MODEL_CLASS &&
                    it.name == ownedByMe &&
                    it.returnType == "Z" &&
                    it.parameterTypes.isEmpty()
            } == true

    fun loadOf(index: Int, register: Int) = (index - 1 downTo 0).firstOrNull { at ->
        val instruction = instructions[at]
        instruction.opcode == Opcode.IGET_OBJECT &&
            (instruction as? TwoRegisterInstruction)?.registerA == register &&
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                ?.type == SUBMISSION_MODEL_CLASS
    }

    return instructions.indices.mapNotNull { index ->
        if (!asksTheModel(instructions[index])) return@mapNotNull null
        if (instructions.getOrNull(index + 1)?.opcode != Opcode.MOVE_RESULT) return@mapNotNull null
        if (instructions.getOrNull(index + 2)?.opcode != Opcode.IF_EQZ) return@mapNotNull null

        val receiver = (instructions[index] as? FiveRegisterInstruction)?.registerC
            ?: return@mapNotNull null
        loadOf(index, receiver)?.let { OwnTopicGuard(load = it, ask = index) }
    }
}

/** One such guard: where the topic is read, and where it is asked. */
internal data class OwnTopicGuard(val load: Int, val ask: Int)

/**
 * The one method every tapped link in the app goes through, which decides
 * between opening it in the app and handing it to a browser.
 *
 * Two methods in that class take a `Context` and a URL and there is no name
 * left on either, so this is found by what it holds: the media hosts it sniffs
 * for, which the smaller sibling beside it has none of. Its own Lemmy patterns
 * would match both.
 *
 * Hooked at the head, where the URL has been read and nothing has been decided
 * about it yet.
 */
internal val linkRouterFingerprint = Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "V",
    strings = listOf(
        "reddit.com/rpan/r/",
        "boostforreddit.com/rocket",
        "pref_link_streamable",
    ),
)

/**
 * `nh.f0$a.a(MenuOption)`, which is the dialog behind **Permalink** answering a
 * tap on one of its rows.
 *
 * Four rows in the shape everybody sees -- **Open in browser**, **Open in
 * external app**, **Share link**, **Copy link** -- and up to four more on a
 * long-pressed image, which is why the method is 1212 instructions of downloads
 * and reverse image searches. The rows carry `0` to `8` rather than resource
 * ids, so the arms are a bare `packed-switch` with nothing in them to read.
 *
 * Found by the two reverse-image-search addresses instead. They are formats
 * with `[url]` in them, they are in this method and nowhere else in the app, and
 * every row of this dialog is dispatched here. Nothing else takes a `MenuOption`
 * and holds either of them.
 */
internal val openLinkDialogFingerprint = Fingerprint(
    parameters = listOf(MENU_OPTION_CLASS),
    returnType = "V",
    strings = listOf(
        "https://yandex.com/images/search?rpt=imageview&url=[url]",
        "https://www.tineye.com/search?url=[url]",
    ),
)

/**
 * `GoToGenericActivity.z1(String, SubscriptionViewModel, boolean)`, which turns
 * one subscription into one row on the **Go to...** screen:
 *
 * ```java
 * public void z1(String str, SubscriptionViewModel model, boolean z) {
 *     if (z && model.n) return;      // <- the same hidden flag the drawer reads
 *     ...
 * }
 * ```
 *
 * The same skip the drawer has, on the other screen that draws these rows, and
 * the same hook answers it. The class keeps its name and nothing else on it
 * takes these three parameters.
 */
internal val goToRowFingerprint = Fingerprint(
    definingClass = GO_TO_ACTIVITY_CLASS,
    parameters = listOf(
        "Ljava/lang/String;",
        SUBSCRIPTION_VIEW_MODEL_CLASS,
        "Z",
    ),
    returnType = "V",
)

/**
 * `GoToGenericActivity.A1(ArrayList)`, which is the whole list arriving at that
 * screen:
 *
 * ```java
 * for (int i = 0; i < arrayList.size(); i++) {
 *     z1("", (SubscriptionViewModel) arrayList.get(i), true);
 * }
 * ```
 *
 * **That screen loads its own copy.** Its `onCreate` asks the app for the
 * subscriptions again rather than taking the list the home screen already
 * built, so the rows a guest is given have to be put into this one as well --
 * and the same object is what the typed filter reads afterwards, so putting
 * them here reaches both.
 *
 * Hooked at the head, before the loop reads the size it is about to count off.
 * The class keeps its name and nothing else on it takes a list.
 */
internal val goToListFingerprint = Fingerprint(
    definingClass = GO_TO_ACTIVITY_CLASS,
    parameters = listOf("Ljava/util/ArrayList;"),
    returnType = "V",
)

/**
 * `SubscriptionsActivity.Q0(ArrayList)`, the one door the **Edit
 * subscriptions** screen's rows come in through:
 *
 * ```java
 * @Override // ej.n
 * public final void Q0(ArrayList<Subscription> arrayList) {
 *     ArrayList<Subscription> arrayList2 = new ArrayList<>();
 *     this.v = arrayList2;
 *     arrayList2.addAll(arrayList);      // <- the list the screen keeps
 *     this.u.notifyDataSetChanged();
 * ```
 *
 * The database read and the network refresh both end here, and the adapter
 * counts and indexes straight off `v`, so a row taken out of this argument is
 * gone from the screen and from everything the screen does by position.
 *
 * The name is the presenter interface's rather than the screen's, so it is two
 * characters and free to move. The signature is not: this is the only method on
 * the class taking an `ArrayList` and answering nothing, in 1.0.31 through
 * 1.0.33, which `PatchAssumptionsTest` checks rather than assumes. Spelled out
 * in `custom` because a `parameters` list is a prefix match rather than an
 * exact one.
 */
internal val subscriptionEditorFingerprint = Fingerprint(
    definingClass = SUBSCRIPTIONS_ACTIVITY_CLASS,
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/ArrayList;")
    },
)

/**
 * `pj.i0.R(Context, String, String)`, the one method every share in the app
 * goes through:
 *
 * ```java
 * public static void R(Context context, String subject, String text) {
 *     Intent intent = new Intent("android.intent.action.SEND");
 *     intent.setType("text/plain");
 *     if (!TextUtils.isEmpty(subject)) intent.putExtra("android.intent.extra.SUBJECT", subject);
 *     intent.putExtra("android.intent.extra.TEXT", text);       // <- the third parameter
 *     context.startActivity(Intent.createChooser(intent, ...));
 * }
 * ```
 *
 * Thirteen callers between them: the three rows under **Share…**, the same
 * three again on each media screen, a topic's toolbar, a comment's menu and a
 * long-pressed link. Hooking here covers all of them, and the text is the only
 * thing any of them has left by this point -- **Share title + link** has
 * already built the title and the address into one string.
 *
 * Found by the four strings it names. The file share beside it fires the same
 * action with `EXTRA_STREAM` and no text, so `EXTRA_TEXT` and `text/plain` are
 * what tell the two apart.
 */
internal val shareTextFingerprint = Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
    returnType = "V",
    strings = listOf(
        "android.intent.action.SEND",
        "text/plain",
        "android.intent.extra.SUBJECT",
        "android.intent.extra.TEXT",
    ),
)

/**
 * `pj.i0.d(Context, String)`, the one method that reaches the clipboard:
 *
 * ```java
 * public static void d(Context context, String text) {
 *     if (context == null) return;
 *     ((ClipboardManager) context.getSystemService("clipboard"))
 *         .setPrimaryClip(ClipData.newPlainText("label", text));   // <- the second parameter
 *     Toast.makeText(context, context.getString(R.string.copied), 0).show();
 * }
 * ```
 *
 * Every **Copy…** row in the app goes through it, and it is the only mention of
 * `ClipboardManager` anywhere in the app. Found by the two strings it names,
 * since the class is two letters and the method is one.
 */
internal val clipboardFingerprint = Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "V",
    strings = listOf("clipboard", "label"),
)

/**
 * `SubmissionModel.e()`, the one method that names a topic's group for
 * comparing:
 *
 * ```java
 * public final String e() {
 *     return this.L + "@" + this.H;      // name@instance
 * }
 * ```
 *
 * What **Muted Communities** is matched against, and what the two menu rows
 * that mention a group print under themselves. Nothing else on the class takes
 * nothing and answers a String, in 1.0.31 through 1.0.33, which
 * `PatchAssumptionsTest` checks rather than assumes.
 */
internal val communityHandleFingerprint = Fingerprint(
    definingClass = SUBMISSION_MODEL_CLASS,
    returnType = "Ljava/lang/String;",
    custom = { method, _ -> method.parameterTypes.isEmpty() },
)

/**
 * `CommentModel.h()`, which builds the address a comment is shared by:
 *
 * ```java
 * public final String h() {
 *     return "https://" + instance + "/comment/" + (S != null ? S : b);
 * }
 * ```
 *
 * That is a Lemmy route. Tildes answers **404** for it, and the number in it is
 * one the interceptor invented, so a comment shared, copied or long-pressed
 * handed over an address that could never resolve.
 *
 * Two methods on the class take nothing and answer a String, and the other is
 * `toString`, whose name cannot be obfuscated because it overrides one.
 */
internal val commentLinkFingerprint = Fingerprint(
    definingClass = COMMENT_MODEL_CLASS,
    returnType = "Ljava/lang/String;",
    custom = { method, _ -> method.parameterTypes.isEmpty() && method.name != "toString" },
)

/**
 * `MenuView.a(MenuView, int)`, where a tap on any menu row in the app is
 * resolved to the row it landed on:
 *
 * ```java
 * public static void a(MenuView menuView, int i) {
 *     MenuOption menuOption = menuView.b.get(i);
 *     if (menuOption != null) {
 *         ArrayList submenu = menuOption.k;
 *         if (submenu != null && !submenu.isEmpty()) { ... return; }   // a submenu opens
 *         a callback = menuView.c;
 *         if (callback != null && menuOption.i && menuOption.j) callback.a(menuOption);
 *     }
 * }
 * ```
 *
 * The other end of `setMenuOptions`: one takes the rows in, this takes the tap.
 * A row the patch adds is acted on here, before the screen that opened the menu
 * gets it, and that screen then dismisses the dialog as it always did.
 *
 * Static, taking its own class and an index, and the only method on `MenuView`
 * that does.
 */
internal val menuTapFingerprint = Fingerprint(
    definingClass = MENU_VIEW_CLASS,
    parameters = listOf(MENU_VIEW_CLASS, "I"),
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.map(CharSequence::toString) == listOf(MENU_VIEW_CLASS, "I")
    },
)

/**
 * `PreferenceFragmentFiltersCompat.onCreatePreferences(Bundle, String)`, where
 * the **Filters & blocks** screen is inflated out of `pref_filters_v2.xml` and
 * its rows are wired up.
 *
 * The Blocking section comes off here, which means after the inflate rather
 * than at the end of the method: this one ends on a `return-void` an `if-eqz`
 * above it jumps to, so [atEveryReturn] refuses it, and there is nothing to
 * find before `setPreferencesFromResource` has run anyway.
 *
 * Boost's class keeps its name and has one `onCreatePreferences`.
 */
internal val filtersScreenFingerprint = Fingerprint(
    definingClass = FILTERS_FRAGMENT_CLASS,
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
    returnType = "V",
    custom = { method, _ -> method.name == "onCreatePreferences" },
)

/**
 * `ScriptRewriteSupportPlugin.processMarkdown(String)`, which is the whole of
 * `ag.l`:
 *
 * ```java
 * public final class l extends gk.a {
 *     public static final Pattern a = Pattern.compile("\^(?!\s)([^\n\^]+)(?<!\s)\^");
 *     public static final Pattern b = Pattern.compile("(?<!~)~(?!\s)([^\n~]+)(?<!\s)~");
 *
 *     public final String e(String str) {
 *         if (!str.contains("^") && !str.contains("~")) return str;
 *         return b.matcher(a.matcher(str).replaceAll("<sup>$1</sup>")).replaceAll("<sub>$1</sub>");
 *     }
 * }
 * ```
 *
 * Matched on the two replacements, which are the whole app's only occurrence of
 * either string in 1.0.31 through 1.0.33 -- `<sub>` and `<sup>` appear nowhere
 * else in any of the three dex files -- and on the signature, since a Markwon
 * plugin's `processMarkdown` is one letter on an obfuscated class.
 */
internal val scriptRewriteFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
    strings = listOf("<sup>\$1</sup>", "<sub>\$1</sub>"),
)

/**
 * `UserContributionPresenterNew.e(boolean)`, which picks a profile tab's
 * paginator:
 *
 * ```java
 * public final void e(boolean z) {
 *     if (d()) c().p0();
 *     if ("liked".equals(this.h) || "disliked".equals(this.h)) {
 *         ...                                  // uf.t, post/list
 *         return;
 *     }
 *     ...                                      // uf.q or uf.s, user
 * }
 * ```
 *
 * Matched on the five words it decides with, which no obfuscator touches: four
 * of them are tab keys Boost sends in a request and the fifth is a remote
 * config name. Exactly one method in 1.0.31 through 1.0.33 takes a boolean,
 * answers void and holds all five.
 */
internal val profilePaginatorFingerprint = Fingerprint(
    parameters = listOf("Z"),
    returnType = "V",
    strings = listOf(
        "liked",
        "disliked",
        "comments",
        "only_comments",
        "paginator_limit",
    ),
)

/**
 * `i0.Y(Context, SubscriptionViewModel)`, the one place one of Boost's own
 * listings becomes a word:
 *
 * ```java
 * public static String Y(Context context, SubscriptionViewModel model) {
 *     if (!model.h()) return model.d();
 *     String str = model.b;
 *     if ("!subscribed".equals(str)) str = context.getString(R.string.subscribed);
 *     if ("!saved".equals(str)) str = context.getString(R.string.saved);
 *     ...
 * }
 * ```
 *
 * Seventeen call sites go through it -- the drawer's top row, both halves of
 * the toolbar spinner, the **Go to...** screen, the launcher shortcuts and the
 * toolbar title once a feed is open -- which is what makes it the one edit that
 * reaches every place the front page is named.
 *
 * Matched on the markers and the signature. `i0.D(String)` holds five of the
 * same strings and answers a boolean, so the parameters are what separate them.
 */
internal val listingNameFingerprint = Fingerprint(
    parameters = listOf("Landroid/content/Context;", SUBSCRIPTION_VIEW_MODEL_CLASS),
    returnType = "Ljava/lang/String;",
    strings = listOf("!subscribed", "!saved", "!all", "!local", "!popular"),
)

/** What the one method that writes a draft row takes, and its wrapper. */
internal val DRAFT_WRITE = listOf(
    "Landroid/content/Context;",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    DRAFT_USER_CLASS,
)

internal val DRAFT_WRITE_WRAPPER = DRAFT_WRITE.dropLast(1)

/**
 * `pj.i0.K(Context, String, String, User)`, the one method in the app that
 * writes a draft row:
 *
 * ```java
 * if (draft != null) { draft.date = new Date(); }
 * else { draft = new Draft(); draft.text = str; draft.user = user; ... }
 * draft.save();
 * ```
 *
 * Every way of saving a draft ends here -- backing out of the composer, the
 * **Save** button inside the Drafts dialog, a comment reply and a private
 * message -- so hooking it needs to find none of those separately. The wrapper
 * one line above, `J(Context, String, String)`, only fills in the signed-in
 * user and calls this.
 *
 * Matched on the shape rather than the name, since `pj.i0` is a bag of statics
 * whose letters move between releases. Nothing else in the app takes a context,
 * two strings and a `User` and builds a `Draft` out of them.
 */
internal val draftWriteFingerprint = Fingerprint(
    parameters = DRAFT_WRITE,
    returnType = "V",
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.builds(DRAFT_ROW_CLASS)
    },
)

/**
 * `DraftSelectorView$DraftAdapter$MyViewHolder.onClick(View)`, where a draft is
 * picked out of the dialog:
 *
 * ```java
 * Draft draft = draftSelectorView.b.get(bindingAdapterPosition);
 * FormattingBar formattingBar = ((t) draftSelectorView.c).a;
 * EditText editText = formattingBar.b;                    // <- hooked here
 * if (editText != null && draft != null) { ... }
 * ```
 *
 * Both of the things a restore needs are in registers by that third line and
 * neither is read from again before the branch, so the call goes in there
 * rather than at the head, where the row is still an index.
 *
 * The class implements `View.OnClickListener` and has one `onClick`.
 */
internal val draftPickFingerprint = Fingerprint(
    definingClass = DRAFT_PICK_CLASS,
    parameters = listOf("Landroid/view/View;"),
    returnType = "V",
    custom = { method, _ -> method.name == "onClick" },
)

/**
 * `mi.e.a(l3.f)`, the **Save** button on the "Save draft?" dialog:
 *
 * ```java
 * public final void a(l3.f fVar) {
 *     String str = this.a;
 *     boolean isEmpty = TextUtils.isEmpty(str);
 *     h.d dVar = this.b;
 *     if (!isEmpty) { i0.J(dVar, str, null); }
 *     dVar.finish();
 * }
 * ```
 *
 * The body is captured when the dialog is built and asked about again here, so
 * a topic with nothing typed under it is dropped on the way out even once the
 * dialog has been offered. This is the second of the three places that ask.
 *
 * Found by what the class holds rather than by its name, which is two letters:
 * the composer and the string it captured. The two dialog callbacks beside it
 * carry the composer alone, and the constructor is ruled out by the call.
 */
internal val draftDialogSaveFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        method.parameterTypes.size == 1 &&
            classDef.fields.any { it.type == POST_ACTIVITY_CLASS } &&
            classDef.fields.any { it.type == "Ljava/lang/String;" } &&
            method.callsVoidStatic(DRAFT_WRITE_WRAPPER)
    },
)

/**
 * `nh.v.a(l3.f)`, the **Save** button inside the Drafts dialog, which files what
 * is on screen without leaving it:
 *
 * ```java
 * String obj = formattingBar.b.getText().toString();
 * if (!TextUtils.isEmpty(obj)) { i0.K(formattingBar.getContext(), obj, null, formattingBar.a); }
 * ```
 *
 * The third place that asks, and the one that reads the editor rather than a
 * string captured earlier. Found by the formatting bar it holds and the writer
 * it calls: four of its neighbours hold the same bar and none of them writes a
 * draft.
 */
internal val draftBarSaveFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        method.parameterTypes.size == 1 &&
            classDef.fields.any { it.type == FORMATTING_BAR_CLASS } &&
            method.callsVoidStatic(DRAFT_WRITE)
    },
)

/**
 * `DraftSelectorView$DraftAdapter.onBindViewHolder`, one row of the Drafts
 * dialog:
 *
 * ```java
 * myViewHolder.text.setText(draft.text);
 * myViewHolder.date.setText(format + " " + format2);
 * ```
 *
 * So every row is a body snippet with a date under it, in a `TextView` carrying
 * no `maxLines` and no `ellipsize`. A draft carries a title now, and the title
 * is what a topic is known by.
 *
 * By the field it reads rather than by the name, since `onBindViewHolder` is an
 * androidx override and androidx went through R8 with the rest of the APK. The
 * adapter's own name survives, and it is the only method on it that reads a
 * draft's text.
 */
internal val draftRowFingerprint = Fingerprint(
    definingClass = DRAFT_ADAPTER_CLASS,
    returnType = "V",
    custom = { method, _ -> method.reads(DRAFT_ROW_CLASS, DRAFT_TEXT_FIELD) },
)

/** Whether a method calls a void static taking exactly these parameters. */
internal fun Method.callsVoidStatic(parameters: List<String>): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        it.opcode == Opcode.INVOKE_STATIC &&
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                call.returnType == "V" &&
                    call.parameterTypes.map(CharSequence::toString) == parameters
            } == true
    }

/** Whether a method reads that field off an object. */
internal fun Method.reads(owner: String, field: String): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        it.opcode == Opcode.IGET_OBJECT &&
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { read ->
                read.definingClass == owner && read.name == field
            } == true
    }

/** The same for a boolean one, which is a different opcode. */
internal fun Method.readsBoolean(owner: String, field: String): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        it.opcode == Opcode.IGET_BOOLEAN &&
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { read ->
                read.definingClass == owner && read.name == field
            } == true
    }

/**
 * `RedditJRAW.j()`, the only method in the app that asks what is unread:
 *
 * ```java
 * public final cg.b j() {
 *     GetUnreadCountResponse r = (GetUnreadCountResponse) b.a(b.c().c.C0(map));
 *     cg.b count = new cg.b(0, r.getMentions(), r.getPrivate_messages(), r.getReplies());
 *     this.q = count;
 *     return count;
 * }
 * ```
 *
 * It is fingerprinted for what it **returns** rather than for what it does.
 * `cg.b` -- `InboxCount` before R8 -- is the object every unread badge in the
 * app is drawn from, and its name is two letters that move between releases,
 * so it is taken off this method's signature instead of written down.
 *
 * `GetUnreadCountResponse` is the anchor because it cannot be renamed: Gson
 * reflects over `com.rubenmayayo.lemmy.datatypes`, so the whole package is
 * kept, and in 1.0.33 this is the only method body in the app that so much as
 * mentions the type. The Retrofit interface declaring the call does not count
 * -- generics are erased, so its own signature says `no.b` and nothing more,
 * and an abstract method has no instructions to search.
 */
internal val unreadCountFingerprint = Fingerprint(
    parameters = emptyList(),
    custom = { method, _ ->
        method.returnType.startsWith("L") && method.handles(UNREAD_COUNT_RESPONSE_CLASS)
    },
)

/** The Lemmy answer to "what is unread", which keeps its name through R8. */
internal const val UNREAD_COUNT_RESPONSE_CLASS =
    "Lcom/rubenmayayo/lemmy/datatypes/GetUnreadCountResponse;"

/** Whether a method's body names that type, as a cast or as something it calls. */
internal fun Method.handles(type: String): Boolean =
    implementation?.instructions?.toList().orEmpty().any {
        val reference = (it as? ReferenceInstruction)?.reference
        (reference as? TypeReference)?.type == type ||
            (reference as? MethodReference)?.definingClass == type
    }

/**
 * `ReplyActivity.q1()`, the whole of Boost's quote dialog:
 *
 * ```java
 * String body = ((CommentModel) this.g).U;         // or a topic's, or a message's
 * f.b builder = new f.b(this);
 * builder.p(R.string.in_reply_to);
 * builder.d(R.layout.dialog_body_selection, true);
 * builder.m(R.string.quote);
 * this.b = builder.p.findViewById(R.id.body_textview);
 * if (!TextUtils.isEmpty(body)) this.b.setText(body);
 * ```
 *
 * The box is selectable and Quote takes the selection, or the whole body where
 * there is none, and puts `>` in front. `setText` is where the label line comes
 * off, so that it is not in the box to be selected in the first place.
 *
 * Found by shape rather than by any of those ids, which renumber every release.
 * `ReplyActivity` is in the manifest and keeps its name, it has two `()V`
 * methods besides the constructor, and this is the only one that sets text on a
 * view -- the other hands the written reply back to whoever asked for it.
 */
internal val replyQuoteFingerprint = Fingerprint(
    definingClass = REPLY_ACTIVITY_CLASS,
    parameters = emptyList(),
    returnType = "V",
    custom = { method, _ -> method.name != "<init>" && method.wires(SET_TEXT) },
)

/**
 * And the Quote button on that dialog, which is the whole of
 * `ReplyActivity$4.onClick(MaterialDialog)`:
 *
 * ```java
 * public final void a(l3.f fVar) {
 *     ReplyActivity replyActivity = this.a;
 *     String charSequence = replyActivity.b.getText().toString();
 *     if (TextUtils.isEmpty(charSequence)) return;
 *     int selectionStart = replyActivity.b.getSelectionStart();
 *     int selectionEnd = replyActivity.b.getSelectionEnd();
 *     if (selectionStart != selectionEnd) {
 *         charSequence = charSequence.substring(selectionStart, selectionEnd);
 *     }
 *     String d = z1.d("\n>", charSequence, "\n\n");
 *     replyActivity.inputEditText.getText().insert(
 *         replyActivity.inputEditText.getSelectionStart(), d);
 * }
 * ```
 *
 * `z1.d` is a three-string concatenation and nothing else, so the whole of the
 * quoting is those two constants: one marker for the selection however many
 * lines it has, and a blank line after it.
 *
 * The class is a synthetic callback and one letter after R8, so it is found by
 * the two strings. `"\n>"` occurs twice in the whole app, and the other is
 * RevenueCat's `CustomerInfo.toString`, which returns a `String` -- so a `V`
 * holding both constants is this method alone.
 */
internal val quoteBlockFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("\n>", "\n\n"),
)

/**
 * `CommentsFragment.q1(int, PublicContributionModel)`, which is every way of
 * starting a reply and the one gate over all of them:
 *
 * ```java
 * public final void q1(int i2, PublicContributionModel publicContributionModel) {
 *     if (publicContributionModel == null) return;
 *     if (yg.h.u()) { a(); return; }
 *     if (publicContributionModel.n) { pj.i0.S(getContext()); return; }
 *     ...
 *     if ((this.d.o || publicContributionModel.o) && !this.d.r) {
 *         Toast.makeText(context3, R.string.locked_warning, 1).show();
 *         return;
 *     }
 *     ...
 *     o1("", "");     // which starts ReplyActivity
 * }
 * ```
 *
 * A comment's reply icon reaches it through `CommentsFragment.F(int)`, a
 * topic's toolbar row through `onOptionsItemSelected`, and the reply icon in
 * the floating menu through `CommentsFragment.z(SubmissionModel)`. None of the
 * three carries a check of its own, so this is the only place the archived flag
 * has to answer differently.
 *
 * Two methods on the class take an `int` and a `PublicContributionModel` and
 * return void -- the other unbans somebody -- and this is the only one in the
 * class that reads the archived flag at all. Which is also the anchor the patch
 * uses, so the two agree by construction.
 */
internal val replyGateFingerprint = Fingerprint(
    definingClass = COMMENTS_FRAGMENT_CLASS,
    parameters = listOf("I", PUBLIC_CONTRIBUTION_CLASS),
    returnType = "V",
    custom = { method, _ -> method.readsBoolean(PUBLIC_CONTRIBUTION_CLASS, ARCHIVED_FIELD) },
)

/**
 * `ReplyActivity.onCreate`, and the point in it where the screen has finished
 * reading what it was opened with:
 *
 * ```java
 * this.g = (ContributionModel) intent.getParcelableExtra("contribution");
 * String reply = intent.getStringExtra("reply_text");
 * if (!TextUtils.isEmpty(reply)) this.inputEditText.setText(reply);
 * this.h = intent.getBooleanExtra("edit_intent", false);
 * ```
 *
 * The box is filled two lines above and the flag saying whether this is an edit
 * is the last of the three to be written, so straight after it is the first
 * point where the post, the flag and the box are all there to be read.
 *
 * `onCreate` keeps its name, being a framework override, and it is matched
 * against the other `(Landroid/os/Bundle;)V` on the class -- `onSaveInstanceState`
 * -- by nothing more than that.
 */
internal val replyScreenFingerprint = Fingerprint(
    definingClass = REPLY_ACTIVITY_CLASS,
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    custom = { method, _ -> method.name == "onCreate" },
)

/** The one reply screen, which the inbox, a thread and a comment all open. */
internal const val REPLY_ACTIVITY_CLASS =
    "Lcom/rubenmayayo/reddit/ui/compose/ReplyActivity;"

/** What that screen is told to open as an edit with, rather than as a reply. */
internal const val EDIT_INTENT_EXTRA = "edit_intent"

/**
 * The **Select text** row on a comment, which is the tap handler for every row
 * in a comment's menu:
 *
 * ```java
 * case R.id.copy_selection:
 *     String body = StringEscapeUtils.unescapeHtml4(holder.commentModel.content);
 *     f.b builder = new f.b(context);
 *     builder.d(R.layout.dialog_body_selection, true);
 *     holder.selectionTv = builder.p.findViewById(R.id.body_textview);
 *     if (!TextUtils.isEmpty(body)) holder.selectionTv.setText(body);
 * ```
 *
 * Which is the quote dialog's layout and the quote dialog's box, built a third
 * time in a class of its own. It is the only `setText` in the handler, so the
 * row is found without naming its id -- which renumbers -- and the holder is in
 * a register the whole way down, since every other row reads the comment off it.
 *
 * The class is a `MenuView.a` carrying a `CommentViewHolder`, and its one method
 * takes a `MenuOption`. All three of those keep their names.
 */
internal val commentSelectionFingerprint = Fingerprint(
    parameters = listOf(MENU_OPTION_CLASS),
    returnType = "V",
    custom = { method, classDef ->
        classDef.fields.any { it.type == COMMENT_VIEW_HOLDER_CLASS } && method.wires(SET_TEXT)
    },
)

/**
 * And the same row on a topic, which has a method to itself:
 *
 * ```java
 * public final void j(Context context, SubmissionModel submissionModel) {
 *     String body = StringEscapeUtils.unescapeHtml4(this.n.title + "\n\n" + this.n.body);
 *     ...
 *     this.selectionTv.setText(body);
 * }
 * ```
 *
 * So a topic's box opens on the title, a blank line, then the body, where a
 * comment's is the body alone. `SubmissionViewHolder` has exactly one method
 * taking a `Context` and a post, and this is it.
 */
internal val topicSelectionFingerprint = Fingerprint(
    definingClass = SUBMISSION_VIEW_HOLDER_CLASS,
    parameters = listOf("Landroid/content/Context;", SUBMISSION_MODEL_CLASS),
    returnType = "V",
)

/** What fills the quote dialog's box, and the last thing that method does with the body. */
internal const val SET_TEXT = "setText"
