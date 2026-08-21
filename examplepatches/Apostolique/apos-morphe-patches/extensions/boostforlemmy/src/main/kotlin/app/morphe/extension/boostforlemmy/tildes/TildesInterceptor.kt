package app.morphe.extension.boostforlemmy.tildes

import android.app.Activity
import android.app.AlertDialog
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.res.Configuration
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.ColorFilter
import android.graphics.Paint
import android.graphics.PixelFormat
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Parcelable
import android.text.Editable
import android.text.SpannableStringBuilder
import android.text.Spanned
import android.text.TextUtils
import android.text.TextWatcher
import android.text.style.ImageSpan
import android.text.style.RelativeSizeSpan
import android.util.TypedValue
import android.view.Gravity
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.WindowInsets
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.CompoundButton
import android.widget.EditText
import android.widget.HorizontalScrollView
import android.widget.LinearLayout
import android.widget.NumberPicker
import android.widget.RelativeLayout
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import okhttp3.Interceptor
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Protocol
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.Response
import okhttp3.ResponseBody
import okhttp3.ResponseBody.Companion.toResponseBody
import org.json.JSONArray
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.lang.ref.WeakReference
import java.lang.reflect.Field
import java.lang.reflect.Method
import java.lang.reflect.Modifier
import java.net.URLEncoder
import java.nio.ByteBuffer
import java.nio.channels.ReadableByteChannel
import java.nio.channels.WritableByteChannel
import java.security.SecureRandom
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.CopyOnWriteArrayList
import java.util.concurrent.Executors
import kotlin.math.max
import kotlin.math.roundToInt

/**
 * Answers Boost's Lemmy API calls from tildes.net, inside Boost's own HTTP
 * stack.
 *
 * Boost asks for `https://tildes.net/api/v3/...`, which does not exist -- the
 * real site answers 404 there. Rather than let the request go out, this builds
 * the JSON Retrofit is expecting by scraping the site's HTML. Retrofit and Gson
 * never learn the difference.
 *
 * It serves the same surface as the standalone bridge, minus everything only a
 * server needs: no NanoHTTPD, no port, no TLS and no certificate, because
 * nothing is listening on a socket.
 */
class TildesInterceptor private constructor() : Interceptor {

    /**
     * Boost expects a JWT back from login and sends it on later calls. There is
     * nothing to sign, so this is opaque, and it doubles as the record of
     * whether anyone is logged in.
     *
     * The bridge read the `Authorization` header instead. That cannot work
     * here: Boost attaches the bearer token in a *network* interceptor, which
     * runs after this one, so the header is not on the request yet. There is
     * nothing to authenticate against in-process anyway, since only Boost can
     * reach this.
     */
    @Volatile
    private var token: String? = null

    /**
     * Whether the stored session has been looked for yet. The cookies behind
     * the token outlive the app now, so the first request of a new process
     * picks them back up before it answers anything.
     */
    @Volatile
    private var restored = false

    // Boost fires several calls at once, so everything here is touched from
    // more than one OkHttp thread. A plain HashMap can spin forever if two
    // writes land together, which would look like the app hanging rather than
    // like a data race.
    private val cursors = ConcurrentHashMap<String, ConcurrentHashMap<Int, String>>()

    /**
     * Which topic a comment sits in. Editing one names only the comment, while
     * the answer has to carry the whole post around it, so the pairing is kept
     * from whenever the thread was last read.
     *
     * **A topic opened on a comment needs it too**, and that one is not an
     * edit. Boost asks for the topic with `comment_id` on it and then asks
     * `/comment/list` for the subtree under that comment's **parent** -- naming
     * the parent alone, with no `post_id` beside it. So the parent has to be in
     * here by then or there is no topic to read, which is why every page read
     * fills it rather than only the screens that list comments out of one.
     * A fresh process opening a notification was the shape that found this: the
     * topic drew with nothing under it.
     */
    private val commentTopics = ConcurrentHashMap<String, String>()

    /**
     * And which comment each one is a reply to, for the screen that opens on a
     * single comment. See [commentParent].
     */
    internal val commentParents = ConcurrentHashMap<String, String>()

    /**
     * Lemmy inbox id back to the notification it stands for, for marking one
     * read.
     *
     * The whole notification rather than the comment's id, because the answer
     * to marking one read has to be the row Boost drew, built again with the
     * flag flipped. See the `mark_as_read` branch.
     */
    private val inboxComments = ConcurrentHashMap<Int, Tildes.UserComment>()

    /**
     * And the message rows the inbox drew, by the id Boost sends back to mark
     * one read. Same reason, and the same shape: the answer to that write is
     * the row, and Boost reads straight through it.
     */
    private val drawnMessages = ConcurrentHashMap<Int, JSONObject>()

    /** Registration dates and bios, from whichever profiles have been opened. */
    private val profiles = ConcurrentHashMap<String, Tildes.Profile>()

    /**
     * The signed-in account's own bio, as markdown, which is the one thing
     * Tildes lets you edit about yourself.
     *
     * Read once per process off `/settings/bio` and kept, since `/site` is
     * asked for far more often than a bio changes and the editor is the only
     * screen that reads it. A bio edited in a browser shows up here on the
     * next launch, and one edited in the app is written straight back into
     * this.
     *
     * Null means never read, `""` means read and empty, which are two
     * different things: an account with no bio should cost one request, not
     * one per `/site`.
     */
    @Volatile
    private var myBio: String? = null

    /**
     * The account's own Tildes settings, as its settings page draws them: a
     * checkbox name against whether it is ticked.
     *
     * Kept for the same reasons [myBio] is, and read on the same `/site`. The
     * account editor is the only screen that reads one, `/site` is asked for
     * far more often than a setting changes, and a setting changed in a
     * browser shows up here on the next launch.
     *
     * Nothing asks for `/site` at launch, though, so the editor is also what
     * fills this the first time each run -- and it does that *after* its own
     * view is built. Which is why the screen reads this again once it has
     * landed rather than only as it is drawn. `settingRows` has the rest.
     *
     * Null means never read, which is not the same as read and empty: a
     * setting Tildes has stopped drawing has no row on the editor and nothing
     * writes it, where a `false` would draw a row saying somebody had turned
     * it off and the next save would turn it off for real.
     */
    @Volatile
    internal var mySettings: Map<String, Boolean>? = null

    /**
     * And the fifth setting on that page, which is a dropdown rather than a
     * checkbox and so has no room in the map beside it. Read off the same page
     * in the same breath, and null until it has been.
     */
    @Volatile
    internal var myCommentSort: List<Tildes.SortChoice>? = null

    /**
     * The account's invite codes, read once per process off a page of their
     * own. Null until they have been, and null again when reading them failed.
     *
     * Not on `/settings` with the rest, and not something Lemmy has at all:
     * `/invite` is its own page, so this is one more request rather than more
     * of one already made. It is only ever asked for by the account editor, and
     * that screen is where the row lands.
     *
     * Kept as the site answered it, so a code generated here shows up in the
     * list without the page being read again -- the fragment behind the button
     * carries the new count as well as the new code.
     */
    @Volatile
    internal var myInvites: Tildes.Invites? = null

    /**
     * The tags the account filters, read once per process off a page of their
     * own. Null until they have been, and null again when the page could not
     * be recognised.
     *
     * The Filters screen is the only thing that asks, so this is read there
     * rather than on `/site`, the way [myInvites] is. It is also what the
     * screen writes back to: the list on it is Boost's own copy, and this is
     * what says whether an edit to that copy is a change worth sending or the
     * same list arriving back from the site.
     *
     * Empty is an account that filters nothing, which is most accounts and is
     * a row worth drawing. Null is the page not reading, which is a row left
     * off.
     */
    @Volatile
    internal var myTags: List<String>? = null

    /**
     * Which half each of the two-tab pages is showing, keyed on the tab it
     * belongs to: `topic` or `comment` against `saved` or `liked`.
     *
     * Both halves are two pages upstream while Lemmy's shape asks for them in
     * one call, so both were always fetched and one was thrown away. Each tab
     * draws one of them now -- Tildes keeps `/bookmarks` and `/votes` as two
     * tabs apiece and has no merged view of either -- and this is what says
     * which, so the other page is not read at all. Written where Boost picks the
     * paginator, a moment before the request goes out.
     *
     * **One entry per tab rather than one flag**, because a pager builds the tab
     * beside the one you are looking at: Bookmarks and Votes are neighbours, so
     * both can be loading at once, each on its own half.
     *
     * All posts is not in here. That tab is one page of both kinds, which is a
     * view the site really has.
     */
    internal val profileKinds = ConcurrentHashMap<String, String>()

    /**
     * What each profile tab is being searched for, where one is.
     *
     * Tildes puts a search box on your own profile over the topics listing and
     * over the comments one, and submitting it keeps you on a user page with
     * the same tabs and the same sort, filtered. So there is no screen to open
     * and nothing to carry in a name: the tab remembers what it is searching
     * for, and [userListing] asks `/user/<name>/search` instead of the plain
     * route while it does. Written where the box is closed, a moment before the
     * reload it asks for.
     *
     * **One entry per person and per tab**, keyed the way [searchKey] spells
     * it. Per person because `search_posts` is a permission an account holds on
     * itself alone, so a query left keyed by tab would turn the next profile
     * you opened into a 403; per tab because the site's box is per type, its
     * form carrying a hidden `type` and its placeholder saying which.
     *
     * Cleared with the account, like everything else here that is somebody's.
     */
    internal val profileSearches = ConcurrentHashMap<String, String>()

    /**
     * Topics as last seen. A delete has to answer with the post it removed,
     * and by then the page it came from is gone. The composer reads its tags
     * out of here too, since Boost opens the editor on a model it already had
     * rather than by fetching the topic again.
     */
    internal val topics = ConcurrentHashMap<String, Tildes.Topic>()

    /**
     * And their logs, which is what the site says has been done to each one
     * since it was posted. Keyed on id36 like [topics], and only ever holding
     * a topic whose own page has been read: a listing draws none of this.
     *
     * Kept beside [topics] rather than on the topic because nothing but the
     * one menu row reads it, and because a topic is merged across a page and a
     * listing while a log only ever comes off the page. Rewritten whole every
     * time the page is parsed, so a topic tagged while you had it open is one
     * refresh from saying so.
     *
     * Not cleared when the account goes, for the same reason [topics] is not:
     * what is in here is the site's own public account of a topic, and the one
     * line of it that depends on who is asking -- an anonymous author reads as
     * **Unknown user** -- is rewritten the next time the page is read.
     */
    internal val topicLogs = ConcurrentHashMap<String, List<String>>()

    /**
     * Subscriber counts, which Tildes prints in a group's sidebar and nowhere
     * else, so each one costs a request. They are kept on disk between runs
     * and gathered once in the background, since the numbers move slowly and
     * a panel full of zeroes is worse than a day-old number.
     */
    internal val subscribers = ConcurrentHashMap<String, Int>()

    /**
     * Group sidebars, as the markdown Boost renders one in, keyed on group
     * name. Read off the same page the count is, so a group whose listing has
     * been opened has one, and kept on disk so the panel is not blank on the
     * first launch of the day.
     */
    internal val sidebars = ConcurrentHashMap<String, String>()

    @Volatile
    private var gathering = false

    @Volatile
    private var groupCache: List<Tildes.Group> = emptyList()

    @Volatile
    private var groupCacheAt = 0L

    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        val path = request.url.encodedPath

        // Scoped to the host Boost was pointed at, so a patched Boost is still
        // an ordinary Lemmy client everywhere else. Matching on the path alone
        // would make lemmy.world report itself as Tildes.
        val mine = request.url.host.equals(HOST, ignoreCase = true)
        if (path.startsWith("/api/v3")) {
            answering = mine
            // The wording is chosen as a screen attaches rather than while a
            // request is in flight, so it reads this back on the next run.
            Session.rememberTildes(mine)
        }
        if (!mine) return chain.proceed(request)

        // Anything else on the host -- images, and whatever Boost fetches
        // directly -- is left alone.
        if (!path.startsWith("/api/v3") && path != NODEINFO && path != NODEINFO_WELL_KNOWN) {
            return chain.proceed(request)
        }

        restoreSession()

        return try {
            route(request, path.removePrefix("/api/v3"))
        } catch (e: TildesException) {
            error(request, e.message ?: "error", if (e.status == 400) 400 else 503)
        } catch (e: Throwable) {
            // Throwable, not Exception. A missing class or method arrives as an
            // Error, and letting one escape here fails the call outright --
            // Boost renders that as a plain "Login failed".
            error(request, e.message ?: e.javaClass.simpleName, 500)
        } finally {
            // After the answer, not only after login: Tildes reissues its
            // cookie as it goes, so a copy taken at login alone goes stale.
            Session.saveIfChanged(token)
            saveHistoryIfChanged()
            repaintBadgeIfChanged()
        }
    }

    /**
     * Tells Boost to redraw the unread badge when the number behind it has
     * moved, which nothing in the app does between screens.
     *
     * `/api/v3/user/unread_count` has one caller and it is an hourly job, so
     * every badge in the app is drawn off what that job stored and a reply
     * arriving five minutes ago was not on the screen. The count itself is live
     * here -- Tildes prints it into the header of every page, so a feed pulled
     * down knows within one fetch -- and [inboxTotal] hands it to the badge
     * whenever the badge is drawn. What was missing is a draw: `onResume` was
     * the only thing that asked, so the number landed when you opened a topic
     * and came back rather than under the finger that pulled.
     *
     * Boost has the event for it already. A local broadcast makes the screen
     * repaint from the count object it holds, and that draw asks [inboxTotal],
     * so this only has to say **something changed** and the right number
     * follows. See [repaintBadge] for why the sending is the patch's job.
     *
     * Compared against what was last painted rather than fired on every answer,
     * since the interceptor answers a dozen calls to draw one screen and each
     * one would be a broadcast. A guest has no badge and no count.
     */
    private fun repaintBadgeIfChanged() {
        if (!answering) return
        val now = Tildes.unreadCounts ?: return
        val total = now.notifications + now.messages
        if (total == painted) return
        painted = total

        val context = Session.application() ?: return
        try {
            repaintBadge(context, null)
        } catch (t: Throwable) {
            // A release that moved either of the two things the patch writes in
            // here leaves the badge where it was, which is where it has always
            // been. Said once rather than per request.
            if (!saidBadge) {
                saidBadge = true
            }
        }
    }

    /** What the badge was last told, so a repaint costs one broadcast. */
    @Volatile
    private var painted = -1

    @Volatile
    private var saidBadge = false

    /**
     * The stored session back into [Tildes], once per process.
     *
     * Called from the head of every request, and from the two screens that read
     * a page of their own on a thread of their own -- the account editor's
     * settings and its invite codes. Those two can be **first**: a tildes.net
     * address opened from outside the app builds that screen before any request
     * has gone out, and a fetch from there with no cookies on it does not merely
     * come back logged out. It comes back with an anonymous session cookie,
     * which lands in the jar over the real one, and the next page read makes
     * `checkStillSignedIn` sign the account out for real. That is what happened
     * on 2026-08-17 -- `PITFALLS.md` has it.
     */
    internal fun restoreSession() {
        if (restored) return
        // A guest reads nothing back. Boost has no account, so this end has
        // none either, and the stored session waits on disk for the account to
        // be picked again. [Session.wasGuest] says why it waits rather than
        // going.
        if (Session.wasGuest()) {
            restored = true
            return
        }
        // The flag is raised once the restore is done, not before, so a second
        // thread waits here rather than answering its request logged out while
        // the first one is still reading the cookies back.
        synchronized(this) {
            if (restored) return
            try {
                subscribers.putAll(Session.loadSubscribers())
                sidebars.putAll(Session.loadSidebars())
                restoreHistory()
                token = Session.restore()
                // Boost remembers the account's person id and asks for the
                // profile by that alone, so the name has to be back in the
                // id map before the first call rather than after /site.
                Tildes.username?.let { Lemmy.userId(it) }
            } finally {
                restored = true
            }
        }
    }

    /**
     * Puts the session aside, which is what picking **Guest** in Boost's
     * account picker means here.
     *
     * The same clearing a sign-out does, and then the disk copy is left exactly
     * where it is: [Session.saveIfChanged] refuses to write while the guest
     * flag is on, so the null token this leaves behind cannot erase anything.
     * That is the whole difference between parking and signing out, and it is
     * why picking the account again costs no two-factor login.
     *
     * The flag goes on **before** the clearing rather than after, since another
     * request can be in flight and its `finally` would otherwise write the
     * cleared state over the stored one.
     *
     * Whatever Tildes hands a signed-out reader lands in a fresh jar and stays
     * in memory. `restored` is raised because there is nothing to read back
     * while this is on.
     */
    internal fun parkSession() {
        Session.rememberGuest(true)
        // On the same monitor [restoreSession] holds, or a restore already
        // running on a request thread finishes after this and puts the cookies
        // back underneath it -- parked by the flag and signed in on the wire,
        // which is the state this whole thing exists to end.
        synchronized(this) {
            signOut()
            restored = true
        }
    }

    /**
     * And takes it out again, the account having been picked.
     *
     * The guest's own jar goes rather than being kept: whatever cookie Tildes
     * gave a signed-out reader means nothing to the account, and leaving it
     * there would ride along beside the real one. Lowering `restored` is what
     * makes the next request read the stored session back.
     */
    internal fun unparkSession() {
        Session.rememberGuest(false)
        synchronized(this) {
            Tildes.cookies = mutableMapOf()
            Tildes.csrfToken = null
            restored = false
        }
    }

    /** Drops the Tildes session and everything that only makes sense with one. */
    private fun signOut() {
        token = null
        Tildes.cookies = mutableMapOf()
        Tildes.csrfToken = null
        Tildes.username = null
        // And what was waiting for them, or the next account's badge opens on
        // somebody else's number until a page of their own has been fetched.
        Tildes.forgetUnread()
        groupCache = emptyList()
        // Whose bio it was goes with the account, or the next one to sign in
        // opens the editor on somebody else's words and saves them.
        myBio = null
        mySettings = null
        myCommentSort = null
        // Whose codes they were goes with them. They are somebody's to hand
        // out, so leaving them behind would draw one account's on the next
        // account's screen.
        myInvites = null
        // And whose filters they were. The list Boost holds is left where it
        // is -- nothing reads it but the screen that draws it, and that screen
        // fills it from the site before it is shown.
        myTags = null
        profileKinds.clear()
        // Whose posts they searched goes with them.
        profileSearches.clear()
        openedOn.clear()
        // And which comments they could label, along with the labels they had
        // put on each. Both are one account's answer about another account's
        // comment, and the next one to sign in shares neither.
        labelledComments.clear()
        Tildes.forgetLabelOptions()
    }

    /**
     * The account's bio, read once per process. [myBio] says why it is kept.
     *
     * A failure answers empty rather than throwing: the editor then draws an
     * empty box, which is what it did before any of this, while a `/site` that
     * errors takes the app's first call with it. Nothing is cached on that
     * path either, so the next `/site` asks again.
     */
    private fun bio(): String {
        myBio?.let { return it }
        return try {
            Tildes.myBio().also { myBio = it }
        } catch (e: Throwable) {
            ""
        }
    }

    /**
     * The account's settings, read once per process. [mySettings] says why.
     *
     * A failure answers nothing rather than throwing, for the reason [bio]
     * does: the editor then draws the bio alone, which is what it did before
     * any of this, while a `/site` that errors takes the app's first call with
     * it. Nothing is cached on that path, so the next `/site` asks again.
     */
    internal fun settings(): Map<String, Boolean> {
        mySettings?.let { return it }
        // Before the fetch, not after: this screen can be the first thing a
        // cold start builds. [restoreSession] says what an un-cookied read
        // costs.
        restoreSession()
        return try {
            // One fetch for both. The checkboxes and the sort dropdown are on
            // the same page, and asking for it twice would be a second request
            // for something already in hand.
            val page = Tildes.settingsPage()
            myCommentSort = Tildes.parseCommentSort(page)
            Tildes.parseSettings(page).also {
                mySettings = it
            }
        } catch (e: Throwable) {
            emptyMap()
        }
    }

    /**
     * The account's invite codes, read once per process. [myInvites] says why.
     *
     * A failure answers null rather than throwing, for the reason [settings]
     * does, and null is also what an unrecognised page answers: the row is
     * then left off the editor rather than drawn claiming an account has no
     * codes. Nothing is cached on that path, so opening the screen again asks
     * again.
     */
    internal fun invites(): Tildes.Invites? {
        myInvites?.let { return it }
        restoreSession()
        return try {
            Tildes.parseInvites(Tildes.invitePage())?.also {
                myInvites = it
            }
        } catch (e: Throwable) {
            null
        }
    }

    /**
     * The account's filtered tags, read once per process. [myTags] says why.
     *
     * A failure answers null rather than throwing, for the reason [invites]
     * does, and null is also what an unrecognised page answers: the row is
     * then left off the Filters screen rather than drawn saying an account
     * filters nothing. Nothing is cached on that path, so opening the screen
     * again asks again.
     */
    internal fun filteredTags(): List<String>? {
        myTags?.let { return it }
        restoreSession()
        return try {
            Tildes.parseFilteredTags(Tildes.filtersPage())?.also {
                myTags = it
            }
        } catch (e: Throwable) {
            null
        }
    }

    /**
     * And writes them, which the Filters screen asks for off the main thread.
     *
     * What went up is kept, so the next change is compared against what the
     * site now holds rather than against what it held when the screen opened.
     * A refusal leaves [myTags] alone, which is what puts the screen's own
     * copy back where it was.
     */
    internal fun writeFilteredTags(tags: List<String>): Boolean =
        try {
            Tildes.editFilteredTags(tags)
            myTags = tags
            true
        } catch (e: Throwable) {
            false
        }

    /**
     * The four switches beside the bio, written one at a time and only where
     * they changed.
     *
     * One request each, since Tildes gives every setting a form of its own and
     * a form is one trigger name. So a save that touched nothing but the bio
     * costs nothing, and one that flipped a switch costs one PATCH.
     *
     * A setting that was never read is never written: [mySettings] holds what
     * `/settings` said, the editor draws a row only for what is in there, and
     * a key missing from it is one this cannot tell a change from.
     *
     * A refusal is left to travel, which is what makes the app say the save
     * failed rather than toast Saved over a switch that did not take. What did
     * land is kept as it goes, so reopening the screen says the truth rather
     * than what was on it a moment ago.
     */
    private fun saveSettings(body: JSONObject) {
        val known = mySettings ?: return
        var written = 0
        for (setting in ACCOUNT_SETTINGS) {
            val was = known[setting.field] ?: continue
            if (!body.has(setting.switch)) continue
            val now = body.optBoolean(setting.switch)
            if (now == was) continue
            Tildes.editSetting(setting.trigger, setting.field, now)
            mySettings = (mySettings ?: known) + (setting.field to now)
            written++
        }
    }

    private fun route(request: Request, uri: String): Response {
        val q = { name: String -> request.url.queryParameter(name) }
        val body by lazy { bodyJson(request) }

        return when {

            // Boost probes this before anything else to tell Lemmy from PieFed,
            // and routes to /api/v3 or /api/alpha accordingly. Claiming Lemmy
            // keeps it on the dialect implemented below.
            uri == NODEINFO || uri == NODEINFO_WELL_KNOWN ->
                json(
                    request,
                    JSONObject()
                        .put("version", "2.0")
                        .put(
                            "software",
                            JSONObject().put("name", "lemmy").put("version", Lemmy.VERSION),
                        )
                        .put("protocols", JSONArray().put("activitypub"))
                        .put("openRegistrations", false)
                        .put(
                            "usage",
                            JSONObject().put("users", JSONObject().put("total", 0))
                                .put("localPosts", 0).put("localComments", 0),
                        )
                )

            uri == "/site" ->
                json(
                    request,
                    Lemmy.siteResponse(
                        groups(),
                        if (token != null) Tildes.username else null,
                        if (token != null) bio() else null,
                        // Tildes' own settings, on the switches Boost draws
                        // them on. The editor is built before it asks for
                        // this, so what it reads here is the copy taken on the
                        // first `/site` of the run rather than a fresh one.
                        if (token != null) {
                            val read = settings()
                            ACCOUNT_SETTINGS.mapNotNull { setting ->
                                read[setting.field]?.let { setting.switch to it }
                            }.toMap()
                        } else emptyMap(),
                    ),
                )

            uri == "/user/login" -> {
                val user = body.optString("username_or_email").removePrefix("@")
                val pass = body.optString("password")
                val totp = body.optString("totp_2fa_token").ifEmpty { null }
                try {
                    if (Tildes.login(user, pass, totp)) {
                        val issued = ByteArray(32).also { SecureRandom().nextBytes(it) }
                            .joinToString("") { "%02x".format(it) }
                        token = issued
                        groupCache = emptyList()
                        json(
                            request,
                            JSONObject().put("jwt", issued).put("registration_created", false)
                                .put("verify_email_sent", false),
                        )
                    } else {
                        error(request, Tildes.ERROR_INCORRECT_LOGIN, 401)
                    }
                } catch (e: TildesException) {
                    // Login errors must come back as Lemmy error codes with
                    // Lemmy's status, or Boost shows a generic failure instead
                    // of, say, prompting for the 2FA code.
                    error(
                        request,
                        e.message ?: Tildes.ERROR_INCORRECT_LOGIN,
                        if (e.status == 400) 400 else 401,
                    )
                }
            }

            uri == "/user/save_user_settings" -> {
                // Boost sends all thirteen fields its own editor carries --
                // avatar, banner, display name, email and eight switches. The
                // bio is Tildes' own, four of the switches carry Tildes'
                // settings, and the rest go nowhere: those fields are hidden
                // on that screen, so what arrives under them is whatever the
                // empty boxes held.
                val text = body.optString("bio")
                Tildes.editBio(text)
                myBio = text
                saveSettings(body)
                // Answered with the shape a Lemmy save answers with. Boost
                // reads nothing off it but does dereference it, and the token
                // is the one it already has, so nothing signs out.
                json(
                    request,
                    JSONObject()
                        .put("jwt", token ?: "")
                        .put("registration_created", false)
                        .put("verify_email_sent", false),
                )
            }

            uri == "/community/block" -> {
                // The same answer a person's block gets, for the same reason:
                // Tildes has nothing to write to, and Boost has a list of its
                // own that its feeds already run every row against.
                //
                // Written the way a group is spelled on screen, `~comp`, which
                // is what [Companion.groupHandle] compares against and what somebody
                // typing one into the Filters screen would write.
                val id = body.optInt("community_id")
                val blocking = body.optBoolean("block", true)
                val name = Lemmy.groupName(id)

                if (name == null) {
                    error(request, "couldnt_find_community", 404)
                } else {
                    Session.muteGroup("~$name", blocking)
                    json(
                        request,
                        JSONObject()
                            .put(
                                "community_view",
                                Lemmy.communityView(
                                    groups().find { it.name == name }
                                        ?: Tildes.Group(name, null, false, 0, 0),
                                    subscribers[name] ?: 0,
                                ),
                            )
                            .put("blocked", blocking),
                    )
                }
            }

            uri == "/user/block" -> {
                // Tildes has no block. `routes.py` has a ban, which is an
                // admin's, and a tag filter, which is about topics, and nothing
                // else per account -- so this used to fall to the catch-all,
                // log `unhandled POST /user/block` and answer `{}`, which is
                // both a lie and a dereference away from a crash.
                //
                // Boost's own **muted users** is the same idea one layer down:
                // a list in its preferences that every feed already runs each
                // row against. So a block is written there instead, and the
                // Filters screen shows it afterwards.
                //
                // The name comes off the id map rather than the request, which
                // carries a number: every person the interceptor has built has
                // passed through it. A block on somebody nothing has drawn
                // cannot happen -- the row you blocked from is what named them.
                val id = body.optInt("person_id")
                val blocking = body.optBoolean("block", true)
                val name = Lemmy.userName(id)

                if (name == null) {
                    error(request, "couldnt_find_person", 404)
                } else {
                    // The answer is read rather than dropped, and the list is
                    // counted after the write. This line used to say "muted"
                    // whether or not anything was stored, so it proved the
                    // request was handled and nothing else -- and the one thing
                    // that can go wrong here is silent: with no application
                    // context there is no preferences file to write to.
                    val changed = Session.mute(name, blocking)
                    val held = Session.muted().size
                    // The rows already on screen stay until the next fetch,
                    // which is the same as any other filter change: the list is
                    // read as a feed is built.
                    json(
                        request,
                        JSONObject()
                            .put("person_view", Lemmy.personView(name))
                            .put("blocked", blocking),
                    )
                }
            }

            uri == "/user/logout" -> {
                signOut()
                json(request, JSONObject().put("success", true))
            }

            uri == "/user/validate_auth" ->
                if (token == null) error(request, "not_logged_in", 401)
                else json(request, JSONObject().put("success", true))

            uri == "/community/list" -> {
                val all = groups()
                val wanted = if (q("type_") == "Subscribed") all.filter { it.subscribed } else all
                // Returning every group on every page made the list append
                // itself again on each scroll. Tildes fits its whole group list
                // in one page, so the slicing happens here.
                val arr = JSONArray().apply {
                    pageOf(sortGroups(wanted, q("sort")), q("page"), q("limit"))
                        .forEach { put(Lemmy.communityView(it, subscribers[it.name] ?: 0)) }
                }
                json(request, JSONObject().put("communities", arr))
            }

            uri == "/community" -> {
                val name = groupNameFor(q("id")?.toIntOrNull(), q("name"))
                if (name == HISTORY) {
                    // Answering 404 for Boost's History tab drew a 404 screen.
                    // An empty community lets it render, and the listing behind
                    // it is answered from the topics already read.
                    //
                    // The title reads "History" rather than the marker, for
                    // wherever Boost draws a community title. It does not fix
                    // the toolbar over the tab, which shows the marker: that
                    // is set once from the model Boost navigated in with,
                    // before this is asked for, and the answer only feeds the
                    // banner and the subscriber count. Boost knows the word --
                    // `i0.Y` maps this exact name to R.string.history -- but
                    // behind a check that passes only for `!all`, `!saved`,
                    // `!local`, `!popular` and `!subscribed`, so the mapping
                    // is unreachable and a stock Boost shows the marker too.
                    json(
                        request,
                        JSONObject()
                            .put(
                                "community_view",
                                Lemmy.communityView(
                                    Tildes.Group(name, null, false, 0, 0),
                                    title = "History",
                                ),
                            )
                            .put("moderators", JSONArray())
                            .put("discussion_languages", JSONArray().put(0)),
                    )
                } else if (Lemmy.tagListing(name) != null) {
                    // A tag listing is not a group, and asking Tildes for one
                    // by this name would fetch the filtered page and file its
                    // sidebar under the filter. Boost does not ask -- the
                    // listing counts as one of its own, so nothing on that
                    // screen wants a community -- and this is here for the day
                    // that stops being true.
                    val tagged = Lemmy.tagListing(name)!!
                    json(
                        request,
                        JSONObject()
                            .put(
                                "community_view",
                                Lemmy.communityView(
                                    // The name back as Boost carries it, which
                                    // is the one every other route here has
                                    // already had its `~` taken off.
                                    Tildes.Group(
                                        tagged.name.removePrefix("~"), null, false, 0, 0,
                                    ),
                                    title = tagged.title,
                                ),
                            )
                            .put("moderators", JSONArray())
                            .put("discussion_languages", JSONArray().put(0)),
                    )
                } else if (Lemmy.subgroupListing(name) != null) {
                    // The same again for a group asked for with its subgroups,
                    // and for the same reason: the screen counts it as one of
                    // Boost's own and never asks, and fetching `/~x` under this
                    // name would file the group's sidebar under a view of it.
                    val subgrouped = Lemmy.subgroupListing(name)!!
                    json(
                        request,
                        JSONObject()
                            .put(
                                "community_view",
                                Lemmy.communityView(
                                    Tildes.Group(
                                        subgrouped.name.removePrefix("~"), null, false, 0, 0,
                                    ),
                                    title = subgrouped.title,
                                ),
                            )
                            .put("moderators", JSONArray())
                            .put("discussion_languages", JSONArray().put(0)),
                    )
                } else if (name == null) {
                    error(request, "couldnt_find_community", 404)
                } else {
                    val known = groups().find { it.name == name }

                    // This is the one call whose answer fills the panel, so a
                    // group nothing has read yet is worth the page it costs.
                    // Either half missing is the same read.
                    var missing = false
                    if (!subscribers.containsKey(name) || !sidebars.containsKey(name)) {
                        try {
                            noteGroupPage(name, Tildes.getHtml("/~$name"))
                        } catch (e: TildesException) {
                            // A 404 on a group nothing lists is the site saying
                            // there is no such group, which Boost draws a screen
                            // for. Anything else is the page not being readable
                            // right now, and the group list still knows enough
                            // to draw the screen, so that is what it draws.
                            //
                            // Settings -> Feedback and support is how this
                            // arrives: the row opens Boost's own support
                            // community, which is a Lemmy one, and asking
                            // tildes.net for it used to answer 503.
                            if (e.status == 404 && known == null) missing = true
                        }
                    }

                    if (missing) {
                        error(request, "couldnt_find_community", 404)
                    } else {
                        json(
                            request,
                            JSONObject()
                                .put(
                                    "community_view",
                                    Lemmy.communityView(
                                        known ?: Tildes.Group(name, null, false, 0, 0),
                                        subscribers[name] ?: 0,
                                        sidebar = sidebars[name],
                                    ),
                                )
                                .put("moderators", JSONArray())
                                .put("discussion_languages", JSONArray().put(0)),
                        )
                    }
                }
            }

            uri == "/community/follow" -> {
                val name = groupNameFor(body.optInt("community_id"), null)
                if (token == null || name == null) {
                    error(request, "not_logged_in", 401)
                } else {
                    val follow = body.optBoolean("follow")
                    Tildes.subscribeGroup(name, follow)
                    groupCache = emptyList()
                    json(
                        request,
                        JSONObject().put(
                            "community_view",
                            // Carrying the panel back, since Boost rebuilds
                            // its model off this answer and a subscribe would
                            // otherwise blank the sidebar it was pressed from.
                            Lemmy.communityView(
                                Tildes.Group(name, null, follow, 0, 0),
                                subscribers[name] ?: 0,
                                sidebar = sidebars[name],
                            ),
                        ).put("discussion_languages", JSONArray().put(0)),
                    )
                }
            }

            uri == "/post/list" -> {
                val page = q("page")?.toIntOrNull() ?: 1
                val sort = q("sort")
                val name = groupNameFor(q("community_id")?.toIntOrNull(), q("community_name"))
                val saved = q("saved_only")?.toBoolean() == true
                val liked = q("liked_only")?.toBoolean() == true
                // Tildes has no downvote, so there is no list of them. Ignoring
                // a topic is the nearest thing it has to a negative signal, and
                // that does keep a list.
                val disliked = q("disliked_only")?.toBoolean() == true

                val key = when {
                    saved -> BOOKMARKED_TOPICS
                    liked -> VOTED_TOPICS
                    disliked -> IGNORED_TOPICS
                    else -> "posts|" + (name ?: "home") + "|" + sort + "|" + q("type_")
                }

                // Boost pages by cursor: it sends back whatever next_page it
                // was last given, as page_cursor, and no page number at all.
                // Reading only the number served the front page every time,
                // which reads as a feed that will not scroll. The numeric path
                // stays for clients that use it.
                val after = q("page_cursor") ?: cursor(key, page)

                // Tildes has no ~all; its front page is the aggregate view.
                val mine = saved || liked || disliked

                /*
                 * A tag opened from a topic, which arrives as a community
                 * because a community is the one listing Boost knows how to
                 * follow. The name it asks for is tildes.net's own URL for the
                 * listing, so what comes back out of it is the group to fetch
                 * and the tag to filter by. See [Lemmy.TagListing].
                 */
                val tagged = Lemmy.tagListing(name)

                /*
                 * And a group asked for with its subgroups, which arrives the
                 * same way and for the same reason. The name is the site's own
                 * URL for it, so the group to fetch comes back out of it and
                 * the flag is the whole of what else it says.
                 */
                val subgrouped = Lemmy.subgroupListing(name)

                /*
                 * History pages the same way everything else does, off the
                 * cursor rather than the page number, since Boost sends no
                 * number at all. The cursor here is just the next page, there
                 * being nothing upstream to carry.
                 *
                 * Answered before the path below is built rather than after,
                 * because building one is what remembers the order and window
                 * a feed was last asked for -- and this screen keeps its own,
                 * which would otherwise be written over the front page's.
                 */
                if (name == HISTORY) {
                    return historyListing(
                        request, sort, q("page_cursor")?.toIntOrNull() ?: page, q("limit"),
                    )
                }

                val listing = when {
                    saved -> tabbedPath(BOOKMARKS, "topic", after)
                    liked -> tabbedPath(VOTES, "topic", after)
                    disliked -> IGNORED + (after?.let { "?after=$it" } ?: "")
                    tagged != null -> buildListingPath(
                        tagged.group,
                        sort,
                        after,
                        q("limit")?.toIntOrNull(),
                        Lemmy.tagSlug(tagged.tag),
                    )
                    subgrouped != null -> buildListingPath(
                        subgrouped.group,
                        sort,
                        after,
                        q("limit")?.toIntOrNull(),
                        allSubgroups = true,
                    )
                    else -> buildListingPath(name, sort, after, q("limit")?.toIntOrNull())
                }

                val html = try {
                    if ((mine && token == null) || pastEnd(key, page, q("page_cursor"))) null
                    else Tildes.getHtml(listing)
                } catch (e: TildesException) {
                    // A 404 on a listing for a group the site does not list is
                    // the site saying there is no such group, and Boost draws a
                    // screen for that where a refusal is a toast reading 503.
                    // The `/community` call beside it has answered this way
                    // since Feedback and support turned up -- that row opens a
                    // Lemmy community -- and the two arrive together, so the
                    // pair disagreeing means one screen with both answers on it.
                    //
                    // **Signing out is the other way in.** Boost falls back to
                    // its own default community, which is a Lemmy one, while
                    // this end is still answering for Tildes.
                    //
                    // Both halves have to hold, the way they do there: a 404,
                    // and a name the group list has never had. Anything else is
                    // a page that could not be read right now, and that is worth
                    // travelling as the failure it is.
                    //
                    // A site-wide tag listing has no group to blame, and the
                    // front page under it does not 404, so it takes the throw.
                    val named = when {
                        tagged != null -> tagged.group
                        subgrouped != null -> subgrouped.group
                        else -> name
                    }
                    if (e.status == 404 && named != null && groups().none { it.name == named }) {
                        return error(request, "couldnt_find_community", 404)
                    }
                    throw e
                }
                if (html != null && !mine) {
                    // A tag listing is a group's own page with the site's
                    // filter on it, sidebar and all, so what it says about the
                    // group is worth keeping under the group's own name rather
                    // than under the name of the filter. A site-wide one is the
                    // front page, which is nobody's sidebar, so it notes
                    // nothing. A group with its subgroups is the group's own
                    // page too, and the same reading applies.
                    when {
                        tagged != null -> tagged.group
                        subgrouped != null -> subgrouped.group
                        else -> name
                    }?.let { noteGroupPage(it, html) }
                }
                val topics = html?.let { Tildes.parseTopicListing(it) }.orEmpty()
                    .map { rememberTopic(it) }
                val next = html?.let { Tildes.nextCursor(it) }
                rememberCursor(key, page, next)

                val subs = groups().filter { it.subscribed }.map { it.name }.toSet()
                val arr = JSONArray().apply {
                    topics.forEach { put(Lemmy.postView(it, subs.contains(it.group))) }
                }
                json(request, JSONObject().put("posts", arr).put("next_page", next))
            }

            /*
             * Tildes' own form takes a title, a link, markdown and tags, and
             * `custom_thumbnail` is the tags. Boost's composer draws that field
             * for the thumbnail a Lemmy link post can carry, and Tildes has no
             * thumbnails at all, so it is the one input on the screen with
             * nothing behind it and the right shape to carry these: free text
             * the app sends untouched and never draws. The patch renames it and
             * `composerFields` fills it in when a topic is opened for editing.
             */
            uri == "/post" && request.method == "POST" -> {
                val group = groupNameFor(body.optInt("community_id"), null)
                val title = body.optString("name")
                if (token == null || group == null || title.isEmpty()) {
                    error(request, "not_logged_in", 401)
                } else {
                    val id36 = Tildes.createTopic(
                        group = group,
                        title = title,
                        link = body.optString("url").ifEmpty { null },
                        markdown = body.optString("body").ifEmpty { null },
                        tags = body.optString("custom_thumbnail").ifEmpty { null },
                    )
                    // Boost reads the new post out of the answer and dies on a
                    // NullPointerException without one, so the topic is read
                    // back off the redirect the create answered with.
                    val created = id36?.let {
                        val path = Tildes.resolveTopicPath(it)
                        Tildes.parseTopicPage(Tildes.getHtml(path, noCache = true), path).topic
                    }
                    created?.let { rememberTopic(it) }
                    json(
                        request,
                        JSONObject().apply {
                            if (created != null) put("post_view", Lemmy.postView(created))
                        },
                    )
                }
            }

            uri == "/post" && request.method == "PUT" -> {
                val id = body.optInt("post_id")
                if (token == null || id == 0) {
                    error(request, "not_logged_in", 401)
                } else {
                    val id36 = Lemmy.intToId36(id)
                    val path = Tildes.resolveTopicPath(id36)
                    // What the topic carries now, for two reasons: the tag line
                    // under the body has to come off what Boost hands back, and
                    // Tildes will not retag without being told what it is
                    // replacing. Usually free, since the topic was open a moment
                    // ago and its page is still in the cache.
                    val before = Tildes.parseTopicPage(Tildes.getHtml(path), path).topic
                    // First, since it is the one edit that changes the topic's
                    // address, and the read at the end of this wants the new
                    // one rather than a redirect to it.
                    regroup(id36, body, before)
                    retitle(id36, body, before)
                    relink(id36, body, before)
                    retext(id36, body, before)
                    retag(id36, body, before)
                    val now = Tildes.resolveTopicPath(id36)
                    val edited = Tildes.parseTopicPage(
                        Tildes.getHtml(now, noCache = true), now,
                    ).topic
                    edited?.let { rememberTopic(it) }
                    val view = edited ?: topics[id36]
                    json(
                        request,
                        JSONObject().apply {
                            if (view != null) put("post_view", Lemmy.postView(view))
                        },
                    )
                }
            }

            // Reading a topic, and the branch every other method falls into,
            // so it stays below the writes above.
            uri == "/post" -> {
                val id = q("id")?.toIntOrNull()
                // Which comment the topic was opened on, if it was opened on
                // one. Boost asks for the topic and its comments in two calls
                // and puts this on only the first, so it is remembered here for
                // the second. See [rootedAt].
                if (id != null) {
                    val on = q("comment_id")?.toIntOrNull()
                    if (on != null) openedOn[id] = on else openedOn.remove(id)
                    // Kept where [openedOn] is dropped, which is the difference
                    // between the two. See [pointedAt].
                    if (on != null) {
                        pointedAt[Lemmy.intToId36(id)] = Lemmy.intToId36(on)
                    }
                }
                if (id == null) {
                    error(request, "couldnt_find_post", 404)
                } else {
                    val topicPath = Tildes.resolveTopicPath(Lemmy.intToId36(id))
                    val page = Tildes.parseTopicPage(Tildes.getHtml(topicPath), topicPath)
                    val topic = page.topic
                    if (topic == null) {
                        error(request, "couldnt_find_post", 404)
                    } else {
                        // The whole page rather than the topic off it, because
                        // the next call is `/comment/list` naming a comment and
                        // no topic, and this is where the pairing it needs is
                        // read. See [commentTopics].
                        rememberComments(page)
                        noteVisit(topic)
                        val subs = groups().filter { it.subscribed }.map { it.name }.toSet()
                        json(
                            request,
                            JSONObject()
                                .put("post_view", Lemmy.postView(topic, subs.contains(topic.group)))
                                .put(
                                    "community_view",
                                    Lemmy.communityView(
                                        Tildes.Group(
                                            topic.group,
                                            null,
                                            subs.contains(topic.group),
                                            0,
                                            0,
                                        ),
                                        subscribers[topic.group] ?: 0,
                                    ),
                                )
                                .put("moderators", JSONArray())
                                .put("cross_posts", JSONArray()),
                        )
                    }
                }
            }

            uri == "/comment/list" -> {
                // A thread asked for by comment rather than by topic, which is
                // what Boost asks for when the row it was opened from named a
                // parent. Tildes has no route for one, so the topic is read the
                // way it always is and cut to the part that was asked for.
                val below = q("parent_id")?.toIntOrNull()
                    ?.let { Lemmy.intToId36(it) }
                    ?.takeIf { it != "0" }
                below?.let { commentTopics[it] }?.let { pointedAt[it] = below }
                val postId = q("post_id")?.toIntOrNull()
                    ?: below?.let { commentTopics[it] }?.let { Lemmy.id36ToInt(it) }
                if (postId == null) {
                    json(request, JSONObject().put("comments", JSONArray()))
                } else {
                    val topicPath = Tildes.resolveTopicPath(Lemmy.intToId36(postId))
                    val page = Tildes.parseTopicPage(
                        Tildes.getHtml(topicPath + commentOrder(q("sort"))), topicPath,
                    )
                    rememberComments(page)
                    val topic = page.topic
                    if (topic == null) {
                        error(request, "couldnt_find_post", 404)
                    } else {
                        val comments =
                            if (below != null) contextFor(page.comments, below)
                            else rootedAt(page.comments, openedOn[postId])
                        val arr = JSONArray().apply {
                            comments.forEach { put(Lemmy.commentView(it, topic)) }
                        }
                        json(request, JSONObject().put("comments", arr))
                    }
                }
            }

            uri == "/post/delete" -> {
                val id = body.optInt("post_id")
                // Tildes deletes for good, so Boost asking to undelete is the
                // one case where saying no is better than pretending.
                val wanted = body.optBoolean("deleted", true)
                val known = topics[Lemmy.intToId36(id)]
                when {
                    token == null || id == 0 -> error(request, "not_logged_in", 401)
                    !wanted -> error(request, "couldnt_update_post", 400)
                    else -> {
                        Tildes.deleteTopic(Lemmy.intToId36(id))
                        json(
                            request,
                            JSONObject().apply {
                                if (known != null) {
                                    put("post_view", Lemmy.postView(known, deleted = true))
                                }
                            },
                        )
                    }
                }
            }

            uri == "/post/like" -> {
                val id = body.optInt("post_id")
                if (token == null || id == 0) {
                    error(request, "not_logged_in", 401)
                } else {
                    // Tildes has one vote; anything but a clear upvote clears it.
                    val id36 = Lemmy.intToId36(id)
                    val up = body.optInt("score") > 0
                    Tildes.voteTopic(id36, up)
                    // The count is moved by one here rather than read back,
                    // which is what Boost does to its own row while the request
                    // is in flight. It is right until the page is read again,
                    // and reading it again to be sure would cost a request per
                    // vote.
                    json(
                        request,
                        JSONObject().put(
                            "post_view",
                            changedTopic(id36) { topic ->
                                topic.copy(
                                    voted = up,
                                    numVotes = topic.numVotes + when {
                                        up == topic.voted -> 0
                                        up -> 1
                                        else -> -1
                                    },
                                )
                            },
                        ),
                    )
                }
            }

            /*
             * Boost's hide. Tildes calls it ignoring, and it is the same idea:
             * the topic stops appearing in listings and lands on a page of its
             * own, which is what the downvoted tab reads.
             */
            uri == "/post/hide" -> {
                // Lemmy moved this from one id to a list of them, so both shapes
                // are read rather than guessing which Boost sends.
                val ids = body.optJSONArray("post_ids")?.let { array ->
                    (0 until array.length()).map { array.optInt(it) }
                } ?: listOf(body.optInt("post_id"))
                val wanted = ids.filter { it != 0 }

                if (token == null || wanted.isEmpty()) {
                    error(request, "not_logged_in", 401)
                } else {
                    val hide = body.optBoolean("hide", true)
                    val id36s = wanted.map { Lemmy.intToId36(it) }
                    id36s.forEach { id36 ->
                        Tildes.ignoreTopic(id36, hide)
                        // Kept as well as sent, so a History row and anything
                        // else drawn from this map agree with the site before
                        // its page is read again.
                        noteTopic(id36) { topic -> topic.copy(ignored = hide) }
                    }
                    json(request, JSONObject().put("success", true))
                }
            }

            uri == "/post/save" -> {
                val id = body.optInt("post_id")
                if (token == null || id == 0) {
                    error(request, "not_logged_in", 401)
                } else {
                    val id36 = Lemmy.intToId36(id)
                    val saved = body.optBoolean("save")
                    Tildes.bookmarkTopic(id36, saved)
                    // Answered with the topic it changed, since Boost
                    // dereferences that without checking. No request behind it:
                    // the topic is the one this last parsed, carrying the
                    // bookmark Tildes has just accepted.
                    json(
                        request,
                        JSONObject().put(
                            "post_view",
                            changedTopic(id36) { it.copy(bookmarked = saved) },
                        ),
                    )
                }
            }

            uri == "/comment/like" -> {
                val id = body.optInt("comment_id")
                if (token == null || id == 0) {
                    error(request, "not_logged_in", 401)
                } else {
                    Tildes.voteComment(Lemmy.intToId36(id), body.optInt("score") > 0)
                    json(request, JSONObject())
                }
            }

            uri == "/comment" && request.method == "POST" -> {
                val postId = body.optInt("post_id")
                val parentId = if (body.has("parent_id")) body.optInt("parent_id") else 0
                val content = body.optString("content")
                if (token == null || postId == 0 || content.isEmpty()) {
                    error(request, "not_logged_in", 401)
                } else {
                    val newId = Tildes.postComment(
                        topicId36 = Lemmy.intToId36(postId),
                        parentId36 = if (parentId != 0) Lemmy.intToId36(parentId) else null,
                        markdown = content,
                    )
                    if (newId == null) {
                        json(request, JSONObject().put("recipient_ids", JSONArray()))
                    } else {
                        commentTopics[newId] = Lemmy.intToId36(postId)
                        json(request, commentResponse(newId))
                    }
                }
            }

            uri == "/comment" && request.method == "PUT" -> {
                val id = body.optInt("comment_id")
                val content = body.optString("content")
                if (token == null || id == 0 || content.isEmpty()) {
                    error(request, "not_logged_in", 401)
                } else {
                    val id36 = Lemmy.intToId36(id)
                    // The editor is filled with the comment as drawn, labels
                    // and all, so the line this end wrote over it comes back
                    // off here. See [Lemmy.withoutLabelLine].
                    Tildes.editComment(id36, Lemmy.withoutLabelLine(content))
                    json(request, commentResponse(id36))
                }
            }

            uri == "/comment/save" -> {
                val id = body.optInt("comment_id")
                if (token == null || id == 0) {
                    error(request, "not_logged_in", 401)
                } else {
                    val id36 = Lemmy.intToId36(id)
                    Tildes.bookmarkComment(id36, body.optBoolean("save"))
                    // And the comment it changed, read back the way an edit is:
                    // a comment is not kept whole anywhere, and the answer has
                    // to carry the whole post around it either way.
                    json(request, commentResponse(id36))
                }
            }

            uri == "/comment/delete" -> {
                val id = body.optInt("comment_id")
                if (token == null || id == 0) {
                    error(request, "not_logged_in", 401)
                } else {
                    Tildes.deleteComment(Lemmy.intToId36(id))
                    json(request, JSONObject())
                }
            }

            uri == "/search" -> {
                val term = q("q").orEmpty().trim()
                val type = q("type_") ?: "All"
                val result = JSONObject().put("type_", type)
                    .put("comments", JSONArray()).put("posts", JSONArray())
                    .put("communities", JSONArray()).put("users", JSONArray())

                when {
                    term.isEmpty() -> {}
                    type == "Communities" -> {
                        val hits = groups().filter {
                            it.name.contains(term, true) ||
                                (it.description ?: "").contains(term, true)
                        }
                        result.put(
                            "communities",
                            JSONArray().apply {
                                pageOf(hits, q("page"), q("limit"))
                                    .forEach { put(Lemmy.communityView(it, subscribers[it.name] ?: 0)) }
                            },
                        )
                    }
                    /*
                     * The Comments tab, which is the Tags tab here.
                     *
                     * Tildes searches topics and nothing else, so a comment
                     * search had no answer at all and the tab drew an empty
                     * list whatever was typed. What the site does have is a
                     * listing filtered by tag, and no way in but pressing one
                     * -- so the tab that could not work becomes the way to ask
                     * for a tag by name. `searchTabName` words it.
                     *
                     * **The type is what tells it apart.** Every other tab and
                     * every other screen that searches sends something else,
                     * and `Comments` reaches here from one fragment only, so
                     * nothing has to be marked or remembered between the tab
                     * and the request.
                     *
                     * Site-wide, because that screen carries no group: it is
                     * opened with a query and a type and nothing else. The
                     * scoped half of the same listing is already reachable by
                     * pressing a tag under a topic.
                     *
                     * The order the search menu offers is honoured and **not**
                     * written down, since this screen keeps its own the way
                     * History does.
                     */
                    type == "Comments" -> {
                        val tag = Lemmy.tagText(term.removePrefix("#").trim())
                        val page = q("page")?.toIntOrNull() ?: 1
                        val key = "tag|" + tag + "|" + q("sort")
                        val after = q("page_cursor") ?: cursor(key, page)

                        val html =
                            if (pastEnd(key, page, q("page_cursor"))) null
                            else Tildes.getHtml(
                                buildListingPath(
                                    null,
                                    q("sort"),
                                    after,
                                    q("limit")?.toIntOrNull(),
                                    Lemmy.tagSlug(tag),
                                    remember = false,
                                ),
                            )
                        rememberCursor(key, page, html?.let { Tildes.nextCursor(it) })
                        val topics = html?.let { Tildes.parseTopicListing(it) }.orEmpty()
                            .map { rememberTopic(it) }
                        result.put(
                            "posts",
                            JSONArray().apply { topics.forEach { put(Lemmy.postView(it)) } },
                        )
                    }
                    type == "Users" -> {
                        // Tildes has no user search, so the term is read as a
                        // username and the one profile it names is the whole
                        // result. A name nobody holds answers 404, and page two
                        // has nothing left to list.
                        val who = term.removePrefix("@").substringBefore('@')
                        val page = q("page")?.toIntOrNull() ?: 1
                        val html =
                            if (page > 1) null
                            else try {
                                Tildes.getHtml("/user/" + URLEncoder.encode(who, "UTF-8"))
                            } catch (e: TildesException) {
                                if (e.status == 404) null else throw e
                            }
                        val profile = html?.let { Tildes.parseUserProfile(it) }
                        if (profile != null) {
                            val found = profile.username ?: who
                            profiles[found] = profile
                            result.put(
                                "users",
                                JSONArray().put(
                                    Lemmy.personView(found, profile.registered, profile.bioHtml),
                                ),
                            )
                        }
                    }
                    else -> {
                        val name = groupNameFor(q("community_id")?.toIntOrNull(), q("community_name"))
                        val base = if (name != null) "/~$name/search" else "/search"

                        // Search results carry the same Next link the feed
                        // does, while Lemmy has no cursor on this call, so the
                        // page number is what maps back onto it.
                        val page = q("page")?.toIntOrNull() ?: 1
                        val key = "search|" + (name ?: "all") + "|" + term
                        val after = q("page_cursor") ?: cursor(key, page)

                        val url = StringBuilder(base)
                            .append("?q=").append(URLEncoder.encode(term, "UTF-8"))
                        after?.let { url.append("&after=").append(it) }

                        val html =
                            if (pastEnd(key, page, q("page_cursor"))) null
                            else Tildes.getHtml(url.toString())
                        rememberCursor(key, page, html?.let { Tildes.nextCursor(it) })
                        val topics = html?.let { Tildes.parseTopicListing(it) }.orEmpty()
                            .map { rememberTopic(it) }
                        result.put(
                            "posts",
                            JSONArray().apply { topics.forEach { put(Lemmy.postView(it)) } },
                        )
                    }
                }
                json(request, result)
            }

            uri == "/user" -> {
                val name = q("username")?.removePrefix("@")?.substringBefore('@')
                    ?: q("person_id")?.toIntOrNull()?.let { Lemmy.userName(it) }
                val page = q("page")?.toIntOrNull() ?: 1
                when {
                    name.isNullOrEmpty() -> error(request, "couldnt_find_person", 404)

                    /*
                     * The All posts tab, which asks what the Topics tab asks
                     * and says so with a sentinel where a person's id goes.
                     * See `profileTabBuilt`.
                     *
                     * It is one fetch rather than the two below, and the page
                     * it gets is the site's own: twenty items of both kinds in
                     * the order Tildes drew them. The order is left for the
                     * list to rebuild, since Lemmy's shape splits them into two
                     * arrays and a topic among comments would float to the top.
                     */
                    q("person_id")?.toIntOrNull() == OVERVIEW_MARKER -> {
                        val html = overviewListing(name, page)
                        val profile = html?.let { Tildes.parseUserProfile(it) }
                        val who = profile?.username ?: name
                        profile?.let { profiles[who] = it }
                        val topics = html?.let { Tildes.parseTopicListing(it) }.orEmpty()
                            .map { rememberTopic(it) }
                        val comments = html?.let { Tildes.parseUserComments(it) }.orEmpty()
                        rememberCommentTopics(comments)
                        pendingOverview = html?.let { Tildes.mergedOrder(it) }.orEmpty()
                        json(request, personDetails(who, topics, comments))
                    }

                    /*
                     * The Votes tab, which asks the same way the All posts tab
                     * does and for the same reason: nothing else about its
                     * request says which tab it is.
                     *
                     * Boost pages that tab through `post/list` with
                     * `liked_only`, and a `GetPostsResponse` has nowhere for a
                     * comment to sit, so it could only ever have drawn half of
                     * what Tildes has there. `likedTakesPostList` is what sends
                     * it down this route instead, where both lists fit in one
                     * answer and the merge the Bookmarks tab already uses draws
                     * them.
                     */
                    q("person_id")?.toIntOrNull() == VOTES_MARKER ->
                        if (token == null || !name.equals(Tildes.username, ignoreCase = true)) {
                            json(request, personDetails(name, emptyList(), emptyList()))
                        } else {
                            json(request, votes(name, page))
                        }

                    // Boost's saved tab asks for a profile with this set, and
                    // answering with the profile is what showed posts there.
                    // Tildes keeps bookmarks on a page of their own, and only
                    // ever your own.
                    q("saved_only")?.toBoolean() == true ->
                        if (token == null || !name.equals(Tildes.username, ignoreCase = true)) {
                            json(request, personDetails(name, emptyList(), emptyList()))
                        } else {
                            json(request, bookmarks(name, page))
                        }

                    else -> {
                        /*
                         * A profile splits into its two listings only for a
                         * signed-in viewer. Logged out, Tildes drops `type` and
                         * `after` and answers with one merged page of twenty
                         * however it is asked, so page two repeats page one and
                         * the one page serves both halves.
                         *
                         * **Signed in, only the half that was asked for is
                         * fetched.** Boost's Topics tab and its Comments tab
                         * send the same request and read a different array out
                         * of the answer, so filling both meant a page upstream
                         * was paid for and thrown away every time either tab
                         * drew -- and with All posts in front of them, the one
                         * thrown away was the one nobody had opened yet. The
                         * Comments tab says it is the comments one the same way
                         * All posts says it is itself.
                         *
                         * What is left unmarked -- the screen's own fetch for
                         * the name, the bio and the registration date -- reads
                         * the topics page, which is the one the Topics tab
                         * behind it wants anyway, so the two share a fetch
                         * rather than costing one each.
                         */
                        val wantsComments =
                            q("person_id")?.toIntOrNull() == COMMENTS_MARKER
                        val sort = q("sort")
                        val merged =
                            if (token != null || page > 1) null
                            else Tildes.getHtml("/user/" + URLEncoder.encode(name, "UTF-8"))
                        val topicsHtml = when {
                            token == null -> merged
                            wantsComments -> null
                            else -> userListing(name, "topic", page, userOrder(sort, "topic"))
                        }
                        val commentsHtml = when {
                            token == null -> merged
                            wantsComments ->
                                userListing(name, "comment", page, userOrder(sort, "comment"))
                            else -> null
                        }

                        val profile = (topicsHtml ?: commentsHtml)
                            ?.let { Tildes.parseUserProfile(it) }
                        val who = profile?.username ?: name
                        profile?.let { profiles[who] = it }
                        val topics = topicsHtml?.let { Tildes.parseTopicListing(it) }.orEmpty()
                            .map { rememberTopic(it) }
                        val comments = commentsHtml?.let { Tildes.parseUserComments(it) }.orEmpty()
                        rememberCommentTopics(comments)
                        json(request, personDetails(who, topics, comments))
                    }
                }
            }

            /*
             * Boost hands this whatever was tapped or pasted, and Tildes URLs
             * carry their own shape: `/~group/id36` is a topic, `/~group` a
             * group, `/user/name` a person.
             */
            uri == "/resolve_object" -> {
                val asked = q("q").orEmpty()
                /*
                 * Both spellings of the tilde, since the interceptor writes one
                 * into the links it builds and a browser's address bar writes
                 * the other. Tildes serves `/%7Egroup` as the group's own page,
                 * so the two are the same address rather than one being a way
                 * around the other.
                 */
                val target = asked
                    .replace(Regex("^https?://[^/]+"), "")
                    .replace(Regex("%7[Ee]"), "~")
                // `tild.es/1vlp` is the site's own short form, and the one this
                // app shares and copies, so it is the link most likely to be
                // tapped from somewhere else on the phone.
                val short = Tildes.shortLinkId36(asked)
                val anchored = Regex("#comment-([a-z0-9]+)$").find(target)
                val topic = Regex("^/~([A-Za-z0-9_.]+)/([A-Za-z0-9]+)").find(target)
                    ?.takeIf { it.groupValues[2] !in GROUP_ROUTES }
                val group = Regex("^/~([A-Za-z0-9_.]+)/?$").find(target)
                val user = Regex("^/user/([^/]+)").find(target)
                when {
                    topic != null || short != null -> {
                        val id36 = topic?.groupValues?.get(2) ?: short!!
                        val path = Tildes.resolveTopicPath(id36)
                        val page = Tildes.parseTopicPage(Tildes.getHtml(path), path)
                        val found = page.topic
                        // A comment's own address is the topic's with the
                        // comment named after it, and Boost has a route for
                        // exactly that: it opens the topic scrolled to the
                        // comment rather than the topic from the top.
                        val comment = anchored
                            ?.let { at -> page.comments.find { it.id36 == at.groupValues[1] } }
                        when {
                            found == null -> error(request, "couldnt_find_object", 404)
                            comment != null -> {
                                rememberComments(page)
                                json(
                                    request,
                                    JSONObject()
                                        .put("comment", Lemmy.commentView(comment, found)),
                                )
                            }
                            else -> json(request, JSONObject().put("post", Lemmy.postView(found)))
                        }
                    }
                    group != null -> {
                        val name = group.groupValues[1]
                        json(
                            request,
                            JSONObject().put(
                                "community",
                                Lemmy.communityView(
                                    // Off the group list rather than made up,
                                    // so a group opened from a link arrives
                                    // knowing whether it is subscribed to.
                                    groups().find { it.name == name }
                                        ?: Tildes.Group(name, null, false, 0, 0),
                                    subscribers[name] ?: 0,
                                    sidebar = sidebars[name],
                                ),
                            ),
                        )
                    }
                    user != null ->
                        json(
                            request,
                            JSONObject().put("person", Lemmy.personView(user.groupValues[1])),
                        )
                    else -> error(request, "couldnt_find_object", 404)
                }
            }

            /*
             * Boost asks for a link's title and picture whenever a post
             * composer opens, and dies on a NullPointerException if the
             * metadata object is missing. Tildes runs no such service and
             * fetching arbitrary pages is not this interceptor's job, so the
             * object is there and empty.
             */
            uri == "/post/site_metadata" ->
                json(request, JSONObject().put("metadata", JSONObject()))

            // Tildes marks things read off the back of the pages being fetched,
            // so there is nothing to tell it here.
            uri == "/post/mark_as_read" -> json(request, JSONObject().put("success", true))

            /*
             * Answered off the header of the last page fetched for anything
             * else, so it costs nothing upstream. See [Tildes.unreadCounts] for
             * why this must not be the page it is counting.
             *
             * **The notifications go under `replies`.** Tildes counts a reply
             * and a mention as one thing -- "3 new comments" beside the
             * username, and no split anywhere on the page -- while Lemmy has a
             * number for each. Boost adds all three up for the badge, which is
             * the number a person sees, so the total is right where it is read;
             * the inbox's own Mentions tab draws a badge of its own off the
             * second, and that one reads zero until [inbox] has separated them.
             *
             * Nothing seen yet answers zero rather than guessing, which is what
             * Boost starts at anyway.
             */
            uri == "/user/unread_count" -> {
                val waiting = if (token != null) Tildes.unreadCounts else null
                json(
                    request,
                    JSONObject().put("replies", waiting?.notifications ?: 0)
                        .put("mentions", 0)
                        .put("private_messages", waiting?.messages ?: 0),
                )
            }

            uri == "/user/replies" -> json(request, inbox(q, mentions = false))
            uri == "/user/mention" -> json(request, inbox(q, mentions = true))

            uri == "/user/mark_all_as_read" -> {
                // Tildes marks everything older than one notification alongside
                // it, so the newest unread one clears the lot.
                Tildes.parseNotifications(Tildes.getHtml(NOTIFICATIONS_UNREAD, noCache = true))
                    .firstOrNull()
                    ?.let { Tildes.markNotificationRead(it.comment.id36, andOlder = true) }
                Tildes.notificationsRead(all = true)
                json(request, JSONObject().put("replies", JSONArray()))
            }

            /*
             * Marking one notification read, which is what tapping an unread
             * one in the inbox does on its way to the comment.
             *
             * **The answer has to be the row Boost drew**, under the name that
             * route's own response class gives it: `comment_reply_view` here and
             * `person_mention_view` next door. Anything else deserializes to a
             * null field, and Boost reads `comment.path` off it with no check --
             * on the main thread, from a callback whose only catch is for its own
             * exception type. So the wrong key is not a failed write, it is the
             * app dying and coming back on the front page, with the tap's own
             * screen already open behind it. `PITFALLS.md` has the walk that
             * found it.
             *
             * A row this has never drawn cannot be built, and **an error is the
             * safe answer** where an empty object is not: Boost's error callback
             * for this call is empty, so it does nothing and nothing dies.
             */
            uri == "/comment/mark_as_read" || uri == "/user/mention/mark_as_read" -> {
                val mention = uri == "/user/mention/mark_as_read"
                val id = if (mention) body.optInt("person_mention_id")
                else body.optInt("comment_reply_id")
                val read = body.optBoolean("read", true)
                val seen = inboxComments[id]
                val me = Tildes.username
                if (seen == null || me == null) {
                    error(request, "couldnt_find_comment", 404)
                } else {
                    // Tildes has no way to make one unread again, so it is told
                    // only about the half it can do.
                    if (read) {
                        Tildes.markNotificationRead(seen.comment.id36)
                        Tildes.notificationsRead(all = false)
                    }
                    json(
                        request,
                        JSONObject().put(
                            if (mention) "person_mention_view" else "comment_reply_view",
                            Lemmy.inboxCommentView(
                                seen.comment, seen.topic, me, read, mention,
                            ),
                        ),
                    )
                }
            }

            /*
             * Two shapes behind one call. With no creator this is the inbox
             * list, which reads the thread pages only, since fetching every
             * thread's text first took four seconds and Boost gave up before
             * the answer arrived. Boost then asks again naming a creator when
             * a thread is opened, and that is when the text is worth reading.
             */
            uri == "/private_message/list" -> {
                val arr = JSONArray()
                val me = Tildes.username
                if (token != null && me != null) {
                    val creator = q("creator_id")?.toIntOrNull()
                    val page = q("page")?.toIntOrNull()?.coerceAtLeast(1) ?: 1
                    // Boost pages a thread 25 at a time and the inbox 50, so the
                    // skip has to follow the limit it sent rather than either.
                    val limit = (q("limit")?.toIntOrNull() ?: PAGE).coerceIn(1, 100)
                    val skip = (page - 1) * limit

                    if (creator == null) {
                        conversations(q("unread_only")?.toBoolean() == true)
                            .drop(skip).take(limit)
                            .forEach { arr.put(rememberMessage(Lemmy.conversationView(it, me))) }
                    } else {
                        /*
                         * One thread, since the list above hands out a person
                         * per conversation, though an id naming a person rather
                         * than a thread still answers with all of theirs.
                         *
                         * Boost draws a thread bottom-up, so what it is handed
                         * has to run newest first or the messages read out of
                         * order. The index stays where the message sits in its
                         * own thread, since that is what its id is built from
                         * and what puts the subject on the first line.
                         *
                         * Paged like everything else, and for the reason every
                         * listing here is: Boost appends what it is handed on
                         * every scroll and never asks whether it has seen it
                         * before, so answering the whole thread each time draws
                         * the same messages again under themselves, forever. A
                         * page past the end has to come back empty.
                         */
                        threadsFor(creator, me)
                            .flatMap { conversation ->
                                Tildes.parseConversation(
                                    Tildes.getHtml(Tildes.conversationPath(conversation.id36))
                                ).mapIndexed { i, message -> Triple(conversation, message, i) }
                            }
                            .sortedByDescending { it.second.sentAt ?: "" }
                            .drop(skip).take(limit)
                            .forEach { (conversation, message, i) ->
                                arr.put(
                                    rememberMessage(
                                        Lemmy.privateMessageView(conversation, message, i, me),
                                    ),
                                )
                            }
                    }
                }
                json(request, JSONObject().put("private_messages", arr))
            }

            /*
             * Lemmy's send carries a person and no thread, so a reply and the
             * start of a conversation are the same call. The inbox is what
             * separates them here: it hands Boost a person per conversation, so
             * a reply comes back naming the thread it was sent from, while a
             * message begun anywhere else -- a profile, the search tab -- names
             * the person alone and starts a new thread with them.
             *
             * Which is the answer to the older problem as well. Continuing
             * whatever thread existed was the only thing available before, and
             * it meant a fresh conversation with someone you had written to
             * landed as a reply to the old one.
             */
            uri == "/private_message" && request.method == "POST" -> {
                val me = Tildes.username
                val personId = body.optInt("recipient_id")
                val recipient = Lemmy.userName(personId)
                val content = body.optString("content")
                when {
                    token == null || me == null -> error(request, "not_logged_in", 401)
                    recipient == null -> error(request, "couldnt_find_person", 404)
                    content.isEmpty() ->
                        error(request, "couldnt_create_private_message", 400)
                    else -> {
                        val existing = threadFor(personId, me)
                        val thread = if (existing != null) {
                            Tildes.replyToConversation(existing.id36, content)
                            existing
                        } else {
                            // The first line names the thread and the rest is
                            // the message, which is the only place a subject
                            // can come from. A one-line message is its own
                            // subject rather than arriving empty.
                            val subject = content.lineSequence().first().trim()
                                .ifEmpty { "(no subject)" }.take(200)
                            val rest = content.substringAfter('\n', "").trim()
                            Tildes.sendMessage(recipient, subject, rest.ifEmpty { content })
                            // The newest thread with them, which is the one
                            // just written: the write cleared the page cache
                            // and the list comes back by last activity.
                            threadWith(recipient)
                        }

                        json(
                            request,
                            JSONObject().apply {
                                sentMessage(thread, me)?.let { put("private_message_view", it) }
                            },
                        )
                    }
                }
            }

            /*
             * Opening a thread is what marks it read on Tildes, and the list
             * above already fetched it. The count the badge draws still has to
             * be told, since no page was fetched for this.
             *
             * And the answer is the row again, for the reason the one above is:
             * Boost reads `private_message.id` straight off it with no check, so
             * an empty object kills the app rather than failing the write.
             */
            uri == "/private_message/mark_as_read" -> {
                val drawn = drawnMessages[body.optInt("private_message_id")]
                val read = body.optBoolean("read", true)
                if (drawn == null) {
                    error(request, "couldnt_find_private_message", 404)
                } else {
                    if (read) Tildes.messageRead()
                    drawn.getJSONObject("private_message").put("read", read)
                    json(request, JSONObject().put("private_message_view", drawn))
                }
            }
            /*
             * Boost's uploads tab. Tildes hosts no images at all -- there is no
             * pictrs behind it and never was -- so this is empty rather than
             * unanswered, which left the tab spinning. An actual upload still
             * fails, which is the honest outcome.
             */
            uri == "/account/list_media" || uri == "/user/list_media" ->
                json(request, JSONObject().put("images", JSONArray()))

            uri == "/user/report_count" ->
                json(request, JSONObject().put("comment_reports", 0).put("post_reports", 0))
            uri == "/federated_instances" ->
                json(
                    request,
                    JSONObject().put(
                        "federated_instances",
                        JSONObject().put("linked", JSONArray()).put("allowed", JSONArray())
                            .put("blocked", JSONArray()),
                    ),
                )

            // Falling through would send the call to the real tildes.net, which
            // answers 404 for everything under /api/v3.
            else -> {
                json(request, JSONObject())
            }
        }
    }

    /* ---------------------------------------------------------------- */
    /* Comments                                                         */
    /* ---------------------------------------------------------------- */

    /** Any group page carries the sidebar, so the count rides along free. */
    private fun noteSubscribers(name: String, html: String) {
        Tildes.parseSubscribers(html)?.let {
            if (subscribers.put(name, it) != it) Session.saveSubscribers(subscribers)
        }
    }

    /**
     * Both of the things a group page says about itself, off the one read.
     *
     * The sidebar is taken every time rather than only when it is missing: a
     * group that rewrites its own text, or schedules a new recurring topic,
     * should say so on the next listing rather than on the next install.
     */
    private fun noteGroupPage(name: String, html: String) {
        noteSubscribers(name, html)
        Tildes.parseGroupSidebar(html)?.let {
            // The name is what puts the row for all the subgroups in the
            // panel, and it is only worth drawing for an account: signed out,
            // Tildes puts every subgroup's topics in the parent's page already,
            // so the row would open the listing it was pressed from. Tildes
            // hides its own line there for the same reason.
            //
            // A panel is re-read on every group page, so signing in fills this
            // in on the next one rather than on the next install.
            val markdown = Lemmy.groupSidebar(it, if (Tildes.username != null) name else null)
            if (markdown.isNotEmpty() && sidebars.put(name, markdown) != markdown) {
                Session.saveSidebars(sidebars)
            }
        }
    }

    /**
     * Fetches the counts for any group that has none yet, on one background
     * thread so the request that triggered it answers straight away.
     *
     * Everything goes through the same gate the rest of the traffic does, so
     * this trickles out at one page per 700ms rather than arriving as a burst.
     * It runs once per launch, and only for groups still missing a number.
     *
     * The sidebar rides along on the same page but does not trigger a run of
     * its own. A group's own screen reads the page it needs when it opens, so
     * a second sweep of all 51 would be a burst nobody asked for.
     */
    private fun gatherSubscribers(groups: List<Tildes.Group>) {
        val missing = groups.map { it.name }.filter { !subscribers.containsKey(it) }
        if (missing.isEmpty() || gathering) return
        gathering = true
        Thread {
            try {
                missing.forEach { name ->
                    try {
                        noteGroupPage(name, Tildes.getHtml("/~$name"))
                    } catch (e: Throwable) {
                    }
                }
            } finally {
                gathering = false
            }
        }.apply {
            isDaemon = true
            name = "tildes-subscribers"
        }.start()
    }

    /**
     * Every thread, newest activity first.
     *
     * The inbox leaves out threads you started that nobody has answered yet --
     * Tildes considers those to be waiting rather than incoming -- and they
     * appear only under sent. Both pages together are the whole set.
     */
    private fun conversations(unreadOnly: Boolean): List<Tildes.Conversation> {
        if (unreadOnly) return Tildes.parseConversations(Tildes.getHtml(MESSAGES_UNREAD))
        val inbox = Tildes.parseConversations(Tildes.getHtml("/messages"))
        val sent = Tildes.parseConversations(Tildes.getHtml("/messages/sent"))
        return (inbox + sent).distinctBy { it.id36 }
            .sortedByDescending { it.lastActivity ?: "" }
    }

    private fun threadWith(username: String): Tildes.Conversation? =
        conversations(false).firstOrNull { it.otherUser.equals(username, ignoreCase = true) }

    /**
     * Which threads Boost means by the person it named.
     *
     * The inbox hands out one synthetic person per conversation, so the usual
     * answer is the one thread whose id hashes to this, and that is what makes
     * a row and a reply carry the conversation rather than only the
     * correspondent.
     *
     * A plain user id still answers, with every thread with that person. That
     * is what an id cached from before this shipped arrives as, and what a
     * message started from a profile carries, and the second of those is the
     * one that matters: a person Boost knows and this does not resolve to no
     * thread at all, which is how [threadFor] tells a reply from the start of
     * something new.
     */
    private fun threadsFor(personId: Int, me: String): List<Tildes.Conversation> {
        val threads = conversations(false)
        val one = threads.filter {
            Lemmy.conversationPersonId(it.otherUser ?: me, it.id36) == personId
        }
        return one.ifEmpty {
            threads.filter { Lemmy.userId(it.otherUser ?: me) == personId }
        }
    }

    /** The one conversation a synthetic person stands for, or null for a real one. */
    private fun threadFor(personId: Int, me: String): Tildes.Conversation? =
        conversations(false).firstOrNull {
            Lemmy.conversationPersonId(it.otherUser ?: me, it.id36) == personId
        }

    /**
     * Applies the composer's Title field, when it was sent and says something
     * different from what the topic carries.
     *
     * The composer has always drawn a title on an edit and this route had
     * nothing behind it, so a retitle was accepted on screen, sent, and dropped.
     *
     * **Only when it was sent, and only when it changed.** An empty title is
     * Tildes refusing rather than an instruction, and the composer sends this
     * field on every save whether it was touched or not.
     *
     * A refusal is handled the way [retag] handles one rather than failing the
     * save. Tildes gives the author five minutes to retitle and hands the
     * permission to a group's moderators after that, so an old topic is refused
     * as a matter of course, and the text beside it has already gone through by
     * then. The answer this route builds is read back off the site afterwards,
     * so a title that was refused comes back as the one the topic still has.
     */
    private fun retitle(id36: String, body: JSONObject, topic: Tildes.Topic?) {
        // isNull rather than has: org.json reads a field sent null back as the
        // four letters, and this one writes what it reads.
        if (topic == null || body.isNull("name")) return
        val title = body.optString("name").trim()
        if (title.isEmpty() || title == topic.title) return
        try {
            Tildes.retitleTopic(id36, title)
        } catch (e: TildesException) {
        }
    }

    /**
     * The same for the composer's Link field, under the same care.
     *
     * Refused more often than the title rather than less: the author never
     * holds `edit_link`, so this is a moderator's edit on Tildes and everyone
     * else's request is a 403 that leaves the link alone. An empty field is not
     * a write either, since a link topic cannot become a text one.
     */
    private fun relink(id36: String, body: JSONObject, topic: Tildes.Topic?) {
        if (topic == null || body.isNull("url")) return
        val link = body.optString("url").trim()
        if (link.isEmpty() || link == topic.linkUrl) return
        try {
            Tildes.relinkTopic(id36, link)
        } catch (e: TildesException) {
        }
    }

    /**
     * Applies the composer's text, when it says something different from what
     * the topic already carries.
     *
     * **Only when the text was sent, and only when it changed.** Three things
     * edit a topic and they do not all send the same fields: Mark NSFW sends
     * the flag alone, so a route that always wrote the markdown wrote an empty
     * one, and Tildes refused -- with a validation error on a text topic, and
     * with 403 on a link topic, which has no markdown to edit at all. Either
     * came back as a 503 and no tag was ever applied, since the write threw
     * before the retag below.
     *
     * Unchanged text is not a write either, which is what lets the tags on a
     * link topic be edited: the composer sends its body every time whether or
     * not there is one, and an empty body on a link topic matches what the
     * topic has.
     *
     * The comparison is against the same markdown the editor was filled from,
     * so text nobody touched compares equal. A text edit that was meant and
     * fails still fails the call, since silently keeping the old words would be
     * worse than saying so.
     *
     * **Everything the interceptor drew comes off first.** The tag line, and
     * the spoiler wrapper on a topic carrying that tag, are both added to the
     * body on the way out and both have to come back off before the comparison
     * -- the inline body edit is filled with the body as drawn and sends it
     * back whole, so a wrapper with no exact reverse would compare unequal on
     * every save and write the topic back over itself, wrapped one layer deeper
     * each time.
     */
    private fun retext(id36: String, body: JSONObject, topic: Tildes.Topic?) {
        if (!body.has("body")) return
        val text = Lemmy.withoutMarkup(
            body.optString("body"), topic?.tags.orEmpty(), topic?.group,
        )
        if (text == Lemmy.htmlToMarkdown(topic?.bodyHtml)) return
        Tildes.editTopic(id36, text)
    }

    /**
     * Applies the composer's Tags field, when it says something different from
     * what the topic already carries.
     *
     * **Only when the field was sent, and only for the topic it was filled in
     * for.** Three things in Boost edit a topic and only the composer draws
     * that field: the inline body edit never sends it, and the NSFW toggle
     * sends it only when it holds something. An absent field has to mean "leave
     * the tags alone" rather than "no tags", or editing a topic's text from the
     * topic screen would strip its tags on the way past. A field sent empty is
     * the composer saying the tags were cleared, and Gson keeps the two apart
     * by dropping a null and writing an empty string.
     *
     * [TildesInterceptor.composing] is the other half of the same care: an
     * empty field only means cleared if the composer had something to show
     * there, and it says whether it did.
     *
     * An unchanged field is not a write either, which matters beyond politeness:
     * the site logs every retag, and the composer sends this on every save
     * whether the field was touched or not.
     */
    private fun retag(id36: String, body: JSONObject, topic: Tildes.Topic?) {
        if (topic == null) return

        // Nothing to do at all unless one of the two things that can carry tags
        // is in the request, which saves the form fetch below on every other
        // kind of edit.
        val typed = body.has("custom_thumbnail") && composing == id36
        if (!typed && !body.has("nsfw")) return

        try {
            // The tags as the site itself would fill the form in, which is the
            // order the conflict check compares against. Reading them off the
            // topic page instead is what made unmarking NSFW fail silently.
            val form = Tildes.topicTagForm(id36)

            // The field when the composer sent it and had something to show
            // there, and what the topic already carries otherwise, which is the
            // Mark NSFW row's case: it edits the flag and sends no tags at all.
            // The composer's field says everything when it was sent, `nsfw`
            // included, so the two cannot disagree about a topic that carries
            // the tag. The flag decides only where no field came with it, which
            // is the Mark NSFW row and nothing else.
            val tags = if (typed) {
                parseTags(body.optString("custom_thumbnail"))
            } else {
                Lemmy.withNsfw(form.tags, body.optBoolean("nsfw"))
            }

            if (tags == form.tags) return
            Tildes.retagTopic(id36, tags, form)
        } catch (e: TildesException) {
            // Tagging is its own permission on Tildes and the text edit has
            // already gone through, so a refusal leaves the tags alone rather
            // than failing a save the site accepted.
        }
    }

    /**
     * Moves the topic when the composer's group row was left showing a
     * different group from the one it opened on.
     *
     * **The group does not ride in on the request**, which is what makes this
     * unlike the four edits beside it. Lemmy's `EditPost` has no
     * `community_id` at all -- a post cannot change community there -- so
     * there is no field for Boost to fill and none for this to read. The row
     * on screen is the whole of what says where the topic should go, and
     * [composerGroup] is that row read as it changed.
     *
     * Which is why the composer being the right one is checked twice rather
     * than assumed: [composing] is the topic that composer was opened on, and
     * the tags field is what says this save came from a composer at all.
     *
     * A refusal leaves the topic where it is and the rest of the save alone.
     * `move` is granted per group, so the site can say no to the group picked
     * while saying yes to the topic, and the title and text have already gone
     * through by then.
     */
    private fun regroup(id36: String, body: JSONObject, topic: Tildes.Topic?) {
        if (topic == null) return
        val picked = composerGroup ?: return
        // The composer sends the tags field on every save and nothing else
        // does, which is what says this edit came from the screen the row is
        // on. Without it, a group picked in a composer that was then backed
        // out of would move the topic the next time its text was edited from
        // the topic screen, which is a move nobody asked for.
        if (!body.has("custom_thumbnail")) return
        if (composing != id36 || picked == topic.group) return

        try {
            Tildes.moveTopic(id36, picked)
            // The topic keeps its id36 and changes address, so what was
            // remembered for it is the old group's path.
            Tildes.rememberPath(id36, "/~$picked/$id36")
        } catch (e: TildesException) {
        }
    }

    private fun parseTags(field: String): List<String> =
        field.split(',').map { it.trim() }.filter { it.isNotEmpty() }

    /**
     * Keeps a message row under the id Boost will send back to mark it read,
     * and hands it on. Both kinds go through here: a conversation in the inbox
     * list and a message inside a thread carry the same field.
     */
    private fun rememberMessage(view: JSONObject): JSONObject {
        view.optJSONObject("private_message")?.optInt("id")
            ?.takeIf { it != 0 }
            ?.let { drawnMessages[it] = view }
        return view
    }

    /**
     * The message just sent, read back so Boost has one to draw rather than an
     * empty answer. The write cleared the page cache, so this is a fresh read.
     */
    private fun sentMessage(conversation: Tildes.Conversation?, me: String): JSONObject? {
        if (conversation == null) return null
        val messages = Tildes.parseConversation(
            Tildes.getHtml(Tildes.conversationPath(conversation.id36))
        )
        val last = messages.lastOrNull() ?: return null
        return Lemmy.privateMessageView(conversation, last, messages.size - 1, me)
    }

    /**
     * Replies and mentions, which Tildes splits into two pages by whether they
     * have been read rather than flagging them on one.
     *
     * Boost sends back an id to mark one read, and that id is a hash rather
     * than anything Tildes knows, so what it stands for is remembered here.
     *
     * **The two pages overlap, and reading the first is what makes them.**
     * Tildes marks everything on `/notifications/unread` read as it renders,
     * for an account with `auto_mark_notifications_read` on, so by the time the
     * read page is fetched a second later the same notification is on that one
     * too -- and it was drawn twice, once highlighted and once not, one under
     * the other. So the two are joined on the comment, and the unread copy wins
     * because it is the one that says something is waiting.
     */
    private fun inbox(q: (String) -> String?, mentions: Boolean): JSONObject {
        val arr = JSONArray()
        val me = Tildes.username
        if (token != null && me != null) {
            val waiting = Tildes.parseNotifications(Tildes.getHtml(NOTIFICATIONS_UNREAD))
                .map { it to false }
            val seen =
                if (q("unread_only")?.toBoolean() == true) emptyList()
                else Tildes.parseNotifications(Tildes.getHtml("/notifications")).map { it to true }

            // Joined after the split rather than before it, so a mention can
            // never be dropped for sharing a comment with a reply.
            val mine = (waiting + seen).filter { it.first.mention == mentions }
            val both = mine.distinctBy { it.first.comment.id36 }
            if (both.size < mine.size) {
            }

            both.forEach { (n, read) ->
                commentTopics[n.comment.id36] = n.topic.id36
                // The inbox draws these through a holder of its own with a
                // menu of its own, so nothing here offers a label on this
                // screen. It is remembered anyway, because tapping one opens
                // the comment in its thread, where the row is.
                rememberLabels(listOf(n.comment))
                inboxComments[Lemmy.inboxId(n.comment.id36, mentions)] = n
                arr.put(Lemmy.inboxCommentView(n.comment, n.topic, me, read, mentions))
            }
        }
        return JSONObject().put(if (mentions) "mentions" else "replies", arr)
    }

    /**
     * Bookmarks and votes are one page each, with a topic tab and a comment
     * tab. Tildes renders the votes page from the bookmarks template, so the
     * two are the same shape down to the pagination.
     */
    private fun tabbedPath(base: String, type: String, after: String?): String {
        val params = mutableListOf("type=$type")
        after?.let { params.add("after=$it") }
        return base + "?" + params.joinToString("&")
    }

    /**
     * The two bookmark tabs, read as one Lemmy person response. They page
     * independently upstream, so each keeps its own cursor.
     */
    private fun bookmarks(name: String, page: Int): JSONObject =
        bothTabs(
            name, BOOKMARKS, BOOKMARKED_TOPICS, BOOKMARKED_COMMENTS, page,
            profileKinds[BOOKMARKS_TAB],
        )

    /**
     * And the two vote tabs, which are the same page under another address.
     *
     * Tildes renders `/votes` from the bookmarks template, down to the two tabs
     * and the pagination, so the only thing that differs is which list is
     * behind them.
     */
    private fun votes(name: String, page: Int): JSONObject =
        bothTabs(name, VOTES, VOTED_TOPICS, VOTED_COMMENTS, page, profileKinds[VOTES_TAB])

    /**
     * `only` is the half the screen is showing, where it has said. Both pages
     * are fetched without one, which is what a screen that has not said gets --
     * the drawer's row opening a tab before its strip exists, and any way in
     * this has not thought of.
     */
    private fun bothTabs(
        name: String,
        base: String,
        topicKey: String,
        commentKey: String,
        page: Int,
        only: String? = null,
    ): JSONObject {
        val topicsHtml =
            if (only == "comment") null else tabbedPage(base, topicKey, "topic", page)
        val commentsHtml =
            if (only == "topic") null else tabbedPage(base, commentKey, "comment", page)

        val comments = commentsHtml?.let { Tildes.parseUserComments(it) }.orEmpty()
        rememberCommentTopics(comments)
        return personDetails(
            name,
            topicsHtml?.let { Tildes.parseTopicListing(it) }.orEmpty(),
            comments,
        )
    }

    private fun tabbedPage(base: String, key: String, type: String, page: Int): String? {
        if (pastEnd(key, page, null)) return null
        val html = Tildes.getHtml(tabbedPath(base, type, cursor(key, page)))
        rememberCursor(key, page, Tildes.nextCursor(html))
        return html
    }

    private fun personDetails(
        name: String,
        topics: List<Tildes.Topic>,
        comments: List<Tildes.UserComment>,
    ): JSONObject =
        JSONObject()
            .put(
                "person_view",
                Lemmy.personView(name, profiles[name]?.registered, profiles[name]?.bioHtml),
            )
            .put(
                "comments",
                JSONArray().apply {
                    comments.forEach { put(Lemmy.commentView(it.comment, it.topic)) }
                },
            )
            .put("posts", JSONArray().apply { topics.forEach { put(Lemmy.postView(it)) } })
            .put("moderates", JSONArray())

    /**
     * Which of these comments carry the site's own answer to whether this
     * account may label them, and which labels it has put on each.
     *
     * By id36 rather than by the decimal id the newness and fold sets use.
     * Those answer a question Boost asks with a Lemmy id in hand, while this
     * one is read off a menu row's address and handed straight back to the
     * site, and both ends of that are id36.
     *
     * A comment the site will not let this account label has its entry taken
     * out rather than left behind: it is the same comment read again saying
     * something different -- a label spent, an account switched -- and a stale
     * yes puts a row in a menu that can only fail.
     */
    private fun rememberLabels(comments: List<Tildes.Comment>) {
        comments.forEach {
            if (it.mayLabel) labelledComments[it.id36] = it.myLabels
            else labelledComments.remove(it.id36)
        }
    }

    private fun rememberCommentTopics(comments: List<Tildes.UserComment>) {
        rememberLabels(comments.map { it.comment })
        comments.forEach {
            commentTopics[it.comment.id36] = it.topic.id36
            // And whatever is above it, which on a listing is the one ancestor
            // the **Parent** link names. Boost opens a listed comment by asking
            // for its parent, and that parent is on no page this has read, so
            // the listing is the only place its topic is ever going to be
            // known.
            it.comment.ancestors.forEach { above -> commentTopics[above] = it.topic.id36 }
        }
    }

    /**
     * A topic a write has just changed, as Lemmy would answer it, and kept.
     *
     * Two things need this. Boost reads the entity out of a write's answer
     * without checking it is there, so an empty object is a failed write at
     * best. And what is remembered here is what the topic screen is handed
     * after a refresh -- see [voteAfterRefresh] -- so a vote or a bookmark
     * made in the app has to land in this map as well as at Tildes, or the
     * next refresh would put the old answer back on screen.
     *
     * The topic this last parsed is enough to build both, which costs nothing
     * upstream. A topic nobody has parsed is read once rather than guessed at,
     * and that only happens for a write from somewhere this never drew.
     */
    private fun changedTopic(id36: String, change: (Tildes.Topic) -> Tildes.Topic): JSONObject {
        val known = topics[id36] ?: run {
            val path = Tildes.resolveTopicPath(id36)
            Tildes.parseTopicPage(Tildes.getHtml(path), path).topic
        }
        val topic = change(known ?: return JSONObject())
        rememberTopic(topic)
        val subscribed = groups().any { it.subscribed && it.name == topic.group }
        return Lemmy.postView(topic, subscribed)
    }

    /**
     * The same for a write that answers with something other than the topic,
     * and so has no reason to fetch one nobody has drawn.
     */
    private fun noteTopic(id36: String, change: (Tildes.Topic) -> Tildes.Topic) {
        topics[id36]?.let { rememberTopic(change(it)) }
    }

    /**
     * A fresh parse of a topic over what was already known, keeping the parts a
     * listing cannot see.
     *
     * Three things go that way:
     *
     * **When the newest comment was posted.** Boost writes that time down as
     * the watermark for what it has already shown you, and the topic's own time
     * in its place marks the whole thread new forever.
     *
     * **The tags.** A listing draws the important ones to everyone and the rest
     * only to an account that asked for them, so it says nothing about the ones
     * it leaves out. Letting one overwrite what a topic page said takes the tag
     * line off a topic already read and empties the composer's Tags field on
     * the way past.
     *
     * **The edit controls**, which a listing draws none of, and which the
     * composer reads to know what Tildes would refuse.
     *
     * **And the tags a listing drew**, which is the same care the other way
     * round: a page says nothing about what a row should show, so what a
     * listing said is kept until another listing says otherwise.
     *
     * And one goes the other way. **The author**, which a *topic page* cannot
     * always see: a recurring scheduled topic is posted by an account and its
     * page says only "Automatically posted", with no name anywhere on it,
     * while the listing row carries `data-topic-posted-by`. Letting the page
     * overwrite that answered `[deleted]` for a topic posted by a real account
     * -- and only after you opened it, so the feed said one thing and the
     * topic another.
     *
     * See [Tildes.Topic.fromTopicPage].
     */
    private fun merged(known: Tildes.Topic?, fresh: Tildes.Topic): Tildes.Topic {
        if (known == null) return fresh
        var merged = fresh
        if (fresh.newestCommentAt == null && known.newestCommentAt != null) {
            merged = merged.copy(newestCommentAt = known.newestCommentAt)
        }
        if (fresh.author == null && known.author != null) {
            merged = merged.copy(author = known.author)
        }
        if (!fresh.fromTopicPage && known.fromTopicPage) {
            merged = merged.copy(
                tags = known.tags,
                actions = known.actions,
                // A listing draws no line saying the topic was taken down, so a
                // row read after the page would otherwise reopen it to a
                // top-level comment Tildes is going to refuse.
                rootCommentsClosed = known.rootCommentsClosed,
                fromTopicPage = true,
            )
        }
        // And what a listing drew stays what a listing drew. A page overwrites
        // the tags above with everything it can see, which is right for the
        // topic's own screen; a row has to keep the site's own answer to what
        // this reader sees in a listing. See [Tildes.Topic.tagsInListing].
        if (fresh.tagsInListing.isEmpty() && known.tagsInListing.isNotEmpty()) {
            merged = merged.copy(tagsInListing = known.tagsInListing)
        }
        if (fresh.contentType == null && known.contentType != null) {
            merged = merged.copy(
                contentType = known.contentType,
                contentMetadata = known.contentMetadata,
            )
        }
        // The icon goes with the link, and a topic stood up out of a comment
        // page carries neither. Both real parses draw it, so this is only ever
        // the synthetic one being kept off the row.
        if (fresh.siteIcon == null && known.siteIcon != null) {
            merged = merged.copy(siteIcon = known.siteIcon)
        }
        return merged
    }

    /** Keeps a topic, and hands back what is known about it. */
    private fun rememberTopic(topic: Tildes.Topic): Tildes.Topic {
        val merged = merged(topics[topic.id36], topic)
        topics[topic.id36] = merged
        refreshHistory(merged)
        return merged
    }

    /**
     * History, which is every topic you have opened, kept as it looked when you
     * last saw it.
     *
     * Nothing here costs a request. The rows are the ones already parsed to
     * answer whatever you were doing, and a listing you scroll past updates the
     * ones it covers for free. Going the other way and refetching a topic page
     * to freshen a row would cost more than the number is worth: Tildes records
     * a visit from an authenticated topic page, and nothing else, so a refresh
     * sweep would mark every topic in your history read and leave nothing to
     * fold or highlight the next time you opened one.
     */
    private val history = ConcurrentHashMap<String, Session.StoredTopic>()

    @Volatile
    private var historyDirty = false

    /**
     * Updates a row in place, without claiming the topic was opened.
     *
     * Merged against the row rather than written over it, because the rows
     * outlive the process while [topics] does not. A feed scrolled after a
     * restart is parsed against nothing, so a plain write would take the tags
     * off every row it passed.
     */
    private fun refreshHistory(topic: Tildes.Topic) {
        val seen = history[topic.id36] ?: return
        val fresh = merged(seen.topic, topic)
        if (seen.topic == fresh) return
        history[topic.id36] = seen.copy(topic = fresh)
        historyDirty = true
    }

    /** Records that the topic was opened, which is what puts it in the list. */
    private fun noteVisit(topic: Tildes.Topic) {
        history[topic.id36] = Session.StoredTopic(System.currentTimeMillis(), topic)
        historyDirty = true
    }

    private fun restoreHistory() {
        Session.loadHistory().forEach { history[it.topic.id36] = it }
    }

    /**
     * Written after the answer rather than on every row, since a feed scroll
     * touches dozens of them and each write is a file.
     */
    private fun saveHistoryIfChanged() {
        if (!historyDirty) return
        historyDirty = false
        Session.saveHistory(history.values.sortedByDescending { it.seenAt }.take(HISTORY_LIMIT))
    }

    /**
     * The order and window the History screen was last asked for.
     *
     * The same pair every feed carries, and kept apart from theirs. Boost
     * remembers a sort per community and sends it, so this only ever fills in
     * the half of the pair that a given `SortType` does not carry -- picking an
     * order says nothing about the window and picking a window says nothing
     * about the order.
     *
     * In memory rather than on disk, unlike a feed's. The whole list is
     * rebuilt from storage at launch anyway, and coming back up in the order
     * this list is really about -- what you opened last -- is the right way to
     * be wrong.
     */
    @Volatile
    private var historyListingPair = "activity" to "all"

    /**
     * Boost's History tab, answered from what is already known.
     *
     * The community behind it is `_load_history_this_is_not_a_subreddit`, a
     * marker left over from Boost's Reddit ancestry rather than anything real,
     * so this never reaches Tildes. It used to answer empty.
     */
    private fun historyListing(
        request: Request,
        sort: String?,
        page: Int,
        limit: String?,
    ): Response {
        val size = limit?.toIntOrNull()?.coerceIn(1, 50) ?: 20
        val (wasOrder, wasPeriod) = historyListingPair
        val order = ORDERS[sort] ?: wasOrder
        val period = customWindow(sort) ?: PERIODS[sort] ?: wasPeriod
        historyListingPair = order to period

        val rows = Session.historyPage(
            history.values, order, period, System.currentTimeMillis(), (page - 1) * size, size,
        )
        val subs = groups().filter { it.subscribed }.map { it.name }.toSet()

        val arr = JSONArray().apply {
            rows.forEach { put(Lemmy.postView(it.topic, subs.contains(it.topic.group))) }
        }
        // A page that came back short is the end of it. Boost pages by cursor
        // and appends whatever it gets, so a null here is what stops it asking
        // again and repeating the first page forever.
        val next = if (rows.size < size) null else (page + 1).toString()
        return json(request, JSONObject().put("posts", arr).put("next_page", next))
    }

    /**
     * Which comment each open topic was opened on, or nothing for the ones
     * opened whole. Written by `/post` and read by `/comment/list`, which is
     * the next call Boost makes.
     */
    private val openedOn = ConcurrentHashMap<Int, Int>()

    /**
     * And which comment each topic has been **pointed at**, which outlives the
     * request that pointed at it.
     *
     * Tildes folds a chain a `noise` label has been spent on, and this end
     * reads that fold off the page, so a comment inside one is a `[+]` row and
     * nothing else. Which is right for a thread somebody opened to read, and
     * wrong for one they arrived at by following a link to a comment in it:
     * **View all comments** then draws the topic with the comment they came for
     * hidden behind the fold above it.
     *
     * So a comment asked for by name is drawn open, and so is every comment
     * above it. Kept per topic rather than per request because the call that
     * needs it -- the one behind **View all comments** -- is the one that names
     * no comment at all.
     */
    private val pointedAt = ConcurrentHashMap<String, String>()

    /**
     * A comment tree cut down to one comment and its replies, as Boost needs it
     * when a topic is opened on a comment.
     *
     * **Tapping a comment used to draw the topic and nothing under it.** Boost
     * asks for the topic with `comment_id` on it and then asks for the comments
     * without, and what it does with the answer is keep every comment whose
     * `path` contains that id as a whole component -- the comment and its
     * replies -- and throw the rest away. Then it builds the tree, and a comment
     * whose parent is not in what is left is **dropped with no branch for it**.
     * So on a reply, every row it had just kept was discarded one step later,
     * and the screen came out as a header with nothing under it and no way back.
     *
     * `path` is the whole of what Boost has to go on: a Lemmy comment carries
     * no parent field and the app derives one from the second-to-last part of
     * the path. Which is also why it never sent a `parent_id` that would have
     * made the request a subtree in the first place -- the comment it was opened
     * from came off a profile listing, where Tildes draws a comment out of its
     * thread and there is no ancestry to read, so it arrived saying it was top
     * level.
     *
     * So the answer is cut here instead. See [Lemmy.rootedAt] for the shape,
     * and what Boost draws above it.
     */
    /**
     * A comment and its replies, ancestry intact, for a thread asked for by
     * comment.
     *
     * The ancestors are **not** sent, and that is what makes Boost draw **Show
     * context** over the top of it: it roots the answer at the oldest comment
     * it was given and offers the row when that comment's path names a parent
     * it has not got. Tapping the row asks again from that parent, one level at
     * a time, until a top-level comment answers **View all comments** instead.
     *
     * A comment nobody can find leaves the tree whole, which Boost will then
     * filter down to nothing -- there is no better answer for a comment that is
     * not on the page, and the log is what says so.
     */
    private fun contextFor(comments: List<Tildes.Comment>, id36: String): List<Tildes.Comment> {
        val subtree = Lemmy.below(comments, id36)
        if (subtree.isEmpty()) {
            return comments
        }
        return subtree
    }

    private fun rootedAt(comments: List<Tildes.Comment>, on: Int?): List<Tildes.Comment> {
        val id36 = on?.let { Lemmy.intToId36(it) } ?: return comments
        val subtree = Lemmy.rootedAt(comments, id36)
        if (subtree.size == comments.size && comments.none { it.id36 == id36 }) {
        } else {
        }
        return subtree
    }

    private fun rememberComments(page: Tildes.TopicPage) {
        val topic = page.topic ?: return
        rememberTopic(topic)
        rememberLog(page)
        page.comments.forEach {
            commentTopics[it.id36] = topic.id36
            // The one ancestor the screen below needs. Kept per comment rather
            // than the whole chain, since what asks wants one step up and asks
            // again from there.
            it.ancestors.lastOrNull()?.let { above -> commentParents[it.id36] = above }
        }
        rememberCommentState(page.comments, openedFor(topic.id36, page.comments))
    }

    /**
     * Keeps what the page said had been done to the topic, for the row that
     * offers to show it.
     *
     * Written whole rather than merged, since the page is the only thing that
     * carries a log and it carries all of one. A topic with nothing in its log
     * is dropped rather than stored empty, so the map answers the row's
     * question -- is there anything to show -- without a size check anywhere
     * else.
     */
    private fun rememberLog(page: Tildes.TopicPage) {
        val id36 = page.topic?.id36 ?: return
        if (page.log.isEmpty()) topicLogs.remove(id36) else topicLogs[id36] = page.log
    }

    /**
     * The comments that stay open on this page whatever the site said: the one
     * this topic was pointed at, and every comment above it.
     *
     * The chain matters as much as the comment. A `noise` label folds the whole
     * chain, and a fold above the comment hides it just as completely as a fold
     * on it -- what is drawn there is one `[+]` row with everything under it
     * inside. See [pointedAt] for what puts a topic in this state and how long
     * it stays there.
     */
    private fun openedFor(topicId36: String, comments: List<Tildes.Comment>): Set<String> {
        val at = pointedAt[topicId36] ?: return emptySet()
        val comment = comments.find { it.id36 == at } ?: return emptySet()
        val chain = comment.ancestors.toSet() + at
        val folded = comments.count { it.collapsed && it.id36 in chain }
        return chain
    }

    /**
     * Which comments Tildes counts as new, and which it has folded, for the two
     * patched predicates below.
     *
     * Only the topic last read is kept. Boost asks about a comment while it is
     * drawing the thread that comment is in, so anything not in here is from
     * somewhere this never saw and gets Boost's own answer instead.
     */
    private fun rememberCommentState(
        comments: List<Tildes.Comment>,
        open: Set<String> = emptySet(),
    ) {
        val fresh = mutableSetOf<String>()
        val seen = mutableSetOf<String>()
        val shut = mutableSetOf<String>()
        val unvotable = mutableSetOf<String>()
        val quiet = mutableSetOf<String>()
        // Read once for the thread rather than once per comment. The list is
        // Boost's own and a person is on it or is not, so a name it holds is
        // the same answer for every comment they wrote.
        val muted = Session.muted()
        comments.forEach {
            val id = Lemmy.id36ToInt(it.id36).toString()
            seen.add(id)
            if (it.isNew) fresh.add(id)
            if (it.collapsed && it.id36 !in open) shut.add(id)
            if (it.votingClosed) unvotable.add(id)
            if (it.author != null && Session.matches(it.author, muted)) quiet.add(id)
        }
        knownComments = seen
        newComments = fresh
        foldedComments = shut
        closedComments = unvotable
        mutedComments = quiet
        rememberLabels(comments)

        // Said whenever there is a list at all, rather than only when something
        // matched. A silent nothing reads the same as an old build, an empty
        // list and a name that does not match, and telling those three apart
        // once cost pulling the APK off the phone.
        if (muted.isNotEmpty() || quiet.isNotEmpty()) {
        }
    }

    /**
     * Lemmy answers a comment write with the comment itself, and Boost calls an
     * edit failed when that is missing even though Tildes accepted it. Tildes
     * answers with a rendered fragment rather than anything Lemmy-shaped, and
     * the view needs the whole post around the comment, so the thread is read
     * again to build it.
     *
     * A comment whose thread was never read this session leaves the answer bare
     * rather than costing a hunt for it, which is the old behaviour.
     */
    private fun commentResponse(id36: String): JSONObject {
        val result = JSONObject().put("recipient_ids", JSONArray())
        val topicId36 = commentTopics[id36] ?: return result
        val path = Tildes.resolveTopicPath(topicId36)
        val page = Tildes.parseTopicPage(Tildes.getHtml(path, noCache = true), path)
        rememberComments(page)
        val topic = page.topic ?: return result
        val comment = page.comments.find { it.id36 == id36 } ?: return result
        return result.put("comment_view", Lemmy.commentView(comment, topic))
    }

    /* ---------------------------------------------------------------- */
    /* Groups                                                           */
    /* ---------------------------------------------------------------- */

    private fun groups(force: Boolean = false): List<Tildes.Group> {
        if (!force && groupCache.isNotEmpty() &&
            System.currentTimeMillis() - groupCacheAt < 60_000
        ) return groupCache
        val html = Tildes.getHtml("/groups")
        checkStillSignedIn(html)
        groupCache = Tildes.parseGroups(html)
        groupCacheAt = System.currentTimeMillis()
        // For the screens that are built before a request has come back. A
        // guest's drawer is the one that needs it -- see [guestGroups].
        Session.saveGroupNames(groupCache.map { it.name })
        gatherSubscribers(groupCache)
        // Seed the id -> name map so Boost can look communities up by id.
        groupCache.forEach { Lemmy.groupId(it.name) }
        return groupCache
    }

    /**
     * A restored session can be one Tildes has since dropped, and believing it
     * anyway is what the persistence was meant to stop: Boost shows the account
     * signed in while every read comes back anonymous.
     *
     * Tildes names the signed-in account in the header of every page, so the
     * check rides along on a page already being fetched rather than costing a
     * request of its own.
     */
    private fun checkStillSignedIn(html: String) {
        if (token == null) return
        if (Tildes.parseLoggedInUser(html) != null) return
        signOut()
    }

    /**
     * Lemmy pages communities by number. Past the end this hands back nothing,
     * which is how Boost learns to stop asking.
     */
    private fun pageOf(
        groups: List<Tildes.Group>,
        page: String?,
        limit: String?,
    ): List<Tildes.Group> {
        val size = (limit?.toIntOrNull() ?: 50).coerceIn(1, 100)
        val n = (page?.toIntOrNull() ?: 1).coerceAtLeast(1)
        return groups.drop((n - 1) * size).take(size)
    }

    /**
     * What order a group listing comes back in.
     *
     * Tildes' own `/groups` is one alphabetical page with each subgroup drawn
     * under its parent, and nothing on it says when a group was made, so name
     * order is the only order the site itself has. It is also the one worth
     * defaulting to: it puts `~life` beside `~life.pets` and `~life.women`,
     * where anything else scatters a family of groups down a list of 51.
     *
     * The exception is the two panels asking how busy a group is rather than
     * what it is called. Tildes publishes daily topic and comment rates per
     * group, which is the closest thing it has to an answer, and without it
     * the trending carousel drew the first six groups alphabetically.
     *
     * Which is which comes off the sort Boost sends, since those panels are
     * the only things asking for a short window: the carousel sends `TopDay`
     * and the sidebar's own panel sends `Active`, while the Groups page sends
     * `TopYear` unless the account picks something else. So the page reads as
     * name order out of the box and an account that wants the busiest groups
     * first has five windows in the sort menu that answer that.
     */
    private fun sortGroups(groups: List<Tildes.Group>, sort: String?): List<Tildes.Group> =
        if (sort in BUSIEST_FIRST) groups.sortedByDescending { it.dailyTopics + it.dailyComments }
        else groups.sortedBy { it.name }

    /**
     * The sorts answered by how busy a group is. Everything shorter than a
     * year, since a window that short is a question about activity however it
     * is spelled, plus Lemmy's two orders that have no window at all.
     *
     * `Old` is here for the Groups page's own menu rather than for anything
     * Boost means by it. That menu is cut to two rows and its **Activity** row
     * is Boost's Old, which is the only top level row on it that this can
     * reach: the others are New, which has to stay name order, and Top, which
     * opens a submenu rather than sorting. Nothing else reads this map -- it is
     * asked once, for `/community/list` -- so a feed's own Old is untouched and
     * still comes back newest first.
     */
    private val BUSIEST_FIRST = setOf(
        "Active", "Hot", "Scaled", "Controversial", "Old",
        "TopHour", "TopSixHour", "TopTwelveHour", "TopDay", "TopWeek", "TopMonth",
    )

    private fun groupNameFor(id: Int?, name: String?): String? {
        if (!name.isNullOrEmpty()) return name.removePrefix("~").substringBefore('@')
        if (id == null || id == 0) return null
        Lemmy.groupName(id)?.let { return it }
        groups(force = true)
        return Lemmy.groupName(id)
    }

    /* ---------------------------------------------------------------- */
    /* Listings                                                         */
    /* ---------------------------------------------------------------- */

    @Volatile
    private var listing: Pair<String, String>? = null

    private fun buildListingPath(
        group: String?,
        sort: String?,
        after: String?,
        limit: Int?,
        tag: String? = null,
        allSubgroups: Boolean = false,
        remember: Boolean = true,
    ): String {
        val (wasOrder, wasPeriod) = listing
            ?: Session.loadListing()
            ?: ("activity" to "all")

        val order = ORDERS[sort] ?: wasOrder
        val period = customWindow(sort) ?: PERIODS[sort] ?: wasPeriod
        // A screen that keeps its own order does not write the feed's, the way
        // History does not -- building a path is what remembers one, so a tag
        // typed on the search screen would otherwise reorder the front page.
        if (remember && (order != wasOrder || period != wasPeriod || listing == null)) {
            listing = order to period
            Session.saveListing(order, period)
        }

        val params = mutableListOf("order=$order", "period=$period")
        // First, the way tildes.net writes it. Nothing reads the order of a
        // query, but this is a URL a person may well end up looking at in a
        // log, and the site's own form is the one to keep.
        tag?.let { params.add(0, "tag=" + URLEncoder.encode(it, "UTF-8")) }
        // On every page rather than only on the first, and that is not a
        // detail: tildes.net's own Next link drops this parameter. The site
        // rebuilds pagination out of a whitelist of query keys -- `order`,
        // `period`, `per_page`, `tag`, `unfiltered` -- and `all_subgroups` is
        // not in it, so following its href would quietly narrow page two back
        // to the subgroups you subscribe to. Nothing here follows that href:
        // only the cursor is read off it and the rest of the URL is built
        // again, which is what makes carrying the flag a matter of passing it.
        if (allSubgroups) params.add("all_subgroups=true")
        after?.let { params.add("after=$it") }
        limit?.let { params.add("per_page=" + it.coerceIn(1, 100)) }
        val base = if (group != null) "/~$group" else "/"
        return base + "?" + params.joinToString("&")
    }

    /**
     * Lemmy comment sort -> Tildes `comment_order`.
     *
     * Anything landing on Tildes' own default answers with no parameter at
     * all, so the topic page stays the same URL the post route asks for and
     * the two share one fetch instead of two. Relevance is that default, which
     * is what Hot and Controversial both come out as.
     */
    private fun commentOrder(sort: String?): String =
        COMMENT_ORDERS[sort].let { if (it == null || it == COMMENT_DEFAULT) "" else "?comment_order=$it" }

    /** Lemmy pages by number, Tildes by cursor; Boost pages in order. */
    private fun cursor(key: String, page: Int): String? =
        if (page <= 1) null else cursors[key]?.get(page)

    /**
     * Whether a page is past the end of a listing.
     *
     * A cursor is only ever learned from the Next link on the page before it,
     * so a page number with nothing remembered for it is one Tildes never
     * offered. Fetching without a cursor anyway serves the first page again,
     * which Boost appends on every scroll -- a short list then repeats forever.
     */
    private fun pastEnd(key: String, page: Int, explicit: String?) =
        explicit == null && page > 1 && cursor(key, page) == null

    private fun rememberCursor(key: String, page: Int, after: String?) {
        if (after == null) return
        cursors.getOrPut(key) { ConcurrentHashMap() }[page + 1] = after
    }

    /**
     * One page of a profile's topics, or of its comments.
     *
     * Tildes filters and pages a profile only for a viewer holding
     * `view_history`, which is any signed-in account. Without it the `type`
     * and `after` given here are stripped and the merged first page comes
     * back instead, so this is only worth calling with a session.
     */
    private fun userListing(name: String, type: String, page: Int, order: String?): String? {
        /*
         * And the search over it, where the tab is on one. `/user/<name>/search`
         * is the same listing with `q` in front of it: the same `type`, the same
         * five orders, the same cursor pagination, and the same page around it
         * -- its template extends the profile's own and overrides three blocks,
         * none of which is the listing or the header. So the parsers, the
         * profile read and the cursor below all carry over untouched.
         *
         * `period` is not a parameter on either route, so nothing is lost by
         * this end never sending one.
         */
        val searched = profileSearches[searchKey(name, tabFor(type))]

        // The order is part of the key, not only of the URL. A cursor anchors
        // on the column being sorted by, so one learned from an `activity`
        // page means nothing on a `votes` one, and paging with the wrong one
        // would draw a page from the middle of the other listing.
        //
        // And so is the query, for the same reason twice over: the pages of one
        // search are not the pages of another, and neither is the unfiltered
        // tab's.
        val key = "user|$name|$type|" + (order ?: "") + "|" + searched.orEmpty()
        if (pastEnd(key, page, null)) return null
        val url = StringBuilder("/user/").append(URLEncoder.encode(name, "UTF-8"))
        searched?.let { url.append("/search") }
        url.append("?type=").append(type)
        searched?.let { url.append("&q=").append(URLEncoder.encode(it, "UTF-8")) }
        order?.let { url.append("&order=").append(it) }
        cursor(key, page)?.let { url.append("&after=").append(it) }
        val html = Tildes.getHtml(url.toString())
        rememberCursor(key, page, Tildes.nextCursor(html))
        return html
    }

    /**
     * Which of Boost's tabs a Tildes `type` is, which is the half of
     * [searchKey] this end of the request has.
     *
     * The two names for the same thing are Boost's tab key and the site's post
     * type, and the request carries the second where the menu carried the
     * first.
     */
    private fun tabFor(type: String): String =
        if (type == "comment") COMMENTS_TAB else TOPICS_TAB

    /**
     * Which order a profile's own listing was asked for.
     *
     * Tildes sorts a profile the way it sorts a feed and spells the orders the
     * same -- `/user/<name>?type=topic&order=votes` -- but the menu asking is
     * not a feed's menu, so the table is not a feed's table either. See
     * [PROFILE_ORDERS]: a profile takes **no window at all**, and the rows that
     * name one on a feed are the rows carrying the orders here.
     *
     * **The type decides what is on offer.** Tildes' topics listing takes five
     * orders and its comments listing takes two, so a request is answered with
     * the order only where that listing has it. Anything else answers null,
     * which sends no `order=` and leaves the site on its own default -- `new`,
     * which is also what it falls back to for an order it does not know.
     */
    private fun userOrder(sort: String?, type: String): String? {
        val order = PROFILE_ORDERS[sort] ?: return null
        val offered =
            PROFILE_TAB_ORDERS[if (type == "comment") COMMENTS_TAB else TOPICS_TAB].orEmpty()
        return order.takeIf { it in offered }
    }

    /**
     * One page of a profile's merged listing, which is what the site opens a
     * profile on.
     *
     * `/user/<name>` with no `type` is a page of twenty of both kinds, newest
     * first, and it pages on a cursor of its own rather than sharing either of
     * the two typed ones -- so the three tabs never move each other along.
     *
     * Logged out Tildes drops `after` and answers the first page however it is
     * asked, which is the same shape the two typed listings are in, so this is
     * only worth calling with a session.
     */
    private fun overviewListing(name: String, page: Int): String? {
        val key = "user|" + name + "|all"
        if (pastEnd(key, page, null)) return null
        val url = StringBuilder("/user/").append(URLEncoder.encode(name, "UTF-8"))
        cursor(key, page)?.let { url.append("?after=").append(it) }
        val html = Tildes.getHtml(url.toString())
        rememberCursor(key, page, Tildes.nextCursor(html))
        return html
    }

    /* ---------------------------------------------------------------- */
    /* Wire                                                             */
    /* ---------------------------------------------------------------- */

    private fun bodyJson(request: Request): JSONObject {
        val text = RequestBodies.readUtf8(request)
        if (text.isEmpty()) return JSONObject()
        return try {
            JSONObject(text)
        } catch (e: Exception) {
            JSONObject()
        }
    }

    private fun json(request: Request, obj: JSONObject, code: Int = 200): Response {
        val text = obj.toString()
        return Response.Builder()
            .request(request)
            .protocol(Protocol.HTTP_1_1)
            .code(code)
            .message(messageFor(code))
            // Set as headers as well as on the body. A real response carries
            // both, and code that reads response.header("Content-Type") sees
            // null otherwise, which is not a shape any server produces.
            .addHeader("Content-Type", CONTENT_TYPE)
            .addHeader("Content-Length", text.toByteArray().size.toString())
            .body(text.toResponseBody(JSON))
            .build()
    }

    private fun error(request: Request, message: String, code: Int): Response {
        return json(request, JSONObject().put("error", message), code)
    }

    private fun messageFor(code: Int): String = when (code) {
        200 -> "OK"
        400 -> "Bad Request"
        401 -> "Unauthorized"
        404 -> "Not Found"
        500 -> "Internal Server Error"
        503 -> "Service Unavailable"
        else -> "Response"
    }

    companion object {
        private const val HOST = "tildes.net"

        /**
         * What Boost calls a site it can sign in to, and which API that site
         * speaks. Gson fills these in, so the class keeps its name where the
         * rest of that package is down to two letters.
         */
        private const val SERVER_CLASS = "com.rubenmayayo.lemmy.datatypes.server.Server"
        private const val LEMMY = "lemmy"
        private const val NODEINFO = "/nodeinfo/2.0.json"
        private const val NODEINFO_WELL_KNOWN = "/.well-known/nodeinfo"
        private const val CONTENT_TYPE = "application/json; charset=utf-8"
        /**
         * Boost's History tab asks for a community by this name. It is a marker
         * left over from its Reddit ancestry rather than anything real, and
         * passing it through made Tildes answer 422, which Boost showed as a
         * failed load. Its history is a local record anyway, so an empty
         * listing is the right answer.
         */
        private const val HISTORY = "_load_history_this_is_not_a_subreddit"

        /**
         * The fields of an edit that reach Tildes, for the one log line the
         * edit route prints. Lemmy's `EditPost` carries more than this and
         * Gson drops whatever the screen did not set, so which of them arrived
         * says which screen sent it.
         */
        private val EDITABLE = listOf("name", "url", "body", "nsfw", "custom_thumbnail")

        /**
         * How many topics the History tab remembers. The same number Boost's
         * own history keeps, which is what it trims its record down to.
         */
        private const val HISTORY_LIMIT = 200
        /** Where the parser side keeps it, since the fetch has a rule about it. */
        private const val NOTIFICATIONS_UNREAD = Tildes.NOTIFICATIONS_UNREAD
        private const val MESSAGES_UNREAD = "/messages/unread"
        /**
         * How many rows a listing answers with when Boost names no limit. Its
         * own paginators send one, so this is only the fallback.
         */
        private const val PAGE = 50

        /**
         * What sits under a group besides its topics.
         *
         * A topic is `/~group/<id36>`, and each of these is a route of the
         * same shape, so a link to one reads as a topic whose id happens to
         * spell a word. A wiki page has a screen of its own now and never
         * reaches here, though this is what it falls back to when that screen
         * will not open, and `search` and `new_topic` have no screen at all.
         */
        private val GROUP_ROUTES = setOf("wiki", "search", "new_topic")

        private const val BOOKMARKS = "/bookmarks"
        private const val VOTES = "/votes"
        private const val IGNORED = "/ignored_topics"
        private const val BOOKMARKED_TOPICS = "bookmarks|topic"
        private const val VOTED_TOPICS = "votes|topic"
        private const val IGNORED_TOPICS = "ignored|topic"
        private const val BOOKMARKED_COMMENTS = "bookmarks|comment"
        private const val VOTED_COMMENTS = "votes|comment"
        private val JSON = CONTENT_TYPE.toMediaType()

        @JvmField
        val INSTANCE = TildesInterceptor()

        /**
         * Whether the last Lemmy call came from the Tildes instance. Boost can
         * hold accounts on several instances at once, and the score below is
         * drawn with no idea where the comment came from, so this is what keeps
         * the change off everyone else's comments. Set on the API call that
         * fetched them, which is always the request right before they draw.
         */
        @Volatile
        private var answering = false

        /**
         * The comments of the topic last read, which of them Tildes calls new,
         * and which of them it has folded.
         */
        @Volatile
        private var knownComments: Set<String> = emptySet()

        @Volatile
        private var newComments: Set<String> = emptySet()

        @Volatile
        private var foldedComments: Set<String> = emptySet()

        /** And which of them Tildes would refuse a vote on. */
        @Volatile
        private var closedComments: Set<String> = emptySet()

        /**
         * And which of them were written by somebody muted, which is not
         * Tildes' answer at all -- it is Boost's own list, read as the thread
         * was built. See [commentFolded] for what it is for.
         */
        @Volatile
        private var mutedComments: Set<String> = emptySet()

        /**
         * Which comments the site said this account may label, against the
         * labels it has already put on each.
         *
         * A comment missing from here gets no **Label** row, which covers all
         * three of the site's refusals at once: your own comment, a taken-down
         * one, and an account under a week old. See [Tildes.Comment.mayLabel].
         *
         * Kept for the run rather than replaced with each thread, unlike the
         * five sets above it. Those answer a question Boost asks while drawing
         * the comment in front of it, where this one is asked of a menu opened
         * on a comment that may have been listed on a profile, in the bookmarks
         * or in a search -- so it is filled wherever a comment is read, and a
         * comment read again overwrites its own entry. Cleared on sign-out with
         * the rest of the session.
         */
        private val labelledComments = ConcurrentHashMap<String, List<String>>()

        // The other half of the same question -- which labels are on offer --
        // is a page's answer rather than a comment's, so it is read off every
        // fetch that carries one and held in Tildes.labelOptions.

        /** Boost's own answer stands. */
        private const val NEWNESS_UNKNOWN = -1
        private const val NEWNESS_OLD = 0
        private const val NEWNESS_NEW = 1

        /** The same three answers for the fold, which reads them as a boolean. */
        private const val FOLD_UNKNOWN = -1
        private const val FOLD_OPEN = 0
        private const val FOLD_SHUT = 1

        /**
         * Lemmy sort -> Tildes order and period.
         *
         * Tildes takes two things where Lemmy takes one. The order is a row of
         * tabs, `activity`, `votes`, `comments`, `new` and `all_activity`, and
         * the time window is a dropdown beside them that applies to whichever
         * tab is open. Lemmy has one `sort` field, and only its Top values
         * carry a window at all.
         *
         * So the sixteen values Boost can send are split in two. Five of them
         * name an order and the Top ones name a window, and each leaves the
         * other half alone, which is what makes "Activity, last 7 days"
         * reachable in a menu that can only send one value at a time.
         *
         * The half that was not sent has to be remembered, since Boost saves
         * its own sort per subscription and will send that one value on every
         * request from then on. It is kept in the app's preferences so a
         * restart does not arrive with a window and no order.
         *
         * `Old` still maps to `new`. Nothing on Tildes sorts ascending, so it
         * is the one value that lies, and the menu no longer offers it --
         * though a sort saved before the patch still arrives.
         */
        private val ORDERS = mapOf(
            "Active" to "activity",
            "Hot" to "activity",
            "Controversial" to "activity",
            "Scaled" to "votes",
            "New" to "new",
            "Old" to "new",
            "MostComments" to "comments",
            "NewComments" to "all_activity",
        )

        /**
         * Boost's Top rows, read as the window rather than as a votes sort.
         *
         * The first six are what the menu offers, worded and valued the way
         * tildes.net's own dropdown is. The rest are gone from the menu and
         * only arrive from a sort saved earlier, though Tildes takes any
         * window, so they still answer with something true.
         */
        private val PERIODS = mapOf(
            "TopHour" to "1h",
            "TopSixHour" to "12h",
            "TopTwelveHour" to "1d",
            "TopDay" to "3d",
            "TopWeek" to "7d",
            "TopAll" to "all",
            "TopMonth" to "30d",
            "TopThreeMonths" to "90d",
            "TopSixMonths" to "180d",
            "TopNineMonths" to "270d",
            "TopYear" to "365d",
        )

        /**
         * The sort a feed carries while it is on a window somebody typed.
         *
         * The number cannot ride inside the sort. Every hand-off between the
         * menu and the request is a closed set of small ints -- the id on the
         * row, the switch behind it, and the int Boost keeps per feed -- and
         * `SortType` is a bare enum with no room for one. So the sort says
         * **that** a feed is on a typed window and [Session.customWindow] says
         * which, and between them a feed comes back to it after a restart with
         * nothing remembered per feed on this end.
         *
         * `TopYear` is the one to borrow because the menu stopped offering it
         * when the sorts were cut to Tildes' own: a year is not one of the
         * site's five windows, so `sort_year` comes out of every menu and
         * **other period** goes in where it was. The only other way it can
         * arrive is a sort saved before the patch, and that answers as the year
         * it says, since a window is borrowed only once one has been typed.
         */
        private const val CUSTOM_WINDOW = "TopYear"

        /**
         * That window, for the one sort that means it. Null for every other
         * sort, and for that sort before anything has been typed.
         */
        private fun customWindow(sort: String?): String? =
            if (sort == CUSTOM_WINDOW) Session.customWindow() else null

        /**
         * Tildes' own word for each order, off `TopicSortOption.display_name`.
         */
        private val ORDER_WORDS = mapOf(
            "activity" to "Activity",
            "new" to "New",
            "comments" to "Comments",
            "all_activity" to "All activity",
            "votes" to "Votes",
        )

        /**
         * Tildes' own word for a window, off the dropdown beside the tabs.
         *
         * Worked out rather than tabulated, because the site works it out too:
         * `last {{ period }}` over a period that says itself through
         * `ago.human`. A table beside it was one entry wrong at the far end --
         * 365 days reads *Last 1 year* on the site, not *Last 365 days* and not
         * *Last year* -- and a window somebody sets themselves can be any of
         * them, so there is nothing to tabulate against.
         *
         * **All time** is the one that is not a window at all, and it is the
         * one word here that is ours.
         */
        private fun periodWords(period: String?): String? =
            if (period == ALL_TIME) ALL_TIME_WORDS else Lemmy.windowWords(period)

        private const val ALL_TIME = "all"
        private const val ALL_TIME_WORDS = "All time"

        /**
         * Boost's `Top` row, which opens the submenu the windows hang under
         * rather than sorting anything. `from` is the site's own label for that
         * dropdown.
         */
        private const val WINDOW_MENU = "From…"

        /**
         * Lemmy comment sort -> Tildes `comment_order`.
         *
         * A comment tree is the one place the two sites nearly agree: four
         * orders each, no time window over them, and three of the four mean
         * the same thing. Only Boost's `Hot` and `Controversial` collide,
         * since Tildes has one relevance order rather than two.
         */
        private val COMMENT_ORDERS = mapOf(
            "Hot" to "relevance",
            "Top" to "votes",
            "New" to "newest",
            "Old" to "posted",
            "Controversial" to "relevance",
        )

        /** The order a topic page comes back in when it is asked for none. */
        private const val COMMENT_DEFAULT = "relevance"

        /**
         * Tildes' own word for each, off `CommentTreeSortOption.description`,
         * which is what its own dropdown over a comment tree says.
         */
        private val COMMENT_ORDER_WORDS = mapOf(
            "relevance" to "relevance",
            "votes" to "most votes",
            "newest" to "newest first",
            "posted" to "order posted",
        )

        /**
         * The two rows the Groups page's own sort menu comes down to, and what
         * each is labelled with.
         *
         * Tildes has no group sort at all. Its `/groups` is one alphabetical
         * page, and the one number it publishes per group is an activity rate,
         * topics and comments per day. So there are two orders to offer and
         * eleven rows to offer them under: Boost builds New, Old and a **Top**
         * submenu of eight windows, and every one of those windows means the
         * same thing here, since a rate is not a window.
         *
         * Which row carries which is not a choice. **New** has to stay name
         * order, since that is what a fresh install and every screen that never
         * picked a sort sends, and Top opens a submenu rather than sorting.
         * That leaves Old for the other one. See [BUSIEST_FIRST].
         */
        private val GROUP_SORT_ROWS = mapOf(
            "sort_new" to "Name",
            "sort_old" to "Activity",
        )

        /**
         * Which post sort each of Boost's rows carries, by the string it is
         * labelled with.
         *
         * A row is found by its title rather than by the id in `MenuOption.a`,
         * because those ids start at zero and every other menu in the app
         * passing through the same method carries its own. The string ids
         * renumber every release, so the names are resolved against the app's
         * own resources at runtime.
         *
         * The id is read for one thing only, and it is the next table down:
         * five of these strings label a row in the comment sort menu as well,
         * where they mean something else entirely.
         */
        private val SORT_ROWS = mapOf(
            "sort_hot" to "Hot",
            "sort_active" to "Active",
            "sort_new" to "New",
            "sort_old" to "Old",
            "sort_most_comments" to "MostComments",
            "sort_new_comments" to "NewComments",
            "sort_controversial" to "Controversial",
            "sort_scaled" to "Scaled",
            "sort_top" to "Top",
            "sort_hour" to "TopHour",
            "sort_six_hours" to "TopSixHour",
            "sort_twelve_hours" to "TopTwelveHour",
            "sort_day" to "TopDay",
            "sort_week" to "TopWeek",
            "sort_month" to "TopMonth",
            "sort_year" to "TopYear",
            "sort_all" to "TopAll",
        )

        /** The sorts Tildes has nothing for, by the string Boost labels them with. */
        private val DROPPED_SORTS = setOf(
            // Hot and Controversial are `activity` again, and nothing on
            // Tildes sorts ascending, so Old answers newest first.
            "sort_hot",
            "sort_controversial",
            "sort_old",
            // Windows the site's own dropdown does not offer.
            "sort_month",
            "sort_year",
        )

        /**
         * Which of Tildes' orders each row of a **profile's** own sort menu asks
         * for, which is a table of its own because that menu is a menu of its
         * own.
         *
         * Boost builds it with `hj.m` rather than with the builder a feed's
         * comes out of, and that one offers three sorts: New, Old, and a Top
         * submenu of eight windows. Tildes offers five orders on a profile's
         * topics and two on its comments, and **no window at all** -- `order` is
         * the whole of what `/user/<name>` takes beside `type`. So the rows that
         * name a window on a feed are the rows with nothing to say here, and
         * they are the ones that carry the orders instead.
         *
         * The same trick as the Groups page's two orders, for the same reason:
         * every hand-off between a menu row and a request is a closed set of
         * small ints -- the id in `MenuOption.a`, the switch behind it, and the
         * sort it resolves to -- so a row can only ask for something Boost
         * already has an id for. What that id means is then this project's to
         * decide per route, and nothing outside a profile reads this.
         *
         * **`Old` is deliberately not in it.** It already means newest-first on
         * a feed and busiest-first on the Groups page, and there are windows
         * going spare.
         */
        private val PROFILE_ORDER_ROWS = mapOf(
            "sort_hour" to "activity",
            "sort_six_hours" to "votes",
            "sort_twelve_hours" to "comments",
            "sort_new" to "new",
            "sort_day" to "all_activity",
        )

        /**
         * The same table keyed by what arrives in a request, which is the far
         * end of it: Boost sends `sort=TopHour` and the interceptor has to read
         * `order=activity` off it. Derived rather than written down twice, so a
         * row cannot ask for one order and be answered with another.
         */
        private val PROFILE_ORDERS: Map<String, String> =
            PROFILE_ORDER_ROWS.mapNotNull { (row, order) ->
                SORT_ROWS[row]?.let { it to order }
            }.toMap()

        /**
         * Which orders each tab of a profile has, in the order tildes.net's own
         * dropdown lists them -- `TopicSortOption` for the topics listing and
         * `CommentSortOption` for the comments one.
         *
         * **Every other tab has none**, and that is off the site's routes rather
         * than off a page. `/bookmarks` and `/votes` take `type`, `after`,
         * `before` and `per_page`; `/ignored_topics` takes those three without
         * `type`; none of them takes `order` at all. `/user/<name>` does take it
         * and **ignores it unless `type` is there**, which is the All posts tab:
         * with no type the view hands its template no sort options and applies
         * none, so the parameter goes nowhere.
         */
        private val PROFILE_TAB_ORDERS = mapOf(
            TOPICS_TAB to listOf("activity", "votes", "comments", "new", "all_activity"),
            COMMENTS_TAB to listOf("votes", "new"),
        )

        /**
         * The two rows a profile's menu offers for filtering by group, which no
         * profile on Tildes has: the site's own pages take a person and a type
         * and nothing else. **All groups** is the second of them, and a row this
         * patch added borrowed its id for a while -- the Bookmarks strip carries
         * that choice now, so both rows go with the rest.
         */
        private const val ALL_GROUPS_ROW = "filter_by_all_communities"

        private val PROFILE_GROUP_FILTER_ROWS = setOf("filter_by_subreddit", ALL_GROUPS_ROW)

        /**
         * And the two the Bookmarks tab keeps. Nothing is done to either -- they
         * are here so that a row this knows the name of is never mistaken for
         * the divider under them, which is the one row in the menu carrying no
         * title and no id.
         */
        private val PROFILE_KIND_ROWS = setOf("filter_by_links", "filter_by_comments")

        /**
         * Which comment sort each of Boost's rows carries, which is the same
         * five strings again meaning something else.
         *
         * The comment menu is built once, in its own method, and shares four of
         * its titles with the post menu: `sort_hot`, `sort_top`, `sort_new` and
         * `sort_old`. So a hook matching on the title alone read a comment menu
         * as a post one -- it dropped Hot and Old, which are two of Tildes' four
         * real comment orders, and labelled Top **From…**, which is a time
         * window a comment tree has never had.
         *
         * Nothing here is a window, so nothing is a submenu either, and all
         * four rows stay.
         */
        private val COMMENT_SORT_ROWS = mapOf(
            "sort_hot" to "Hot",
            "sort_top" to "Top",
            "sort_new" to "New",
            "sort_old" to "Old",
            "sort_controversial" to "Controversial",
        )

        /**
         * The one comment sort that goes, for the reason Hot goes from a post
         * menu: Controversial is `relevance` again, and the row above it
         * already says relevance.
         *
         * Boost only builds it on PieFed, so it should never be reached here.
         * It is in the table because a row that is not built costs nothing and
         * a duplicate order in a four row menu would look like a bug.
         */
        private val DROPPED_COMMENT_SORTS = setOf("sort_controversial")

        /**
         * `MenuOption.a` on the comment menu's **Top** row, which is what tells
         * the two sort menus apart.
         *
         * The rest of the app's rows carry an id from `R.id`, in the
         * `0x7f0a0000` range, and Boost's sort rows carry a small number of
         * their own instead: the post menu numbers its windows 7 to 14 and puts
         * `R.id.sort_3` on the row they hang under, while the comment menu
         * numbers its four rows 0 to 3. So `sort_top` under `1` is the comment
         * menu's and nothing else's.
         */
        private const val COMMENT_SORT_TOP_ROW = 1

        /**
         * The rows with nothing behind them, from the menus a topic, a comment
         * and a message carry.
         *
         * **Downvote**, because Tildes votes one way only. It is built where a
         * listing's layout has no button to tap, so it and [voteButton] cover
         * the same absence on different screens.
         *
         * **Report**, because Tildes has no such thing. What it has instead is
         * comment labels -- Exemplary, Offtopic, Joke, Noise and Malice -- and
         * those are a feature of their own rather than this row renamed, so
         * until one exists the row leads nowhere. It is built in three places,
         * a topic's menu, a comment's and a message's, and all three come
         * through here.
         *
         * **Cross-posts**, because nothing on Tildes is a copy of anything
         * else. Lemmy files a repost against the original and Boost lists them
         * under a topic, which is a list that is always empty here.
         *
         * **Cross-post** the verb with it, which sits in the share submenu
         * under a topic rather than beside the list. Tildes has no equivalent
         * and wants none: where Reddit answers "this belongs somewhere else" by
         * posting a second copy, Tildes answers it by **moving** the topic, one
         * topic throughout. The row opened Boost's composer with the link
         * filled in and a group to pick, which would have posted a duplicate.
         *
         * Mark NSFW is not here. It looked like the same kind of row and is
         * not: Tildes has no flag for it while it does have the tag, so the row
         * adds and removes `nsfw` and means what it says.
         *
         * None of them carries a word of its own, only a drop, so they never
         * reach [sortWord].
         */
        private val DROPPED_ROWS =
            setOf(
                "button_downvote",
                "popup_report",
                "crossposts",
                "crosspost",
                // **Share source**, on a comment. It shares the address the
                // comment came from, which on a federated instance is another
                // server and here is the row above it. Tildes federates with
                // nothing, so it has always been the same link twice, and it
                // reads as though there were somewhere else to look.
                "share_fedilink",
            )

        /**
         * The listing-type rows on a search menu, which is the one menu in the
         * app that carries them: **Subscribed**, **Local** and **All**, above
         * a divider and the sorts.
         *
         * Two of the three come off. **Local** because Tildes federates with
         * nothing, which is the argument that took the tab off the Groups page
         * and the row off the drawer. And **All** because it is the same answer
         * as the row above it: the interceptor never reads `listing_type`, so
         * all three search the same thing, and a row promising the whole site
         * while searching your subscriptions is worse than no row.
         *
         * Subscribed stays. It is what the search does, and leaving it keeps
         * the group a group -- the divider under it still separates something
         * from the sorts.
         *
         * **`all` is not safe to drop by name alone.** That same string titles
         * the inbox's All/Unread filter and the Notifications filter, and both
         * of those go through the same hook. So it comes off only in a menu
         * that also carries `local`, which no other menu in the app does.
         */
        private const val LOCAL_ROW = "local"

        private val DROPPED_LISTING_ROWS = setOf(LOCAL_ROW, "all")

        /**
         * **Delete**, which is a real row everywhere but on the one menu
         * [mayTagRow] opens. See [dropDeleteRow].
         */
        private const val DELETE_ROW = "popup_delete"

        /**
         * The pairs of rows that say the same thing on a topic with no link of
         * its own, and which of the two is the one to keep.
         *
         * Boost's **Share…** and **Copy…** submenus each offer the link and the
         * discussion separately -- Share link against Share topic, Copy link
         * against Copy comments -- and the first of each is
         * `SubmissionModel.T`, the link target, which **falls back to the
         * topic's own address when there is no link**. So on a text topic the
         * two rows hand over the same thing under different names, and the name
         * on the first one is not true: there is no link.
         *
         * They said the same thing before the short form as well, as two long
         * addresses that took a moment to tell apart. The short one only made
         * it obvious.
         *
         * The link row comes off rather than the other, since it is the one
         * whose name is untrue there. On a link topic the two say different
         * things -- somebody else's site, and the discussion of it -- and
         * neither moves.
         */
        private val SAID_TWICE = listOf(
            SHARE_LINK_ROW to SHARE_TOPIC_ROW,
            "copy_link" to "copy_comments",
        )

        /**
         * The three rows under **Share…**: the topic's link target, the topic
         * itself, and the title in front of the first of those.
         */
        private const val SHARE_LINK_ROW = "share_link"
        private const val SHARE_TOPIC_ROW = "share_permalink_comments"
        private const val SHARE_TITLE_ROW = "share_title_link"

        /**
         * **Share…** itself, which is the row the topic log goes above.
         *
         * It is the last thing in a topic's menu that is not a submenu of
         * addresses, so a row about the topic sits over it rather than under
         * Copy…, and it is in the menu whether that menu was opened from inside
         * the topic or off a row in a listing -- **Permalink** above it is only
         * in the first.
         */
        private const val SHARE_MENU_ROW = "menu_submission_share"

        /**
         * The rows Tildes has a word of its own for, written over them here
         * rather than into the string table.
         *
         * **Bookmark** is what the site calls saving, and the row that does it
         * carries `button_save`, which is Boost's generic Save: ten places use
         * that string and only the topic and comment menus mean bookmarking by
         * it. Rewriting it read Bookmark on the profile editor's Save button,
         * on the dialog that offers to keep a draft and on four more screens
         * besides.
         *
         * So it goes on the row, where the sort words already go, for the same
         * reason they do: a resource is chosen when the patch is applied and a
         * field is chosen when the row is drawn. Which leaves the word on the
         * two menus that mean it and Save everywhere else.
         *
         * One entry covers both directions. The row keeps this title whether or
         * not the topic is bookmarked and swaps its icon instead, and
         * `button_unsave` is a string nothing in the app draws.
         */
        private val RENAMED_ROWS = mapOf("button_save" to "Bookmark")

        /**
         * Which String field on a row is drawn when it holds anything.
         *
         * `MenuView$MenuAdapter.onBindViewHolder` reads it first and only falls
         * back to the title resource in `d` when it is empty, which is what
         * makes a per-account label possible at all: resources are chosen when
         * the patch is applied, a field is chosen when the row is drawn.
         *
         * Boost's own class names survive here while its fields are down to
         * single letters, so this one is named rather than found. The patch's
         * assumption tests pin it against the app.
         */
        private const val TITLE_TEXT_FIELD = "e"

        /**
         * Which int field on a row holds the id Boost tells its own rows apart
         * by, read for one question only: which of the two sort menus this is.
         *
         * Named for the same reason [TITLE_TEXT_FIELD] is, and pinned the same
         * way. It cannot be found by its value the way the title is, since a
         * row id is any int Boost likes and two of the four int fields on a row
         * hold a small number.
         */
        private const val ROW_ID_FIELD = "a"

        /**
         * What one menu is made of: the rows that come out, and the words
         * written over the ones that stay.
         */
        private class Table(val dropped: Set<Int>, val words: Map<Int, String>)

        /**
         * The menu rows this touches, resolved against the app's own resources.
         *
         * [titles] is every title it knows, which is what a row is looked up
         * by. The two tables are the same strings read two ways, and [topRow]
         * is the title that says which of them a menu wants.
         */
        private class Rows(
            val titles: Set<Int>,
            val topRow: Int,
            /** The row that says a menu is a feed's own, and the one to borrow. */
            val activeRow: Int,
            val yearRow: Int,
            /** The **Local** row, which is what says a menu is the search one. */
            val localRow: Int,
            /** And what comes off once it has. */
            val listingRows: Set<Int>,
            /** The row that comes off when it repeats the one beside it, and that one. */
            val saidTwice: List<Pair<Int, Int>>,
            /** The author's own row, for the one menu it is offered wrongly on. */
            val deleteRow: Int,
            /** The three share rows, for the fourth this offers beside them. */
            val shareLinkRow: Int,
            val shareTopicRow: Int,
            val shareTitleRow: Int,
            /** And the submenu they hang under, which the topic log goes over. */
            val shareMenuRow: Int,
            /** Every row that names a sort, which is a profile's whole block. */
            val sortRows: Set<Int>,
            /** The group filter it has none of, and the second of those two. */
            val groupFilterRows: Set<Int>,
            val allGroupsRow: Int,
            /** And which sort row carries which of Tildes' orders on a profile. */
            val profileOrders: Map<Int, String>,
            val post: Table,
            val comment: Table,
            val group: Table,
        )

        @Volatile
        private var rows: Rows? = null

        /**
         * Whether Tildes counts a comment as posted since your last visit.
         *
         * Boost works this out from a watermark of its own, in a preferences
         * file, holding the newest comment it saw last time you opened the
         * topic. That answers the same as Tildes right up until the two stop
         * agreeing about when you last read the thread -- reading it on the
         * website moves Tildes' visit and not Boost's watermark, and then the
         * app highlights comments the site no longer calls new, and leaves the
         * chains around them folded.
         *
         * Tildes marks them itself, on the page, so there is a right answer to
         * hand over. It also excludes your own comments, which Boost's
         * comparison cannot do.
         *
         * Called from patched bytecode, for every comment on screen. The
         * unknown answer is what keeps this off other instances and off any
         * thread this never parsed.
         */
        @JvmStatic
        fun commentNewState(id: String?): Int = when {
            !answering || id == null -> NEWNESS_UNKNOWN
            id in newComments -> NEWNESS_NEW
            id in knownComments -> NEWNESS_OLD
            else -> NEWNESS_UNKNOWN
        }

        /**
         * Whether Tildes has folded a comment.
         *
         * Tildes folds every chain holding nothing posted since your last
         * visit, so the new replies are what you land on. Boost can do that --
         * the fold is written, and it already hides a folded comment's whole
         * subtree -- but it only ever runs it for a blocked author, and there
         * is no Lemmy field meaning "collapse this".
         *
         * The interceptor reads Tildes' own `is-comment-collapsed` off the
         * page, so the question has a right answer here rather than a field to
         * borrow. Swapping the field the fold reads was the earlier way, and it
         * cost every other instance the fold it had: a blocked author's
         * comments stopped folding wherever the app was pointed. This one
         * answers unknown instead, and Boost's own read runs.
         *
         * **A muted author's comment is handed back rather than answered**, and
         * that is the same principle pointed at the case it was written for.
         * `Lemmy.commentView` marks such a comment blocked, so Boost's own read
         * folds it and draws its whole blocked-author treatment; answering
         * `FOLD_OPEN` here would open it again one instruction later. Tildes has
         * no block of any kind, so a muted person's comments were drawn in full
         * inside every topic while their topics vanished from every feed.
         *
         * Called from patched bytecode, once per comment, as the thread loads.
         */
        @JvmStatic
        fun commentFolded(id: String?): Int = when {
            !answering || id == null || id !in knownComments -> FOLD_UNKNOWN
            id in mutedComments -> FOLD_UNKNOWN
            id in foldedComments -> FOLD_SHUT
            else -> FOLD_OPEN
        }

        /**
         * Whether a listing is one of Boost's own rather than a community.
         *
         * Boost keeps a list of these -- `!all`, `!local`, `!popular`, `!saved`
         * and `!subscribed` -- and left History out of it, which is one
         * omission with three visible ends. The name drawn over the tab falls
         * back to the marker, `_load_history_this_is_not_a_subreddit`, even
         * though Boost has `R.string.history` mapped to that exact string one
         * `if` away. The screen counts as a community, so once the list loads
         * Boost adopts the first row's community and the tab retitles itself
         * `~enviro`. And the community it is not offers to be subscribed to.
         *
         * Adding History to the list is Boost's own answer to all three. It
         * also puts a trending panel at the top, which is what its other
         * listings of this kind do.
         *
         * Not scoped to Tildes, unlike everything else here: it is Boost's own
         * screen and its own bug, so it reads the same wherever the app is
         * pointed.
         *
         * **A tag listing answers the same way, and is scoped.** It reaches
         * this screen as a community because a community is the one listing
         * Boost knows how to follow, and it is not one: it cannot be subscribed
         * to, it has no sidebar to fetch, and left to itself the screen would
         * ask for the community, put a Subscribe control on a filter, and
         * retitle itself after whichever group the first row happened to be in.
         * Saying it is one of Boost's own settles all three, and costs the
         * request the screen would have spent on `/community`. What it draws
         * over the tab is then the name itself, which is why that name is
         * tildes.net's own URL for the listing.
         *
         * **A group asked for with its subgroups is the same shape**, and is
         * here for the same three reasons: `~sports?all_subgroups=true` is a
         * view of a group rather than a group, so it cannot be subscribed to
         * under that name and the group it is a view of already has its own
         * screen with its own Subscribe on it.
         *
         * Called from patched bytecode, for every listing name tested.
         */
        @JvmStatic
        fun isSpecialListing(name: String?): Boolean =
            name == HISTORY || (
                Session.wasTildes() &&
                    (Lemmy.tagListing(name) != null || Lemmy.subgroupListing(name) != null)
                )

        /**
         * The site's own front page, opened as the app's front page rather than
         * in a browser.
         *
         * Every other tildes.net address the phone hands over is answered a
         * request later: Boost asks its server to resolve the link and the
         * interceptor reads a topic, a comment, a group or a person off the
         * shape of the path. **The root has no shape.** `/resolve_object`
         * answers `couldnt_find_object` for it, the way it does for anything it
         * cannot name, and Boost's fallback for that is the built-in browser --
         * so tapping tildes.net went to a WebView showing the page Boost was
         * about to draw itself.
         *
         * There is nothing to resolve it into, either: Lemmy's resolve has a
         * post, a comment, a community and a person in it and no way to say
         * "the front page". So this is answered a step earlier, in the router
         * Boost runs before it asks anything -- the one that already knows four
         * shapes of Lemmy address and says whether it handled one.
         *
         * **The feed is Boost's own `!subscribed`**, built rather than named:
         * the class keeps its name where the static that makes one is a letter,
         * and `(-3000, "!subscribed")` is exactly what that letter passes. The
         * id matters -- the screen finds the row in its own spinner by comparing
         * models, and a model built from a name alone keeps `-1` and compares
         * equal to every other one that did.
         *
         * **A query is dropped.** `tildes.net/?order=votes&period=3d` is the
         * front page in an order, and the order is not this hook's to carry:
         * Boost sends its own sort on every request and reads it from a
         * preference per feed. Opening the front page in whatever order it is
         * already in beats a browser, and the log says what was ignored.
         *
         * Scoped on the account, and it can be: this runs inside the app, where
         * the flag has outlived the process. A Lemmy account tapping a tildes.net
         * link keeps Boost's own answer, which is the browser.
         *
         * Called from patched bytecode, at the head of that router, and answers
         * false wherever Boost's own should run.
         */
        @JvmStatic
        fun openedSitePage(context: Context?, url: String?): Boolean {
            if (context == null || url == null || !Session.wasTildes()) return false
            return try {
                /*
                 * A tag listing first, because it is a filter over a page
                 * rather than a page, and the table below reads paths.
                 *
                 * Both scopes were wrong without this and each in its own way.
                 * `/?tag=x` is the front page's path, so it opened the front
                 * page and threw the tag away -- the log said
                 * `ignoring ?tag=apps` in as many words. `/~group?tag=x` is no
                 * site page at all, so it fell past this to `/resolve_object`,
                 * which has nothing to resolve a listing into, and ended in a
                 * browser.
                 *
                 * [openTag] is the same answer for a link tapped inside the
                 * app. This is the one for a link arriving from anywhere else
                 * on the phone, which is a different way in and was the half
                 * with nothing behind it.
                 */
                Lemmy.tagListingFor(url)?.let { return openTagListing(context, it) }

                /*
                 * And a group asked for with its subgroups, which is the other
                 * filter over a page rather than a page. `/~sports` resolves to
                 * a group one request later, but the pattern that reads it ends
                 * at the path, so `/~sports?all_subgroups=true` is no shape the
                 * resolve route knows and would end in a browser -- which is
                 * where `/~group?tag=x` ended before the line above.
                 */
                Lemmy.subgroupListingFor(url)?.let { return openSubgroups(context, url) }

                /*
                 * And a wiki page, for the same reason one step further along:
                 * the table below reads paths and a wiki page's path carries a
                 * group, so `/~comp/wiki/index` was never going to be a row in
                 * it. `Tildes.sitePage` does not even answer for one -- a `~`
                 * is not in the set of characters it takes -- so this fell past
                 * everything to `/resolve_object`, which has a topic, a
                 * comment, a group and a person in it and no wiki page, and
                 * ended in the built-in browser.
                 *
                 * [openWiki] is the same answer for a link tapped inside the
                 * app, and it is the whole answer here too: the screen it
                 * opens takes a group and a page name and nothing about where
                 * the tap came from.
                 */
                if (openWiki(context, url)) return true

                val page = Tildes.sitePage(url) ?: return false
                when (page.path) {
                    "" -> openedFrontPage(context, page.query)
                    GROUPS_PATH -> opened(context, GROUPS_SCREEN, "the groups page")
                    BOOKMARKS -> openedOwnTab(context, BOOKMARKS_TAB, "bookmarks")
                    VOTES -> openedOwnTab(context, VOTES_TAB, "votes")
                    IGNORED -> openedOwnTab(context, IGNORED_TAB, "ignored topics")
                    NOTIFICATIONS -> openedInbox(context, REPLIES_TAB, "notifications")
                    MESSAGES -> openedInbox(context, MESSAGES_TAB, "messages")
                    SETTINGS -> openedAccountEditor(context)
                    else -> false
                }
            } catch (t: Throwable) {
                false
            }
        }

        /**
         * **Open in browser** on a tildes.net address, which used to land back
         * in the app.
         *
         * The row is in the dialog every **Permalink** opens, and a long-pressed
         * link opens the same one. It hands the address to Boost's own browser,
         * which is a preference with three answers: a Custom Tab, the built-in
         * `WebViewActivity`, or another app. **Two of those three are an
         * `ACTION_VIEW` intent** -- a Custom Tab is one with extras on it -- and
         * this patch puts `tildes.net` and `tild.es` in the manifest, so Android
         * offers Boost for them. With the phone set to let Boost have those
         * links, the intent came straight back: the deep-link activity read the
         * address, `/resolve_object` named the comment, and the app opened the
         * comment it was already showing. The default is a Custom Tab, so that
         * is what most people get.
         *
         * So the site's own addresses go to the built-in browser and skip the
         * intent. Everything else is handed back for Boost to open exactly as it
         * did, which is every link in a body that is not a Tildes one.
         *
         * **Only this row.** A link *tapped* rather than long-pressed goes
         * through a different method, and there the bounce is what opens it in
         * the app -- one of the four Lemmy shapes never matches a Tildes path,
         * so the address falls out to the same browser call and comes back
         * through the manifest. Taking that away would open a topic in a
         * WebView. See `ARCHITECTURE.md`.
         *
         * **Open in external app**, the row under it, is left alone: it says
         * hand this to another app, and which app Android offers is the phone's
         * business rather than this patch's.
         *
         * Called from patched bytecode, in place of the call the row made.
         * Answers the address for Boost to carry on with, or null once this end
         * has opened it. A failure to start the activity hands the address back
         * rather than swallowing the tap.
         */
        @JvmStatic
        fun browserFor(context: Context?, url: String?): String? {
            if (context == null || url == null) return url
            if (!Session.wasTildes() || !Tildes.onThisSite(url)) return url
            return try {
                // No flags, the way Boost's own call has none: the context here
                // is the activity the dialog was shown over, so the browser
                // belongs in the task that is already open.
                context.startActivity(
                    Intent(context, Class.forName(BROWSER_SCREEN)).putExtra(BROWSER_URL, url),
                )
                null
            } catch (t: Throwable) {
                url
            }
        }

        /**
         * Boost's built-in browser, and the one extra it takes.
         *
         * The activity is in the manifest, so its name survives obfuscation the
         * way the settings host's does, and the extra is the literal `"url"`.
         */
        private const val BROWSER_SCREEN =
            "com.rubenmayayo.reddit.ui.activities.WebViewActivity"
        private const val BROWSER_URL = "url"

        /**
         * Your own profile, on the tab one of the site's own pages lives on.
         *
         * `/bookmarks`, `/votes` and `/ignored_topics` are the same three lists
         * the profile draws, and on Tildes they are only ever **yours** -- the
         * site has no route for anybody else's -- so the person is built out of
         * the signed-in name rather than read off the address, and the tab key
         * is the whole of what tells the three apart. The drawer's Bookmarks row
         * builds the same intent, which is [ownProfile].
         *
         * Signed out this answers false and the address goes to a browser,
         * where the site would ask for a login. There is nothing on the phone to
         * show instead.
         */
        private fun openedOwnTab(context: Context, tab: String, what: String): Boolean {
            val name = ownName() ?: return false
            context.startActivity(
                ownProfile(context, name, tab).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK),
            )
            return true
        }

        /**
         * The intent behind that, which is a person and a tab key.
         *
         * `PersonModel` keeps its name where most of Boost's classes are down to
         * letters, and its three-argument constructor is the one the app builds
         * one with. The id is the CRC32 the interceptor hashes a name into, so
         * the profile asks for the same person the rest of the app would.
         */
        private fun ownProfile(context: Context, name: String, tab: String): Intent {
            val person = Class.forName(PERSON_MODEL_CLASS)
                .getConstructor(
                    String::class.java, String::class.java, Int::class.javaPrimitiveType,
                )
                .newInstance(name, HOST, Lemmy.userId(name)) as Parcelable

            return Intent(context, Class.forName(PROFILE_SCREEN))
                .putExtra(PERSON_EXTRA, person)
                .putExtra(OPEN_TAB_EXTRA, tab)
        }

        /**
         * The signed-in account's name, or null where nothing is signed in.
         *
         * Every page this table reaches beyond the front page and `/groups` is
         * behind a login on Tildes -- `/bookmarks`, `/votes`,
         * `/ignored_topics`, `/notifications`, `/messages` and `/settings` all
         * sit under the site's own logged-in factory -- so a row with no name to
         * open one for hands the address back, and the browser asks for a login
         * the way the site would. It is also what keeps the inbox off the screen
         * signed out, which is a screen that dereferences the account unchecked.
         *
         * Read off disk where the session has not been put back yet, which is
         * every address tapped on a cold start: the restore runs inside the
         * first request and this runs before there has been one.
         */
        private fun ownName(): String? = Tildes.username ?: Session.storedUsername()

        /**
         * The site's notifications and its messages, which are one screen here
         * with a tab each.
         *
         * Tildes keeps them apart -- `/notifications` is replies to your posts
         * and `/messages` is conversations -- and Boost's inbox has both, plus a
         * Mentions tab in the middle that Tildes has nothing for. The tab is an
         * `int` extra and out of range is ignored rather than refused, so the
         * worst a renumbering does is land on Replies.
         *
         * `NotificationsActivity` is the other screen this could be, and it is
         * not this one: Boost picks it for a **PieFed** account and the inbox for
         * everything else, which is what a Tildes account counts as.
         */
        private fun openedInbox(context: Context, tab: Int, what: String): Boolean {
            if (ownName() == null) return false
            context.startActivity(
                Intent(context, Class.forName(INBOX_SCREEN))
                    .putExtra(INBOX_TAB, tab)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK),
            )
            return true
        }

        /**
         * The site's settings page, which is the account editor here.
         *
         * Not Boost's own settings screen, which holds Boost's own preferences
         * and knows nothing about Tildes. The four Tildes settings this patch
         * carries are on the **account editor**, with the comment sort order and
         * the invite codes under them and the bio above, so that is the screen
         * somebody tapping `/settings` is after.
         *
         * One activity hosts every settings page in Boost and an extra names
         * which, as a fragment class name -- the same intent its own profile
         * builds behind **Edit**. Started without that extra it opens the list
         * of headers instead, which is two taps from the page rather than on it.
         *
         * The site's subpages stay in a browser. `/settings/password_change` and
         * `/settings/two_factor` are things this app has no screen for at all,
         * and `/settings/bio` is the one of them this editor does draw, so that
         * one is a row away if anybody taps it.
         */
        private fun openedAccountEditor(context: Context): Boolean {
            if (ownName() == null) return false
            context.startActivity(
                Intent(context, Class.forName(SETTINGS_SCREEN))
                    .putExtra(SHOW_FRAGMENT, ACCOUNT_FRAGMENT)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK),
            )
            return true
        }

        /** The front page, which is the one of these that carries a feed. */
        private fun openedFrontPage(context: Context, query: String): Boolean {
            val model = Class.forName(SUBSCRIPTION_MODEL_CLASS)
                .getDeclaredConstructor(Int::class.javaPrimitiveType, String::class.java)
                .apply { isAccessible = true }
                .newInstance(FRONT_PAGE_ID, FRONT_PAGE) as Parcelable

            context.startActivity(
                Intent(context, Class.forName(MAIN_ACTIVITY_CLASS))
                    .putExtra(TARGET_LISTING, model)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP),
            )
            return true
        }

        /**
         * And a screen that needs nothing but starting, which is the shape the
         * rest of the site's own pages would take.
         */
        private fun opened(context: Context, screen: String, what: String): Boolean {
            context.startActivity(
                Intent(context, Class.forName(screen))
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK),
            )
            return true
        }

        /**
         * The site's groups page, and Boost's own screen for it.
         *
         * `/groups` is one alphabetical list on the site and three tabs in the
         * app, one of which this patch already drops. It takes no extra at all --
         * Boost's own way in is `new Intent(context, CommunitiesActivity.class)`
         * and nothing else -- so the whole of translating it is this row.
         */
        private const val GROUPS_PATH = "/groups"
        private const val GROUPS_SCREEN =
            "com.rubenmayayo.lemmy.ui.communities.CommunitiesActivity"

        /**
         * The site's own settings page, and Boost's screen for one.
         *
         * `SETTINGS_SCREEN` is the host for every settings page in the app and
         * `SHOW_FRAGMENT` is how it is told which -- a fragment class name,
         * which is why [ACCOUNT_FRAGMENT] is spelled out here. Both survive
         * obfuscation for the same reason: the activity is in the manifest and
         * the fragment is named in `pref_headers_v2.xml`, so the tests pin them.
         */
        private const val NOTIFICATIONS = "/notifications"
        private const val MESSAGES = "/messages"

        /**
         * Boost's inbox, and how it is told which tab. The three are Replies,
         * Mentions and Messages, in that order, and the extra is a bare `int`
         * with no constant of Boost's own to borrow.
         */
        private const val INBOX_SCREEN = "com.rubenmayayo.lemmy.ui.inbox.InboxActivity"
        private const val INBOX_TAB = "where"
        private const val REPLIES_TAB = 0
        private const val MESSAGES_TAB = 2

        private const val SETTINGS = "/settings"
        private const val SETTINGS_SCREEN =
            "com.rubenmayayo.reddit.ui.preferences.v2.SettingsActivityCompat"
        private const val SHOW_FRAGMENT = "extra_show_fragment"
        private const val ACCOUNT_FRAGMENT =
            "com.rubenmayayo.reddit.ui.preferences.v2.PreferenceFragmentAccountCompat"

        /**
         * Boost's own front page, which is its subscriptions rather than the
         * whole site. Tildes' front page is the same thing: logged in it draws
         * the groups you are subscribed to.
         */
        private const val FRONT_PAGE = "!subscribed"

        /** And the id Boost files it under, which is what the screen matches on. */
        private const val FRONT_PAGE_ID = -3000

        /**
         * Boost's model for a feed, which keeps its name where the six statics
         * that build one are single letters. Its `(int, String)` constructor is
         * the one all six of them call.
         */
        private const val SUBSCRIPTION_MODEL_CLASS =
            "com.rubenmayayo.reddit.models.reddit.SubscriptionViewModel"

        /** The screen that draws a feed of its own, and the extra it takes one in. */
        private const val MAIN_ACTIVITY_CLASS =
            "com.rubenmayayo.reddit.ui.submissions.subreddit.MainActivity"
        private const val TARGET_LISTING = "target_subscription"

        /**
         * Puts tildes.net at the top of the sites Boost offers to sign in to.
         *
         * The list Boost draws is built in code rather than read from the
         * resource its layout names, so this is the only place a row can be
         * added. It arrives as the instances the app has already been pointed
         * at, with the ones Boost ships merged in behind them afterwards.
         *
         * `Server` is one of the Gson datatypes and keeps its name, while the
         * class assembling the list does not, so the row is built by reflection
         * rather than named here. A removal before the insert keeps it to one
         * row and puts it first whatever else is in there: `Server.equals`
         * compares the host and the platform, and this list holds every site
         * signed in to, which after the first login includes this one.
         *
         * The platform decides which API Boost speaks, `lemmy` or `piefed`, and
         * the interceptor answers Lemmy's.
         *
         * Not scoped to Tildes, unlike most of what is here. There is no
         * account yet on the screen this draws, so there is nothing to scope
         * on, and one more row in a dropdown is not a wrong answer on a Lemmy
         * account.
         *
         * Called from patched bytecode, once per account screen opened.
         */
        @JvmStatic
        fun offerTildes(servers: MutableList<Any>?) {
            if (servers == null) return
            try {
                val server = Class.forName(SERVER_CLASS)
                    .getConstructor(String::class.java, String::class.java)
                    .newInstance(HOST, LEMMY)

                servers.remove(server)
                servers.add(0, server)
            } catch (t: Throwable) {
            }
        }

        /**
         * Which site the app talks to when nobody is signed in.
         *
         * Boost has one host for the whole process and **only ever writes it
         * from an account**: the switcher sets it off `User.instance`, and with
         * no account that write is skipped entirely, so the host stays whatever
         * the API singleton was built with. What it is built with is
         * `lemmy.world`, a constant with nothing behind it here -- so a guest
         * asked tildes.net for nothing and lemmy.world for everything.
         *
         * That is the whole of what stood between this patch and a first look
         * with no account. Nothing else gates a read: Boost attaches its token
         * only when it has one, every listing, topic and comment thread renders
         * without one, and the login screen is somewhere you go rather than
         * somewhere you land. Tildes is public in exactly the same places, so
         * the answers were all already written.
         *
         * **The empty host is the discriminator, and it is exact.** This runs
         * where Boost picks its fallback, which is the one path an account
         * never takes: an account with a host set brings its own, an account
         * with a blank one is repaired somewhere else, and the login screen
         * builds a throwaway client against the host you typed. So the only
         * caller that arrives here with nothing is the singleton being built
         * for a guest.
         *
         * Scoped on [Session.wasTildes], which on a fresh install answers yes
         * for the reason given there. A guest who last used a Lemmy account
         * gets Boost's own answer and lands where Boost would have landed.
         *
         * **An account cannot be mispointed by this even so**, which is what
         * makes the flag safe to read here at all. Boost builds the singleton
         * from inside the account switcher and then writes the account's own
         * host over it a line later, rebuilding the client -- so on any run
         * where an account is picked, whatever was chosen here is replaced
         * before a request goes out. Only the run where nothing is picked keeps
         * it.
         *
         * Called from patched bytecode, with the host Boost was given, once per
         * client built.
         */
        @JvmStatic
        fun guestHost(boostsOwn: String?): String? {
            if (!boostsOwn.isNullOrEmpty() || !Session.wasTildes()) return boostsOwn
            return HOST
        }

        /**
         * The context a screen is built from, which decides its wording.
         *
         * Boost's strings are resources, and a resource is picked by the
         * configuration the context carries, so the way to have two wordings in
         * one install is to file the second one under a configuration the app
         * can ask for. Tildes' words go in `res/values-mcc999` and this hands
         * every screen a context with `mcc` set to 999 while the account is
         * this one.
         *
         * The mobile country code, of all things, because it is the highest
         * priority qualifier Android has -- above language -- so a Tildes word
         * wins over the French translation of the same string while every
         * string Tildes has no opinion about still comes back in French. A
         * locale qualifier would have taken the language with it, and there is
         * no qualifier meant for "the app decides".
         *
         * This is the only hook that has to answer before a request rather than
         * during one, since a screen attaches before it fetches anything, so it
         * reads the account off disk instead of off [answering]. Which also
         * means a screen already on top when you switch accounts keeps the
         * words it was built with until it is built again.
         *
         * Called from patched bytecode, once per screen, as it attaches.
         */
        @JvmStatic
        fun scopeWording(base: Context?): Context? {
            if (base == null || !Session.wasTildes()) return base
            return try {
                val config = Configuration(base.resources.configuration)
                config.mcc = TILDES_MCC
                base.createConfigurationContext(config)
            } catch (t: Throwable) {
                base
            }
        }

        /** The qualifier Tildes' wording is filed under, and nothing else. */
        private const val TILDES_MCC = 999

        /**
         * How many tabs a profile has, which is two fewer and one more here.
         *
         * **Uploads** lists what an account has put on the instance's own image
         * host, and Tildes hosts no images. **About** is a karma panel, the
         * groups an account moderates and two more lists behind it, and Tildes
         * publishes none of that -- what a profile does say, the registration
         * date and the bio, is already drawn above the tabs. **All posts** is
         * the one going the other way: see [addAllPostsTab].
         *
         * Which of the seven those are is read off the pager rather than
         * counted to: Boost keeps a key per tab in an array of its own, the
         * same keys it puts in a request, so the drop is by name and the order
         * carries no weight. It is also two different arrays -- your own
         * profile has seven tabs and somebody else's has three, ending on About
         * either way.
         *
         * **The cap moves with the array.** Boost's own count is lower than the
         * keys it holds on a PieFed site, which is what the cap is for, and a
         * grown array would otherwise have its last tab counted off the end.
         *
         * Read off disk rather than off [answering], since the pager is built
         * before the screen fetches anything -- the same reason [groupTabs] is.
         * On [answering] this crashed: a profile opened from a tildes.net
         * address on a cold start built its pager with Boost's seven, the first
         * request landed a moment later, the next count answered six, and
         * `ViewPager` throws on a count that moves under it. The drawer's own
         * Bookmarks row never showed it, since by then a request has always
         * gone out.
         *
         * Called from patched bytecode, whenever the pager is asked how many
         * tabs it has.
         */
        @JvmStatic
        fun profileTabs(pager: Any?, boostsOwn: Int): Int {
            if (!Session.wasTildes()) return boostsOwn
            val keys = profileTabKeys(pager) ?: return boostsOwn
            val added = if (keys.firstOrNull() == OVERVIEW_TAB) 1 else 0
            return (0 until minOf(boostsOwn + added, keys.size))
                .count { keys[it] !in DROPPED_PROFILE_TABS }
        }

        /**
         * Which of Boost's tabs a position means, once About and Uploads are
         * not among them.
         *
         * The same shape as [groupTab], and the same reason: the pager takes
         * the position as an index into the titles and into the keys, so a tab
         * comes off by stepping over it in both.
         *
         * Off disk like the count beside it, and it has to be the same flag as
         * the count: one of the two answering Boost's own while the other
         * answers ours is a pager whose positions do not mean what its length
         * says.
         *
         * Called from patched bytecode, once per tab titled and once per tab
         * filled.
         */
        @JvmStatic
        fun profileTab(pager: Any?, position: Int): Int {
            if (!Session.wasTildes()) return position
            val keys = profileTabKeys(pager) ?: return position

            var drawn = -1
            keys.forEachIndexed { index, key ->
                if (key !in DROPPED_PROFILE_TABS) {
                    drawn++
                    if (drawn == position) return index
                }
            }
            return position
        }

        /**
         * The All posts tab saying so in the one place the interceptor can hear
         * it: the request.
         *
         * `overview` asks the site exactly what the Topics tab asks -- `user`
         * with `saved_only=false`, the same paginator and the same parameters --
         * so nothing about the request says which of the two it is, and the two
         * want different pages fetched. The Topics tab wants `?type=topic`,
         * paged on its own; All posts wants the merged listing with no `type`,
         * which is the site's own page of twenty in document order.
         *
         * **The marker rides in the fragment's arguments**, which is where the
         * tab key already is, so it costs no second edit anywhere. `person_id`
         * is read in exactly one place in the whole app -- handed to the
         * presenter, handed to the paginator, put in the query -- and every
         * identity thing the profile screen does it does off a model of its own.
         *
         * Safe here and nowhere else. `person_id` and `username` both go out,
         * and Lemmy takes one **or** the other; a real server would answer the
         * wrong question or none. The interceptor reads the name off `username`
         * and falls back to `person_id` only when there is none, so here the
         * sentinel is a marker rather than a question -- and that fallback has
         * to stay that way round.
         *
         * **Scoped on the account, and it has to be.** Only one of the three
         * tabs marked here is one Boost invented -- `overview` exists because
         * [addAllPostsTab] puts it there, behind the same gate -- while
         * `comments` and `liked` are Boost's own and a Lemmy account has both.
         * A sentinel written into either of those would go out to a real
         * server as a person id, which answers "couldnt_find_person" rather
         * than a profile.
         *
         * Called from patched bytecode, once per tab the profile's pager fills.
         */
        @JvmStatic
        fun profileTabBuilt(fragment: Any?) {
            if (fragment == null || !Session.wasTildes()) return
            try {
                val args = fragment.javaClass.getMethod(ARGUMENTS_GETTER)
                    .invoke(fragment) as? Bundle ?: return
                val tab = args.getString(CONTRIBUTION_TYPE)
                val marker = when (tab) {
                    OVERVIEW_TAB -> OVERVIEW_MARKER
                    COMMENTS_TAB -> COMMENTS_MARKER
                    VOTES_TAB -> VOTES_MARKER
                    else -> return
                }
                args.putInt(PERSON_ID, marker)
            } catch (t: Throwable) {
            }
        }

        /**
         * What the All posts tab puts where a person's id would go, and what
         * the Comments tab puts there.
         *
         * Any negative would do, since Boost's person ids here are a CRC32 with
         * the sign bit cleared and so never are, and `-1` is how the paginator
         * says it has none. These two are far enough from both to read as
         * deliberate in a log line.
         *
         * The Comments tab is marked for a different reason from the All posts
         * one. It does not need a different page fetched -- it needs the other
         * half of the pair, and saying so is what stops the half nobody asked
         * for being fetched at all. See the `/user` route.
         *
         * And the Votes tab is marked for the All posts reason again. Once
         * `likedTakesPostList` has sent it down this route it asks byte for
         * byte what the Topics tab asks, and the two want different pages: one
         * wants `/user?type=topic` and this one wants `/votes`.
         */
        private const val OVERVIEW_MARKER = Int.MIN_VALUE
        private const val COMMENTS_MARKER = Int.MIN_VALUE + 1
        private const val VOTES_MARKER = Int.MIN_VALUE + 2

        /** Boost's own name for it, in the bundle and in the query alike. */
        private const val PERSON_ID = "person_id"

        /** And its key for the tab that lists a person's comments alone. */
        private const val COMMENTS_TAB = "comments"

        /**
         * And for the one that lists their topics, which Boost calls **Posts**.
         * The same word does a second job as [PROFILE_TAB_ANCHOR].
         */
        private const val TOPICS_TAB = "submitted"

        /**
         * And for the Votes tab, which Boost calls **Upvoted** and words as
         * **Votes** here. Tildes has no downvote, so there is only the one.
         */
        private const val VOTES_TAB = "liked"

        /**
         * And for the one Tildes calls **Ignored topics**, which Boost calls
         * **Downvoted** and this patch words as **Ignored**. Ignoring a topic is
         * the nearest thing the site has to a negative signal, and it is the one
         * of the three lists with no comment half.
         */
        private const val IGNORED_TAB = "disliked"

        /**
         * The key per tab, off the profile the pager was built for.
         *
         * Two hops of reflection, and neither one names a letter: whatever the
         * pager holds that has an array of strings with [PROFILE_TAB_ANCHOR] in
         * it is the screen, and that array is the keys rather than the words
         * beside them. Boost sends those keys in a request, so they are spelled
         * the way Lemmy spells them and no obfuscator touches them.
         *
         * The tab Tildes has and Boost has not is added on the way through, so
         * both callers above see it without either of them knowing.
         */
        private fun profileTabKeys(pager: Any?): List<String>? {
            val screen = profileScreen(pager) ?: return null
            addAllPostsTab(screen)
            return tabArrayOf(screen, PROFILE_TAB_ANCHOR)?.second?.toList()
        }

        /** Whatever the pager holds that looks like the screen behind it. */
        private fun profileScreen(pager: Any?): Any? =
            pager?.javaClass?.declaredFields?.firstNotNullOfOrNull { field ->
                try {
                    field.isAccessible = true
                    field.get(pager)?.takeIf { tabArrayOf(it, PROFILE_TAB_ANCHOR) != null }
                } catch (t: Throwable) {
                    null
                }
            }

        /**
         * The screen's array of strings holding [anchor], with the field it
         * came out of, so it can be written back.
         */
        private fun tabArrayOf(screen: Any, anchor: String): Pair<Field, Array<String>>? =
            screen.javaClass.declaredFields.firstNotNullOfOrNull { field ->
                try {
                    field.isAccessible = true
                    stringsOf(field.get(screen))
                        ?.takeIf { anchor in it }
                        ?.let { field to it }
                } catch (t: Throwable) {
                    null
                }
            }

        /** An array of strings as one, or null for anything else. */
        private fun stringsOf(value: Any?): Array<String>? {
            val items = value as? Array<*> ?: return null
            if (items.isEmpty() || items.any { it !is String }) return null
            return Array(items.size) { items[it] as String }
        }

        /**
         * The tab a profile opens on here, and the one Boost has no key for.
         *
         * Tildes' first tab on a profile -- anyone's, not only your own --
         * merges that person's topics and comments into one list, newest first
         * and interleaved, and it is where a profile lands. Boost opens on
         * Topics and has no merged view at all.
         *
         * **It is added to the arrays rather than stepped into.** The two
         * dropped tabs come off by stepping over them, which works because
         * every tab still drawn is one Boost has a key and a word for. A tab
         * Boost has neither for cannot be reached that way: whatever position
         * were stepped to would name one of Boost's own. So the key and the
         * word go into the two arrays the pager reads, in front of Topics, and
         * everything downstream follows without being told -- the count, the
         * titles, the fragment each tab builds, and the key that fragment is
         * given.
         *
         * `overview` is Boost's own word for it, off the Reddit ancestry:
         * `UserContributionListFragment` accepts it among the seven keys it
         * gives an options menu to, and the pager builds an ordinary
         * contribution list for anything that is not `uploads`, `info`,
         * `friends` or `blocked`. So nothing new is constructed anywhere, and
         * the presenter behind it asks `user` the way the Topics tab does.
         *
         * **The word is written here rather than filed under the wording.**
         * That is where the sort names are as well, and for the same reason:
         * there is no string in the APK to override, Boost having no tab to
         * call it.
         *
         * Idempotent, because the pager asks for the keys once per tab titled
         * and once per tab filled, and every one of those comes through here.
         */
        private fun addAllPostsTab(screen: Any) {
            try {
                val (keysField, keys) = tabArrayOf(screen, PROFILE_TAB_ANCHOR) ?: return
                if (keys.firstOrNull() == OVERVIEW_TAB) return

                // The words beside them: the other array of strings the screen
                // holds that is as long and is not the keys. Told apart by
                // length rather than by anything in it, since every word in it
                // is in whatever language the phone is set to.
                val titles = screen.javaClass.declaredFields.firstNotNullOfOrNull { field ->
                    if (field == keysField) return@firstNotNullOfOrNull null
                    try {
                        field.isAccessible = true
                        stringsOf(field.get(screen))
                            ?.takeIf { it.size == keys.size }
                            ?.let { field to it }
                    } catch (t: Throwable) {
                        null
                    }
                } ?: return

                keysField.set(screen, arrayOf(OVERVIEW_TAB) + keys)
                titles.first.set(screen, arrayOf(ALL_POSTS_TITLE) + titles.second)
            } catch (t: Throwable) {
            }
        }

        /** The two tabs Tildes has nothing to put under. */
        private val DROPPED_PROFILE_TABS = setOf("info", "uploads")

        /** What says an array of strings is the tab keys and not the titles. */
        private const val PROFILE_TAB_ANCHOR = TOPICS_TAB

        /**
         * Boost's own key for a profile's merged listing, which nothing in
         * 1.0.33 puts in a tab. See [addAllPostsTab].
         */
        private const val OVERVIEW_TAB = "overview"

        /** And tildes.net's own word for it. */
        private const val ALL_POSTS_TITLE = "All posts"

        /**
         * How many tabs the Groups page has, which is one fewer here.
         *
         * Boost draws Subscribed, Local and All, where Local is the instance's
         * own groups and All is those plus everything it federates with.
         * Tildes federates with nothing, so the two are the same list: the
         * interceptor answers `/community/list` by filtering on
         * `type_=Subscribed` and handing back everything otherwise, and the
         * middle tab has been a second copy of the third since the first day.
         *
         * Dropping it by the count is how the pager already drops two: a PieFed
         * account is shown five tabs where a Lemmy one gets three, off the same
         * arrays. Which leaves the order load-bearing, and [groupTab] is the
         * other half.
         *
         * Read off disk rather than off [answering], since the pager is built
         * before the screen fetches anything.
         *
         * Called from patched bytecode, whenever the pager is asked how many
         * pages it has.
         */
        @JvmStatic
        fun groupTabs(boostsOwn: Int): Int =
            if (Session.wasTildes() && boostsOwn > LOCAL_TAB) boostsOwn - 1 else boostsOwn

        /**
         * Which of Boost's tabs a position means, once Local is not one of
         * them.
         *
         * The pager keeps its titles and its fragments in two arrays and takes
         * the position as the index into both, so a tab comes off by stepping
         * over it in each: everything from Local on is asked for one place
         * later than it was.
         *
         * Boost opens the screen on position 1, which was Local and is All now,
         * so the tab it lands on lists the same groups it always did.
         *
         * Called from patched bytecode, once per title drawn and once per
         * fragment built.
         */
        @JvmStatic
        fun groupTab(position: Int): Int =
            if (Session.wasTildes() && position >= LOCAL_TAB) position + 1 else position

        /** Where Local sits among the tabs, between Subscribed and All. */
        private const val LOCAL_TAB = 1

        /**
         * Whether the drawer draws its Local row, which is All under another
         * name for the reason [groupTabs] gives.
         *
         * Every row in that drawer is behind a switch under Settings, and this
         * is Boost's own answer for the Local one, taken as it is read. So the
         * preference still decides on a Lemmy account and the switch itself is
         * left alone: turning it back on there costs nothing, and on a Tildes
         * account it does nothing.
         *
         * Read off disk like the tabs beside it, since the drawer is built with
         * the screen behind it.
         *
         * Called from patched bytecode, once per drawer built.
         */
        @JvmStatic
        fun drawerLocalRow(boostsOwn: Boolean): Boolean {
            // Asked here rather than earlier because Boost swaps its account
            // part way through building this drawer: at the head of the
            // refresh it is still the account you are leaving, and by the time
            // this row is decided it is the one you picked. The log said so
            // outright -- `account at refresh: lemmy.world` one line above
            // `account at subscriptions: tildes.net` -- after two rounds of
            // reasoning about it guessed wrong.
            noteAccount(accountHolder, "local row")
            val tildes = Session.wasTildes()
            builtFor = tildes
            return boostsOwn && !tildes
        }

        /**
         * And the All row eight lines under it, for the reason
         * `ALL_SUBSCRIPTION` gives: the site's front page **is** the aggregate
         * view, `type_` never reaches a request, so All and Home send the same
         * `/` and draw the same list. A row promising the whole site while
         * showing your subscriptions is worse than no row.
         *
         * Its twin among the subscriptions came off with Local's, through
         * [subscriptionHidden], and this one did not -- so the drawer kept an
         * All at the top while the list under it had none. That is the shape
         * to look for if another row ever half-disappears: these two sections
         * of the drawer are built by different code and neither knows about
         * the other.
         *
         * No account read of its own. [drawerLocalRow] runs a few instructions
         * earlier in the same method and does that once, which is where the
         * account has to be taken.
         *
         * Called from patched bytecode, once per drawer built.
         */
        @JvmStatic
        fun drawerAllRow(boostsOwn: Boolean): Boolean = boostsOwn && !Session.wasTildes()

        /**
         * Whether the screen was built for the account you just left, asked as
         * the refresh that rebuilt its drawer finishes.
         *
         * Boost swaps its account **between** the two halves of that refresh --
         * the rows first, the subscriptions after -- so everything decided in
         * the first half is decided against the wrong account, and no point
         * inside it can answer otherwise. The log says so to five milliseconds:
         *
         * ```
         * account at local row: lemmy.world, tildes was false
         * account at subscriptions: tildes.net, tildes was false
         * ```
         *
         * The drawer's rows are one thing decided there. **The wording is the
         * other**, and it is the one a refresh cannot repair: every string on
         * the screen comes from the configuration the screen was attached with,
         * so a drawer rebuilt for a new account keeps `Groups` and `Bookmarks`
         * until something attaches it again. Running the refresh twice fixed
         * the rows and left the words.
         *
         * So the answer is the screen itself, and `Activity.recreate` is what
         * the patch calls on it. Everything decided as a screen is built goes
         * with it: the words, both Local rows, the tabs on the Groups page.
         *
         * It answers true once and then forgets, so the screen it rebuilds
         * cannot ask for another: the pass that follows writes this again, and
         * by then the two agree.
         *
         * Called from patched bytecode, at the end of that refresh.
         */
        @JvmStatic
        fun builtForOtherAccount(): Boolean {
            val built = builtFor ?: return false
            if (built == Session.wasTildes()) return false
            builtFor = null
            return true
        }

        /** Which account the screen was last built for, or null once asked. */
        @Volatile
        private var builtFor: Boolean? = null

        /**
         * And the **second** Local row, which is the one that survived the
         * first: the drawer lists your subscriptions under those switches, and
         * Boost puts Subscribed, Local, All and Bookmarks among them as
         * subscriptions of their own.
         *
         * Those four are rows in the app's own database rather than
         * preferences, seeded once per account and carrying a marker for a
         * name -- `!local` here -- so nothing about them goes through the
         * switch above. On screen it read Subscribed, `~comp`, `~tv`, `~tech`,
         * **Local**, All, Bookmarks, and only the one at the top of the drawer
         * ever came off.
         *
         * Answered through Boost's own skip rather than around it. Every row
         * in that list is already tested against a per-account **hidden** flag,
         * which is what the Subscriptions editor writes when you hide one, and
         * the screen honours it while the list behind it keeps every entry. So
         * this hands back that same answer with one more row hidden, which
         * leaves every index and identifier where it was: the click handler
         * resolves a row by its position in the list, not in the drawer.
         *
         * **Two screens read that flag and both come through here.** The drawer
         * is one and the **Go to...** screen is the other, which draws the same
         * subscriptions with a filter over them and is where the Local row was
         * still showing after the drawer's came off. The Subscriptions editor
         * reads it too and is left alone on purpose: that is the screen where
         * you set the flag, so it has to say what the flag actually says.
         *
         * Nothing is written down. The flag is changed in flight, so the
         * database still says what it said and a Lemmy account in the same app
         * gets its Local row.
         *
         * The row is found by the marker rather than by the field holding it,
         * for the reason a menu row is found by its title: Boost's field names
         * here are single letters. No display name can collide -- by the time
         * one is drawn it reads "Local", and this is the string underneath.
         *
         * Called from patched bytecode, once per subscription row, with the
         * answer Boost had and the row it was about.
         */
        @JvmStatic
        fun subscriptionHidden(boostsOwn: Boolean, model: Any?): Boolean {
            if (boostsOwn || model == null || !Session.wasTildes()) return boostsOwn
            return HIDDEN_SUBSCRIPTIONS.any { marked(model, it) }
        }

        /**
         * And the list that screen draws its rows from, which it loads itself.
         *
         * **Go to...** asks the app for the subscriptions again in its own
         * `onCreate` rather than taking the one the home screen already built,
         * so a guest's rows -- the front page, and the groups under it -- stop
         * at the drawer and the spinner without this. Which is the screen the
         * bottom bar's **Subscriptions** opens, so it is the emptiest place a
         * guest could land.
         *
         * The same addition as [homeSubscriptions] makes and nothing else: the
         * rows that have to come *off* this list are taken off one at a time by
         * [goToRowElsewhere] and [subscriptionHidden] as it draws them.
         *
         * Called from patched bytecode, with the list on its way to the screen.
         */
        @JvmStatic
        fun goToSubscriptions(subscriptions: MutableList<Any>?) =
            subscriptionList(subscriptions, "go to")

        /**
         * And the fourth screen, which is the one Boost's own hidden flag never
         * reached.
         *
         * The toolbar over a feed is a spinner listing the same subscriptions,
         * and **nothing in it asks whether a row is hidden**. Not the adapter,
         * which reads the home screen's list on every bind, and not the method
         * that builds the adapter. So the three rows this account has no use for
         * were still in the dropdown after they came off the drawer and the **Go
         * to...** screen, and picking Bookmarks there opened a feed of bookmarked
         * topics with no comments in it -- the screen the drawer's own row stopped
         * opening weeks ago.
         *
         * That is Boost's own behaviour rather than something this patch caused:
         * a subscription hidden in the editor shows up in that dropdown too.
         *
         * **The list is the answer rather than the rows**, and it is safe to cut
         * because it is one object with one owner. The home screen builds it
         * fresh out of the database, hands it to the method that builds the
         * adapter, and that method hands the same object on to the drawer's own
         * end of it -- so filtering here reaches the spinner, the drawer's
         * subscription rows, the two lookups that turn a feed into a position in
         * it, and the launcher shortcuts, all agreeing.
         *
         * **The positions stay consistent because they are recomputed.** Nothing
         * in Boost stores a position: a screen saves the feed as a model and asks
         * for its index again afterwards, and the drawer's rows are numbered
         * inside the same call this runs in.
         *
         * **What it leans on** is the drawer's own rows for those three being
         * gone already -- Local's and All's are hidden and Bookmarks' is answered
         * before Boost sees it. Each of them would otherwise drive the spinner to
         * a row that is no longer there, and Boost's lookup answers `0` for a
         * feed it cannot find, which is the front page. That is a wrong feed
         * rather than a crash, and the log line above it would say so.
         *
         * Called from patched bytecode, once per rebuild of the home screen's
         * subscriptions.
         */
        @JvmStatic
        fun homeSubscriptions(subscriptions: MutableList<Any>?) =
            subscriptionList(subscriptions, "subscriptions")

        /**
         * The list itself, for both screens that load one.
         *
         * An account keeps its own rows and loses the three this site has
         * nothing behind. A guest's are replaced outright -- see [guestList],
         * which is where the reasoning is.
         */
        private fun subscriptionList(subscriptions: MutableList<Any>?, what: String) {
            if (subscriptions == null || !Session.wasTildes()) return
            try {
                if (guestList(subscriptions, what)) return

                val before = subscriptions.size
                subscriptions.removeAll { row ->
                    HIDDEN_SUBSCRIPTIONS.any { marked(row, it) }
                }
                if (before != subscriptions.size) {
                }
            } catch (t: Throwable) {
            }
        }

        /**
         * A guest's list, which is built here rather than filtered.
         *
         * **Boost's list for a guest is somebody else's.** The signed-out
         * profile is filled once, on the first launch the app ever has, with
         * the top communities of whatever host it was pointed at then, and
         * nothing clears them after: the sign-out path deletes the rows of the
         * account being removed, and switching to guest touches no row at all.
         * An install that browsed lemmy.world before it was patched carries 25
         * of them for good, and every one of them is a dead end here -- tapping
         * `Linux Gaming` asked tildes.net for `~linux_gaming` and got a 404.
         *
         * Taking the wrong rows out was the first answer and it was the wrong
         * shape. It needed a test for which rows were foreign, and every test
         * of that kind is a guess about somebody else's data: matching on the
         * name kept three of lemmy.world's own, that site having communities
         * named after the same things Tildes has groups named after. **A guest
         * has no subscriptions here at all** -- Tildes has no way to subscribe
         * without an account -- so there is nothing in that list to preserve
         * and no reason to inspect it. It is replaced.
         *
         * What replaces it is what the site gives somebody with no account: the
         * front page, and every group. Signed out, tildes.net's front page is
         * all of them and `/groups` lists all of them, and the site's own
         * answer to what a new account should be subscribed to is the same --
         * `for group in all_groups: if group.path == "test": continue`, which
         * is the one group it leaves out and so the one left out here.
         *
         * **A guest is a list with no `!subscribed` row in it.** Boost seeds
         * its six markers per account and that one only when there is an
         * account, so its absence is the account's absence -- read off the list
         * itself rather than off a flag that could be a beat stale. An account
         * takes none of this: the caller does its own thing and this answers
         * false.
         *
         * **Nothing is written down.** The list is rebuilt from the database on
         * every refresh and this is the copy on its way to the screen, so the
         * signed-out profile keeps exactly the rows Boost put in it and a Lemmy
         * account added to the same app finds them where it left them.
         *
         * Answers whether it took the list over.
         */
        private fun guestList(subscriptions: MutableList<Any>, what: String): Boolean {
            if (subscriptions.any { marked(it, FRONT_PAGE) }) return false

            val names = Lemmy.guestGroups(siteGroupNames())
            val had = subscriptions.size
            subscriptions.clear()
            subscriptions.add(subscriptionRow(FRONT_PAGE_ID, FRONT_PAGE))
            names.forEach { subscriptions.add(subscriptionRow(Lemmy.groupId(it), "~$it")) }

            return true
        }

        /**
         * One of Boost's own subscription rows, built by id and name.
         *
         * **The name carries the tilde**, which is how the site spells a group,
         * so the drawer reads `~comp` the way a signed-in account's does. Every
         * community name the interceptor is handed has the tilde taken off it
         * before anything else looks at it, so the row still asks for the group
         * it names.
         *
         * **The id is the same hash the rest of the patch turns a group name
         * into.** A model built without one keeps `-1`, and Boost's `equals`
         * answers true for any two rows that did, so fifty rows would have been
         * fifty copies of the first as far as the spinner's selection was
         * concerned.
         */
        private fun subscriptionRow(id: Int, name: String): Any =
            Class.forName(SUBSCRIPTION_MODEL_CLASS)
                .getDeclaredConstructor(Int::class.javaPrimitiveType, String::class.java)
                .apply { isAccessible = true }
                .newInstance(id, name)


        /**
         * And the third screen those rows are drawn on, where hiding one is
         * beside the point.
         *
         * **Edit subscriptions** is the screen the hidden flag is set on, so
         * [subscriptionHidden] deliberately leaves it alone: a screen that lied
         * about the flag it exists to change would be worse than one row too
         * many. Which is exactly what it had -- Local and All listed there and
         * on no other screen, each offering to hide something already gone
         * everywhere it could be drawn.
         *
         * So they come out of the list rather than off the row. This screen
         * reads its subscriptions out of the database itself, where the drawer
         * and **Go to...** both take a list Boost has already loaded, so it is
         * the one place neither of those hooks can reach, and everything it
         * does afterwards is an index into what it was handed: the adapter
         * counts off it, a tap resolves a row by position, and a drag writes
         * the whole list back with a new order per index. Filtering here keeps
         * all of them agreeing.
         *
         * Two rows and no others, which is what makes it safe to shorten the
         * list at all. `!subscribed` carries Boost's "this is the home feed"
         * flag and a bulk action clears that flag by walking this same list, so
         * dropping *that* row would leave two rows claiming it. `!local` and
         * `!all` are seeded without it.
         *
         * Nothing is written down, the way nothing is for the other two
         * screens: the rows are still in the database and a Lemmy account in
         * the same app still edits them.
         *
         * Called from patched bytecode, with the list on its way to the screen.
         */
        @JvmStatic
        fun editableSubscriptions(subscriptions: MutableList<Any>?) {
            if (subscriptions.isNullOrEmpty() || !Session.wasTildes()) return
            try {
                val before = subscriptions.size

                /*
                 * A guest has nothing to edit. The rows in the database belong
                 * to whatever server the app was pointed at on the first launch
                 * it ever had -- 25 of lemmy.world's, on the phone this was
                 * found on -- and the rows drawn in their place are built as a
                 * list goes past rather than stored, so there is nothing on
                 * this screen a person could reorder or hide. Which is also the
                 * site's answer: nobody subscribes to anything on Tildes
                 * without an account.
                 *
                 * These are somebody else's rows rather than `Subscription`
                 * objects this end made, so they cannot be replaced the way the
                 * other two lists are -- this screen reads the database itself
                 * and keeps what it is handed. Emptying it is the whole of what
                 * can be said honestly here.
                 */
                if (subscriptions.none { marked(it, FRONT_PAGE) }) {
                    subscriptions.clear()
                    return
                }

                subscriptions.removeAll { row ->
                    HIDDEN_SUBSCRIPTIONS.any { marked(row, it) }
                }
                if (before != subscriptions.size) {
                }
            } catch (t: Throwable) {
            }
        }

        /**
         * Which account the drawer is about to be built for, taken from the
         * account rather than from the last request.
         *
         * [Session.wasTildes] is written by every `/api/v3` call, so it says
         * whose request went out last. That is the only answer available to a
         * view built before it fetches anything, and it costs nothing until an
         * account switch: the drawer is rebuilt as the accounts change, which
         * is **before** anything has been asked of the new instance, so it is
         * built against the account you just left. The Local row came back on
         * Tildes and went missing on Lemmy for exactly that, one switch behind
         * each way.
         *
         * Boost loads a user's subscriptions from its own database on its way
         * into the drawer, and that is the one place the account is in hand
         * before a screen is drawn. So the flag is written there as well, off
         * `User.instance`, which is an ActiveAndroid column and keeps its name
         * for the schema's sake where the fields around it are single letters.
         *
         * The user is found by the type of what a field holds rather than by
         * the field's name, and up the class hierarchy, since it is declared on
         * a superclass. An account with no instance recorded writes nothing,
         * which leaves the last request's answer standing rather than reading
         * an empty string as Lemmy.
         *
         * Called from patched bytecode, at the head of the method that loads
         * them, with the object holding the account.
         */
        @JvmStatic
        fun subscriptionsFor(holder: Any?) = noteAccount(holder, "subscriptions")

        /**
         * What either of them found, and what the flag said before it.
         *
         * Logged rather than worked out from the screen, because everything
         * about this is a matter of **when**: the same two writes are right or
         * a switch behind depending on whether Boost has swapped its account
         * yet, and the screen cannot tell those apart. The line reads
         *
         * ```
         * account at refresh: lemmy.world, tildes was true
         * account at subscriptions: lemmy.world, tildes was false
         * ```
         *
         * on a switch that landed, and says `unknown` where the account could
         * not be reached at all.
         */
        private fun noteAccount(holder: Any?, where: String) {
            if (holder != null) accountHolder = holder
            val instance = holder?.let { accountInstance(it) }
            // Whether Boost has an account at all, which is a different
            // question from which one and is answered even where the first is
            // not. A holder with no account on it is somebody who picked Guest
            // in the account picker, and that is what parks the session.
            //
            // Only where there is a holder to read. `unknown` with none is
            // nothing having built a drawer yet, which says nothing about
            // whether an account exists -- and parking on that would browse a
            // signed-in reader logged out for no reason.
            if (holder != null) {
                if (instance.isNullOrEmpty()) {
                    if (!Session.wasGuest()) INSTANCE.parkSession()
                } else {
                    if (Session.wasGuest()) INSTANCE.unparkSession()
                }
            }
            if (instance.isNullOrEmpty()) return
            Session.rememberTildes(instance.equals(HOST, ignoreCase = true))
        }

        /**
         * Boost's subscription store, kept so the account can be read again
         * without a second way in. It is the app's own singleton, so holding it
         * keeps nothing alive that was not already.
         */
        @Volatile
        private var accountHolder: Any? = null

        /** The signed-in account's own instance, off Boost's user row. */
        private fun accountInstance(holder: Any): String? {
            var type: Class<*>? = holder.javaClass
            while (type != null) {
                type.declaredFields.forEach { field ->
                    val value = try {
                        field.isAccessible = true
                        field.get(holder)
                    } catch (t: Throwable) {
                        null
                    }
                    if (value != null && value.javaClass.name == USER_CLASS) {
                        return try {
                            value.javaClass.getField("instance").get(value) as? String
                        } catch (t: Throwable) {
                            null
                        }
                    }
                }
                type = type.superclass
            }
            return null
        }

        /**
         * Boost's own account row. An ActiveAndroid model, so the class and its
         * `instance` column both keep their names: the schema is written from
         * them.
         */
        private const val USER_CLASS = "com.rubenmayayo.reddit.aa.User"

        /** Whether any field on a model holds this exact string. */
        private fun marked(model: Any, marker: String): Boolean =
            model.javaClass.declaredFields.any { field ->
                try {
                    field.isAccessible = true
                    field.get(model) == marker
                } catch (t: Throwable) {
                    false
                }
            }

        /**
         * What Boost calls the Local listing where it stands in for a
         * subscription. Two of the four markers beside it mean something here:
         * `!subscribed` is the front page, and `!popular` is only built for an
         * instance that has one, which this is not.
         */
        private const val LOCAL_SUBSCRIPTION = "!local"

        /**
         * What Boost calls the aggregate listing, which Tildes does not have.
         *
         * The site's front page **is** the aggregate view, and it is the
         * subscribed one: there is no `~all` to browse and no request that
         * asks for one. `buildListingPath` takes a group, an order, a cursor
         * and a limit, and `type_` never reaches it -- it only lands in the
         * page cache's key -- so this row and the front page send the same `/`
         * and draw the same list.
         *
         * Which makes it worse than a duplicate. It says everything on the
         * site and shows your subscriptions.
         */
        private const val ALL_SUBSCRIPTION = "!all"

        /**
         * And Bookmarks, which is a **screen** on this site rather than a feed.
         *
         * Tildes keeps `/bookmarks` as two tabs, topics and comments, and the one
         * view in the app that draws both is the profile's own Bookmarks tab. The
         * drawer's Bookmarks row opens that, and has since it was redirected --
         * but Boost seeds `!saved` as a subscription as well, so the same word
         * appeared twice in the same drawer, one of them opening a feed of
         * bookmarked topics with no comments in it.
         *
         * This is the row a week apart from the other one, which is the shape
         * `STATUS.md` warns about: **a row can need taking off twice**, and the
         * two sections of that drawer are built by different code.
         */
        private const val BOOKMARKS_SUBSCRIPTION = "!saved"

        /**
         * The three rows that come off a Tildes account. `!subscribed` stays,
         * being the front page, and `!popular` is not seeded here.
         */
        private val HIDDEN_SUBSCRIPTIONS =
            listOf(LOCAL_SUBSCRIPTION, ALL_SUBSCRIPTION, BOOKMARKS_SUBSCRIPTION)

        /**
         * Every group the site lists, in the site's own order.
         *
         * Read out of the cache the group list already keeps, and off disk
         * where that is cold -- which is every screen built before the first
         * request comes back. **Never fetched here**: this is asked while a
         * drawer is being built, and a request on that thread would hang the
         * app rather than fill a list.
         */
        private fun siteGroupNames(): List<String> {
            val known = INSTANCE.groupCache
            if (known.isNotEmpty()) {
                val names = known.map { it.name }
                groupNames = names
                return names
            }
            if (groupNames.isEmpty()) groupNames = Session.loadGroupNames()
            return groupNames
        }

        @Volatile
        private var groupNames: List<String> = emptyList()

        /**
         * Whether the line under a profile's name should stay hidden.
         *
         * Boost writes "12 posts · 34 comments" there, from the two counts
         * Lemmy sends with a person. Tildes publishes neither, so the
         * interceptor answers zero for both and an account with years behind
         * it reads "0 posts · 0 comments". The same shape as the score under a
         * comment: a number Boost was handed rather than one the site said.
         *
         * The view is laid out gone and only the write reveals it, so refusing
         * the write leaves no gap where the line would have been.
         *
         * Off disk rather than off [answering], like the tabs under it: a
         * profile opened from a tildes.net address draws its header off the
         * person in the intent, before any request has gone out, and on
         * [answering] that read "0 posts &middot; 0 comments".
         *
         * Called from patched bytecode, once per profile drawn.
         */
        @JvmStatic
        fun hideProfileStats(): Boolean = Session.wasTildes()

        /**
         * Takes the downvote button off a topic and off a comment.
         *
         * Tildes has one vote and no opposite. Boost draws the pair anyway, so
         * the second one has never done anything here: the interceptor answers
         * `downvotes: 0` and a tap on it goes nowhere. A button that does
         * nothing reads as a broken button rather than as a site that works
         * differently, which is what this is for.
         *
         * Every layout that has one names it `DownActiveImageButton`, and
         * nothing in Boost ever sets its visibility, so hiding it once as it is
         * built holds for the life of the view. There are three holders behind
         * it -- a feed row, a comment row and the topic screen -- and hooking
         * the view is one place instead of three.
         *
         * Read off disk rather than off [answering], like the wording: a row
         * can be inflated before the request that fills it, and a view pool
         * outlives one screen. Which leaves the same gap the wording has, and
         * it is the reason for the second branch: a view built on Tildes and
         * recycled on a Lemmy account is handed its button back rather than
         * keeping a hidden one.
         *
         * Called from patched bytecode, once per downvote button built.
         */
        @JvmStatic
        fun voteButton(button: View?) {
            if (button == null) return
            val gone = Session.wasTildes()
            button.visibility = if (gone) View.GONE else View.VISIBLE
            // The column around it once it has a parent, which a view being
            // built has not. Queued before the view is attached runs as it
            // attaches, which is in time for the first measure.
            button.post { voteColumn(button, gone) }
        }

        /**
         * The gap the hidden button leaves in a **Compact** row, which is the
         * one place a score is measured against it.
         *
         * That row stacks the arrow, the number and the second arrow in a
         * `wrap_content` column, and tucks the number 7dp up into each arrow
         * with a negative margin at both ends. `RelativeLayout` measures a
         * `wrap_content` column as the lowest `mBottom + bottomMargin` of the
         * children it can see, so with the second arrow gone the column
         * measures **7dp shorter than the number inside it** and the bottom of
         * the digits is cut off. Nothing about the number changed, which is why
         * it reads as a font bug rather than a layout one.
         *
         * So the column is given back what the margin took, as padding of its
         * own. Padding rather than clearing the margin, because padding is
         * exactly reversible: the amount comes off the layout rather than out
         * of here, and putting it back is setting it to nothing. Which is what
         * a row recycled onto a Lemmy account gets, along with its button.
         *
         * Only where the margin is negative and the column pads itself nowhere
         * else, so this reaches the compact row and no other layout drawing a
         * downvote -- a feed card, a comment and the topic screen all space
         * their score with ordinary margins.
         */
        private fun voteColumn(button: View, gone: Boolean) {
            try {
                val column = button.parent as? ViewGroup ?: return
                val score = column.findViewById<View>(
                    id(button.context, "submission_header_score")
                ) ?: return
                val overlap =
                    (score.layoutParams as? ViewGroup.MarginLayoutParams)?.bottomMargin ?: return
                if (overlap >= 0) return

                val want = if (gone) -overlap else 0
                if (column.paddingBottom == want) return
                if (column.paddingBottom != 0 && column.paddingBottom != -overlap) return
                column.setPadding(
                    column.paddingLeft,
                    column.paddingTop,
                    column.paddingRight,
                    want,
                )
                if (!saidVoteColumn) {
                    saidVoteColumn = true
                }
            } catch (t: Throwable) {
            }
        }

        /** Once per run, since a feed builds one of these per row. */
        @Volatile
        private var saidVoteColumn = false

        /**
         * Keeps the bottom of a list clear of the system navigation bar.
         *
         * Boost draws every screen edge to edge and applies the window insets
         * to the sides of its content and to the top of its toolbar. Nothing
         * applies the bottom one, so a list is laid out to the bottom of the
         * window with the navigation bar drawn over it and the last row of a
         * list that ends cannot be scrolled clear. Worst on History, which is
         * the one listing that reliably ends.
         *
         * The fix is the ordinary edge-to-edge pair: bottom padding the height
         * of the bar, and `clipToPadding` off so a row still scrolls under it
         * rather than being cut at the padding. So the list looks exactly as it
         * does now until you reach the end of it.
         *
         * The padding is added to whatever the list already had rather than
         * replacing it, and the base is read here, in the constructor, where it
         * is still the layout's own.
         *
         * Read off disk rather than off [answering], since a list is built
         * before the screen fetches anything, and answered once rather than
         * both ways: this runs as the view is inflated, and an inflated view
         * never goes through its constructor again, so a Lemmy account gets
         * a list nothing has touched.
         *
         * Called from patched bytecode, once per list built.
         */
        @JvmStatic
        fun listInsets(list: View?) {
            if (list == null || !Session.wasTildes()) return
            (list as? ViewGroup)?.clipToPadding = false
            padForNavigationBar(list, "list")
        }

        /**
         * The padding itself, which the wiki screen wants for the same reason
         * a list does: it scrolls, and its end is drawn under the bar.
         *
         * Added to whatever the view already had rather than replacing it, and
         * the base is read here, before the first inset arrives, so it is still
         * the layout's own. The listener runs again on a rotation and on a
         * gesture bar changing height, which is why it compares before it
         * writes rather than adding a second time.
         */
        private fun padForNavigationBar(view: View, what: String) {
            val base = view.paddingBottom
            view.setOnApplyWindowInsetsListener { padded, insets ->
                val bottom = insets.getInsets(BOTTOM_INSETS).bottom
                if (padded.paddingBottom != base + bottom) {
                    padded.setPadding(
                        padded.paddingLeft,
                        padded.paddingTop,
                        padded.paddingRight,
                        base + bottom,
                    )
                }
                insets
            }
        }

        /**
         * Keeps the bottom of the navigation drawer clear of the same bar.
         *
         * The drawer ends on a Settings row with a light-mode button beside it,
         * and it was drawn under the navigation bar. Which of the two views
         * carries it is a preference: `pref_drawer_sticky_settings` pins the row
         * to a footer along the bottom, and off -- which is the default -- it is
         * the last row of the drawer's own list, laid out to the bottom of the
         * window with nothing to scroll it clear.
         *
         * Padding the slider covers both. It is the drawer's root, it is the
         * view Boost paints the drawer's background on, and everything in the
         * drawer is inside it, so the footer rises above the bar, the list ends
         * above it, and the strip left behind is the same colour as the drawer.
         *
         * **[padForNavigationBar] cannot do this one.** The slider is a
         * `ScrimInsetsRelativeLayout`, which takes the window insets through a
         * listener of its own and hands back a consumed copy, and a listener is
         * what `View.dispatchApplyWindowInsets` calls *instead of* the view's own
         * dispatch. So nothing inside the drawer is offered the insets at all,
         * and setting a listener here would take the scrim's insets away from
         * it. The bar is read off [View.getRootWindowInsets] instead, which
         * answers what reached the window rather than what a parent passed on.
         *
         * The read hangs off a layout rather than an inset, since that is the
         * callback still arriving: it fires on the first pass, on a rotation and
         * on a gesture bar changing height, and it compares before it writes, so
         * the second pass its own write causes stops there.
         *
         * Called from patched bytecode, once per drawer built.
         */
        @JvmStatic
        fun drawerInsets(slider: View?) {
            if (slider == null || !Session.wasTildes()) return
            val base = slider.paddingBottom
            slider.addOnLayoutChangeListener { padded, _, _, _, _, _, _, _, _ ->
                val bottom = padded.rootWindowInsets?.getInsets(BOTTOM_INSETS)?.bottom
                if (bottom != null && padded.paddingBottom != base + bottom) {
                    padded.setPadding(
                        padded.paddingLeft,
                        padded.paddingTop,
                        padded.paddingRight,
                        base + bottom,
                    )
                }
            }
        }

        /**
         * What sits along the bottom of the window, which is the navigation bar
         * and whatever the screen is cut around. The same pair Boost applies to
         * the sides of its own content.
         */
        private val BOTTOM_INSETS =
            WindowInsets.Type.navigationBars() or WindowInsets.Type.displayCutout()

        /**
         * Takes the attach-image button off the markdown toolbar.
         *
         * Boost draws the same `FormattingBar` under every markdown field it
         * has -- the composer, a comment reply and the message editor -- and
         * one of its fourteen buttons uploads an image to the instance's own
         * host and writes the link into the text. Tildes hosts no images and
         * has nothing to upload to, so the button opens a picker whose answer
         * goes nowhere.
         *
         * Hidden as the bar is built, like the downvote button, because that
         * is one place against every screen carrying one and because nothing
         * in Boost ever sets that button's visibility: the only other thing
         * naming it is the ButterKnife binding that wires its tap.
         *
         * Read off disk rather than off [answering], since a bar is built
         * before anything it writes is sent, and set both ways for the same
         * reason [voteButton] is: a view recycled onto a Lemmy account gets
         * its button back.
         *
         * Called from patched bytecode, once per formatting bar built.
         */
        @JvmStatic
        fun formattingBar(bar: View?) {
            if (bar == null) return
            val image = bar.findViewById<View>(id(bar.context, "format_image")) ?: return
            image.visibility = if (Session.wasTildes()) View.GONE else View.VISIBLE
        }

        /**
         * Takes **View cross-posts** off the toolbar menu inside a topic.
         *
         * Tildes has no cross-posting. A topic lives in one group and moves
         * between them rather than being copied, so the row opens a list that
         * is empty by construction and says "No cross-posts" every time.
         *
         * The two rows Boost puts in a topic's own menu, Cross-posts and
         * Cross-post, come off through [trimMenu] with the sorts. This one is
         * an ordinary Android menu item in the toolbar above them, inflated
         * from a resource, so it is neither a `MenuOption` nor anything that
         * pass ever sees.
         *
         * Hooked where the fragment prepares that menu, which runs each time it
         * is opened, so a Lemmy account gets the row back with no second place
         * deciding it. Found by name rather than by id, since the ids renumber
         * every release.
         *
         * Called from patched bytecode with the menu about to be shown.
         */
        @JvmStatic
        fun topicMenu(menu: Menu?) {
            if (menu == null) return
            val context = Session.application() ?: return
            val tildes = Session.wasTildes()

            TOPIC_MENU_ROWS.forEach { name ->
                val id = id(context, name)
                if (id == 0) {
                    return@forEach
                }
                menu.findItem(id)?.isVisible = !tildes
            }
        }

        /** What the toolbar over a topic offers that Tildes cannot answer. */
        private val TOPIC_MENU_ROWS = listOf("menu_comment_other_discussions")

        /**
         * Opens a Tildes wiki page in the app rather than in a browser.
         *
         * Boost has a wiki screen already, inherited from its Reddit ancestor:
         * the Activity is in the manifest, the layout and the toolbar are
         * whole, and the text view on it takes a string of HTML. What it has
         * not got any more is the half that fetched a page, which R8 shrank
         * away with the rest of the Reddit API. So the screen is reached here
         * and filled in [wikiPage], and neither half exists without the other.
         *
         * Hooked at the head of the one method every tapped link in the app
         * goes through. Answering true means the link is handled and Boost's
         * own routing does not run; everything else falls through untouched,
         * which is what leaves an ordinary link opening the way it always did.
         *
         * **[openedSitePage] asks the same question**, for the wiki link that
         * arrives from somewhere else on the phone. That is a different way in
         * -- the deep-link activity's own router, which this hook sits nowhere
         * near -- and until it asked, a wiki address tapped in a browser or a
         * chat opened Boost and then opened the built-in browser inside it.
         *
         * A group's sidebar is where these links come from, and a wiki page
         * links to its own page list, which links back to every page. So the
         * whole of a group's wiki browses through here once the first link is
         * tapped.
         *
         * Scoped twice over: the account has to be a Tildes one and the link
         * has to be a tildes.net wiki path, so a Lemmy account cannot reach
         * this even on an instance that has a `/wiki/` of its own.
         */
        @JvmStatic
        fun openWiki(context: Context?, url: String?): Boolean {
            if (context == null || url == null || !Session.wasTildes()) return false
            val found = WIKI_LINK.find(url.substringBefore('#').substringBefore('?'))
                ?: return false

            val group = found.groupValues[1]
            val page = found.groupValues[2]
            return try {
                wikiAsked = wikiKey(group, page)
                val intent = Intent(context, Class.forName(WIKI_ACTIVITY))
                    .putExtra("subreddit", group)
                    .putExtra("wiki_page", page)
                if (context !is Activity) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
                true
            } catch (e: Throwable) {
                // Left to Boost, which ends at a browser. A wiki page in a
                // browser is worse than one in the app and better than a tap
                // that does nothing.
                false
            }
        }

        /**
         * Opens a tag as a listing in the app rather than in a browser.
         *
         * Tildes makes every tag on a topic a link to the same group's topics
         * filtered by it, and [Lemmy.tagLine] writes the site's own link under
         * the body. This is what takes it: the listing opens on the screen
         * Boost draws a community on, which is the one screen it has that
         * scrolls a list of topics and pages it.
         *
         * **The community is the tag.** Boost is handed a name rather than a
         * model -- `SubredditActivity` reads one off the intent when the intent
         * carries a URI -- and the name it is handed is tildes.net's own URL
         * for the listing, minus the host. So nothing has to be remembered
         * between the tap and the request: the name arrives back at
         * `/post/list` as `community_name` and says which group and which tag
         * on its own. [isSpecialListing] is the other half, and says the screen
         * is a listing rather than a community.
         *
         * Hooked at the head of the one method every tapped link goes through,
         * beside [openWiki]. Answering true means the link is handled and
         * Boost's own routing does not run.
         *
         * Scoped twice over, the way [openWiki] is: the account has to be a
         * Tildes one and the link has to be a tildes.net tag URL. Which also
         * means this takes a tag link somebody pasted into a comment, since
         * that is the same link.
         *
         * **What happens when it does not run is a real page.** A tag drawn in
         * a feed row's excerpt is rendered by a stripped-down markdown pass
         * that never reaches here, and a failure below falls through to Boost's
         * own routing, which ends at a browser. Both open tildes.net's own tag
         * listing, which is the same thing this draws.
         */
        /**
         * What the fourth tab of the search screen is called.
         *
         * Boost's four are Posts, Communities, Users and Comments, and the last
         * of them cannot work here: Tildes searches topics and nothing else, so
         * whatever was typed the tab drew an empty list. It asks for a tag
         * instead -- see the `Comments` branch of `/search` -- and this is the
         * word over it.
         *
         * **The wording table cannot carry this one.** The tab's title is
         * `pref_header_comments`, which is also the Comments heading in Boost's
         * own settings, so rewriting the string would rename a settings page to
         * match a tab. The same shape as the front page's word, and answered
         * the same way: here rather than in the table.
         *
         * By position rather than by resource, since a resource id renumbers
         * every release while the tab has been last of four since the screen
         * was written. `PatchAssumptionsTest` pins both the count and which
         * resource sits there, so a release that reorders them fails the build
         * rather than renaming the wrong tab.
         *
         * Answers null for the other three, which keep Boost's own words.
         *
         * Called from patched bytecode, once per tab titled.
         */
        @JvmStatic
        fun searchTabName(position: Int): String? =
            if (position == TAG_TAB && Session.wasTildes()) TAGS else null

        /** Where Comments sits, and what stands there instead. */
        private const val TAG_TAB = 3
        private const val TAGS = "Tags"

        /**
         * The topics that tab found, where Boost was about to read comments.
         *
         * The tab keeps Boost's own request and its own paginator -- what comes
         * back is the only thing that changes. `/search` answers a `Comments`
         * search with a tag listing, which is topics, and they arrive in the
         * `posts` array because that is the shape they are. This reads them out
         * of there.
         *
         * **Nothing downstream had to be told.** The list is handed on with its
         * type erased, through a LiveData and into an adapter that picks a row
         * by asking what each item *is*, so a topic among comments draws as a
         * topic. There is no cast to a comment anywhere between here and the
         * screen, which is what makes this one hook rather than three.
         *
         * The list factory is found by shape rather than by name: Boost's post
         * model has exactly two static methods and only one of them takes a
         * list, so the letter it goes under can renumber freely.
         *
         * Answers null on a Lemmy account, and on anything it cannot read, and
         * Boost's own comment reading runs.
         *
         * Called from patched bytecode, at the head of the method that turns a
         * search answer into rows.
         */
        @JvmStatic
        fun tagResults(response: Any?): ArrayList<Any>? {
            if (response == null || !Session.wasTildes()) return null
            return try {
                val posts = response.javaClass.getMethod(POSTS_OF).invoke(response)
                @Suppress("UNCHECKED_CAST")
                postList()?.invoke(null, posts) as? ArrayList<Any>
            } catch (t: Throwable) {
                null
            }
        }

        /**
         * Boost's own `List<PostView>` to `ArrayList<SubmissionModel>`, which
         * is the one static method on that model taking a list.
         *
         * The other one takes a single `PostView`, so the pair cannot be
         * confused, and neither keeps its name.
         */
        private fun postList(): Method? {
            postListMethod?.let { return it }
            val model = Class.forName(SUBMISSION_MODEL_CLASS)
            val found = model.declaredMethods.singleOrNull { method ->
                Modifier.isStatic(method.modifiers) &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == List::class.java &&
                    method.returnType == ArrayList::class.java
            }
            if (found == null) {
                return null
            }
            found.isAccessible = true
            postListMethod = found
            return found
        }

        @Volatile
        private var postListMethod: Method? = null

        /** Where the topics are on a Lemmy search answer, and what maps them. */
        private const val POSTS_OF = "getPosts"
        private const val SUBMISSION_MODEL_CLASS =
            "com.rubenmayayo.reddit.models.reddit.SubmissionModel"

        @JvmStatic
        fun openTag(context: Context?, url: String?): Boolean {
            if (context == null || url == null || !Session.wasTildes()) return false
            val tagged = Lemmy.tagListingFor(url) ?: return false

            return openTagListing(context, tagged)
        }

        /**
         * Opens one, from a link or from a tag drawn under a topic.
         *
         * Answers whether the screen took, which is what [openTag] hands back
         * to Boost's link routing. A tag pressed under a topic has nowhere else
         * to go, so it only logs.
         */
        private fun openTagListing(context: Context, tagged: Lemmy.TagListing): Boolean =
            openListing(
                context,
                Lemmy.tagUrl(tagged.group, tagged.tag),
                tagged.name,
                "tag listing: " + tagged.title,
            )

        /**
         * A group with its subgroups, opened from the row its own sidebar
         * carries.
         *
         * Tildes serves that at the group's own address with a flag on it -- see
         * [Lemmy.SubgroupListing] -- so it is the same kind of thing a tag
         * listing is and opens on the same screen, carrying the site's own URL
         * as its name.
         */
        @JvmStatic
        fun openSubgroups(context: Context?, url: String?): Boolean {
            if (context == null || url == null || !Session.wasTildes()) return false
            val listing = Lemmy.subgroupListingFor(url) ?: return false

            return openListing(
                context,
                Lemmy.subgroupUrl(listing.group),
                listing.name,
                "subgroup listing: " + listing.title,
            )
        }

        /**
         * The screen both of them open, which is the one Boost draws a
         * community on and the only one it has that scrolls topics and pages
         * them.
         *
         * Answers whether it took. A link that reaches here has somewhere to
         * fall back to -- Boost's own routing, which ends at tildes.net's own
         * page in a browser -- and a tag pressed under a topic has not, so it
         * only logs.
         */
        private fun openListing(
            context: Context,
            url: String,
            name: String,
            what: String,
        ): Boolean =
            try {
                val intent = Intent(context, Class.forName(SUBREDDIT_ACTIVITY))
                    // The screen reads the name off `shortcut` only when the
                    // intent carries data, since that is the path a home screen
                    // shortcut arrives by. Without it the name is ignored and
                    // the screen looks for a model that is not there.
                    .setData(Uri.parse(url))
                    .putExtra(SHORTCUT, name)
                if (context !is Activity) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
                true
            } catch (e: Throwable) {
                // Left to Boost, which ends at the site's own listing in a
                // browser. Worse than the listing in the app and better than a
                // tap that does nothing.
                false
            }


        /**
         * Draws a topic's tags under its body, as something to press.
         *
         * They ride in the body as code spans, for want of a Lemmy field to
         * hold them, and a code span is as far as markdown goes: it cannot be
         * given a shape or a colour. So they are drawn here instead, in the
         * same pill the composer offers a tag in, and the line they came from
         * is taken off the body.
         *
         * **In that order, and it matters.** The line comes off only once the
         * chips have somewhere to go, so a layout this cannot find leaves the
         * tags where they were: readable text rather than nothing at all.
         *
         * **Which screen this is comes off the layout.** One method binds a
         * post to a view, on a topic's own screen and in a listing row alike,
         * and the two inflate different body views:
         * `submission_header_selftext` on a topic and
         * `submission_preview_selftext` in a row. Whichever is there says which
         * is being drawn, and that decides which tags get drawn with it -- all
         * of them on a topic, and only the ones the listing itself drew in a
         * row. See [Tildes.Topic.tagsInListing] for why those are not the same
         * question.
         *
         * The chips go in the column **outside** the body's own container,
         * which is the root of the layout rather than the box the text sits in.
         * That box is hidden for a topic with no text -- a link topic, which is
         * most of Tildes -- and anything inside it would go with it, while the
         * tags belong to the topic rather than to the words.
         *
         * The body copy that is edited is `M`, which is the one the renderer is
         * handed. Its twin `N` holds the same text and is left alone, so every
         * path that reads a topic back for editing still sees the line and
         * still takes it off the way it always did.
         *
         * Called from patched bytecode, once per post bound.
         */
        @JvmStatic
        fun tagPills(holder: Any?, model: Any?) {
            if (holder == null || model == null || !Session.wasTildes()) return

            try {
                val root = holder.javaClass.getField(ITEM_VIEW).let {
                    it.isAccessible = true
                    it.get(holder) as? View
                } ?: return

                val topic = idOf(model)?.let { INSTANCE.topics[it] } ?: return
                val opened = root.findViewById<View>(id(root.context, SELFTEXT_VIEW))

                // The line comes off the body either way, since the tags are
                // drawn beside it now. A row the site drew no tags for is still
                // a topic that has them, and its excerpt would otherwise carry
                // every one at the end of the words.
                withoutTagLine(model, topic)

                if (opened != null) pillsUnder(root, opened, topic)
                else tagsBesideRow(root, topic)
            } catch (t: Throwable) {
                // The tags are still under the body as text, which is where
                // they were before any of this.
            }
        }

        /**
         * A comment's labels, drawn in the byline where Boost draws its own
         * marks, and taken off the body they were read from.
         *
         * They ride in the body as code spans, for want of a Lemmy field to
         * put them in, and a code span cannot be given a colour: Boost renders
         * a comment through Markwon, and there is no `ForegroundColorSpan`
         * anywhere in that pipeline and no handler for `<span>` or `<font>`. So
         * the word reads as something the author typed rather than as the site
         * saying something about the comment.
         *
         * **The byline already has the slot.** `item_comment_distinguished` is
         * one `TextView` painting coloured spans -- the `🔒`, the `OP`, the `M`
         * and the `A` -- and it is filled and made visible earlier in the same
         * bind this is called from. So this appends to what that left, and a
         * comment carrying an `OP` marker reads `OP Exemplary`.
         *
         * **In that order, and it matters.** The line comes off only once the
         * word has somewhere to go, so a layout with no such view keeps the
         * body it always had: a word that reads, rather than nothing at all.
         *
         * **Only the pill shape.** A comment carrying reasons opens on a fold
         * instead, and that stays where it is -- it holds what people wrote,
         * which no badge can say, and it is your own comment either way.
         *
         * **A holder is reused**, so whatever it drew last has to come off
         * before this draws anything. What this appends is marked with a
         * zero-width space, which is the one character that can sit in a byline
         * without being seen, so the cut is exact and Boost's own marks keep
         * their colours.
         *
         * Called from patched bytecode, with the view the body is about to be
         * rendered into and the body itself, and answers what should be
         * rendered instead.
         */
        @JvmStatic
        fun commentLabel(body: Any?, text: String?): String? {
            if (text == null || body !is View || !Session.wasTildes()) return text
            return try {
                val slot = labelSlot(body)
                val words = Lemmy.labelsInLine(text)
                if (slot == null) {
                    return text
                }
                drawLabels(slot, words)
                if (words.isEmpty()) text else Lemmy.withoutLabelLine(text)
            } catch (t: Throwable) {
                text
            }
        }

        /**
         * The byline view to draw them in, found from the body view beside it.
         *
         * Both are children of the same layout, so this walks up from the one
         * the bind handed over rather than being handed a holder. Two levels is
         * the whole of it -- the body's own parent in every comment layout the
         * app has -- and the walk stops at the first that answers.
         */
        private fun labelSlot(body: View): TextView? {
            val wanted = id(body.context, LABEL_SLOT_VIEW)
            if (wanted == 0) return null
            var parent = body.parent
            var levels = LABEL_SLOT_LEVELS
            while (parent is View && levels > 0) {
                (parent.findViewById<View>(wanted) as? TextView)?.let { return it }
                parent = parent.parent
                levels--
            }
            return null
        }

        /**
         * Writes them into that view, after whatever Boost put there.
         *
         * The colours are Tildes' own, off the theme whose accents are built to
         * read on either ground: the site paints a label's pill differently in
         * each of its themes, and Boost has eleven of its own, so a colour that
         * works on both a white and a black byline is worth more here than a
         * colour matched to one of them.
         */
        private fun drawLabels(slot: TextView, words: List<String>) {
            val was = slot.text ?: ""
            val cut = was.indexOf(LABEL_MARK)
            val base = if (cut >= 0) was.subSequence(0, cut) else was

            if (words.isEmpty()) {
                if (cut >= 0) {
                    slot.text = base
                    if (base.isEmpty()) slot.visibility = View.GONE
                }
                return
            }

            val out = android.text.SpannableStringBuilder(base).append(LABEL_MARK)
            words.forEach { word ->
                if (out.length > base.length + LABEL_MARK.length) out.append(' ')
                val at = out.length
                out.append(word)
                val colour = LABEL_COLOURS[word.substringBefore(' ').lowercase()]
                if (colour != null) {
                    out.setSpan(
                        android.text.style.ForegroundColorSpan(colour),
                        at,
                        out.length,
                        android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE,
                    )
                }
                // The size Boost's own OP and M markers are drawn at, so a
                // label sits in the line rather than over it.
                out.setSpan(
                    android.text.style.RelativeSizeSpan(0.9f),
                    at,
                    out.length,
                    android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE,
                )
            }
            slot.text = out
            slot.visibility = View.VISIBLE
        }

        /** The byline view Boost paints its own marks into. */
        private const val LABEL_SLOT_VIEW = "item_comment_distinguished"

        /** How far up from the body view to look for it. */
        private const val LABEL_SLOT_LEVELS = 2

        /**
         * What separates Boost's marks from ours, and what says where ours
         * start on a holder that is about to draw a different comment.
         */
        private const val LABEL_MARK = "​"

        /**
         * Tildes' own colours for the five, taken from the theme it calls
         * black. Its light themes darken these and its dark ones lift them,
         * while these are solarized accents and read on either.
         */
        private val LABEL_COLOURS = mapOf(
            "exemplary" to 0xFF268BD2.toInt(),
            "offtopic" to 0xFF2AA198.toInt(),
            "joke" to 0xFF859900.toInt(),
            "noise" to 0xFFB58900.toInt(),
            "malice" to 0xFFDC322F.toInt(),
        )

        /**
         * The body Boost's quote dialog offers, with the label line off it.
         *
         * Tapping the comment at the head of a reply opens that dialog, which
         * fills a selectable box with the parent's body and puts `>` in front
         * of whatever is left selected when you tap Quote. The box is filled
         * from `content`, which still carries the label line: [commentLabel]
         * rewrites what the renderer is handed, not the model behind it. So a
         * reply to an exemplary comment opened with `` > `Exemplary` ``, which
         * reads as a word its author had typed.
         *
         * Taking the line off here rather than off the quote means it is not in
         * the box at all, so no selection can reach it either.
         *
         * **A topic's tag line stays**, and it is a different job rather than
         * the same one twice. A label is one of five words, so its line is
         * recognised from the string alone, while a tag is any word and its
         * line comes off only by rebuilding the exact line from the topic's own
         * tags. Those are a lookup away rather than in hand here, and the copy
         * the dialog reads is `N` -- the one [tagPills] leaves alone on purpose,
         * so that the edit route still finds the line and still takes it off.
         * See [Lemmy.withoutLabelLine] and [Lemmy.withoutTagLine].
         *
         * Called from patched bytecode with the body the dialog is about to
         * show, and answers what it should show instead.
         */
        @JvmStatic
        fun quotedBody(screen: Any?, box: Any?, text: String?): String? {
            if (text == null || !Session.wasTildes()) return text

            val post = postOn(screen)
            // Already here, because the screen this was opened from asked for
            // it on its way up. Which is the usual way round: the card has to
            // be tapped, and that is a second gesture and a good deal later.
            post?.let { (id36, comment) ->
                Tildes.heldMarkdownSource(id36, comment)?.let { return it }
            }

            val shown = try {
                Lemmy.withoutLabelLine(text)
            } catch (t: Throwable) {
                text
            }

            // And where it is not, the box opens on the body it always opened
            // on and takes the source when it lands.
            sourceInto(post, box as? TextView, "", shown)
            return shown
        }

        /**
         * And the quote that dialog builds, marked on every line rather than on
         * the first one.
         *
         * Boost puts a single `>` in front of the whole selection. Markdown's
         * lazy continuation then carries the quote over the lines under it, so
         * a one-paragraph parent comes out right and the rule looks like "the
         * whole thing is quoted". It is not: the first blank line ends the
         * quote, and everything after it lands in the reply as the replier's
         * own words. Which is the worst shape a formatting bug can take here --
         * it puts somebody else's sentences under your name, and the reply
         * reads perfectly well either way.
         *
         * [Lemmy.quoted] has what it does instead and why the marker is read
         * off Boost's own head rather than spelt again.
         *
         * **The composer's own quote button is left alone.** That one inserts a
         * `>` where the caret is, the way the bullet button inserts a `* `, and
         * a marker you place yourself is doing what it says.
         *
         * Called from patched bytecode in place of the concatenation Boost was
         * about to do, with the three pieces it was going to join, and answers
         * what goes into the composer.
         */
        @JvmStatic
        fun quoteBlock(head: String?, text: String?, tail: String?): String {
            val whole = (head ?: "") + (text ?: "") + (tail ?: "")
            if (head == null || text == null || tail == null || !Session.wasTildes()) return whole

            return try {
                Lemmy.quoted(head, text, tail)
            } catch (t: Throwable) {
                // The quote Boost would have built, which is one marker short
                // rather than nothing at all.
                whole
            }
        }

        /**
         * Whether the reply path should read a post as one that takes no reply.
         *
         * `PublicContributionModel.n` is Reddit's archived flag, and this end
         * writes it where tildes.net drew no vote button -- see [voteClosedTopic]
         * for what that is worth on a vote. Reddit archives a post's votes and
         * its comments together, so Boost reads the one flag on both paths, and
         * the reply icon on a topic of your own started toasting **Tildes is not
         * taking votes on this** at somebody trying to answer their own thread.
         *
         * Tildes does not tie the two together at all. Its topic ACL denies
         * `vote` to the author and to anything past the 30-day voting period,
         * and denies `comment` for three unrelated reasons: the topic is
         * removed, it is locked, or it is a scheduler post that has been
         * superseded. Nothing an author does closes their own thread.
         *
         * So the flag answers no here, and the reply gate Tildes does have sits
         * a few lines further down the same method, on Lemmy's `locked`. See
         * [replyLocked], which is the hook on that one: a locked topic closes
         * everything, while a removed one closes only the box for a new
         * top-level comment.
         *
         * Called from patched bytecode with the flag just read, on the one
         * method all three ways of starting a reply funnel through.
         */
        @JvmStatic
        fun replyClosed(closed: Boolean): Boolean = if (Session.wasTildes()) false else closed

        /**
         * And the gate that is left, which Tildes does have and applies to less
         * than Boost assumes.
         *
         * Boost refuses a reply when `submissionModel.o || contribution.o`,
         * both being Lemmy's `locked`. That reads the topic on every path, so a
         * topic closed to new comments closes the replies to its comments too.
         * Tildes splits the two: the topic ACL denies `comment`, which is the
         * box for a new top-level comment, while a comment's own ACL grants
         * `reply` unless that comment is removed or the topic is *locked*. A
         * removed topic is not a locked one, so the tree stays answerable.
         *
         * So this answers per contribution rather than per topic:
         *
         * - a locked topic still closes everything, which is the flag arriving
         *   set off the site's own `topic-comments-locked`
         * - a reply to a comment is allowed, since Tildes takes it
         * - a new top-level comment is refused on a topic the site has taken
         *   down, which is [Tildes.Topic.rootCommentsClosed]
         *
         * Refusing here is what the 403 used to do, only before the request
         * leaves rather than after: Boost draws its own locked notice instead
         * of the composer opening onto a post that cannot land.
         *
         * Called from patched bytecode at both reads of the flag, with the
         * contribution the reply was started from. Both reads answer the same
         * way, so which of the two ran first does not matter.
         */
        @JvmStatic
        fun replyLocked(locked: Boolean, contribution: Any?): Boolean {
            if (!Session.wasTildes()) return locked
            if (locked) return true
            if (contribution == null) return false
            // Tildes takes a reply to any comment it has not removed, whatever
            // has happened to the topic over it.
            if (contribution.javaClass.name.endsWith(COMMENT_MODEL)) return false
            return idOf(contribution)?.let { INSTANCE.topics[it]?.rootCommentsClosed } == true
        }

        /**
         * The edit box, filled with the markdown its author typed rather than
         * with what the body converts back into.
         *
         * Boost fills that box from the model, which holds what
         * [Lemmy.htmlToMarkdown] made of the rendered page, and a save writes
         * the box back over the post. So everything the render does not carry
         * was being written into somebody's own words the first time they fixed
         * a typo -- a fence's language and an author's backslash escapes both,
         * neither of which is recoverable from the HTML. [Tildes.markdownSource]
         * says why, and it is the same reason [Tildes.myBio] exists.
         *
         * **Only on an edit**, which the screen is handed as it reads it, and
         * only for a comment or a topic: a message cannot be edited on Tildes,
         * and nothing else reaches this screen.
         *
         * **On a thread, and it swaps rather than waits.** The fetch sits on
         * the 700 ms gate and this runs while the screen is being built, so the
         * box opens holding the converted body the way it always did and takes
         * the source when it lands. It takes it **only if the box still holds
         * what it was handed**, so somebody who started typing in the meantime
         * keeps what they typed -- and the strip in [quotedBody] and the one on
         * the way back out both stay where they are, since either can be what
         * the box ends up holding.
         *
         * **Asked for on every composer, not only on an edit**, and that is the
         * cheap way round rather than the thorough one. The same screen's quote
         * dialog wants the same post's source, and it is built on the main
         * thread where it cannot wait for one, so asking here means the answer
         * is usually held by the time the card is tapped. One request either
         * way: [Tildes.markdownSource] holds it for the thirty seconds a page is
         * held for, so the two boxes share the one fetch.
         *
         * Only the edit box is filled from it. A reply's box is where somebody
         * is about to type, and what they are replying to belongs in the dialog.
         *
         * Called from patched bytecode with the screen and the flag it is about
         * to store, once the post and the box are both set.
         */
        @JvmStatic
        fun composerSource(screen: Any?, editing: Boolean) {
            if (screen == null || !Session.wasTildes()) return
            try {
                val (id36, comment) = postOn(screen) ?: return
                val box = if (editing) editBox(screen) ?: return else null
                val was = box?.text?.toString().orEmpty()

                Thread {
                    val source = Tildes.markdownSource(id36, comment) ?: return@Thread
                    if (box == null) return@Thread
                    box.post {
                        if (box.text?.toString() == was && source != was) {
                            box.setText(source)
                            box.setSelection(source.length)
                        }
                    }
                }.start()
            } catch (t: Throwable) {
            }
        }

        /**
         * The post a composer was opened over, as the site spells it, and
         * whether it is a comment.
         *
         * Null for anything the site has no markdown route for, which is a
         * message: they cannot be edited on Tildes and nothing else reaches
         * this screen.
         */
        private fun postOn(screen: Any?): Pair<String, Boolean>? =
            try {
                postOf(screen?.javaClass?.getField(EDIT_MODEL_FIELD)?.get(screen))
            } catch (t: Throwable) {
                null
            }

        /**
         * And the same off the holder drawing a row, which is what the two
         * **Select text** rows are handed.
         *
         * By the type it finds rather than by a letter: each holder carries
         * exactly one field holding a post, and the letter naming it is not the
         * same one on the two of them. Walking is one pass over a holder's
         * fields when a dialog opens, which is nothing, and it is one less
         * single letter to be wrong about after a release.
         *
         * **Two levels, because the two rows are not handed the same thing.** A
         * topic's is a method on the holder itself, so its post is one field
         * away. A comment's is the menu callback beside the holder -- a class
         * whose whole content is the holder it was built with -- so its post is
         * two. The walk stops at Boost's own classes and at that depth, which is
         * enough for both and short of anything worth calling a search.
         */
        private fun postIn(holder: Any?, depth: Int = 2): Pair<String, Boolean>? {
            if (holder == null || depth <= 0) return null
            postOf(holder)?.let { return it }

            var owner: Class<*>? = holder.javaClass
            while (owner != null) {
                owner.declaredFields.forEach { field ->
                    val value = try {
                        field.isAccessible = true
                        field.get(holder)
                    } catch (t: Throwable) {
                        null
                    }
                    if (value != null && value.javaClass.name.startsWith(BOOST_PACKAGE)) {
                        postIn(value, depth - 1)?.let { return it }
                    }
                }
                owner = owner.superclass
            }
            return null
        }

        /** Where Boost's own models and holders live, and nothing else does. */
        private const val BOOST_PACKAGE = "com.rubenmayayo."

        /** And the same off a model that is already in hand. */
        private fun postOf(model: Any?): Pair<String, Boolean>? {
            val kind = model?.javaClass?.name ?: return null
            return when {
                kind.endsWith(COMMENT_MODEL) -> idOf(model)?.let { it to true }
                kind.endsWith(SUBMISSION_MODEL) -> idOf(model)?.let { it to false }
                else -> null
            }
        }

        /**
         * **Select text**, which opens the same box the quote dialog does and
         * fills it the same way: off the model, so with the label line still on
         * it and with whatever the render converted back into.
         *
         * Three rows draw that box in the app -- this one on a comment, this one
         * on a topic, and the quote dialog -- and each builds it in a method of
         * its own, so each is hooked separately. Nothing is written back from
         * here, which makes this the tidiest of the three rather than the most
         * urgent: what it costs is copying a fence that has lost its language.
         *
         * **A topic's box opens on its title, a blank line, then the body**,
         * while a comment's is the body alone. Only the body half is the site's
         * to answer for, so the head is held back and put in front of whatever
         * comes back. A title cannot carry a blank line, so the first one is
         * where the two meet.
         *
         * Called from patched bytecode with the holder drawing the row, the box
         * and what was about to go in it.
         */
        @JvmStatic
        fun selectedBody(holder: Any?, box: Any?, text: String?): String? {
            if (text == null || !Session.wasTildes()) return text

            val found = postIn(holder)
            val head = if (found?.second == false) text.substringBefore("\n\n") + "\n\n" else ""
            val body = text.removePrefix(head)

            found?.let { (id36, comment) ->
                Tildes.heldMarkdownSource(id36, comment)?.let { return head + it }
            }

            val shown = head + try {
                Lemmy.withoutLabelLine(body)
            } catch (t: Throwable) {
                body
            }

            sourceInto(found, box as? TextView, head, shown)
            return shown
        }

        /**
         * Puts the source in a box already showing the converted body, once it
         * lands.
         *
         * Only where the box still holds what it was handed **and** nothing has
         * been selected out of it. A selection is somebody choosing what to
         * take, and a better spelling underneath is not worth losing it for.
         */
        private fun sourceInto(
            post: Pair<String, Boolean>?,
            view: TextView?,
            head: String,
            shown: String,
        ) {
            if (post == null || view == null) return
            Thread {
                val source = Tildes.markdownSource(post.first, post.second) ?: return@Thread
                val whole = head + source
                view.post {
                    if (view.text?.toString() == shown &&
                        whole != shown &&
                        view.selectionStart == view.selectionEnd
                    ) {
                        view.setText(whole, TextView.BufferType.SPANNABLE)
                    }
                }
            }.start()
        }

        /**
         * The box itself, which is declared on the screen's parent and is not
         * public, so it is reached by walking rather than by [Class.getField].
         */
        private fun editBox(screen: Any): EditText? {
            var owner: Class<*>? = screen.javaClass
            while (owner != null) {
                try {
                    return owner.getDeclaredField(EDIT_BOX_VIEW)
                        .apply { isAccessible = true }
                        .get(screen) as? EditText
                } catch (e: NoSuchFieldException) {
                    owner = owner.superclass
                }
            }
            return null
        }

        /** What the reply screen was opened over, which is the post being edited. */
        private const val EDIT_MODEL_FIELD = "g"

        /** The box that screen types into, which keeps its name for ButterKnife. */
        private const val EDIT_BOX_VIEW = "inputEditText"

        /** The two models that reach it. Boost does not obfuscate either name. */
        private const val COMMENT_MODEL = ".CommentModel"
        private const val SUBMISSION_MODEL = ".SubmissionModel"

        /**
         * A topic's own screen: every tag it has, as a pill that opens the
         * tag's listing.
         */
        private fun pillsUnder(root: View, body: View, topic: Tildes.Topic) {
            val column = columnOf(body) ?: return
            val row = rowOf(body, column) ?: return

            // A holder is reused, so whatever it was drawing last is found
            // before anything is drawn now. Otherwise the topic scrolled past
            // keeps its tags under the one after it.
            val drawn = column.findViewWithTag<TagFlow>(PILLS)
            if (topic.tags.isEmpty()) {
                drawn?.visibility = View.GONE
                return
            }

            // Off the body's own colour, so a pill follows whichever of Boost's
            // themes is on without reading any of them. The body is a text view
            // even when it is empty and hidden, which is the case that matters:
            // a link topic has tags and no words.
            val colour = (body as? TextView)?.currentTextColor ?: return

            val strip = drawn ?: pillStrip(column, row)
            strip.removeAllViews()
            strip.visibility = View.VISIBLE

            val gap = (4 * root.resources.displayMetrics.density).toInt()
            topic.tags.forEach { tag ->
                val chip = pill(root.context, colour, tag) {
                    openTagListing(root.context, Lemmy.TagListing(topic.group, tag))
                }
                // What holds one row of tags off the next, where the composer's
                // own row has nothing under it to be held off.
                (chip.layoutParams as? ViewGroup.MarginLayoutParams)?.bottomMargin = gap
                strip.addView(chip)
            }
        }

        /**
         * A listing row: the tags the listing itself drew, as one line of small
         * text under the byline.
         *
         * **Not pills, and not tappable.** Tildes does link a tag in a listing,
         * but a row in Boost is one big tap target that opens the topic, and
         * something tappable inside it fights that -- a thumb aiming at the
         * topic lands on a tag. The topic's own screen is where a tag is worth
         * pressing, and it is one tap away.
         *
         * So this is what a row can say without taking room: the tags, small
         * and dimmed, on one line that ellipsizes rather than wrapping. Which
         * is close to what the site does with them, where they sit beside the
         * rest of a row's metadata rather than under it.
         *
         * Anchored on whichever view the row turns out to have. A row is not
         * one layout but seven, and half of them inflate their middle out of a
         * `ViewStub`, so the body preview is not always there to hang this off
         * -- the first walk found a row carrying none of it. The metadata line
         * is the fallback, and the log says which one answered.
         */
        private fun tagsBesideRow(root: View, topic: Tildes.Topic) {
            val anchor = ROW_ANCHORS.firstNotNullOfOrNull { name ->
                root.findViewById<View>(id(root.context, name))?.also { noteAnchor(name) }
            } ?: run {
                noteAnchor("nothing")
                return
            }

            val words = rowTags(topic)
            val drawn = root.findViewWithTag<TextView>(ROW_TAGS)
            if (words.isEmpty()) {
                drawn?.visibility = View.GONE
                return
            }

            val line = drawn ?: rowTagLine(anchor) ?: return
            line.text = words.joinToString("  ·  ")
            line.visibility = View.VISIBLE
        }

        /**
         * The line itself, built the first time a row needs one, in whichever
         * of two places that row keeps its byline.
         *
         * **A Compact row is the odd one and was the wrong one.** Every other
         * layout keeps the byline in a block that is a vertical `LinearLayout`,
         * or hangs it straight off the row's own column, so walking up to the
         * nearest vertical `LinearLayout` lands inside the block either way and
         * the line goes in with the rest of the row's small print. A Compact
         * row keeps its block in a `RelativeLayout`, which that walk does not
         * stop at, so the line went in *after* the whole block: 8dp of the
         * block's own bottom padding above it, 1dp under it, and indented to
         * the edge of the screen where every other line in the row starts past
         * the vote column.
         */
        private fun rowTagLine(anchor: View): TextView? {
            (anchor.parent as? RelativeLayout)?.let { return inBlock(it) }

            val column = columnOf(anchor) ?: return null
            val row = rowOf(anchor, column) ?: return null
            return underRow(column, row)
        }

        /**
         * A Compact row, where the line becomes another child of the block the
         * title and the byline are in, under the bottom line of it.
         *
         * Which leaves the block's own 8dp under the tags rather than over
         * them, and lines them up with everything above, both for free: the
         * padding belongs to the block and the line is inside it now.
         *
         * **Under the counts rather than over them**, which is one row later
         * than a Dense row puts them. That line is anchored below the byline by
         * a rule of Boost's, so going above it would mean re-pointing that rule
         * at this, where going below it adds a child and moves nothing.
         *
         * The bottom line is an `<include>` with no id of its own, so it is
         * found through the one view in it that has one and given an id here,
         * since a `RelativeLayout` rule can only name a sibling by id. Nothing
         * of Boost's looks that view up, having never named it.
         */
        private fun inBlock(block: RelativeLayout): TextView? {
            val counts = block.findViewById<View>(id(block.context, COUNT_VIEW)) ?: return null
            val under = generateSequence(counts) { it.parent as? View }
                .firstOrNull { it.parent === block } ?: return null
            if (under.id == View.NO_ID) under.id = View.generateViewId()

            val line = tagLine(block.context)
            block.addView(
                line,
                RelativeLayout.LayoutParams(
                    RelativeLayout.LayoutParams.WRAP_CONTENT,
                    RelativeLayout.LayoutParams.WRAP_CONTENT,
                ).apply {
                    addRule(RelativeLayout.BELOW, under.id)
                    addRule(RelativeLayout.ALIGN_LEFT, under.id)
                    addRule(RelativeLayout.ALIGN_START, under.id)
                    topMargin = (2 * block.resources.displayMetrics.density).toInt()

                    // Held off the thumbnail the way the byline over it is, so
                    // a long list of tags ends where that line ends rather than
                    // running under the picture.
                    val thumbnail = block.findViewById<View>(id(block.context, THUMBNAIL_VIEW))
                    if (thumbnail != null && thumbnail.id != View.NO_ID) {
                        addRule(RelativeLayout.LEFT_OF, thumbnail.id)
                        addRule(RelativeLayout.START_OF, thumbnail.id)
                    }
                },
            )
            return line
        }

        /**
         * What a row has to say about a topic, in the order tildes.net says it:
         * the tags it drew, and then what it calls the topic.
         *
         * `nsfw` and `spoiler` are not among them: Boost draws a badge for each
         * on the row already, so listing them here would say the same thing
         * twice in the same inch of screen. See [Lemmy.tagsBesideBadges].
         *
         * That second part earns its place twice over. **`Ask (survey)` stands
         * in for a tag** -- Tildes works it out from the `ask` family and then
         * leaves that tag out of the row's tag list, so a topic tagged
         * `ask.survey` reads as untagged without it. And **`Article: 696
         * words` or `Video: 2:45` is a thing to know before you tap**, which
         * nothing else in the row says.
         *
         * Two of them are dropped. `Text` and `Link` are the bare "what kind of
         * post is this", which a row already answers in its own way -- an
         * excerpt under the one, a domain and a thumbnail on the other -- and
         * `Text` alone was on sixteen of the fifty rows in the group fixture.
         * Everything else is kept whatever it says, including the ones nobody
         * has seen yet.
         *
         * The line ellipsizes, so a long tag list can cut this off the end.
         * That is the site's own order and worth keeping: a row with that many
         * tags is one where the tags are what it is saying.
         */
        private fun rowTags(topic: Tildes.Topic): List<String> =
            Lemmy.tagsBesideBadges(topic.tagsInListing) +
                listOfNotNull(Tildes.contentTypeInRow(topic.contentType, topic.contentMetadata))

        /**
         * Every other row, where the block is a vertical `LinearLayout` and the
         * line is the next child of it.
         *
         * Nothing above it. A row that gets here already ends its content on
         * 8dp of its own -- the excerpt's own padding in a Cards row, or the
         * spacer that stands in for it, and the counts' bottom margin in a
         * Dense one -- so anything here is on top of that rather than instead
         * of it.
         *
         * The 16dp is the indent a Cards row's excerpt has and the tags line up
         * under, and it is skipped where the block pads itself, which is the
         * same alignment one step in.
         */
        private fun underRow(column: LinearLayout, row: View): TextView {
            val dp = column.resources.displayMetrics.density
            val indent = if (column.paddingLeft > 0) 0 else (16 * dp).toInt()

            val line = tagLine(column.context).apply {
                setPadding(indent, 0, indent, 0)
            }
            column.addView(
                line,
                column.indexOfChild(row) + 1,
                LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                ),
            )
            return line
        }

        /** What both of them build, so the two places agree on the look. */
        private fun tagLine(context: Context): TextView =
            TextView(context).apply {
                tag = ROW_TAGS
                textSize = 12f
                setTextColor(rowTagColour(context))
                maxLines = 1
                ellipsize = android.text.TextUtils.TruncateAt.END
            }

        /**
         * What colour a row's tag line is drawn in.
         *
         * **Off the theme rather than off the view it hangs under**, which is
         * the whole of the fix and worth the paragraph. The first version took
         * the colour of whichever anchor it found, and a row is seven layouts
         * that do not agree on what that anchor is: a Compact, Dense or Small
         * cards row hangs off `submission_header_info_top`, which is styled
         * `SecondaryTextColor` -- the small print -- while a Cards or Cards 2.0
         * row hangs off `submission_preview_selftext`, styled
         * `PrimaryTextColor`, the same colour as the words of the topic. So the
         * same line came out as small print in half the modes and as body text
         * in the other half, which is what "the tags are not dimmed on Cards"
         * was.
         *
         * `SecondaryTextColor` is Boost's own answer for this: it is what the
         * byline the tags sit under already uses, on every one of the eleven
         * themes, and reading it off the theme also settles a second thing --
         * the excerpt's colour is set **during** the bind, by whichever of read
         * and unread the topic is, and this runs at the head of it, so a
         * recycled row was reading the colour of the topic before it.
         *
         * Resolved by name, since an attribute id renumbers every release like
         * everything else in the table.
         */
        private fun rowTagColour(context: Context): Int {
            val colour = dimmed(
                themeColour(context, ROW_META_COLOUR) ?: 0xFF888888.toInt(),
            )
            noteColour(colour)
            return colour
        }

        /**
         * [colour] at [DIM] of the opacity it arrived with.
         *
         * **Masking the alpha byte is not this**, and it is what the line was
         * drawn with until now: `colour and 0x99FFFFFF` answers the source's own
         * alpha wherever that is already under the mask. On the Amoled theme,
         * whose small print is `#9bffffff`, it dimmed nothing at all, and on the
         * Material light one, whose is `#6a000000`, it landed on alpha `0x08`
         * and the line all but disappeared.
         */
        private fun dimmed(colour: Int): Int {
            val alpha = (colour ushr 24) * DIM / 0xFF
            return (alpha shl 24) or (colour and 0x00FFFFFF)
        }

        /**
         * A colour off the theme the screen was built with, by name.
         *
         * Boost ships eleven themes and names its own colours as attributes on
         * each, so one lookup answers for all of them -- including the two
         * Material ones, whose colours are the platform's and are in Boost's
         * resources as a reference rather than as a number.
         */
        private fun themeColour(context: Context, name: String): Int? {
            val attr = id(context, name, "attr")
            if (attr == 0) return null

            val value = TypedValue()
            if (!context.theme.resolveAttribute(attr, value, true)) return null

            return when {
                value.type in TypedValue.TYPE_FIRST_COLOR_INT..TypedValue.TYPE_LAST_COLOR_INT ->
                    value.data
                value.resourceId != 0 -> context.resources.getColor(value.resourceId, context.theme)
                else -> null
            }
        }

        /* ------------------------------------------------------------ */
        /* Site icons                                                   */
        /* ------------------------------------------------------------ */

        /**
         * Tildes' own icon for the site a link topic points at, in the line
         * where Boost already prints that site's domain.
         *
         * The site draws one beside the source of every link topic -- a 32x32
         * PNG it hosts itself, at 16 CSS pixels -- and it is the fastest thing
         * to read in a listing: you know a topic is from GitHub before you have
         * read a word of it. Boost draws the domain after the title in grey
         * italic, so the icon goes in front of that, which is where the site
         * puts it and where Three Cheers puts it.
         *
         * **Not in the thumbnail slot beside the row**, which is the obvious
         * place and the wrong one. That square is between 65dp and 110dp and
         * Glide fills it with a CenterCrop sized off the view, so a 32-pixel
         * logo would be blown up sevenfold with nothing sharper to fall back
         * on: 32x32 is the largest Tildes has, and it is already the 2x asset
         * for the 16 pixels the site draws it at. Beside the domain the badge
         * is drawn at about the size the browser draws it, off the same file.
         *
         * Called from patched bytecode, straight after Boost sets the title,
         * with the view it just set and the model it is drawing.
         */
        @JvmStatic
        fun siteIcon(title: TextView?, model: Any?) {
            if (title == null || model == null || !Session.wasTildes()) return

            try {
                val slug = idOf(model)?.let { INSTANCE.topics[it] }?.siteIcon ?: return
                badgeTheDomain(title, slug)
            } catch (t: Throwable) {
                // The domain is still there in words, which is what the row
                // said before any of this.
            }
        }

        /**
         * Puts the badge in front of the domain, by finding where the domain
         * starts.
         *
         * Boost builds the title as `title + " " + domain` and marks the domain
         * with three spans over exactly that stretch, one of which sets it to
         * 80% -- so the span says where the words end and the address begins,
         * without this having to know either. A title with no such span is a
         * topic with no link, and there is nothing to badge.
         *
         * The two characters go in at the domain's own start, which is outside
         * every one of those spans, so the badge keeps the title's size and
         * colour rather than the domain's small grey italic. The first is what
         * the icon is drawn over and the second is the gap after it.
         */
        private fun badgeTheDomain(title: TextView, slug: String) {
            val drawn = title.text as? Spanned ?: return
            val at = drawn.getSpans(0, drawn.length, RelativeSizeSpan::class.java)
                .minOfOrNull { drawn.getSpanStart(it) }
                ?.takeIf { it > 0 } ?: return

            // The title's own size rather than the domain's, so the badge is a
            // little taller than the address beside it and reads as a mark
            // rather than as a letter. It follows the title font size setting
            // for free, which is what Boost sizes the thumbnail square off too.
            val badge = SiteIcon(slug, title.textSize.roundToInt().coerceAtLeast(1))
            val out = SpannableStringBuilder(drawn)
            out.insert(at, BADGE)
            out.setSpan(
                ImageSpan(badge, ImageSpan.ALIGN_CENTER),
                at,
                at + 1,
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE,
            )

            // The space Boost left between the title and the address becomes a
            // line break, so the address reads as a line of its own under the
            // words rather than as the end of them -- which is where tildes.net
            // puts it. **Only where the title is not capped**: a Grid row caps
            // it at one line in the layout and Mini cards cap it at two when
            // that setting is on, and a line break under a cap would take the
            // address off the row rather than move it. Where it is capped the
            // badge still goes in, and the row reads as it did with an icon in
            // front of the address.
            if (title.maxLines == Int.MAX_VALUE) out.replace(at - 1, at, "\n")

            title.text = out
            badge.drawnIn(title)
            iconInto(slug, badge)
        }

        /** The character the icon is drawn over, and the gap after it. */
        private const val BADGE = "  "

        /**
         * What Boost loads into the big square beside a row, which on Tildes is
         * a picture or nothing rather than a picture or a placeholder.
         *
         * **A real one is left exactly alone**, and there are more of those
         * than this end sends: Boost works a thumbnail out of the address for
         * eight kinds of link -- a YouTube video is `img.youtube.com/vi/<id>`,
         * and imgur, gfycat, redgifs, streamable, v.redd.it, neatclip and xkcd
         * each have one -- and it needs no `thumbnail_url` from anybody to do
         * it. A Tildes topic linking to a video has had that picture all along.
         *
         * What is answered away is the **placeholder**, which is what a plain
         * link gets: no thumbnail exists, so Boost passes its own word here --
         * `link`, `no_pic` or `redgifs` -- and draws a stock tile for it. The
         * grey chain-link one was on every link row in the feed, the same
         * picture every time, 75dp of a row saying only "this is a link" where
         * the row says it in words underneath with the site's own icon in front
         * of them.
         *
         * So anything addressed goes through and anything else does not, which
         * is one rule rather than three words to keep up with. Answering
         * nothing sends Boost down the path it already takes for a topic with
         * no link at all: the square is hidden and the title gets the width.
         * **It costs a tap** -- that square opens the linked page, where the
         * row opens the topic -- and the address is still in the row's own
         * menu.
         *
         * Called from patched bytecode, with the URL Boost was about to load.
         */
        @JvmStatic
        fun rowThumbnail(url: String?): String? {
            if (!Session.wasTildes() || url == null || url.startsWith("http")) return url
            notePlaceholder(url)
            return null
        }

        /** Which words came through as placeholders, said once rather than once per row. */
        @Volatile
        private var placeholderNoted: String? = null

        private fun notePlaceholder(word: String) {
            if (placeholderNoted == word) return
            placeholderNoted = word
        }

        /** The icons that have been fetched and decoded, by slug. */
        private val icons = ConcurrentHashMap<String, Bitmap>()

        /** And the slugs the site turned out to have no file for. */
        private val iconless = ConcurrentHashMap<String, Boolean>()

        /** What is waiting on a fetch, so a screenful of one domain costs one. */
        private val iconsWanted = ConcurrentHashMap<String, MutableList<SiteIcon>>()

        /**
         * The one thread they are fetched on.
         *
         * **One, on purpose.** Every request this project makes is 700 ms after
         * the last one, icons included, so a screenful of new domains asked for
         * in parallel would put the feed's own next page behind twenty of them.
         * One at a time means a page waits for at most one icon, and the icons
         * themselves trickle in at about one and a half a second while you read.
         */
        private val iconThread by lazy {
            Executors.newSingleThreadExecutor { work ->
                Thread(work, "tildes-site-icons").apply { isDaemon = true }
            }
        }

        private val onMainThread by lazy { Handler(Looper.getMainLooper()) }

        /**
         * The icon for a slug, and a fetch for it when there is none yet.
         *
         * Answers straight away and never blocks: a slug already in hand comes
         * back decoded, and anything else comes back null with [waiting] left
         * holding the space, to be filled in or dropped once the fetch answers.
         *
         * A slug the site has no file for is remembered here as well as on
         * disk, so the second row from that domain costs neither a request nor
         * a file read.
         */
        private fun iconInto(slug: String, waiting: SiteIcon) {
            icons[slug]?.let {
                waiting.settle(it)
                return
            }
            if (iconless.containsKey(slug)) {
                waiting.settle(null)
                return
            }

            // Claimed with one write, the way a page fetch already in flight is
            // joined rather than repeated. A row that joins one just as it
            // finishes would be left holding a gap nothing answers, so it asks
            // again after adding itself.
            val queue = CopyOnWriteArrayList<SiteIcon>()
            val running = iconsWanted.putIfAbsent(slug, queue)
            if (running != null) {
                running.add(waiting)
                if (icons.containsKey(slug) || iconless.containsKey(slug)) {
                    waiting.settle(icons[slug])
                }
                return
            }
            queue.add(waiting)

            iconThread.execute {
                try {
                    val bytes = Tildes.siteIconBytes(slug)
                    val icon = bytes?.let { BitmapFactory.decodeByteArray(it, 0, it.size) }
                    if (icon != null) {
                        icons[slug] = icon
                    } else {
                        // Bytes that did not decode are the same answer as no
                        // bytes, and worth telling apart in the log: one is the
                        // site having no icon and the other is this end failing
                        // to read one it was given.
                        iconless[slug] = true
                    }
                } catch (t: Throwable) {
                    // Nothing is remembered, so the next row that wants it asks
                    // again. A minute of no network should not blank a domain
                    // for the rest of the install.
                }
                val icon = icons[slug]
                val held = iconsWanted.remove(slug).orEmpty()
                onMainThread.post { held.forEach { it.settle(icon) } }
            }
        }

        /**
         * One site icon drawn in a line of text, which starts as the space it
         * is going to take and fills in when the fetch answers.
         *
         * **The space is held rather than left out.** A badge that appeared
         * where there had been nothing would reflow the line under your eyes,
         * once per row, on every feed whose domains are new. So the drawable
         * goes in at its full size empty, and the only thing that moves is a
         * domain the site has no icon for, which gives the space back once and
         * is remembered after that.
         *
         * The view it is in is held weakly. A row scrolled off before its icon
         * lands has been rebound to another topic by then, and its own drawable
         * is what draws that one.
         */
        private class SiteIcon(private val slug: String, size: Int) : Drawable() {
            private val paint = Paint(Paint.FILTER_BITMAP_FLAG)
            private var icon: Bitmap? = null
            private var host: WeakReference<TextView>? = null

            init {
                setBounds(0, 0, size, size)
            }

            /** Which view to redraw when the answer arrives. */
            fun drawnIn(view: TextView) {
                host = WeakReference(view)
            }

            /**
             * **The text is set again rather than invalidated.** A row is a
             * recycled view, so by the time an icon lands the view may be
             * drawing another topic entirely -- and where it is still drawing
             * this one, setting the text is what makes the line measure itself
             * again, which is what a badge that has just changed size needs. An
             * `invalidate` alone left the row exactly as it was.
             */
            fun settle(fetched: Bitmap?) {
                icon = fetched
                if (fetched == null) setBounds(0, 0, 0, 0)

                val view = host?.get()
                val text = view?.text
                if (view == null || text == null) {
                    noteIcon(slug, "landed on a row that had gone")
                    return
                }
                if ((text as? Spanned)?.getSpans(0, text.length, ImageSpan::class.java)
                        ?.any { it.drawable === this } != true
                ) {
                    noteIcon(slug, "landed on a row drawing something else")
                    return
                }
                view.text = text
                noteIcon(slug, if (fetched == null) "has no icon, so its space went back" else "drawn")
            }

            override fun draw(canvas: Canvas) {
                val drawing = icon ?: return
                canvas.drawBitmap(drawing, null, bounds, paint)
            }

            override fun setAlpha(alpha: Int) = Unit

            override fun setColorFilter(filter: ColorFilter?) = Unit

            override fun getOpacity(): Int = PixelFormat.TRANSLUCENT

            /**
             * What became of one icon, said once per slug.
             *
             * A row is drawn many times over and an icon is fetched once, so
             * this is the line that says whether the two met. Without it, an
             * icon that arrived and drew nothing looks exactly like one that
             * was never fetched.
             */
            private fun noteIcon(slug: String, what: String) {
                if (settled.putIfAbsent(slug, what) != null) return
            }
        }

        /** Which slugs have already had their line in the log. */
        private val settled = ConcurrentHashMap<String, String>()

        /** Which colour the line came out, said once rather than once per row. */
        @Volatile
        private var colourNoted: Int? = null

        private fun noteColour(colour: Int) {
            if (colourNoted == colour) return
            colourNoted = colour
        }

        /**
         * Which view a row was hung off, said once rather than once per row.
         *
         * A row is seven layouts and this is the cheapest way to learn which of
         * them is in front of you, without a line per bind in the log.
         */
        @Volatile
        private var anchorNoted: String? = null

        private fun noteAnchor(name: String) {
            if (anchorNoted == name) return
            anchorNoted = name
        }

        /**
         * What a row might have to hang the tag line under, best first.
         *
         * The body preview is the one that reads right -- the tags land under
         * the words, where the site puts them -- and it is missing from the row
         * layouts that build their middle out of a `ViewStub`. The metadata
         * line is in every one of them.
         */
        private val ROW_ANCHORS = listOf(
            PREVIEW_VIEW,
            "submission_header_info_top",
            "post_metadata",
        )

        /**
         * The block the chips go in, built the first time a holder needs one.
         *
         * It is added **after** the body's container rather than inside it, and
         * the side padding is the body's own, so the chips line up under the
         * first word rather than under the edge of the screen.
         *
         * Above it there is a little more than that, since the chips are the
         * topic's rather than part of what it says. Below it there is none: the
         * gap that spaces one row off the next is all that is under the last
         * one, and the row of buttons beneath brings its own. Anything more and
         * the tags read as belonging to the buttons rather than sitting between
         * the two.
         *
         * It wraps rather than scrolls. A topic can carry a good many tags --
         * seven is ordinary on tildes.net -- and a row that scrolls sideways
         * hides them behind a gesture nothing on the screen suggests, on a
         * screen that already scrolls the other way. See [TagFlow].
         */
        private fun pillStrip(column: LinearLayout, row: View): TagFlow {
            val dp = column.resources.displayMetrics.density
            val strip = TagFlow(column.context).apply {
                tag = PILLS
                setPadding((16 * dp).toInt(), (10 * dp).toInt(), (16 * dp).toInt(), 0)
            }
            column.addView(
                strip,
                column.indexOfChild(row) + 1,
                LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                ),
            )
            return strip
        }

        /**
         * Takes the tag line off the copy of the body that gets drawn, now that
         * the tags are drawn as chips instead.
         *
         * Only the exact line [Lemmy.tagLine] wrote comes off, which is the
         * same rule the edit path goes by, so a body that does not end in one
         * is handed back whole.
         */
        private fun withoutTagLine(model: Any, topic: Tildes.Topic) {
            val field = model.javaClass.getField(BODY_FIELD).apply { isAccessible = true }
            val body = field.get(model) as? String ?: return
            val without = Lemmy.withoutTagLine(body, topic.tags, topic.group)
            if (without != body) field.set(model, without)
        }

        /**
         * Fills that screen, which arrives empty and spinning.
         *
         * Its presenter is a shell: two methods, neither of which loads
         * anything, and the interface between them has no way to hand a body
         * back. So the fetch happens here instead, on a thread of its own since
         * this runs while the view is being created, and the answer goes into
         * the same text view Boost would have filled.
         *
         * `setTextHtml` is reached by reflection, so the extension needs no
         * dependency on the app it is injected into. It is the view's own
         * public method and it takes the HTML Tildes already serves.
         *
         * Only a screen this patch opened is filled. Boost reaches the same
         * Activity from **Settings -> About**, asking for a wiki on
         * boostforreddit.com, and that one is left exactly as it was.
         *
         * Called from patched bytecode as the fragment's view is returned.
         */
        @JvmStatic
        fun wikiPage(fragment: Any?, root: View?) {
            if (fragment == null || root == null || !Session.wasTildes()) return

            val args = try {
                fragment.javaClass.getMethod("getArguments").invoke(fragment) as? Bundle
            } catch (e: Throwable) {
                null
            } ?: return

            val group = args.getString("subreddit").orEmpty()
            val page = args.getString("wiki_page").orEmpty()
            if (wikiKey(group, page) != wikiAsked) return

            val text = root.findViewById<View>(id(root.context, "wiki_text"))
            if (text == null) {
                return
            }
            val spinner = root.findViewById<View>(id(root.context, "progress_smooth"))

            // The page scrolls and its last line was drawn under the
            // navigation bar. Two things had to move for that to come right.
            //
            // The padding goes on the text rather than on the `ScrollView`
            // around it: a `ScrollView` counts its own padding against the
            // viewport, so padding it moves the bottom edge up and clips the
            // last line there instead of letting it scroll clear. Padding the
            // content makes the content taller, which is what the scroll range
            // is measured from.
            //
            // And the page's top margin becomes padding, because that range is
            // `child.getHeight()` against the viewport and a height does not
            // include margins. So a margin is space that can never be scrolled
            // away, and the end of the page stayed under the bar by exactly
            // that much. The same amount goes on the bottom, which is the gap
            // the layout already asks for above the first line.
            val margin = (text.layoutParams as? ViewGroup.MarginLayoutParams)?.topMargin ?: 0
            if (margin > 0) {
                text.setPadding(
                    text.paddingLeft,
                    text.paddingTop + margin,
                    text.paddingRight,
                    text.paddingBottom + margin,
                )
                (text.layoutParams as ViewGroup.MarginLayoutParams).let {
                    it.topMargin = 0
                    text.layoutParams = it
                }
            }
            padForNavigationBar(text, "wiki")

            val path = "/~$group/wiki" + if (page.isEmpty()) "" else "/$page"
            Thread {
                // Same reason the account editor does: a wiki address opened
                // from outside the app builds this screen before any request
                // has gone out.
                INSTANCE.restoreSession()
                val html = try {
                    Tildes.parseWikiPage(Tildes.getHtml(path))
                } catch (e: Throwable) {
                    null
                }
                root.post {
                    hide(spinner)
                    try {
                        if (html == null) {
                            (text as? TextView)?.text = ""
                        } else {
                            text.javaClass
                                .getMethod("setTextHtml", String::class.java)
                                .invoke(text, html)
                        }
                    } catch (e: Throwable) {
                    }
                }
            }.start()
        }

        /**
         * Which wiki page [openWiki] last sent the app to, so [wikiPage] can
         * tell that screen from the one Settings opens on boostforreddit.com.
         * Kept rather than cleared, since a rotation builds the same screen
         * again and it should fill the same way.
         */
        @Volatile
        private var wikiAsked: String? = null

        private fun wikiKey(group: String, page: String): String = "$group/$page"

        /**
         * A wiki link as a group page writes one, with the page name optional
         * because a group's list of pages is `/~group/wiki` with nothing after
         * it. Both are pages this can open.
         *
         * Both spellings of the `~`, the way every other pattern here takes
         * them: Tildes serves `/%7Egroup` as the group's own page, so the two
         * are one address rather than one being a way around the other. A
         * sidebar writes the plain one and a device shell eats it, which is
         * where the other turns up.
         */
        private val WIKI_LINK =
            Regex(
                "^https?://" + Regex.escape(HOST) +
                    "/(?:~|%7[Ee])([A-Za-z0-9_.]+)/wiki/?([A-Za-z0-9_.-]*)$",
            )

        private const val WIKI_ACTIVITY = "com.rubenmayayo.reddit.ui.wiki.WikiActivity"

        /**
         * The screen a community is drawn on, which is also the only screen
         * Boost has that scrolls a listing of topics. A tag opens on it.
         */
        private const val SUBREDDIT_ACTIVITY =
            "com.rubenmayayo.reddit.ui.submissions.subreddit.SubredditActivity"

        /**
         * The extra a name arrives on. Boost's own home screen shortcuts use
         * it, which is the one way into that screen that carries a name rather
         * than a model.
         */
        private const val SHORTCUT = "shortcut"

        /**
         * The view a holder was built around. It is `RecyclerView.ViewHolder`'s
         * own field and keeps its name where the class around it is two
         * characters, so the holder hands over its layout without the extension
         * naming anything of Boost's.
         */
        private const val ITEM_VIEW = "itemView"

        /**
         * The body view a topic's own screen inflates, and the excerpt a
         * listing row has in its place. Which one a holder has is how the one
         * method that binds both tells them apart.
         */
        private const val SELFTEXT_VIEW = "submission_header_selftext"

        private const val PREVIEW_VIEW = "submission_preview_selftext"

        /** Which field on the post model holds the body as it is drawn. */
        private const val BODY_FIELD = "M"

        /** What marks the tag row, so a rebound holder refills it rather than growing another. */
        private const val PILLS = "tildes_tag_pills"

        /** And the same for the one line of them a listing row gets instead. */
        private const val ROW_TAGS = "tildes_row_tags"

        /**
         * The bottom line of a Compact row's block, which the tags go under,
         * and the picture beside it they are held off.
         */
        private const val COUNT_VIEW = "submission_header_comment_count"

        private const val THUMBNAIL_VIEW = "submission_header_thumbnail"

        /**
         * Boost's own colour for the small print in a row, named as a theme
         * attribute so the one name answers on all eleven of them.
         */
        private const val ROW_META_COLOUR = "SecondaryTextColor"

        /**
         * How much of it the tag line takes. It is what a Compact row has been
         * drawing all along, which is the half of this nobody reported wrong.
         */
        private const val DIM = 0x99

        /**
         * Takes the Moderators heading off a group's sidebar.
         *
         * Tildes has no moderators. The site is one non-profit server with one
         * admin, and a group is a listing rather than something anyone runs, so
         * the interceptor answers `moderators: []` and there is nothing to put
         * under the heading. Boost draws it anyway: the heading is a plain
         * `TextView` in the layout that nothing ever hides, and the container
         * under it is emptied and then left alone when the list is empty.
         *
         * Hooked where ButterKnife binds the sidebar rather than where it is
         * filled, so this runs once per sidebar and reads the root it was
         * handed. Nothing sets either view's visibility afterwards.
         *
         * Called from patched bytecode with the sidebar's own root view.
         */
        @JvmStatic
        fun sidebarModerators(root: View?) {
            if (root == null) return
            val tildes = Session.wasTildes()
            listOf("moderators_title", "moderators_container").forEach { name ->
                root.findViewById<View>(id(root.context, name))?.visibility =
                    if (tildes) View.GONE else View.VISIBLE
            }
        }

        /**
         * Takes the **Blocking** section off the Filters & blocks screen.
         *
         * Tildes has no block of any kind, so `POST /user/block` writes the name
         * into Boost's own muted list rather than asking a server with no such
         * route. Which leaves that section describing something that never
         * happens: the Blocked screen under it lists what the **server** says is
         * blocked, so its three tabs -- Communities, Users, Instances -- are
         * empty here and always will be, and the rows would answer nothing if
         * they had anything in them, since that screen hands its view holder a
         * null listener.
         *
         * The **Muting options** heading directly under it is the one that
         * works, and is where a block on this site lands. Nothing else on the
         * screen belongs to blocking, and the section holds exactly one row, so
         * there is nothing left orphaned above the next heading.
         *
         * **The heading is what goes, not the row.** It is a `PreferenceCategory`
         * with no key of its own, so it is reached through the one row under it,
         * which has one, and hiding it takes the row with it -- androidx's
         * adapter skips a group that is not visible rather than walking into it.
         * Hiding the row alone would leave a heading over nothing.
         *
         * That row also carries `android:visible="false"` in
         * `pref_filters_v2.xml` already, which does nothing: androidx reads
         * `app:isPreferenceVisible` and the platform attribute is not in its
         * styleable at all. The same file uses the right one elsewhere. So it is
         * a row Boost meant to hide everywhere and hides nowhere, and this is
         * still the Tildes half of it rather than a fix for Boost.
         *
         * androidx.preference keeps its names through R8 here, so the three
         * calls are reachable by name, and reflection is what saves the
         * extension a dependency on it.
         *
         * Called from patched bytecode once the screen has been inflated.
         */
        @JvmStatic
        fun filtersScreen(fragment: Any?) {
            if (fragment == null || !Session.wasTildes()) return

            // Three edits to one screen rather than one edit in three parts,
            // each in arms of its own: they share nothing but the screen, and a
            // row Boost has renamed since should cost only itself.
            try {
                blockingSection(fragment)
            } catch (t: Throwable) {
            }

            try {
                val sites = preference(fragment, SITE_ROW)
                if (sites == null) {
                } else {
                    show(sites, false)
                }
            } catch (t: Throwable) {
            }

            try {
                tagRow(fragment)
            } catch (t: Throwable) {
            }
        }

        /** The Blocking heading, reached through the one row under it. */
        private fun blockingSection(fragment: Any) {
            val row = preference(fragment, BLOCK_ROW)
            if (row == null) {
                return
            }

            val section = row.javaClass.getMethod("getParent").invoke(row)
            if (section == null) {
                return
            }

            show(section, false)
        }

        /**
         * The one row under that heading, and the only key either of them has.
         */
        private const val BLOCK_ROW = "block"

        /**
         * **Muted Sites**, which is the other row on this screen with nothing
         * behind it.
         *
         * Boost hides a post whose author is on another server, which is a
         * thing to want when a feed is federated out of fifty of them. Tildes
         * is one site and every topic on it comes from that site, so the list
         * can only ever say `tildes.net` -- and a person who put it there would
         * be asking for an empty app.
         *
         * It goes rather than staying empty, which is the rule the whole screen
         * follows: the Blocking section above it is off for having nothing
         * behind it either. The row is a `FilterPreference` with a key of its
         * own, so hiding it takes nothing else with it -- unlike the Blocking
         * heading, which had to be reached through the row under it.
         */
        private const val SITE_ROW = "pref_filter_instance"

        /**
         * The tags Tildes filters, on the row Boost draws for a flair.
         *
         * Reddit had a flair, Lemmy has none, and Boost still ships the row for
         * one: a `FilterPreference` keyed `pref_filter_flair`, carrying a tag
         * icon, hidden with `app:isPreferenceVisible="false"` and read by
         * nothing that filters. So it is a control the app already draws,
         * already stores a list for, and already opens an editor for -- and
         * this site's filtered tags are exactly a list of words to hide topics
         * by. Nothing is built here that Boost does not already have.
         *
         * **What it filters by is the site rather than the app.** Tildes drops
         * a filtered topic out of the listing query, so those topics never
         * reach the HTML the interceptor parses and there is nothing on this
         * end to hide. That is also why the list is worth drawing: it is the
         * one screen in the app where what somebody sees can be *changed*
         * rather than reported.
         *
         * **A guest gets no row.** Filtering is a thing an account carries, and
         * with nobody signed in there is no page to read one off.
         *
         * The read is a request, so it is off the main thread and the row is
         * filled when it lands -- the same shape [settingRows] uses on the
         * account editor, and for the same reason: this screen is built before
         * anything has been asked for.
         */
        private fun tagRow(fragment: Any) {
            if (!signedInToBoost("no filtered tags") || ownName() == null) return
            val row = preference(fragment, TAG_ROW)
            if (row == null) {
                return
            }
            Thread {
                val tags = INSTANCE.filteredTags()
                onMain {
                    try {
                        drawTagRow(row, tags)
                    } catch (t: Throwable) {
                    }
                }
            }.start()
        }

        /**
         * The row itself, on the main thread.
         *
         * The list goes into Boost's own preference **before** the row is
         * shown, since that preference is what its editor opens on. And before
         * the watch is set up, so seeding it does not read as somebody having
         * typed it -- though the comparison in [tagsSettled] would catch that
         * anyway, which is what makes a second visit to this screen cost
         * nothing.
         *
         * A page that did not read leaves the row hidden, which is where Boost
         * has it. Same rule as the invite codes and the four switches: what has
         * to be right is what was found.
         */
        private fun drawTagRow(row: Any, tags: List<String>?) {
            if (tags == null) {
                return
            }
            Session.setFilteredTags(tags)
            Session.watchFilteredTags { tagsEdited() }

            words(row, "setTitle", TAG_ROW_TITLE)
            words(row, "setSummary", tagSummary(tags.size))
            // And the dialog over it, which is a third line rather than the
            // first one again: a `DialogPreference` takes its dialog's title
            // off the row **as it is constructed**, so the header would still
            // read Flairs long after the row stopped saying it. Best effort,
            // since a header saying the wrong word is worth less than the row
            // it is over -- one is a wart and the other is the feature.
            try {
                words(row, "setDialogTitle", TAG_ROW_TITLE)
            } catch (t: Throwable) {
            }
            show(row, true)
            // Weakly, since a row belongs to a screen and this outlives one.
            // It is only ever used to keep the count on it honest, so a screen
            // that has gone since is a refresh there is nothing left to do.
            tagRowShown = java.lang.ref.WeakReference(row)
        }

        /** The row that is on screen, if one still is. */
        private var tagRowShown: java.lang.ref.WeakReference<Any>? = null

        /**
         * Whether **Boost** has an account, which is not the same question as
         * whether this end has a session -- and the gap between the two is a
         * guest being shown somebody's settings.
         *
         * Signing out of Boost does not reach [signOut]. Nothing calls
         * `/user/logout` on that path, so the Tildes cookie, the username and
         * everything read off them survive a sign-out that Boost itself
         * considers complete: its own requests stop carrying `auth` while ours
         * still carry the cookie. `ownName()` then answers a name for somebody
         * the app is drawing as **Guest**, which is how the filtered tags came
         * up on a guest's Filters screen with the account's own list in them.
         *
         * So this asks Boost. [accountHolder] is Boost's own subscription
         * store, kept from the drawer, and the account hangs off it -- so this
         * is a **live** read of the app's own state rather than a remembered
         * answer, and it is the same read that logs `unknown` beside every
         * drawer build. An account that has gone answers null a moment later.
         *
         * **Not knowing is treated as no.** With nothing having built a drawer
         * yet there is no holder to read, which happens on a cold start
         * straight into the settings screen -- a `/settings` link from
         * elsewhere on the phone is the way in. The row is then left off until
         * something opens a drawer, which is the rule the rest of this screen
         * follows: what has to be right is what was found.
         */
        private fun signedInToBoost(what: String): Boolean {
            if (Session.wasGuest()) {
                return false
            }
            // And the live read beside the flag, which covers the run where the
            // flag has not been written yet -- a guest on the first launch
            // after this went in, before any drawer has said so. A holder that
            // is not there says nothing either way, and the flag is what
            // answers then.
            val holder = accountHolder
            if (holder != null && accountInstance(holder).isNullOrEmpty()) {
                return false
            }
            return true
        }

        /**
         * Puts the count back on it, the list under it having changed.
         *
         * Off Boost's own list rather than the site's answer, and before the
         * request rather than after it: the number on the row is what somebody
         * just typed, and it is right the moment they typed it. A refusal is
         * what puts the old one back, along with the list it counted.
         */
        private fun sayHowMany() {
            val row = tagRowShown?.get() ?: return
            try {
                words(row, "setSummary", tagSummary(Session.filteredTags().size))
            } catch (t: Throwable) {
            }
        }

        /**
         * What the row says under its name, which carries the count and the
         * site's own sentence for what the list does.
         *
         * Tildes' own page says "if a topic has *any* of these tags, it will be
         * filtered out (not shown) by default" and "these filters are *global*
         * and will apply both to your home page as well as inside specific
         * groups". Both halves matter to somebody deciding what to type, and
         * neither is a thing Boost's own summary for this row would say -- that
         * one is about flairs and offers a wildcard this site has no use for.
         */
        private fun tagSummary(held: Int): String {
            val count = when (held) {
                0 -> ""
                1 -> "1 tag. "
                else -> "$held tags. "
            }
            return count + TAG_ROW_SUMMARY
        }

        /**
         * An edit to that list, which is Boost's own editor writing it.
         *
         * That dialog persists on **every** add and every removal rather than
         * on the way out, so a person taking off three tags writes three times.
         * Tildes takes the whole list at once, so each of those would be a
         * request carrying what the one before it already said. They are let
         * settle instead, and one request goes when the typing stops.
         *
         * The callback arrives on whichever thread wrote the preference, which
         * is the main one here. The wait is what needs a looper either way.
         */
        private fun tagsEdited() {
            onMain {
                sayHowMany()
                tagSettling.removeCallbacks(tagsSettled)
                tagSettling.postDelayed(tagsSettled, TAG_SETTLE_MS)
            }
        }

        /** How long the list is given to stop changing. */
        private const val TAG_SETTLE_MS = 1200L

        private val tagSettling by lazy { android.os.Handler(android.os.Looper.getMainLooper()) }

        /**
         * And the write, once it has.
         *
         * Compared against what the site last said rather than against what the
         * screen was opened with, so filling the list from the site writes
         * nothing back and neither does putting it back after a refusal. The
         * comparison is a set, since Boost stores one and the order is gone by
         * the time it is read again.
         *
         * A refusal puts the list back where it was and says so, which is what
         * the account editor's dropdown does: a row that cannot be saved should
         * not be left claiming something the site never took.
         */
        private val tagsSettled = Runnable {
            val was = INSTANCE.myTags
            val now = Session.filteredTags()
            if (was == null || !Session.wasTildes() || ownName() == null ||
                !signedInToBoost("nothing to write")
            ) {
            } else if (was.toSet() == now.toSet()) {
            } else {
                Thread {
                    if (!INSTANCE.writeFilteredTags(now)) {
                        onMain {
                            Session.setFilteredTags(was)
                            toast(TAG_REFUSED)
                        }
                    }
                }.start()
            }
        }

        /** Runs something on the main thread, which is where a screen changes. */
        private fun onMain(what: () -> Unit) = tagSettling.post(what)

        private fun toast(words: String) {
            val app = Session.application() ?: return
            Toast.makeText(app, words, Toast.LENGTH_SHORT).show()
        }

        /** A preference by key, off the fragment holding it. */
        private fun preference(fragment: Any, key: String): Any? =
            fragment.javaClass
                .getMethod("findPreference", CharSequence::class.java)
                .invoke(fragment, key)

        /** Shows a preference or takes it off, heading or row alike. */
        private fun show(row: Any, visible: Boolean) {
            row.javaClass
                .getMethod("setVisible", Boolean::class.javaPrimitiveType)
                .invoke(row, visible)
        }

        /**
         * And writes one of its two lines.
         *
         * At runtime rather than through the wording table, for the reason the
         * account editor's switches are relabelled in code: those strings are
         * one install's worth of resources and this row has to read as Boost's
         * own on a Lemmy account in the same app.
         */
        private fun words(row: Any, method: String, said: String) {
            row.javaClass
                .getMethod(method, CharSequence::class.java)
                .invoke(row, said)
        }

        /** Boost's own key for the row, and what it says once it is ours. */
        private const val TAG_ROW = "pref_filter_flair"
        private const val TAG_ROW_TITLE = "Filtered tags"
        private const val TAG_ROW_SUMMARY =
            "Topics with any of these tags are hidden, on your home page and inside groups"
        private const val TAG_REFUSED = "Tildes would not take that list of tags"

        /**
         * The line under a group's name in its info panel, which Boost draws as
         * a handle and Reddit drew as a count.
         *
         * The view is called `sidebar_subscribers_textview` and on Boost's
         * Reddit ancestor it said **1,079,925 members · 0 online**. On the
         * Lemmy path it says `!tech@tildes.net` instead, which is the same
         * thing the name above it already says, one line up and with an
         * instance nobody on a single-site app needs.
         *
         * Tildes publishes a subscriber count per group and nothing else about
         * who is there -- no online count, and its post number is a daily rate
         * rather than a total, so a second half here would say something the
         * site does not mean. One number, and the site's own noun for it:
         * `.group-subscription-count` reads "25596 subscribers".
         *
         * The count is the one this already knows. It is gathered per group and
         * kept between runs, and it is what the interceptor answered `/community`
         * with a moment ago, so the number on screen is the number in this map
         * either way.
         *
         * The group is read out of the handle Boost just built rather than off
         * the model beside it, which costs nothing and names nothing: every
         * field on that model is a single letter, while `!name@instance` is a
         * shape this already parses in three other places.
         *
         * Called from patched bytecode with the handle Boost was about to draw.
         * Handing it back is what leaves a Lemmy account alone, and is also the
         * answer for a group whose count has not been gathered yet.
         */
        @JvmStatic
        fun sidebarSubscribers(boostsOwn: CharSequence?): CharSequence? {
            if (!Session.wasTildes() || boostsOwn == null) return boostsOwn
            val group = Regex("^!([A-Za-z0-9_.]+)@")
                .find(boostsOwn.toString())?.groupValues?.get(1)
            val count = group?.let { INSTANCE.subscribers[it] } ?: 0
            // Said whatever happens, and before anything is decided on it. A
            // line that only speaks on success cannot tell a hook that ran and
            // found nothing from one that never ran at all, which is a day this
            // project has already had.
            if (group == null || count <= 0) return boostsOwn
            return grouped(count) + " subscribers"
        }

        /** A count with separators, the way that panel has always drawn one. */
        private fun grouped(count: Int): String {
            val digits = count.toString()
            val out = StringBuilder()
            digits.forEachIndexed { at, digit ->
                if (at > 0 && (digits.length - at) % 3 == 0) out.append(',')
                out.append(digit)
            }
            return out.toString()
        }

        /**
         * The composer, once Boost has finished building it.
         *
         * Tildes' own form is a title, a link, markdown and tags, and Boost's
         * is that plus a thumbnail URL the site has nothing behind. So the
         * thumbnail field becomes the tags, which is where the wording has
         * already renamed it, and only its end icon comes off.
         *
         * Both end icons come off, in fact. `PostActivity` puts the same
         * add-a-photo button on the link field and on the thumbnail one, and
         * each uploads an image to the instance's own host to fill the field
         * in. Tildes hosts no images, so both buttons open a picker whose
         * answer has nowhere to go.
         *
         * That field is borrowed rather than rebuilt. Boost sends it as
         * `custom_thumbnail` on both create and edit, untouched and unvalidated,
         * and draws it nowhere, so the value reaches the interceptor through
         * Boost's own request rather than through a static set from a view,
         * which is the part that would be fragile.
         *
         * The NSFW chip beside it goes, and this is the second time it has
         * changed: Tildes has no flag for it and does have the tag, so the
         * field already carries `nsfw` like any other and a chip beside it is
         * the same answer asked twice. Worse than redundant, since the two can
         * be set against each other and only one of them can win.
         *
         * Which leaves the tags as the one control here and **Mark NSFW** as a
         * shortcut everywhere else, where no tags field is on screen to
         * disagree with. See [showNsfw] for what the tag turns on.
         *
         * Called from patched bytecode, once per composer opened.
         */
        @JvmStatic
        fun composerFields(activity: Activity?) {
            if (activity == null || !Session.wasTildes()) return
            composing = null
            composerGroup = null
            try {
                hide(activity.findViewById(id(activity, "submit_nsfw")))
                endIconOff(activity.findViewById(id(activity, "submit_url_wrapper")))
                endIconOff(activity.findViewById(id(activity, "submit_thumbnail_url_wrapper")))
                reorder(activity)
                toolbarTitle(activity)
                composing = fillTags(activity)
                suggestTags(activity)
                lockFields(activity, composing)
            } catch (t: Throwable) {
            }
        }

        /**
         * Whether there is nothing on the composer worth keeping, which is what
         * Boost asks before it offers to save a draft.
         *
         * It asks about the body alone, in three places -- the toolbar's X
         * choosing between "Save draft?" and "Do you want to discard?", the
         * **Save** on that dialog asking again about the body it captured, and
         * the **Save** inside the Drafts dialog asking about the editor. On
         * Lemmy a post with no body is a post with a link and a title, and Boost
         * throws it away at all three.
         *
         * On Tildes that is most of a front page. A link topic is a title and a
         * URL, the tags are what sorts it once it is up, and none of the three
         * is the body. So where the body is empty and any of those has something
         * in it, this says the answer is no and Boost keeps the draft. Where
         * nothing has been typed anywhere it agrees, and the discard dialog is
         * the right one.
         *
         * **Only on a new topic.** A composer opened on one that already exists
         * arrives with its title, its tags and its group filled in, so this
         * would ask "Save draft?" of somebody who opened a link topic to retag
         * it and backed out. Boost's own answer is right there, and it is the
         * intent extra that says which case this is -- the same one the toolbar
         * title reads.
         *
         * [screen] is the activity on two of the three and the formatting bar on
         * the third, so both are taken as a context and [composer] decides
         * whether it is the topic composer at all. A comment reply and a private
         * message go through the same three places and are left alone.
         *
         * Called from patched bytecode, once per question asked.
         */
        @JvmStatic
        fun bodyIsBlank(boostsOwn: Boolean, screen: Any?): Boolean {
            if (!boostsOwn || !Session.wasTildes()) return boostsOwn
            return try {
                val context = when (screen) {
                    is View -> screen.context
                    is Context -> screen
                    else -> null
                } ?: return boostsOwn
                val activity = composer(context) ?: return boostsOwn
                if (activity.intent?.hasExtra(SUBMISSION) == true) return boostsOwn

                val typed = TOPIC_FIELDS
                    .filter { (_, name) -> fieldText(activity, name).isNotEmpty() }
                    .map { (label, _) -> label }
                if (typed.isEmpty()) return boostsOwn

                false
            } catch (t: Throwable) {
                boostsOwn
            }
        }

        /** What a topic carries beside its body, by the word this project uses. */
        private val TOPIC_FIELDS = listOf(
            "title" to "submit_title",
            "link" to "submit_url",
            "tags" to "submit_thubmnail_url",
        )

        /**
         * A draft, once Boost has written its body down.
         *
         * Boost's drafts table is four columns -- Date, Parent, Text and User --
         * and the composer fills it with the body and nothing else, so a draft
         * picked back up arrived as text in an otherwise empty screen. On Tildes
         * that loses most of the topic: the title, the link and the tags are all
         * typed on that screen, and the group is chosen there too.
         *
         * So the rest of the screen is written beside Boost's row rather than
         * into it, keyed on the same body the row is deduplicated on. See
         * [Session.saveDraft]. Boost's row is untouched, which is what makes
         * this safe to be wrong about: a draft this never saw comes back exactly
         * as it always did.
         *
         * **Both ways of saving one come through here.** Backing out of a
         * composer with something in it asks "Save draft?", and the Drafts
         * dialog itself has a **Save** button that files what is on screen
         * without leaving. Both call the one method that writes the row, which
         * is where this is hooked, so neither has to be found separately.
         *
         * That method also files a comment reply and a private message, from
         * screens with no title, link or tags on them at all. Those are left
         * alone -- [composer] is what separates them, by looking for the field
         * only the topic composer has.
         *
         * **It also decides what goes in the row**, which is the one thing here
         * that is not beside Boost's own storage. A link topic is a title, a URL
         * and tags with nothing typed under them, and Boost's table has one text
         * column and will not write a row when it is empty. So a body-less topic
         * files its title there and its real body -- the empty string -- in the
         * record beside it, and [draftPicked] puts that back rather than the
         * row's own text. Everything with a body in it is filed exactly as
         * before, and this answers with the string it was handed.
         *
         * Called from patched bytecode, once per draft written, and its answer
         * is what Boost files.
         */
        @JvmStatic
        fun draftSaved(context: Context?, text: String?): String? {
            if (context == null || !Session.wasTildes()) return text
            try {
                val activity = composer(context) ?: return text
                val user = Tildes.username ?: return text
                val body = text.orEmpty()
                val title = fieldText(activity, "submit_title")
                val link = fieldText(activity, "submit_url")
                val tags = fieldText(activity, "submit_thubmnail_url")

                val row = Session.draftText(body, listOf(title, link, tags)) ?: return text

                val fields = Session.DraftFields(
                    title = title,
                    link = link,
                    tags = tags,
                    group = composerGroup(activity).orEmpty(),
                    body = if (row == body) null else body,
                    head = Session.draftHead(row),
                    at = System.currentTimeMillis(),
                )
                if (fields.empty) {
                    return row
                }
                Session.saveDraft(user, row, fields)
                val standIn =
                    if (fields.body == null) "" else ", and filed under its " + filedUnder(fields)
                return row
            } catch (t: Throwable) {
                return text
            }
        }

        /** Which of the three Boost's row ended up carrying, for the log. */
        private fun filedUnder(fields: Session.DraftFields): String =
            TOPIC_FIELDS.map { (label, _) -> label }
                .zip(listOf(fields.title, fields.link, fields.tags))
                .first { (_, value) -> value.isNotEmpty() }
                .first

        /** What a saved draft turned out to be carrying, for the log. */
        private fun carried(fields: Session.DraftFields): String =
            listOf(
                "title" to fields.title,
                "link" to fields.link,
                "tags" to fields.tags,
                "group" to fields.group,
            ).filter { it.second.isNotEmpty() }.joinToString(", ") { it.first }

        /**
         * And the same draft picked out of the dialog again.
         *
         * Boost writes the body into the editor and stops there. This puts the
         * rest of the topic back around it, out of what [draftSaved] stored.
         *
         * **Only into a field that is empty.** Boost's own handling of the body
         * is three-way -- an empty editor takes the draft outright, and a full
         * one asks **Replace** or **Add** -- and this runs before that is
         * answered. Filling only what is blank is one rule that is right under
         * all three: opening a fresh composer and picking a draft restores the
         * whole topic, which is the case this is for, and a draft dropped into
         * something half-written never takes away a word of it.
         *
         * **The group goes back through Boost's own picker result** rather than
         * by writing the name onto the row. The name is drawn by an observer on
         * a view model, and the composer posts with the id off that same model,
         * so a row written directly would read right and post to nothing.
         * Handing the activity the result its own picker would have hands the
         * choice to the code already written for it, which is the same argument
         * the group row in [composerFields] rests on.
         *
         * Called from patched bytecode, once per draft picked.
         */
        @JvmStatic
        fun draftPicked(bar: Any?, draft: Any?) {
            if (bar == null || draft == null || !Session.wasTildes()) return
            try {
                val view = bar as? View ?: return
                val activity = composer(view.context) ?: return
                val text = draftBody(draft) ?: return
                val user = Tildes.username ?: return
                val fields = Session.draft(user, text)
                if (fields == null) {
                    return
                }

                // Boost is about to write the row's own text into the editor,
                // and on a draft filed under its title that would put the title
                // in the body. All three of its paths -- the direct set and the
                // two behind Replace and Add -- read the text off this object
                // when they run rather than off a string taken now, and none of
                // them saves it, so the body goes back on the object itself.
                val body = fields.body
                if (body != null && body != text) {
                    draft.javaClass.getDeclaredField(DRAFT_TEXT_FIELD)
                        .apply { isAccessible = true }
                        .set(draft, body)
                }

                val filled = ArrayList<String>()
                if (fill(activity, "submit_title", fields.title)) filled.add("title")
                if (fill(activity, "submit_url", fields.link)) filled.add("link")
                if (fill(activity, "submit_thubmnail_url", fields.tags, list = true)) {
                    filled.add("tags")
                }
                if (pointAtGroup(activity, fields.group)) filled.add("group")
            } catch (t: Throwable) {
            }
        }

        /**
         * The activity behind a context, but only when it is the topic
         * composer.
         *
         * The drafts table is shared with the comment editor and the message
         * editor, and the formatting bar carrying the Drafts button is drawn
         * under all three. `submit_title` is on none of the others, so looking
         * for it says which screen this is without naming any of them.
         *
         * A view's context is the activity, or a theme wrapper around it, so
         * the wrappers are walked off first.
         */
        private fun composer(context: Context): Activity? {
            var at: Context? = context
            while (at is ContextWrapper && at !is Activity) at = at.baseContext
            val activity = at as? Activity ?: return null
            if (activity.findViewById<View>(id(activity, "submit_title")) == null) return null
            return activity
        }

        /** What a field on that screen says now. */
        private fun fieldText(activity: Activity, name: String): String =
            activity.findViewById<TextView>(id(activity, name))
                ?.text?.toString()?.trim().orEmpty()

        /**
         * And writing one, where there is something to write and room for it.
         *
         * **A locked field is not room.** The composer disables what this
         * account may not change on the topic it was opened on -- a link is a
         * group moderator's to edit, and a title runs out after five minutes --
         * and [composerFields] is what draws that. Filling one of those would
         * put a value somewhere the person could not have typed it, and send
         * it on the next save. So a draft only ever fills a field they could
         * have filled themselves.
         *
         * **And the caret goes to the end of what was written**, which
         * `setText` does not do: it leaves the caret at the start. That is only
         * cosmetic on a title, and it was a bug on the Tags field, where the
         * suggestion row completes the tag the caret is standing in. A restored
         * `draft, roundtrip` with the caret at 0 read as "editing `draft`", so
         * tapping **nsfw** replaced it. [list] is what says a field is one of
         * those: it ends in a separator with the caret past it, which is the
         * state the field is in after any tap on that row anyway.
         */
        private fun fill(
            activity: Activity,
            name: String,
            value: String,
            list: Boolean = false,
        ): Boolean {
            if (value.isEmpty()) return false
            val field = activity.findViewById<EditText>(id(activity, name)) ?: return false
            if (!field.isEnabled) return false
            if (field.text?.toString()?.trim()?.isNotEmpty() == true) return false

            val written = if (list) value.trimEnd(',', ' ') + ", " else value
            field.setText(written)
            field.setSelection(written.length)
            return true
        }

        /**
         * The group a draft was written in, put back on a composer that has not
         * been pointed at one.
         *
         * The model is built rather than found, the way the front page is in
         * [openedFrontPage]: a group's id is a stable hash of its name, so the
         * model built here carries the id Boost was handed by
         * `/community/list`, which is the id the composer sends when it posts.
         *
         * **The name goes in with its tilde on**, which is what the row ends up
         * reading. Boost draws that row from the model's title where it has one
         * and from its name otherwise, and the two-argument constructor sets no
         * title, so a bare `test` was drawn where opening the composer from the
         * group itself drew `~test`. The tilde comes back off wherever the name
         * is read again -- `composerGroup` strips it, and nothing sends it,
         * since a request carries the id.
         *
         * **Handing an activity its own result is not a new path.** That
         * handler already runs with this code and this extra every time
         * somebody picks a group in the composer, which on a Tildes account is
         * every time the row added by [composerFields] is tapped. The prologue
         * in front of the branch -- the fragment dispatch and the image
         * picker's own result handler -- has therefore already seen a 143
         * carrying a bare intent, with no data on it, and answered nothing.
         *
         * If it ever does throw, it throws in here rather than in the app:
         * [draftPicked] catches it, and the draft comes back without its group
         * instead of taking the composer down.
         */
        private fun pointAtGroup(activity: Activity, group: String): Boolean {
            if (group.isEmpty() || composerGroup(activity) != null) return false

            val model = Class.forName(SUBSCRIPTION_MODEL_CLASS)
                .getDeclaredConstructor(Int::class.javaPrimitiveType, String::class.java)
                .apply { isAccessible = true }
                .newInstance(Lemmy.groupId(group), "~" + group) as Parcelable

            val handler = generateSequence(activity.javaClass as Class<*>) { it.superclass }
                .firstNotNullOfOrNull { type ->
                    try {
                        type.getDeclaredMethod(
                            "onActivityResult",
                            Int::class.javaPrimitiveType,
                            Int::class.javaPrimitiveType,
                            Intent::class.java,
                        )
                    } catch (t: Throwable) {
                        null
                    }
                } ?: return false

            handler.isAccessible = true
            handler.invoke(
                activity,
                PICK_GROUP,
                Activity.RESULT_OK,
                Intent().putExtra(PICKED_GROUP, model),
            )
            return true
        }

        /**
         * What one row of the Drafts dialog says, which was a body snippet and
         * is the title where there is one.
         *
         * Boost draws `draft.text` with the date under it, in a `TextView` with
         * no `maxLines` and nothing to ellipsize it, so a long draft is a long
         * row. A topic is known by its title, and a link topic's row has nothing
         * else in it to read.
         *
         * A draft with no title stored beside it comes back exactly as it was
         * handed over, which is every comment reply, every message, and every
         * draft written before this existed.
         *
         * Called from patched bytecode, once per row drawn.
         */
        @JvmStatic
        fun draftRow(text: String?): String? {
            if (text.isNullOrEmpty() || !Session.wasTildes()) return text
            return try {
                val user = Tildes.username ?: return text
                val title = Session.draft(user, text)?.title
                if (title.isNullOrEmpty()) text else title
            } catch (t: Throwable) {
                text
            }
        }

        /**
         * The body off one of Boost's own draft rows.
         *
         * `Draft` is an ActiveAndroid model, so its columns keep their names
         * through obfuscation -- the ORM reads them by reflection at runtime and
         * could not find them otherwise. `PatchAssumptionsTest` pins that.
         */
        private fun draftBody(draft: Any): String? =
            draft.javaClass.getDeclaredField(DRAFT_TEXT_FIELD)
                .apply { isAccessible = true }
                .get(draft) as? String

        /** The column Boost files a draft's body under. */
        private const val DRAFT_TEXT_FIELD = "text"

        /** The extra Boost's own group picker answers in. */
        private const val PICKED_GROUP = "subscription"

        /**
         * A Tildes account setting, and the switch on Boost's editor it is
         * drawn on.
         *
         * Tildes keeps its settings in the same shape Boost's editor draws:
         * a checkbox each, behind `PATCH /api/web/user/<name>` under a trigger
         * name each, the way the bio is. So four of Boost's eight switches are
         * relabelled rather than hidden, and the save behind them writes
         * Tildes' setting rather than Lemmy's.
         *
         * [switch] is one name doing three jobs, which is what makes the swap
         * cheap: Boost's layout gives the switch that resource id, its save
         * sends it under that JSON key, and `/site` fills it from
         * `my_user.local_user` under the same one. `PatchAssumptionsTest` pins
         * the first, and the round trip is what the other two rest on.
         */
        internal class AccountSetting(
            /** The checkbox on Tildes' own `/settings`. */
            val field: String,
            /** The form it sits in, which is what tells the PATCH routes apart. */
            val trigger: String,
            /** Boost's switch, by resource name and by the key it rides on. */
            val switch: String,
            /** What the row says once it has been relabelled. */
            val label: String,
        )

        /**
         * The four, in the order Tildes' own settings page draws them, which
         * is also the order those four switches sit in on Boost's screen. So
         * the rows read down the page the way the site does.
         *
         * Which four is not arbitrary. Every one of them is a preference about
         * something Tildes has none of -- avatars, bot accounts, push
         * notifications, notification email -- so even if Boost reads one
         * somewhere this has not found, there is nothing on a Tildes account
         * for it to change. The four left alone are the ones that would show:
         * `show_nsfw` is already the patch's, and `show_read_posts` and
         * `show_scores` would hide topics and numbers that are on the screen.
         *
         * The fifth thing Tildes has of this kind is the **default comment
         * sort order**, which is a dropdown rather than a checkbox and so has
         * no row on Boost's screen to borrow. It is built instead -- see
         * [commentSortRow], and [inviteRow] under it, which is the same
         * argument for something Lemmy has no setting for at all.
         */
        internal val ACCOUNT_SETTINGS = listOf(
            AccountSetting(
                "show_tags_in_listings",
                "show-tags-in-listings",
                "show_avatars",
                "Show topic tags in listing pages",
            ),
            AccountSetting(
                "collapse_old_comments",
                "collapse-old-comments",
                "show_bot_accounts",
                "Collapse old comments when I return to a topic",
            ),
            AccountSetting(
                "interact_mark_notifications_read",
                "interact-mark-notifications-read",
                "show_new_post_notifs",
                "Mark a notification read when I interact with its comment",
            ),
            AccountSetting(
                "auto_mark_notifications_read",
                "auto-mark-notifications-read",
                "send_notifications_to_email",
                "Mark all notifications read when I open the list",
            ),
        )

        /**
         * The account editor, cut down to what Tildes has.
         *
         * A Tildes account owns a bio and nothing else you can type: no
         * avatar, no banner, no display name and no email. So those rows go,
         * and so do four of the eight switches, which are Lemmy's own reading
         * preferences with nothing behind them here. The other four are
         * relabelled and carry Tildes' own settings, which are the same shape
         * -- [ACCOUNT_SETTINGS] says which is which.
         *
         * By sibling rather than by a list of ids. The rows are the children
         * of one column and the bio is one of them, so hiding everything
         * beside it needs no name for the other thirteen, and the two that
         * carry no id of their own -- the avatar and banner header, and the box
         * the email sits in -- come off with the rest. The bio's own wrapper is
         * what is kept, since hiding a wrapper takes its label and its outline
         * with it. The Save button is not in that column at all, being a
         * floating one over the whole screen, so it is never in reach of this.
         *
         * Everything goes and then four come back, which [settingRows] gives
         * the reason for: what those four say is usually not read yet when
         * this runs.
         *
         * A switch comes back only where its setting was actually **read** off
         * `/settings`. A setting Tildes has renamed comes back missing rather
         * than false, so its row stays off rather than being drawn saying
         * somebody had turned it off -- and nothing writes it. Which also means
         * the screen stays at the bio alone when that page could not be read at
         * all, which is what it did before any of this.
         *
         * Read off disk rather than off [answering], since the screen is built
         * before it fetches anything, and answered one way only: a fragment is
         * inflated fresh every time it is opened, so a Lemmy account gets a
         * screen nothing has touched. Same argument as [listInsets].
         *
         * Called from patched bytecode, once per account editor opened.
         */
        @JvmStatic
        fun accountScreen(root: View?) {
            if (root == null || !Session.wasTildes()) return
            try {
                val bio = root.findViewById<View>(id(root.context, "bio_wrapper"))
                if (bio == null) {
                    return
                }
                val column = bio.parent as? ViewGroup ?: return

                var hidden = 0
                for (i in 0 until column.childCount) {
                    val row = column.getChildAt(i)
                    if (row === bio) continue
                    row.visibility = View.GONE
                    hidden++
                }

                // And the counter under it, which reads 1000 because that is
                // what Lemmy takes. Tildes takes 2000 and says so on its own
                // form, and neither site's number is enforced on the way in:
                // the field takes as much as you type and the counter is what
                // a person stops at.
                bio.javaClass.getMethod("setCounterMaxLength", Int::class.javaPrimitiveType)
                    .invoke(bio, BIO_LIMIT)

                settingRows(root, column)
            } catch (t: Throwable) {
            }
        }

        /**
         * And then the four switches back, once there is something to put on
         * them.
         *
         * Every row goes first and these come back after, rather than the
         * other way round, because **the settings are usually not read yet
         * when this screen is built**. Nothing in the app asks for `/site` at
         * launch -- a cold start goes straight to `post/list` and
         * `community/list` -- so the account editor's own request is the first
         * one, and it goes out *after* the fragment's view exists. Deciding
         * here on what was known then drew the bio alone on the first open of
         * every run, and four switches on every open after it, which is the
         * shape of a bug that looks intermittent.
         *
         * So a cold cache is read on a thread of its own and the rows are put
         * back when it lands. That is not a second request in practice: the
         * screen's own `/site` fills the same cache a moment later and
         * `Tildes.getHtml` joins a fetch already in flight rather than
         * repeating it, so the two share one page either way.
         *
         * Revealing late is safe in the one way that matters. Boost fills a
         * switch's checked state from `/site` whether the row is visible or
         * not, and enables it when that call comes back, so a row that appears
         * afterwards is already right -- and one that appears before is
         * disabled and unchecked, which is what the whole screen looks like
         * while it loads.
         */
        private fun settingRows(root: View, column: ViewGroup) {
            val known = INSTANCE.mySettings
            if (known != null) {
                drawSettingRows(column, known)
                return
            }
            Thread {
                val read = INSTANCE.settings()
                root.post {
                    try {
                        drawSettingRows(column, read)
                    } catch (t: Throwable) {
                    }
                }
            }.start()
        }

        /** The rows themselves, on the main thread either way. */
        private fun drawSettingRows(column: ViewGroup, known: Map<String, Boolean>) {
            var drawn = 0
            for (setting in ACCOUNT_SETTINGS) {
                if (setting.field !in known) continue
                val row = column.findViewById<View>(id(column.context, setting.switch))
                val switch = row as? CompoundButton ?: continue
                switch.text = setting.label
                switch.visibility = View.VISIBLE
                drawn++
            }
            commentSortRow(column, INSTANCE.myCommentSort.orEmpty())
            inviteRow(column)
        }

        /**
         * The fifth Tildes setting, which is the one with no row of Boost's to
         * land on.
         *
         * The four above it are checkboxes and Boost's editor draws eight of
         * those, so each of them borrowed one. This one is a list of four, and
         * that screen has no list on it anywhere -- three text fields and eight
         * switches -- so it is built rather than borrowed. It is the first
         * control this patch adds to a screen rather than taking one away.
         *
         * **A plain framework spinner**, for the reason a dialog of ours would
         * not be Boost's: the controls Boost draws come from a Material library
         * the extension cannot name at compile time and an obfuscated dialog
         * builder it cannot name at all. `Spinner` needs neither, draws its own
         * dropdown off whatever theme the screen is under, and Boost puts one
         * on six of its own screens. The rows inside it are Boost's
         * `small_spinner_item` where that resolves, so the words follow the
         * theme rather than the platform's default, and the framework's own
         * layout where it does not.
         *
         * **The words are the site's own**, read off the page beside the values
         * they send, so the row says what a browser says and in the same order.
         * Every other row here carries a label this project wrote, because
         * every other setting is a box rather than a list.
         *
         * **It writes on change rather than on save**, which is what the site
         * does -- `data-js-autosubmit-on-change` is on that select and on
         * nothing else on the page. It also has to: Boost's save carries a
         * fixed list of thirteen fields with no room for a fourteenth, so
         * nothing would pick this up on the way past.
         *
         * A refusal puts the row back where it was and says so, rather than
         * leaving the screen claiming an order the site never took.
         */
        private fun commentSortRow(column: ViewGroup, orders: List<Tildes.SortChoice>) {
            if (orders.isEmpty()) return
            if (column.findViewWithTag<View>(COMMENT_SORT) != null) return
            val context = column.context
            val dp = context.resources.displayMetrics.density

            val item = id(context, SPINNER_ITEM, "layout")
                .takeIf { it != 0 } ?: android.R.layout.simple_spinner_dropdown_item
            val spinner = Spinner(context).apply {
                adapter = ArrayAdapter(context, item, orders.map { it.label })
                    .also { it.setDropDownViewResource(item) }
            }
            val was = orders.indexOfFirst { it.chosen }.takeIf { it >= 0 } ?: 0
            spinner.setSelection(was)

            val label = TextView(context).apply {
                text = COMMENT_SORT_LABEL
                layoutParams = LinearLayout.LayoutParams(
                    0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f,
                )
            }

            column.addView(
                LinearLayout(context).apply {
                    tag = COMMENT_SORT
                    orientation = LinearLayout.HORIZONTAL
                    gravity = Gravity.CENTER_VERTICAL
                    setPadding(
                        (16 * dp).toInt(), (8 * dp).toInt(),
                        (16 * dp).toInt(), (8 * dp).toInt(),
                    )
                    addView(label)
                    addView(spinner)
                },
                LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                ),
            )

            // The listener goes on after the first callback rather than before
            // it. A spinner tells its listener what is already selected as soon
            // as it is laid out, and one attached now would read that as
            // somebody picking the order the account is already on -- a PATCH
            // per opening of the screen, saying nothing.
            spinner.post { watchCommentSort(spinner, orders, was) }
        }

        /** The write behind it, and what a refusal does to the row. */
        private fun watchCommentSort(
            spinner: Spinner,
            orders: List<Tildes.SortChoice>,
            was: Int,
        ) {
            var settled = was
            spinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
                override fun onItemSelected(
                    parent: AdapterView<*>?,
                    view: View?,
                    position: Int,
                    id: Long,
                ) {
                    if (position == settled) return
                    val picked = orders[position]
                    val before = settled
                    settled = position
                    Thread {
                        try {
                            Tildes.editCommentSort(picked.value)
                            INSTANCE.myCommentSort = orders.map {
                                Tildes.SortChoice(it.value, it.label, it.value == picked.value)
                            }
                        } catch (t: Throwable) {
                            spinner.post {
                                settled = before
                                spinner.setSelection(before)
                                Toast.makeText(
                                    spinner.context,
                                    COMMENT_SORT_REFUSED,
                                    Toast.LENGTH_SHORT,
                                ).show()
                            }
                        }
                    }.start()
                }

                override fun onNothingSelected(parent: AdapterView<*>?) = Unit
            }
        }

        /** What marks the row, so a second pass over the screen adds no second one. */
        private const val COMMENT_SORT = "tildes_comment_sort"

        /** Boost's own spinner row, which follows the theme where ours would not. */
        private const val SPINNER_ITEM = "small_spinner_item"

        /**
         * What the row says. Tildes' own label ends in a colon, being written
         * above its control rather than beside it.
         */
        private const val COMMENT_SORT_LABEL = "Default comment sort order"

        /** And what it says when the site would not take one. */
        private const val COMMENT_SORT_REFUSED = "Tildes would not take that order"

        /**
         * How long a bio Tildes takes, off `BIO_MAX_LENGTH` in its own schema,
         * which is a check constraint on the column as well as a form rule. So
         * a longer one is refused rather than trimmed.
         */
        private const val BIO_LIMIT = 2000

        /**
         * The invite codes, which are the one thing on this screen that
         * translates nothing.
         *
         * Every row above it is a Lemmy control pointed at a Tildes setting, or
         * a Lemmy control taken off because Tildes has nothing behind it.
         * Tildes accounts are invite-only and each one carries a few codes to
         * hand out, and Lemmy has no such idea anywhere, so there is no call of
         * Boost's this arrives through and no row of its own to borrow. It is a
         * control to *put* somewhere, and this screen is the one with the room.
         *
         * Built in code for the reason the comment sort row is: a `Button` and
         * a `TextView` need no library the extension cannot name, and both take
         * their colours off whatever theme the screen is under.
         *
         * `/invite` is a page of its own, so this costs one request, and it is
         * made once per process -- [myInvites] keeps what it said. The row is
         * drawn only where that page was recognised, which is the rule the four
         * switches and the sort row follow.
         */
        private fun inviteRow(column: ViewGroup) {
            if (column.findViewWithTag<View>(INVITES) != null) return
            INSTANCE.myInvites?.let {
                drawInviteRow(column, it)
                return
            }
            Thread {
                val read = INSTANCE.invites() ?: return@Thread
                column.post {
                    try {
                        drawInviteRow(column, read)
                    } catch (t: Throwable) {
                    }
                }
            }.start()
        }

        /**
         * The box itself: a line with the button on it, and a code under it for
         * each one already handed out.
         *
         * Newest first, as `/invite` orders them. The codes are what the rows
         * draw and the register link is what a tap copies -- `ABCDE-FGHIJ-KLMNO`
         * is what reads as a code on a phone, while the link is the thing
         * somebody can be sent, and the site puts the whole link in a box you
         * are meant to copy out of.
         */
        private fun drawInviteRow(column: ViewGroup, invites: Tildes.Invites) {
            if (column.findViewWithTag<View>(INVITES) != null) return
            val context = column.context
            val dp = context.resources.displayMetrics.density
            val side = (16 * dp).toInt()

            val label = TextView(context).apply {
                text = INVITES_LABEL
                layoutParams = LinearLayout.LayoutParams(
                    0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f,
                )
            }
            val button = Button(context)
            val hint = TextView(context).apply {
                text = INVITES_HINT
                textSize = 12f
                alpha = 0.7f
                setPadding(side, 0, side, (4 * dp).toInt())
                visibility = if (invites.links.isEmpty()) View.GONE else View.VISIBLE
            }
            val codes = LinearLayout(context).apply {
                orientation = LinearLayout.VERTICAL
            }

            column.addView(
                LinearLayout(context).apply {
                    tag = INVITES
                    orientation = LinearLayout.VERTICAL
                    addView(
                        LinearLayout(context).apply {
                            orientation = LinearLayout.HORIZONTAL
                            gravity = Gravity.CENTER_VERTICAL
                            setPadding(side, (8 * dp).toInt(), side, 0)
                            addView(label)
                            addView(button)
                        },
                        LinearLayout.LayoutParams(
                            LinearLayout.LayoutParams.MATCH_PARENT,
                            LinearLayout.LayoutParams.WRAP_CONTENT,
                        ),
                    )
                    addView(hint)
                    addView(codes)
                },
                LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                ),
            )

            for (link in invites.links) addCode(codes, hint, link)
            offerNewCode(button, invites.remaining)
            button.setOnClickListener { mintCode(button, codes, hint) }
        }

        /** One code, and the copy behind it. */
        private fun addCode(codes: LinearLayout, hint: View, link: String, first: Boolean = false) {
            val context = codes.context
            val dp = context.resources.displayMetrics.density
            val row = TextView(context).apply {
                // The link where the code cannot be read out of it, so the row
                // still carries something that can be handed over.
                text = Tildes.inviteCode(link) ?: link
                typeface = Typeface.MONOSPACE
                setPadding((16 * dp).toInt(), (10 * dp).toInt(), (16 * dp).toInt(), (10 * dp).toInt())
                isClickable = true
                // The theme's own press feedback, or none where it cannot be
                // found: a row that copies on a tap and shows nothing while it
                // is held reads as a row that does nothing.
                TypedValue().let {
                    if (context.theme.resolveAttribute(
                            android.R.attr.selectableItemBackground, it, true,
                        ) && it.resourceId != 0
                    ) {
                        setBackgroundResource(it.resourceId)
                    }
                }
                setOnClickListener { copyInvite(context, link) }
            }
            codes.addView(row, if (first) 0 else codes.childCount)
            hint.visibility = View.VISIBLE
        }

        /** What the button says, which is the count as the site draws it. */
        private fun offerNewCode(button: Button, remaining: Int?) {
            button.text = when {
                remaining == null -> INVITE_NEW
                remaining <= 0 -> INVITE_NONE
                else -> "$INVITE_NEW ($remaining left)"
            }
            // A null count is a button the site drew and a number this could not
            // read off it, so the row keeps the button and a tap finds out.
            button.isEnabled = remaining == null || remaining > 0
        }

        /**
         * Generating one, which is a `GET` that changes something -- Tildes'
         * own button is an intercooler `data-ic-get-from`.
         *
         * The new link goes on the clipboard as it arrives. Tapping a button
         * that says **New code** is somebody about to send one to a person, and
         * the site does the same thing in its own way, selecting the box the
         * new link lands in. The row stays behind either way, so a code copied
         * over can be copied again.
         *
         * A refusal leaves the count where the answer put it. **403** is the
         * site saying there are none left, which is a number rather than a
         * failure, so the button reads that instead of going back to what it
         * said before.
         */
        private fun mintCode(button: Button, codes: LinearLayout, hint: View) {
            button.isEnabled = false
            Thread {
                try {
                    val minted = Tildes.mintInvite()
                    val link = minted.links.firstOrNull()
                    INSTANCE.myInvites = Tildes.Invites(
                        minted.remaining,
                        listOfNotNull(link) + INSTANCE.myInvites?.links.orEmpty(),
                    )
                    button.post {
                        offerNewCode(button, minted.remaining)
                        if (link == null) {
                            return@post
                        }
                        addCode(codes, hint, link, first = true)
                        copyInvite(button.context, link)
                    }
                } catch (t: Throwable) {
                    val gone = t is TildesException && t.status == 403
                    button.post {
                        if (gone) {
                            INSTANCE.myInvites = Tildes.Invites(
                                0, INSTANCE.myInvites?.links.orEmpty(),
                            )
                        }
                        offerNewCode(button, if (gone) 0 else null)
                        Toast.makeText(
                            button.context,
                            if (gone) INVITE_NONE_LEFT else INVITE_REFUSED,
                            Toast.LENGTH_SHORT,
                        ).show()
                    }
                }
            }.start()
        }

        /**
         * The clipboard, which is the whole point of the row.
         *
         * Android 13 and up puts up its own confirmation when an app copies
         * text, so a toast of ours would be the second thing to say it.
         */
        private fun copyInvite(context: Context, link: String) {
            val clipboard = context.getSystemService(Context.CLIPBOARD_SERVICE)
                as? android.content.ClipboardManager
            if (clipboard == null) {
                return
            }
            clipboard.setPrimaryClip(
                android.content.ClipData.newPlainText(INVITES_LABEL, link),
            )
            if (android.os.Build.VERSION.SDK_INT < 33) {
                Toast.makeText(context, INVITE_COPIED, Toast.LENGTH_SHORT).show()
            }
        }

        /** What marks the box, so a second pass over the screen adds no second one. */
        private const val INVITES = "tildes_invites"

        /** And the words, none of which are anywhere in the APK to borrow. */
        private const val INVITES_LABEL = "Invite codes"
        private const val INVITES_HINT = "Tap a code to copy its invite link"
        private const val INVITE_NEW = "New code"
        private const val INVITE_NONE = "None left"
        private const val INVITE_COPIED = "Invite link copied"
        private const val INVITE_NONE_LEFT = "Tildes has no invite codes left for you"
        private const val INVITE_REFUSED = "Tildes would not give out another code"

        /**
         * Which word the account editor toasts when a save comes back.
         *
         * Boost toasts `R.string.saved`, which reads **Bookmarks** on a Tildes
         * account: saving is bookmarking in the ten other places the app uses
         * the word, and the same string names the drawer's bookmarks row and
         * the listing behind it, where it is right. So the string is left
         * alone and this one call is handed a different one.
         *
         * `theme_preset_saved` is the id it gets, which is "Saved" in every
         * configuration and is not a word the table rewrites. Resolved by
         * name, like everything else here, and Boost's own id goes back
         * whenever the name cannot be found or the account is not Tildes.
         *
         * Called from patched bytecode, once per account save answered.
         */
        @JvmStatic
        fun savedWord(boostsOwn: Int): Int {
            if (!Session.wasTildes()) return boostsOwn
            val context = Session.application() ?: return boostsOwn
            val plain = id(context, "theme_preset_saved", "string")
            return if (plain != 0) plain else boostsOwn
        }

        /**
         * Boost's own question of whether the thumbnail field is empty,
         * answered yes while the account is Tildes.
         *
         * The composer validates that field as a URL before it will send
         * anything, and refuses with "Link not valid" when it does not parse.
         * It is the tags here, so `hello, world` is exactly the shape that
         * fails. Saying the field is empty skips the check and leaves the value
         * itself alone, which is what has to reach the interceptor.
         *
         * Nothing else is lost by it: the check exists to stop a thumbnail URL
         * being sent malformed, and Tildes has no thumbnails.
         *
         * Scoped off disk like the rest of the composer, so both halves of the
         * screen answer to the same flag.
         *
         * Called from patched bytecode, once per attempt to post.
         */
        @JvmStatic
        fun thumbnailIsBlank(boostsOwn: Boolean): Boolean =
            Session.wasTildes() || boostsOwn

        /**
         * Whether `~text~` and `^text^` mean anything in a body being drawn.
         *
         * On Lemmy they are subscript and superscript, and Boost rewrites both
         * into HTML tags before the markdown is parsed. On Tildes they are
         * ordinary characters: cmark-gfm has no syntax for either, so the site
         * draws them as themselves and this has to as well.
         *
         * **A group is `~group`, which is what made it a bug rather than a
         * nicety.** The rewrite pairs the tildes on a line left to right and
         * takes everything between them, whatever it is -- a code span, a
         * fenced block, the address inside a link. Two group mentions in one
         * sentence is two tildes, and a comment on this site can easily hold
         * six. What came out of `[~tildes.official](https://tildes.net/~tildes.official)`
         * was a link pointing at `https://tildes.net/</sub>tildes.official`.
         *
         * Answering no leaves the body exactly as the interceptor built it,
         * which is the markdown Tildes' own HTML came back as.
         *
         * Called from patched bytecode, once per body rendered.
         */
        @JvmStatic
        fun scriptMarkup(): Boolean = !Session.wasTildes()

        /**
         * What one of Boost's own listings is called, where Tildes has a word
         * of its own for it.
         *
         * Two kinds of thing answer here. The first is the front page: Tildes'
         * sidebar on `/` says **Home** over "The home page shows topics from
         * all the groups on Tildes", and that is the listing Boost's
         * `!subscribed` row opens.
         *
         * **The second is a listing that is not a community**, which is a tag
         * and a group asked for with its subgroups. Those arrive carrying
         * tildes.net's own URL for themselves as their name -- that is how the
         * request end knows what to fetch -- and this is the method that turns
         * a name into words, so `~comp?tag=programming` read out over the
         * toolbar as itself. It says `programming in ~comp` now, and
         * `~sports?all_subgroups=true` says `~sports and its subgroups`.
         *
         * **Only the words change.** Nothing downstream reads what this
         * answers: the fetch goes off the model's own name field, which this
         * never touches, and the seventeen call sites are a toolbar, a drawer
         * row, a spinner, a launcher label and a handful of toasts.
         *
         * The name is read the same way the marker is, by asking every field on
         * the model rather than by naming the letter it lives under. Only the
         * one holding the name can parse as either listing.
         *
         * **The wording table cannot carry it.** Every place the front page is
         * named goes through `R.string.subscribed`, and so does the first tab
         * on the **Groups** page, where the same word names the groups you
         * follow rather than a feed. Rewriting the string would leave a strip
         * reading Home | All over two lists of groups. This method is the one
         * the Groups page does not go through.
         *
         * The marker is read the way every other one is, by asking whether any
         * field on the model holds it, rather than by naming the letter it
         * lives under.
         *
         * Answers null for everything else, including the other five markers.
         * `!saved` is already **Bookmarks** off the wording table, and the rest
         * are rows this patch takes off the screens that draw them.
         *
         * Called from patched bytecode, once per listing named.
         */
        @JvmStatic
        fun listingName(model: Any?): String? {
            if (model == null || !Session.wasTildes()) return null
            if (marked(model, FRONT_PAGE_SUBSCRIPTION)) return HOME
            return model.javaClass.declaredFields.firstNotNullOfOrNull { field ->
                try {
                    field.isAccessible = true
                    (field.get(model) as? String)?.let { listingTitle(it) }
                } catch (t: Throwable) {
                    null
                }
            }
        }

        /**
         * The words over a listing that is not a community, or null for
         * everything else -- which is every real group, and is what leaves
         * Boost's own name for it alone.
         */
        private fun listingTitle(name: String): String? =
            Lemmy.tagListing(name)?.title ?: Lemmy.subgroupListing(name)?.title

        /** Boost's marker for the front page, and Tildes' own word for it. */
        private const val FRONT_PAGE_SUBSCRIPTION = "!subscribed"
        private const val HOME = "Home"

        /**
         * Whether the Votes tab pages through `post/list`, which is the one
         * route that cannot carry a comment.
         *
         * Boost's profile has two paginators behind it. One asks `user` and
         * gets Lemmy's `posts` and `comments` arrays back together, which is
         * how the Bookmarks tab draws both kinds. The other asks `post/list`
         * with `liked_only`, reads `getPosts()` off a `GetPostsResponse`, and
         * has nowhere to put a comment -- so the Votes tab could only ever have
         * drawn half of what `/votes` holds, whatever the interceptor answered.
         *
         * Answering no sends it down the first one. Everything after that is
         * already written: the tab marks its request the way the All posts tab
         * does, the interceptor reads both halves of `/votes` for it, and the
         * merge puts the comments on the page.
         *
         * **`disliked` keeps the old route**, which is why this is asked about
         * one word rather than about the branch. That tab is `/ignored_topics`,
         * and there is no comment half of it to miss.
         *
         * Scoped off disk, since the paginator is picked while a tab is being
         * built rather than while anything is in flight.
         *
         * Called from patched bytecode, once per page of a profile tab.
         */
        @JvmStatic
        fun likedTakesPostList(boostsOwn: Boolean): Boolean =
            boostsOwn && !Session.wasTildes()

        /**
         * The topic whose tags the composer was actually shown, or null when it
         * was opened on a new one or could not work out which.
         *
         * The edit route reads this before it writes any tags, so a blank Tags
         * field only ever means "cleared" when there was something in it to
         * clear. Without that the two would be coupled by nothing but the
         * expectation that the fill always works, and a blank field on a topic
         * whose tags were never drawn would delete them on save.
         */
        @Volatile
        internal var composing: String? = null

        /**
         * The group that composer is showing, which is the group the topic will
         * be in after a save.
         *
         * Written by the row itself rather than by what was picked, because
         * what a pick does is Boost's: the picker answers into
         * `PostActivity.onActivityResult`, which publishes the choice and lets
         * an observer draw it. The drawn name is downstream of all of that, so
         * reading it needs to know none of it.
         *
         * The prefill writes it too, on the way in, which is the topic's own
         * group and so no move at all. See [regroup], which is where that is
         * compared.
         */
        @Volatile
        internal var composerGroup: String? = null

        /**
         * The tags of the topic being edited, written into the field that will
         * send them back.
         *
         * Boost hands the editor the topic it was opened on, as the model it
         * already had, and the interceptor kept that topic when it parsed the
         * page. So the tags are known here without a request, and without them
         * the field would open blank on an edit and clear the topic's tags on
         * save.
         *
         * The id is read off the model by name, since Boost's fields are down
         * to single letters. [TOPIC_ID_FIELD] is the one `SubmissionModel`
         * writes `String.valueOf(post.getId())` into, and the patch's
         * assumption tests pin it against the app.
         */
        /**
         * The composer's inputs, in the order Tildes asks for them: a title,
         * then a link and text with "enter a link, text, or both" over the pair
         * of them, then the tags. Boost draws the same inputs in its own order,
         * link first and tags between the title and the text.
         *
         * The title's suggestion row travels with the title, since that is what
         * it suggests. Everything not named here keeps its place: the group
         * selector above and the chips below never move.
         */
        private val COMPOSER_ORDER = listOf(
            "title_suggestion",
            "submit_title_wrapper",
            "submit_url_wrapper",
            "submit_optional_text",
            "submit_thumbnail_url_wrapper",
        )

        /**
         * Puts those inputs in that order, in the column they share.
         *
         * Moved here rather than in a second copy of the layout, because a
         * layout is chosen when the patch is applied while this follows the
         * account, and because it costs no resource to keep in step with
         * Boost's own. It runs before the first pass, so nothing is drawn in
         * the old order first.
         *
         * Each row is found by an id somewhere inside it and then lifted to
         * whichever child of the column it belongs to, since two of the five
         * are wrapped in a layout carrying no id at all.
         */
        private fun reorder(activity: Activity) {
            val views = COMPOSER_ORDER.mapNotNull {
                activity.findViewById<View>(id(activity, it))
            }
            val column = views.firstNotNullOfOrNull { columnOf(it) } ?: return

            val rows = views.mapNotNull { rowOf(it, column) }.distinct()
            if (rows.size < 2) return

            // The places they occupy now, filled again in the order above. The
            // removals close the column up, so the slots have to go back in
            // ascending order for each to land where one of them started.
            val slots = rows.map { column.indexOfChild(it) }.sorted()
            rows.forEach { column.removeView(it) }
            rows.zip(slots).forEach { (row, slot) -> column.addView(row, slot) }
        }

        /** The vertical column a composer input sits in, however deep. */
        private fun columnOf(view: View): LinearLayout? =
            generateSequence(view.parent) { (it as? View)?.parent }
                .filterIsInstance<LinearLayout>()
                .firstOrNull { it.orientation == LinearLayout.VERTICAL }

        /** Whichever child of [column] holds [view]. */
        private fun rowOf(view: View, column: LinearLayout): View? {
            var row: View = view
            while (row.parent !== column) row = row.parent as? View ?: return null
            return row
        }

        // The typed overload wants API 33 and Boost's own minimum is 32, which
        // is also why Boost reads its own extra the same way.
        @Suppress("DEPRECATION")
        private fun fillTags(activity: Activity): String? {
            val field = activity.findViewById<TextView>(id(activity, "submit_thubmnail_url"))
                ?: return null
            val model = activity.intent?.getParcelableExtra<Parcelable>(SUBMISSION)
                ?: return null
            val id36 = model.javaClass.getField(TOPIC_ID_FIELD).let {
                it.isAccessible = true
                (it.get(model) as? String)?.toIntOrNull()
            }?.let { Lemmy.intToId36(it) } ?: return null

            val topic = INSTANCE.topics[id36] ?: return null
            val tags = topic.tags
            field.text = tags.joinToString(", ")

            // The same tags ride under the body, for want of anywhere else to
            // draw them, and the editor is filled from that. Now that they have
            // a field of their own, leaving them there shows them twice and
            // writes them into the markdown on the way back. The spoiler
            // wrapper comes off here for the same reason: it is drawn for a
            // reader rather than typed by the author, and the box is for
            // editing what the author wrote.
            activity.findViewById<TextView>(id(activity, "submit_optional_text"))?.let {
                it.text = Lemmy.withoutMarkup(it.text.toString(), tags, topic.group)
            }
            return id36
        }

        /**
         * The tags the group already uses, under the Tags field.
         *
         * Tildes' own field is a chip box that suggests as you type. Boost's is
         * the thumbnail URL input, a plain `EditText`, so the chips are not on
         * offer here and the suggestions do not need them: a row of tags under
         * the field, narrowed to what the word being typed could still become,
         * and a tap finishes that word. `hello, wor` and a tap on `world`
         * leaves `hello, world, ` with the caret after it.
         *
         * The word being completed runs from the last comma before the caret to
         * the next one after it, so a tag edited in the middle of a line is
         * replaced rather than appended to.
         *
         * The row goes **above** the field rather than under it. Tags are the
         * last thing on the composer, so focusing the field scrolls it to the
         * bottom of what the keyboard leaves, and anything below it goes with
         * the keyboard. What is above the field is what stays on screen.
         *
         * Nothing is fetched until the field is used, and the row appears with
         * the first use and keeps its place after that: one that came and went
         * as you typed would move the field under your thumb. [note] is what
         * stands in it when there is nothing to offer.
         *
         * See [tagsFor] for where the list comes from.
         */
        private fun suggestTags(activity: Activity) {
            val field = activity.findViewById<EditText>(id(activity, "submit_thubmnail_url"))
                ?: return

            // The column is found from the wrapper rather than from the input,
            // and that is the whole of the difference between a row above the
            // field and a row inside it. `TextInputLayout` is a vertical
            // `LinearLayout` of its own, so walking up from the input stops
            // there, and a view added at that point lands between the box and
            // its label: the label draws where the layout says it should while
            // the box is pushed down past it, so the outline runs through the
            // words instead of parting for them.
            val wrapper = activity.findViewById<View>(id(activity, "submit_thumbnail_url_wrapper"))
                ?: return
            val column = columnOf(wrapper) ?: return
            val row = rowOf(wrapper, column) ?: return
            if (column.findViewWithTag<View>(SUGGESTIONS) != null) return

            val dp = activity.resources.displayMetrics.density
            val chips = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
            val strip = HorizontalScrollView(activity).apply {
                tag = SUGGESTIONS
                isHorizontalScrollBarEnabled = false
                clipToPadding = false
                setPadding((16 * dp).toInt(), (8 * dp).toInt(), (16 * dp).toInt(), (4 * dp).toInt())
                visibility = View.GONE
                addView(chips)
            }
            column.addView(
                strip,
                column.indexOfChild(row),
                LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                ),
            )

            // Nothing goes out until the field has been used once, and the row
            // is redrawn from what is already known whenever it has not.
            var touched = false
            val draw = {
                touched = true
                strip.visibility = View.VISIBLE
                drawTags(activity, field, strip, chips, fetch = true)
            }

            field.addTextChangedListener(object : TextWatcher {
                override fun afterTextChanged(s: Editable?) = draw()
                override fun beforeTextChanged(s: CharSequence?, a: Int, b: Int, c: Int) = Unit
                override fun onTextChanged(s: CharSequence?, a: Int, b: Int, c: Int) = Unit
            })

            // The caret moves without the text changing too, which is a tap
            // inside the field or the focus arriving there.
            field.setOnClickListener { draw() }
            field.setOnFocusChangeListener { _, focused -> if (focused) draw() }

            // A group can be picked while the Tags field still has the focus,
            // and the row was going stale until the focus left and came back.
            //
            // It is the one input here that is typed into as well as picked
            // from, so a change draws at once from what is already known and
            // waits [GROUP_SETTLE_MS] before asking about anything: half a
            // group name is a page that does not exist, and every letter of one
            // would be a 404 of its own.
            var settle: Runnable? = null
            activity.findViewById<TextView>(id(activity, "submit_subreddit"))
                ?.addTextChangedListener(object : TextWatcher {
                    override fun afterTextChanged(s: Editable?) {
                        drawTags(activity, field, strip, chips, fetch = false)
                        settle?.let { strip.removeCallbacks(it) }
                        if (!touched) return

                        settle = Runnable { draw() }
                            .also { strip.postDelayed(it, GROUP_SETTLE_MS) }
                    }

                    override fun beforeTextChanged(s: CharSequence?, a: Int, b: Int, c: Int) = Unit
                    override fun onTextChanged(s: CharSequence?, a: Int, b: Int, c: Int) = Unit
                })

            if (field.hasFocus()) draw()
        }

        /**
         * Fills the row with whatever the word under the caret could become.
         *
         * [fetch] is what separates a redraw from an ask. A group that has not
         * been read yet answers with nothing either way, and only a redraw that
         * may fetch sends anything, so a group half-typed can change the row
         * without changing what has gone out.
         */
        private fun drawTags(
            activity: Activity,
            field: EditText,
            strip: View,
            chips: LinearLayout,
            fetch: Boolean,
        ) {
            val group = composerGroup(activity)
            val all = if (group == null) {
                emptyList()
            } else {
                tagsFor(group, fetch) {
                    strip.post { drawTags(activity, field, strip, chips, fetch = false) }
                }
            }

            val text = field.text?.toString().orEmpty()
            val caret = field.selectionEnd.coerceIn(0, text.length)
            val word = text.substring(text.substring(0, caret).lastIndexOf(',') + 1, caret).trim()

            // Every other tag on the line, so the row never offers one twice.
            // The word being edited is not one of them, or typing a tag out in
            // full would take it off the row as you finished it.
            val used = text.split(',').map { it.trim().lowercase() }.toMutableSet()
            used.remove(word.lowercase())

            val offer = all
                .filter { it.lowercase() !in used && it.startsWith(word, ignoreCase = true) }
                .take(12)

            chips.removeAllViews()
            if (offer.isEmpty()) {
                // Two different nothings, and the difference is what to do
                // about it: one comes back by deleting a letter and the other
                // is a group with no common tags, or a fetch still out.
                chips.addView(
                    note(
                        activity,
                        field,
                        if (all.isEmpty()) "No suggestions" else "No suggestions for that tag",
                    ),
                )
                return
            }

            offer.forEach { tag ->
                chips.addView(chip(activity, field, tag) {
                    drawTags(activity, field, strip, chips, fetch = false)
                })
            }
        }

        /**
         * What stands in the row when there is nothing to offer.
         *
         * The row keeps its place rather than coming and going as you type,
         * since a row that appears and disappears moves the field under it
         * while you are aiming at it.
         */
        private fun note(activity: Activity, field: EditText, words: String): TextView {
            val dp = activity.resources.displayMetrics.density
            return TextView(activity).apply {
                text = words
                textSize = 13f
                setTextColor(field.currentTextColor and 0x99FFFFFF.toInt())
                setPadding(0, (6 * dp).toInt(), 0, (6 * dp).toInt())
            }
        }

        /** One tag the composer is offering, which fills the field when tapped. */
        private fun chip(
            activity: Activity,
            field: EditText,
            tag: String,
            drawn: () -> Unit,
        ): TextView = pill(activity, field.currentTextColor, tag) {
            complete(field, tag)
            drawn()
        }

        /**
         * One tag, drawn as something tappable rather than as a chip Boost has.
         *
         * Boost has no chip of its own to borrow -- its Reddit ancestry drew
         * flair as a `RichFlairView`, which takes a colour and a corner radius
         * off a Reddit flair and nothing off a tag -- so this is built here,
         * and both places that draw a tag use it: the composer's suggestions
         * and the tags under a topic. One look, one place to change it.
         *
         * **The colour comes off a view already on the screen** rather than off
         * the theme, so this follows whichever of Boost's themes is on without
         * reading any of them. The outline is the same colour at a quarter
         * alpha, which is what keeps it legible on both the light and the dark
         * ones.
         */
        private fun pill(
            context: Context,
            textColor: Int,
            label: String,
            onClick: () -> Unit,
        ): TextView {
            val dp = context.resources.displayMetrics.density
            return TextView(context).apply {
                text = label
                textSize = 12f
                setTextColor(textColor)
                setPadding((10 * dp).toInt(), (4 * dp).toInt(), (10 * dp).toInt(), (4 * dp).toInt())

                // Larger than half the height, so the ends stay round however
                // tall a line of text makes it.
                background = GradientDrawable().apply {
                    cornerRadius = 16 * dp
                    setStroke((1 * dp).toInt(), textColor and 0x40FFFFFF.toInt())
                }
                isClickable = true
                setOnClickListener { onClick() }
                layoutParams = LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                ).apply { marginEnd = (6 * dp).toInt() }
            }
        }

        /**
         * Puts [tag] where the word under the caret is, and leaves the line
         * ready for the next one.
         *
         * The bounds are worked out here rather than carried from the draw,
         * since the text can have moved on between a row being filled and a tap
         * landing on it.
         */
        private fun complete(field: EditText, tag: String) {
            val text = field.text?.toString().orEmpty()
            val (line, caret) = Tildes.completeTag(text, field.selectionEnd, tag)
            field.setText(line)
            field.setSelection(caret)
        }

        /**
         * The group the composer is pointed at, read off its own selector so a
         * group picked after the screen opened is the one asked about.
         */
        private fun composerGroup(activity: Activity): String? =
            activity.findViewById<TextView>(id(activity, "submit_subreddit"))
                ?.text?.toString()?.trim()
                ?.removePrefix("~")?.removePrefix("!")?.substringBefore('@')
                ?.takeIf { name -> name.isNotEmpty() && name.none(Char::isWhitespace) }

        /**
         * A group's suggested tags, fetched once and kept for as long as the
         * app is up.
         *
         * The fetch is a whole page off a background thread, so this answers
         * with what it has and calls [then] when there is more. A group that
         * answers nothing, and a fetch that fails, are both remembered as empty
         * rather than asked about again on the next keystroke.
         */
        private fun tagsFor(group: String, fetch: Boolean, then: () -> Unit): List<String> {
            tagSuggestions[group]?.let { return it }
            if (!fetch || !fetchingTags.add(group)) return emptyList()

            Thread {
                try {
                    tagSuggestions[group] = Tildes.groupTagSuggestions(group)
                } catch (t: Throwable) {
                    tagSuggestions[group] = emptyList()
                } finally {
                    fetchingTags.remove(group)
                }
                then()
            }.start()

            return emptyList()
        }

        private val tagSuggestions = ConcurrentHashMap<String, List<String>>()
        private val fetchingTags = ConcurrentHashMap.newKeySet<String>()

        /** What marks the suggestion row, so a second pass does not add another. */
        private const val SUGGESTIONS = "tildes_tag_suggestions"

        /** How long a group has to stop changing before it is asked about. */
        private const val GROUP_SETTLE_MS = 400L

        /**
         * Whether a listing should keep a topic Tildes tagged `nsfw`.
         *
         * Boost drops every NSFW post from a feed and from a profile unless its
         * "Show NSFW" preference is on, and that preference is off out of the
         * box. tildes.net does the opposite: `nsfw` is a tag like any other for
         * the purpose of listing, filtered only by accounts that have asked for
         * it, and the front page shows those topics to everyone.
         *
         * So a truthful `nsfw` flag would silently shorten every feed here, and
         * a topic that is simply absent is the hardest kind of wrong answer to
         * notice. The flag stays truthful and the drop is what gives way: the
         * badge, the blur and the NSFW settings all still read it, while a
         * Tildes listing keeps what the site would have listed.
         *
         * Boost's own answer stands everywhere else, which is what the argument
         * is for.
         *
         * Called from patched bytecode, once per post filtered.
         */
        @JvmStatic
        fun showNsfw(boostsOwn: Boolean): Boolean = answering || boostsOwn

        /**
         * The drawer's Bookmarks row, sent to the Bookmarks that can draw both
         * kinds.
         *
         * Tildes keeps one `/bookmarks` page with a topic tab and a comment tab
         * on it, and Boost has two screens that both claim to be it. This row
         * opened an ordinary submission feed, which can only ever draw topics --
         * it casts every row it is handed to a post, which is what crashed the
         * app the first time comments were put in front of it. The profile's
         * Bookmarks tab is the one that draws both, so the row goes there and
         * there is one Bookmarks screen again.
         *
         * **The row is found by what it answers rather than by where it sits.**
         * Every row in that drawer carries an identifier, and Boost's are round
         * numbers it hard-codes rather than resource ids that renumber. So a row
         * with a method answering that number is that row, and no letter is
         * named.
         *
         * The person is built rather than fetched, out of the name this is
         * signed in as and the id this gave Boost for it -- the interceptor is
         * the only thing that has ever told the app an id for this account, so
         * the two agree by construction. That matters: the profile counts its
         * own tabs one way and a stranger's another, and it tells them apart by
         * that id.
         *
         * Answering **true** takes the tap, which leaves the drawer to be closed
         * here since Boost only closes it for a tap it was given back. It is
         * found by walking up from the row that was pressed, and a failure there
         * costs an open drawer behind the screen rather than the screen.
         *
         * Called from patched bytecode, once per row tapped in the drawer.
         */
        @JvmStatic
        fun drawerBookmarks(activity: Any?, view: Any?, row: Any?): Boolean {
            if (activity !is Activity || row == null || !Session.wasTildes()) return false
            return try {
                if (!answersTo(row, BOOKMARKS_ROW)) return false
                val name = Tildes.username ?: return false
                activity.startActivity(ownProfile(activity, name, BOOKMARKS_TAB))
                closeDrawer(view as? View)
                true
            } catch (t: Throwable) {
                false
            }
        }

        /**
         * And the profile opening on it, which that screen has never been able
         * to be told.
         *
         * It reads one extra, the person, and opens on the first tab always.
         * So the row above puts a tab key in the intent and this reads it back,
         * once the tabs have been wired to the pager.
         *
         * **By key rather than by index**, because the index is not Boost's any
         * more: About and Uploads come off that screen on a Tildes account, so
         * Bookmarks is the third of seven to Boost and the third of five as
         * drawn. The keys are the ones Boost puts in a request, so nothing
         * renames them, and the same array this counts is the one the pager
         * reads.
         *
         * Called from patched bytecode, once per profile opened.
         */
        @JvmStatic
        fun profileOpensOn(activity: Any?) {
            if (activity !is Activity || !Session.wasTildes()) return
            try {
                val wanted = activity.intent?.getStringExtra(OPEN_TAB_EXTRA) ?: return
                val keys = tabArrayOf(activity, PROFILE_TAB_ANCHOR)?.second ?: return
                val at = keys.filter { it !in DROPPED_PROFILE_TABS }.indexOf(wanted)
                if (at <= 0) return

                val pager = fieldsOf(activity).firstNotNullOfOrNull { field ->
                    read(field, activity)?.takeIf { held ->
                        held.javaClass.methods.any {
                            it.name == SELECT_TAB && it.parameterTypes.size == 1
                        }
                    }
                } ?: return

                pager.javaClass
                    .getMethod(SELECT_TAB, Int::class.javaPrimitiveType)
                    .invoke(pager, at)
            } catch (t: Throwable) {
            }
        }

        /** Whether any number this row answers with is the one being looked for. */
        private fun answersTo(row: Any, id: Long): Boolean =
            row.javaClass.methods.any { method ->
                method.parameterTypes.isEmpty() &&
                    method.returnType == Long::class.javaPrimitiveType &&
                    runCatching { method.invoke(row) }.getOrNull() == id
            }

        /**
         * Shuts the drawer the tap came from, found by walking up from the row
         * that was pressed. Boost shuts it itself for every tap it is given
         * back, and this is the one it is not.
         */
        private fun closeDrawer(view: View?) {
            var walk: View? = view
            while (walk != null) {
                if (walk.javaClass.name.endsWith(DRAWER_LAYOUT)) {
                    val layout = walk
                    val shuts = drawerCloser(layout.javaClass)
                    if (shuts == null) {
                        return
                    }
                    runCatching { shuts.invoke(layout, false) }
                    return
                }
                walk = walk.parent as? View
            }
        }

        /**
         * `DrawerLayout.closeDrawers()`, under whatever name it has left.
         *
         * Asking for it by name is what the first version of this did, and it
         * failed on every tap: the drawer layout is **androidx rather than
         * framework**, so it went through R8 with the rest of the app, and
         * `closeDrawers()` is a one-line call to `closeDrawers(false)` that was
         * inlined away. What is left is that second one under a letter.
         *
         * So it is found by shape, over the layout's own classes and no further
         * -- the walk stops where the framework starts, which is `ViewGroup`, and
         * everything above that is `android.view` and keeps its names.
         *
         * **Shape alone is not enough**, which the second version found out the
         * same way: there are two methods there taking a boolean and answering
         * nothing. `requestDisallowInterceptTouchEvent` is the other, and what
         * separates them is exactly what makes it the other -- it **overrides the
         * framework**, so `ViewGroup` declares it too and its name survived R8
         * for that reason. Anything the framework above also declares is
         * therefore not the one, and what is left is the method androidx wrote
         * and R8 renamed.
         *
         * The argument is androidx's `peekingOnly`, and false is what the no-arg
         * one passed.
         */
        private fun drawerCloser(type: Class<*>): Method? {
            val found = mutableListOf<Method>()
            var walk: Class<*>? = type
            while (walk != null && !isPlatform(walk)) {
                val on = walk
                found += on.declaredMethods.filter { method ->
                    method.returnType == Void.TYPE &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == Boolean::class.javaPrimitiveType &&
                        !overridesPlatform(on, method)
                }
                walk = on.superclass
            }
            if (found.size != 1) {
            }
            return found.singleOrNull()?.apply { isAccessible = true }
        }

        /**
         * Whether the framework above a class declares the same method, which
         * makes it an override and so a name R8 had to keep.
         */
        private fun overridesPlatform(from: Class<*>, method: Method): Boolean {
            var walk: Class<*>? = from.superclass
            while (walk != null) {
                if (isPlatform(walk) &&
                    runCatching {
                        walk!!.getDeclaredMethod(method.name, *method.parameterTypes)
                    }.isSuccess
                ) {
                    return true
                }
                walk = walk.superclass
            }
            return false
        }

        /**
         * Where a walk up a view's classes has left the app. Narrower than
         * [isFramework] on purpose: `androidx` ships inside the APK and is
         * renamed with everything else, so it is part of what has to be searched
         * rather than part of what stops the search.
         */
        private fun isPlatform(type: Class<*>): Boolean =
            type.name.startsWith("android.") || type.name.startsWith("java.")

        /** Boost's own identifier for the drawer's Bookmarks row. */
        private const val BOOKMARKS_ROW = 400000L

        /** The profile screen, the person it takes, and the tab this adds. */
        private const val PROFILE_SCREEN = "com.rubenmayayo.reddit.ui.profile.UserActivity"
        private const val PERSON_MODEL_CLASS = "com.rubenmayayo.lemmy.ui.person.PersonModel"
        private const val PERSON_EXTRA = "person"
        private const val OPEN_TAB_EXTRA = "tildes_open_tab"

        /** The layout that shuts, matched on the end of its name. */
        private const val DRAWER_LAYOUT = "DrawerLayout"

        /** What moves a pager to a tab. */
        private const val SELECT_TAB = "setCurrentItem"

        /**
         * The bookmarked comments on a page of bookmarked topics, which Boost
         * has been fetching and throwing away.
         *
         * Tildes bookmarks a comment as readily as a topic -- more readily,
         * since most of what anybody says here is a comment -- and
         * `/bookmarks` has a tab for each. The interceptor has read both since
         * the first day and answers with Lemmy's `posts` and `comments` arrays
         * together, which is the shape a profile comes back in there.
         *
         * Boost then drops one of them. Its profile pages one list at a time --
         * a Topics tab reading `posts`, a Comments tab reading `comments`, two
         * paginators over the same response -- and the Bookmarks tab is wired
         * to the first of the two. So the second read was paid for on every
         * page and drawn nowhere, which is a request a page against a small
         * server that bought nothing.
         *
         * **This only reads them.** [addBookmarkedComments] is what puts them
         * on a page, and the split is not tidiness: the paginator this hangs
         * off is not the profile tab's alone. The drawer's Bookmarks row opens
         * a submission feed that pages through the same class and casts every
         * row it is handed to a post, so a comment in the list there is a
         * `ClassCastException` before anything is drawn. The response is only
         * in reach here and only the far end knows which screen is asking, so
         * the comments are read here and left for it.
         *
         * **Which tab this is comes off the request rather than off a field.**
         * One paginator class serves the profile's Topics tab, its Bookmarks
         * tab and the drawer's feed alike, and what separates the second from
         * the first is `saved_only` in the query it built. Asking it for its
         * own map asks the question the server was asked, which no rename can
         * quietly change the answer to.
         *
         * Scoped on the account like everything a view is built from, so a
         * Lemmy account keeps Boost's own saved tab -- which draws topics
         * alone there too, and is Boost's to decide.
         *
         * Called from patched bytecode, once per page of a profile's topics.
         */
        @JvmStatic
        fun bookmarkedComments(paginator: Any?, response: Any?) {
            // Cleared first and every time, so a page that is never drawn
            // leaves nothing behind for the next one to pick up.
            pendingBookmarks = emptyList()
            if (paginator == null || response == null || !Session.wasTildes()) return
            try {
                val query = paginatorQuery(paginator)
                // The three tabs that draw both kinds: bookmarks, All posts
                // and votes. Each says which it is in the query it built
                // rather than in a field letter that could move.
                if (query?.get(SAVED_ONLY) != "true" &&
                    query?.get(PERSON_ID) != OVERVIEW_MARKER.toString() &&
                    query?.get(PERSON_ID) != VOTES_MARKER.toString()
                ) {
                    return
                }
                val make = commentModelFactory ?: return
                val views = response.javaClass.getMethod(COMMENTS_GETTER)
                    .invoke(response) as? List<*> ?: return
                pendingBookmarks = views.filterNotNull().mapNotNull { make.invoke(null, it) }
            } catch (t: Throwable) {
            }
        }

        /**
         * And putting them on the page, which is the profile list's own end of
         * it.
         *
         * Two methods on that fragment take a page, one appending and one
         * replacing, and this is at the head of both. Nothing else in the app
         * reaches them, which is the whole point: this is the one list in Boost
         * that draws topics and comments together, and its adapter has had a
         * branch for each all along -- that is how the Comments tab draws at
         * all.
         *
         * The page arrives before Boost's own filter has been over it, so the
         * comments ride through that with the topics. It passes anything that
         * is not a post through untouched.
         *
         * **The tab is asked as well as the stash**, because a page can reach
         * here from three different paginators and only one of them filled it.
         * `contribution_type` is the argument the pager hands a tab when it
         * builds it, `saved` is the bookmarks one, and it is a key Boost puts
         * in a bundle rather than a name an obfuscator touches.
         *
         * **And the tab's own filter is asked with it.** That menu's top two
         * rows are **Show topics** and **Show comments**, which are Boost's
         * own and have worked here since the day the interceptor started
         * answering the `comments` array -- Show comments pages through the
         * other paginator entirely and never reaches this. Show topics comes
         * back through this one, though, so merging without asking made that
         * row draw both and say one.
         *
         * Called from patched bytecode, twice per page of a profile's list.
         */
        @JvmStatic
        fun addBookmarkedComments(fragment: Any?, page: ArrayList<Any>?) {
            val pending = pendingBookmarks
            val order = pendingOverview
            pendingBookmarks = emptyList()
            pendingOverview = emptyList()
            if (pending.isEmpty() || fragment == null || page == null) return
            try {
                when (val tab = contributionType(fragment)) {
                    BOOKMARKS_TAB, VOTES_TAB -> {
                        if (showingTopicsAlone(fragment)) {
                            return
                        }
                        page.addAll(pending)
                        // The number is what says this worked. It was nothing
                        // at all for as long as either tab has existed.
                    }

                    OVERVIEW_TAB -> interleave(page, pending, order)

                    else -> return
                }
            } catch (t: Throwable) {
            }
        }

        /**
         * The All posts page put back into the order Tildes drew it in.
         *
         * The site's own first tab is one list of both kinds, newest first, and
         * Lemmy's shape splits them into an array each -- so a topic among
         * comments would come back at the top of the page rather than where it
         * belongs. [Tildes.mergedOrder] reads that order off the page while it
         * is still one document, and this lays the two lists back down along
         * it.
         *
         * **No date is read off a model to do it.** Both models keep their
         * fields under single letters that renumber between releases, and the
         * order was known upstream anyway.
         *
         * **The plan has to fit or it is not used.** It is counted against both
         * lists rather than trusted: a page that arrived from somewhere else,
         * or a parse that read a different number of items than the arrays
         * carry, falls back to the comments after the topics, which is what the
         * bookmarks tab has always drawn. Wrong order beats missing comments.
         */
        private fun interleave(page: ArrayList<Any>, comments: List<Any>, order: List<Boolean>) {
            val topics = page.size
            if (order.count { it } != comments.size || order.count { !it } != topics) {
                page.addAll(comments)
                return
            }

            val drawn = ArrayList<Any>(order.size)
            var topic = 0
            var comment = 0
            order.forEach { isComment ->
                drawn.add(if (isComment) comments[comment++] else page[topic++])
            }
            page.clear()
            page.addAll(drawn)
        }

        /**
         * The comments read off one bookmarks page, between the paginator that
         * has them and the list that can draw them.
         *
         * Those two are one synchronous call apart -- the response is mapped
         * and handed straight on, on the same thread -- so this is a handover
         * rather than a cache. It is cleared at both ends: filled or emptied by
         * every page the paginator maps, and taken by every page the list
         * receives whether it wants it or not.
         */
        @Volatile
        private var pendingBookmarks: List<Any> = emptyList()

        /**
         * And the order those two lists go back into, on the All posts tab.
         *
         * Filled where the page is parsed rather than where the comments are
         * read, since that is the last place both kinds are one document, and
         * taken at the same moment the comments are. Empty everywhere else,
         * which is what makes the bookmarks tab go on appending.
         */
        @Volatile
        private var pendingOverview: List<Boolean> = emptyList()

        /**
         * Which kind the Bookmarks tab is loading, read where Boost decides it.
         *
         * Tildes keeps `/bookmarks` as two tabs and Boost keeps the same choice
         * as a filter on the presenter behind its one tab -- `only_posts`,
         * `only_comments`, or nothing at all, which is both kinds at once and a
         * list this site never draws. The strip inside that tab writes it and
         * this reads it back, at the head of the method that builds the
         * paginator, so it runs on every page of every profile tab.
         *
         * **A tab that opens with no filter is given topics**, which is the
         * site's own first tab. It has to happen here rather than from the strip:
         * a filter set after the first page has already gone out means throwing
         * that page away and fetching again, and the cancel that costs shows up
         * as an error toast of Boost's.
         *
         * **And it tells the interceptor which half to fetch**, which is the one
         * thing the request cannot say: `only_posts` and no filter build the
         * identical query. Without it the comment half of `/bookmarks` was read
         * upstream and dropped on the way out, on every page.
         *
         * By value rather than by name, like everything else about this
         * presenter: its tab and its filter are both single-letter `String`
         * fields, while what they hold are words Boost compares against.
         *
         * Called from patched bytecode, once per page of any profile tab.
         */
        @JvmStatic
        fun profileListLoading(presenter: Any?) {
            if (presenter == null || !Session.wasTildes()) return
            try {
                val field = tabField(presenter) ?: return
                // Every other tab draws one kind, or merges on purpose, which
                // All posts does because the site's own first tab is merged.
                val tab = read(field, presenter)?.takeIf { it in TWO_TAB_PAGES } ?: return
                val kind = kindField(presenter, field) ?: return
                if (read(kind, presenter) !in KIND_FILTERS) {
                    kind.isAccessible = true
                    kind.set(presenter, ONLY_TOPICS)
                }
                INSTANCE.profileKinds[tab.toString()] =
                    if (read(kind, presenter) == ONLY_COMMENTS) "comment" else "topic"
            } catch (t: Throwable) {
            }
        }

        /**
         * The two tabs Tildes draws as two tabs.
         *
         * `/bookmarks` and `/votes` are the same page under two addresses --
         * the site renders the second from the first's template, down to the
         * two tabs and the pagination -- so both take a strip and neither has a
         * merged view to fall back to. `/ignored_topics` has no comment half at
         * all, and All posts is merged on purpose.
         */
        private val TWO_TAB_PAGES = setOf(BOOKMARKS_TAB, VOTES_TAB)

        /**
         * The presenter's own tab key, which is the field holding one of the
         * words a tab is filed under. Every one of them is a key Boost sends in
         * a request, so no obfuscator touches the values.
         */
        private fun tabField(presenter: Any): java.lang.reflect.Field? =
            fieldsOf(presenter).firstOrNull { read(it, presenter) in PROFILE_TAB_KEYS }

        /**
         * And its kind filter, which is the one thing left once the tab and the
         * name are accounted for.
         *
         * Three of the presenter's fields hold a `String`: the account's name,
         * the tab, and this. The tab is known by the value it holds, the name is
         * whatever the account is called, and the filter is either one of two
         * words or empty -- so the filter is the empty or filtered one that is
         * not the tab. Two candidates means something moved, and then nothing is
         * written: a wrong guess here would write a filter over a username.
         */
        private fun kindField(presenter: Any, tab: java.lang.reflect.Field): java.lang.reflect.Field? {
            val candidates = fieldsOf(presenter).filter { field ->
                if (field == tab || field.type != String::class.java) return@filter false
                val held = read(field, presenter)
                held == null || held == "" || held in KIND_FILTERS
            }
            if (candidates.size == 1) return candidates.first()
            return null
        }

        /** The word for the other half of that tab, beside [ONLY_TOPICS]. */
        private const val ONLY_COMMENTS = "only_comments"

        /** Every key a profile tab is filed under, Boost's seven and ours. */
        private val PROFILE_TAB_KEYS = setOf(
            TOPICS_TAB, COMMENTS_TAB, BOOKMARKS_TAB, VOTES_TAB, IGNORED_TAB,
            OVERVIEW_TAB, "info", "uploads",
        )

        /**
         * Whether the tab's own filter has been set to **Show topics**.
         *
         * Boost keeps that choice on the presenter behind the fragment, as one
         * of two words it puts nowhere near a request: the filter picks which
         * paginator is built rather than what is asked for, so `only_posts` and
         * no filter at all send the identical query. Nothing about the page
         * coming back says which one it was.
         *
         * So it is read off the screen, and **by the value rather than by a
         * name**. The presenter is a letter on the fragment and the choice is a
         * letter on the presenter, and a letter is the thing that moves between
         * releases -- while `only_posts` is a word Boost compares against and
         * cannot rename without breaking its own menu. Anything the fragment
         * holds that is holding that word is that field.
         *
         * **Declared fields are not enough**, which is what the first version
         * of this got wrong and a walk caught: a profile draws its list through
         * one of two fragments, and the one with autoplay on is a subclass, so
         * the presenter is declared a class above where it was looked for. Both
         * walks go up the hierarchy now, and stop where Boost's own classes do
         * -- everything above that is the framework's, holding nothing of this
         * and a great deal of everything else.
         *
         * Cheap enough per page: a field read has no side effects and there are
         * a few hundred of them.
         */
        private fun showingTopicsAlone(fragment: Any): Boolean =
            fieldsOf(fragment).asSequence()
                .mapNotNull { field -> read(field, fragment) }
                .any { held -> fieldsOf(held).any { read(it, held) == ONLY_TOPICS } }

        /**
         * Every field an object declares, and every one its classes declare, up
         * to the point where the app's own code stops.
         */
        private fun fieldsOf(of: Any): List<java.lang.reflect.Field> {
            val found = mutableListOf<java.lang.reflect.Field>()
            var walk: Class<*>? = of.javaClass
            while (walk != null && !isFramework(walk)) {
                found.addAll(walk.declaredFields)
                walk = walk.superclass
            }
            return found
        }

        /**
         * Where to stop walking. Boost's own classes are `com.rubenmayayo` or
         * one of R8's short packages, and everything it is built on is under a
         * name that says so.
         */
        private fun isFramework(type: Class<*>): Boolean {
            val name = type.name
            return name.startsWith("android.") || name.startsWith("androidx.") ||
                name.startsWith("java.") || name.startsWith("kotlin.")
        }

        /** One field off one object, or null wherever that is not allowed. */
        private fun read(field: java.lang.reflect.Field, of: Any): Any? =
            runCatching {
                field.isAccessible = true
                field.get(of)
            }.getOrNull()

        /** Which tab of a profile a fragment was built for. */
        private fun contributionType(fragment: Any): String? =
            (
                fragment.javaClass.getMethod(ARGUMENTS_GETTER).invoke(fragment) as? Bundle
                )?.getString(CONTRIBUTION_TYPE)

        /**
         * The query a paginator is about to send, which is how it says which
         * tab is asking.
         *
         * Every paginator in Boost builds the map it hands Retrofit and hands
         * it back from a method of its own. The method is a single letter, so
         * it is found by shape -- no arguments, a `HashMap` back -- and
         * confirmed by the map carrying `saved_only`, which every profile
         * paginator sets and nothing else in the app does. Free to ask: the map
         * is built out of fields each time, and nothing is sent by building
         * one.
         *
         * Asking the query rather than a field is the point. One paginator
         * class serves the profile's Topics tab, its Bookmarks tab, its All
         * posts tab and the drawer's feed alike, and what separates them is
         * what each put in the map -- which is the question the server was
         * asked, and no rename can quietly change the answer to it.
         */
        private fun paginatorQuery(paginator: Any): Map<*, *>? =
            paginator.javaClass.methods.firstNotNullOfOrNull { method ->
                if (method.parameterTypes.isNotEmpty() ||
                    method.returnType != HashMap::class.java
                ) {
                    null
                } else {
                    runCatching { method.invoke(paginator) as? Map<*, *> }
                        .getOrNull()?.takeIf { it.containsKey(SAVED_ONLY) }
                }
            }

        /**
         * `CommentModel.m(CommentView)`, the one call that turns a Lemmy
         * comment into the model Boost's lists draw.
         *
         * Found by its shape rather than by its name. Both classes keep theirs
         * -- one is a JSON shape and the other a model Boost names all over --
         * while the method between them is a letter that moves between
         * releases. A static one on the model taking a comment and answering a
         * model is that call, and there is no second candidate.
         */
        private val commentModelFactory: Method? by lazy {
            try {
                val model = Class.forName(COMMENT_MODEL_CLASS)
                val view = Class.forName(COMMENT_VIEW_CLASS)
                val found = model.methods.firstOrNull {
                    Modifier.isStatic(it.modifiers) && it.returnType == model &&
                        it.parameterTypes.size == 1 && it.parameterTypes[0] == view
                }
                found
            } catch (t: Throwable) {
                null
            }
        }

        /** Boost's own comment model, and the Lemmy shape it is built from. */
        private const val COMMENT_MODEL_CLASS =
            "com.rubenmayayo.reddit.models.reddit.CommentModel"
        private const val COMMENT_VIEW_CLASS =
            "com.rubenmayayo.lemmy.datatypes.CommentView"

        /** What the response calls the array Boost's saved tab leaves behind. */
        private const val COMMENTS_GETTER = "getComments"

        /** And the query parameter that says which tab asked. */
        private const val SAVED_ONLY = "saved_only"

        /**
         * How a profile tab says which one it is, and the bookmarks one's
         * answer. Both are Boost's own bundle key and value rather than
         * anything an obfuscator renames, and `getArguments` is the fragment
         * method that carries them.
         */
        private const val ARGUMENTS_GETTER = "getArguments"
        private const val CONTRIBUTION_TYPE = "contribution_type"
        private const val BOOKMARKS_TAB = "saved"

        /**
         * And what Boost sets behind its **Show topics** row, which is the one
         * word that says this page was asked for without its comments.
         */
        private const val ONLY_TOPICS = "only_posts"

        /** The extra Boost puts the topic being edited in. */
        private const val SUBMISSION = "submission"

        /**
         * Which field on Boost's post model holds the topic's id, as the
         * string `String.valueOf(post.getId())` left there. Boost's own class
         * names survive where its fields are down to single letters, so this
         * one is named rather than found, and pinned by the patch's tests.
         */
        private const val TOPIC_ID_FIELD = "b"

        /**
         * Which field on that model says the topic is a spoiler.
         *
         * Boost inherited it from its Reddit ancestry, where a post carries a
         * `spoiler` flag, and a row already draws all of it: a **Spoiler**
         * badge over the title, a red **SPOILER** in the line under it, and a
         * view type that leaves a video alone. Lemmy has no such field, so
         * nothing on the Lemmy path ever writes this one -- the only writers in
         * the app are the parcel and four mark-spoiler callbacks -- which is
         * what makes it free to fill in.
         */
        private const val SPOILER_FIELD = "W"

        /**
         * Which field on both models says the app may not vote on it, which
         * Boost inherited from Reddit's archived posts and Lemmy has nothing
         * for. It sits on `PublicContributionModel`, above the topic and the
         * comment alike, and the five places a vote can be cast all read it
         * before doing anything.
         */
        private const val ARCHIVED_FIELD = "n"

        /**
         * Marks a row's topic a spoiler, off Tildes' tag of that name.
         *
         * Tildes calls `spoiler` an important tag, like `nsfw`: drawn in every
         * listing and styled bold and red, where an ordinary tag is hidden
         * unless you ask for them. `nsfw` had a Lemmy boolean waiting for it
         * and this one had nothing, so a listing said nothing at all about a
         * topic the site marks in every row.
         *
         * The body carries the warning as well, which is what a topic's own
         * screen draws. This is the other half, and it is the half a listing
         * can show: a row draws a truncated preview rather than markdown, and a
         * link topic has no body to preview at all.
         *
         * Called from patched bytecode as a post is copied off the answer, so
         * every listing, profile and search that builds one goes through here.
         * Scoped on [answering] like the rest of what a listing is drawn from,
         * and on the topic being one this parsed, so a Lemmy post whose id
         * happens to match keeps Boost's own answer.
         */
        @JvmStatic
        fun spoilerRow(model: Any?) {
            if (!answering || model == null) return
            try {
                val id36 = model.javaClass.getField(TOPIC_ID_FIELD).let {
                    it.isAccessible = true
                    (it.get(model) as? String)?.toIntOrNull()
                }?.let { Lemmy.intToId36(it) } ?: return

                val tags = INSTANCE.topics[id36]?.tags ?: return
                if (!Lemmy.isSpoiler(tags)) return

                model.javaClass.getField(SPOILER_FIELD).apply {
                    isAccessible = true
                    setBoolean(model, true)
                }
            } catch (t: Throwable) {
            }
        }

        /**
         * Takes the vote off a topic Tildes would refuse one on.
         *
         * Tildes closes voting 30 days after a topic is posted, refuses it on
         * your own, and refuses it on anything removed. Boost votes
         * optimistically -- the score moves and the button fills in before the
         * request goes out -- and its failure path throws the error away, so a
         * vote that the site refused read as counted until the next refresh.
         *
         * What answers it is the page rather than the clock: Tildes draws a
         * vote button where the account may vote and a plain `div` where it may
         * not, so all three rules arrive as one already-made permission check.
         *
         * Boost has the control for this already and has never used it.
         * `PublicContributionModel.n` is read before every vote in the five
         * places one can be cast, and a model carrying it toasts rather than
         * voting. Nothing on the Lemmy path writes it -- the same shape the
         * spoiler flag was in -- so it is free here.
         *
         * Called from patched bytecode where a listing row's model is filled
         * in, which is the seam [spoilerRow] uses, and scoped the same way: on
         * [answering], and on the topic being one this parsed.
         */
        @JvmStatic
        fun voteClosedTopic(model: Any?) {
            if (!answering || model == null) return
            val id36 = idOf(model) ?: return
            if (INSTANCE.topics[id36]?.votingClosed != true) return
            closeVote(model)
        }

        /**
         * The same for a comment, off the thread last read.
         *
         * Kept as a set of ids rather than on a model, like the two predicates
         * beside it: Boost asks about a comment while it is drawing the thread
         * that comment is in, so anything this never saw keeps Boost's own
         * answer.
         *
         * Called from patched bytecode where a comment's model is filled in.
         */
        @JvmStatic
        fun voteClosedComment(model: Any?) {
            if (!answering || model == null) return
            val id36 = idOf(model) ?: return
            if (Lemmy.id36ToInt(id36).toString() !in closedComments) return
            closeVote(model)
        }

        /**
         * Whether Tildes would let this account tag a topic somebody else
         * wrote.
         *
         * Tagging on Tildes is a permission a group hands out rather than
         * something only the author holds, and it is most of what the site's
         * regulars do to a topic: a mistagged one gets fixed by whoever reads
         * it next. Boost has no idea any of that exists. Everything on a topic
         * that opens the composer is gated on `SubmissionModel.i()` -- "the
         * signed-in id equals the author's id" -- because on Lemmy nobody but
         * the author may touch a post at all.
         *
         * So this is the second half of that question rather than a
         * replacement for it. Boost's own answer runs first and still wins:
         * this is only asked where `i()` already said no, and answering yes
         * opens the same composer on somebody else's topic.
         *
         * **Nothing is guessed, and nothing costs a request.** A topic's page
         * draws a **Tag** button only for an account holding the permission,
         * which is [Tildes.Topic.actions], parsed off the page that was fetched
         * anyway. A topic whose page has never been read carries no actions at
         * all, so it answers no and the control stays exactly where Boost put
         * it -- which is also what a listing row answers until you have opened
         * the topic once.
         *
         * What rides along is the rest of the composer, and it is already
         * handled: [lockFields] greys out the title, the link and the text off
         * these same actions, and [retitle], [relink] and [retext] each write
         * only what changed, so a save on somebody else's topic sends the tag
         * `PUT` and nothing else. **Delete** is the one thing that does not
         * come right on its own -- see [mayTagRow].
         *
         * Called from patched bytecode, at the two guards that decide whether a
         * topic may be edited: the toolbar's Edit item inside a topic, and the
         * Edit submenu on a row's overflow.
         */
        @JvmStatic
        fun mayTag(model: Any?): Boolean = taggable(model) != null

        /**
         * The same answer for the overflow menu on a row, which needs one thing
         * more.
         *
         * That menu is a submenu rather than an item: **Edit**, and under it
         * Edit topic, Mark NSFW and **Delete**, all four built inside the one
         * guard. Two of the three under it are Tildes' tag permission spelt
         * differently -- the composer is a Tags field once [lockFields] has
         * been over it, and Mark NSFW adds and removes the `nsfw` tag -- and
         * the third is not: Tildes lets nobody but the author delete a topic,
         * so the row would be an offer the site answers **403** to.
         *
         * A row cannot be dropped where it is built. R8 outlined the add into a
         * chain where each row's last instruction hands back the next one, so
         * removing one means rewriting its neighbours. [trimMenu] already
         * filters the finished list for exactly that reason, and this is what
         * tells it which list: the menu is built and shown microseconds later
         * on the same thread, so the id set here is the id read there.
         *
         * Which is why this is a hook of its own rather than [mayTag] doing
         * both. The toolbar asks its question on every menu prepare and shows
         * no list of ours afterwards, so a marker set there would sit until
         * some unrelated menu picked it up.
         */
        @JvmStatic
        fun mayTagRow(model: Any?): Boolean {
            val id36 = taggable(model) ?: return false
            somebodyElsesTopic = id36
            return true
        }

        /**
         * The topic behind a model this account may edit and did not write, or
         * null for every other model in the app.
         *
         * **Two permissions open it rather than one.** What the composer comes
         * up as on somebody else's topic is a Tags field over a group row, and
         * Tildes hands those two out separately: `tag` is the group's to give,
         * `move` comes off its own permissions table. Most accounts holding
         * either hold both, which is why one condition read right for as long as
         * it did -- and an account holding only `move` could not reach the row
         * that moves a topic at all, because the screen it is on never opened.
         *
         * Either one opens it now, and what is live once it is open stays
         * decided per field: [dressGroupRow] locks the group row without `move`
         * and [lockFields] locks the Tags field without `tag`, so neither
         * permission carries the other's control in.
         *
         * Scoped on [Session.wasTildes] like the rest of what a view is built
         * from, and on the topic being one this parsed -- a Lemmy post whose id
         * happens to match a Tildes id36 finds nothing here.
         */
        private fun taggable(model: Any?): String? {
            if (model == null || !Session.wasTildes()) return null
            return try {
                val id36 = idOf(model) ?: return null
                // A listing draws no edit controls at all, so an empty set is
                // "nobody has asked" rather than "Tildes said no", and both
                // answer the same here: leave the control where Boost put it.
                val topic = INSTANCE.topics[id36] ?: return null
                val held = EDITOR_ACTIONS.filter { it in topic.actions }
                val may = held.isNotEmpty()

                // Once per topic rather than once per menu. This is asked every
                // time a toolbar is prepared, which is often enough to bury the
                // rest of the log.
                //
                // **The no is logged as well as the yes**, and it says which no
                // it is. A row that does not appear otherwise looks the same
                // whether Tildes withheld the permission, the page was never
                // read, or the injection never fired -- three different faults
                // with one symptom, and only the third is this patch's. The
                // buttons are what separates the first two: a topic page always
                // draws some, and a topic that came off a listing has none.
                //
                // **The answer is part of what makes it the same line**, not
                // just the topic. A topic is asked about from its listing row
                // before it is asked about from its own screen, and only the
                // second of those has a page behind it, so the answer flips
                // from no to yes as it is opened. Keyed on the id alone, the
                // flip was the one thing the log would not say -- the walk that
                // proved this works printed the row's no and then nothing at
                // all.
                if ("$id36 $may" != tagAsked) {
                    tagAsked = "$id36 $may"
                }
                if (may) id36 else null
            } catch (t: Throwable) {
                null
            }
        }

        /**
         * The two permissions that open Boost's composer on a topic this
         * account did not write, in the order the log names them.
         *
         * Both reach the same screen and neither is the other's shorthand.
         * Tildes grants `tag` through the group, which is most of what its
         * regulars do to a topic, and `move` through its permissions table,
         * which is how a topic ends up in the group it belongs in. An account
         * can hold either alone.
         */
        private val EDITOR_ACTIONS = listOf("tag", "move")

        /** The last topic [taggable] answered about, so the log says it once. */
        @Volatile
        private var tagAsked: String? = null

        /**
         * The topic whose overflow menu is being built, when it is one this
         * account may tag and did not write. Read once and cleared, the way
         * [groupsPageMenu] is. See [mayTagRow].
         */
        @Volatile
        private var somebodyElsesTopic: String? = null

        /** The id Boost left on a model, as Tildes spells it. */
        private fun idOf(model: Any): String? =
            try {
                model.javaClass.getField(TOPIC_ID_FIELD).let {
                    it.isAccessible = true
                    (it.get(model) as? String)?.toIntOrNull()
                }?.let { Lemmy.intToId36(it) }
            } catch (t: Throwable) {
                null
            }

        /**
         * Marks a model as one Boost may not vote on, which is the flag it
         * inherited from Reddit's archived posts.
         *
         * The field is final, in the sense that Boost only ever assigns it in
         * the parcel constructor, so this is a reflective write with the final
         * bit set. That is allowed for an instance field once the field is
         * accessible, and the failure if it ever stops being allowed is this
         * line rather than the app: the vote goes back to what it does now,
         * which is to look like it worked.
         */
        private fun closeVote(model: Any) {
            try {
                model.javaClass.getField(ARCHIVED_FIELD).apply {
                    isAccessible = true
                    setBoolean(model, true)
                }
            } catch (t: Throwable) {
            }
        }

        /**
         * Which vote the topic screen keeps when it refreshes.
         *
         * Boost carries the vote and the bookmark off the old model onto the
         * freshly fetched one -- `submissionModel.i = submissionModel2.i` in
         * `CommentsFragment.o0` -- so that a slow refresh cannot undo something
         * you just tapped. The cost is that a vote cast anywhere else can never
         * appear: the answer says one thing and the screen keeps the other, for
         * as long as the topic stays open.
         *
         * Here the answer is worth more than that. It was parsed off the
         * topic's own page a moment ago, and everything done in the app lands
         * in the same map on its way out, so what this remembers is both what
         * Tildes says and what you just did.
         *
         * Called from patched bytecode, in front of each of the two copies,
         * with the value Boost was about to keep and the model it was about to
         * write it onto.
         */
        @JvmStatic
        fun voteAfterRefresh(boostsOwn: Int, model: Any?): Int {
            val topic = refreshed(model) ?: return boostsOwn
            return if (topic.voted) 1 else 0
        }

        /** And the bookmark beside it, which is copied the same way. */
        @JvmStatic
        fun bookmarkAfterRefresh(boostsOwn: Boolean, model: Any?): Boolean =
            refreshed(model)?.bookmarked ?: boostsOwn

        /** What this last knew about the topic a model stands for. */
        private fun refreshed(model: Any?): Tildes.Topic? {
            if (!Session.wasTildes() || model == null) return null
            return INSTANCE.topics[idOf(model) ?: return null]
        }

        /**
         * A pull to refresh, which is the one fetch somebody asked for.
         *
         * Pages are cached for 30 seconds so that going back and forth between
         * a feed and a topic costs nothing upstream. That is right for
         * everything the app does on its own and wrong here: a bookmark added
         * on tildes.net and a refresh in the app inside that window drew the
         * page as it was, which reads like a write that did not take rather
         * than a copy that is half a minute old.
         *
         * So a gesture reads past the cache for the next few seconds. The two
         * limits that matter to the site are untouched -- requests are still
         * 700 ms apart and a fetch already in flight is still joined rather
         * than repeated -- and the window is short, so what it costs is the
         * page that was asked for rather than a session with no cache.
         *
         * Called from patched bytecode, from every class that listens for that
         * gesture, which is what the swipe layout hands it to.
         */
        @JvmStatic
        fun pulledToRefresh() {
            if (!Session.wasTildes()) return
            Tildes.readPastCache()
        }

        /**
         * The one word on the composer the wording cannot reach.
         *
         * "Create post" is the activity's label in the manifest, and a label is
         * resolved by the system out of the app's own configuration rather than
         * out of the context a screen was built with, so the mcc999 table never
         * gets a look at it. Every other string here is a `getString` on the
         * activity and already reads Tildes' word.
         *
         * Setting it again from the same resource is all it takes, since the
         * activity's own resources are the wrapped ones. Boost's own method for
         * it goes through `getString` too.
         *
         * Only for a new topic: editing one and cross-posting both set a title
         * of their own a few instructions earlier, and those are already
         * translated.
         */
        private fun toolbarTitle(activity: Activity) {
            if (activity.intent?.hasExtra(SUBMISSION) == true) return
            val title = id(activity, "submit_activity_title", "string")
            if (title == 0) return

            try {
                activity.javaClass
                    .getMethod("setToolbarTitle", Int::class.javaPrimitiveType)
                    .invoke(activity, title)
            } catch (t: Throwable) {
                activity.setTitle(title)
            }
        }

        /**
         * Greys out the inputs Tildes would refuse, with the reason under them.
         *
         * Boost draws a Title, a Link and a Text box on every edit because
         * Lemmy takes all three for as long as a post exists. Tildes takes far
         * less, and what it takes narrows as a topic ages:
         *
         * | Field | A text topic | A link topic |
         * | --- | --- | --- |
         * | Title | Five minutes, then moderators | The same |
         * | Link | Never, the author does not own it | The same |
         * | Text | Always, it is what the topic is | **Never** |
         * | Tags | Always | Always |
         *
         * So a link topic five minutes old is a Tags field and nothing else.
         * Left alone, the rest invite an edit that is sent, refused, and comes
         * back as the words that were already there -- and the text is worse
         * than the other two, because Tildes answers **403** rather than a
         * validation error and the whole save goes down with it, tags included.
         *
         * What Tildes allows is not guessed at here. Its topic page draws an
         * **Edit title** button only for an account that may use one, and an
         * **Edit link** and an **Edit** the same way, so the buttons on the
         * page the topic was read from are the permission check, already made
         * and already fetched. A topic whose page has not been read says
         * nothing about the first two, and nothing is locked on a guess:
         * [Tildes.Topic.fromTopicPage] is what separates "Tildes said no" from
         * "nobody has asked".
         *
         * The text is the exception, and it is not a guess either. Tildes
         * grants `edit` to text topics alone, so the answer is which kind of
         * topic it is rather than what this account may do, and a listing
         * already said that.
         */
        private fun lockFields(activity: Activity, id36: String?) {
            val topic = id36?.let { INSTANCE.topics[it] } ?: return

            // The text is the one of the three that needs no page read to know
            // the answer, because it is the site's shape rather than a
            // permission that varies: Tildes grants `edit` to text topics
            // alone, so a link topic takes no markdown from anyone at any age,
            // and a listing already said which kind this is. The page is still
            // asked when it has been read, since that is what will say no once
            // the composer opens on somebody else's topic.
            lock(
                wrapperOf(activity.findViewById(id(activity, "submit_optional_text"))),
                "the text box",
                topic.linkUrl == null && (!topic.fromTopicPage || "edit" in topic.actions),
                // Two different noes, and the composer now opens on both. A
                // link topic takes no markdown from anyone, while a text topic
                // takes it from its author, which is what a reader here to fix the
                // tags is not. Saying the first on the second would name the
                // wrong rule on the screen `mayTag` opens most often.
                if (topic.linkUrl != null) {
                    "Tildes takes no text on a link topic"
                } else {
                    "Only the author can edit a topic's text"
                },
            )

            groupRow(activity, topic)

            if (!topic.fromTopicPage) return
            lock(
                activity.findViewById(id(activity, "submit_title_wrapper")),
                "submit_title_wrapper", "edit-title" in topic.actions,
                "Tildes takes a new title for five minutes after posting",
            )
            lock(
                activity.findViewById(id(activity, "submit_url_wrapper")),
                "submit_url_wrapper", "edit-link" in topic.actions,
                "Only a group's moderators can point a topic somewhere else",
            )
            // And the tags, which had been the one field on this screen that
            // was always live. It could be, while `tag` was the only thing that
            // opened the composer on somebody else's topic -- the field was
            // live exactly where the permission was held. Now that `move`
            // opens it too, a mover would have been offered the one control
            // Tildes answers 403 for.
            //
            // Safe on your own topic for the reason the two above are safe:
            // this is past the `fromTopicPage` guard, and a topic page draws a
            // `tag` button for its own author whatever the group has granted.
            lock(
                activity.findViewById(id(activity, "submit_thumbnail_url_wrapper")),
                "submit_thumbnail_url_wrapper", "tag" in topic.actions,
                "This group has not given you tagging",
            )
        }

        /**
         * The group a topic is in, which is the row on this screen that has
         * never done anything.
         *
         * Boost draws it above the title on an edit as well as on a new topic,
         * chevron and all, and the listener behind it opens with "am I
         * editing? then return". So it has been a row that looks like a
         * control and answers no tap, in every install, Lemmy included. Lemmy
         * is why: a community is part of a post's identity there, `EditPost`
         * carries no `community_id`, and there is nothing the row could do.
         *
         * Tildes does have the thing it looks like. So on a topic this account
         * may move, the row gets a listener of its own that opens the very
         * picker Boost's own would have: `onActivityResult` is **not** gated
         * the way the click is, so the choice lands in Boost's own view model
         * and is drawn by Boost's own observer. Nothing here draws anything.
         *
         * And on every other topic it is locked, which includes a topic whose
         * page nobody has read. That is the opposite of what the three fields
         * under it do with an unknown, and deliberately: leaving one of those
         * alone leaves a control that works, while leaving this one alone
         * leaves the dead row Boost drew.
         *
         * The pick is read back off the row rather than out of the picker. See
         * [composerGroup].
         */
        private fun groupRow(activity: Activity, topic: Tildes.Topic) {
            val row = activity.findViewById<View>(id(activity, "submit_select_subreddit"))
                ?: return
            // After Boost, not before it. The chevron is shown by an observer
            // on the view model the topic is published to, and a live data
            // hands a value to a lifecycle-aware observer no earlier than
            // `onStart` -- which is after the end of `onCreate`, where this
            // runs. Hiding it here would be hiding it before it was shown.
            //
            // A post from `onCreate` lands at the first traversal, so it is
            // after `onStart` either way and still before anything is drawn.
            // The log says which order actually happened, since that is a
            // question about the app rather than about the framework.
            row.post {
                try {
                    dressGroupRow(activity, row, topic)
                } catch (t: Throwable) {
                }
            }
        }

        /** The row itself, once Boost has finished with it. */
        private fun dressGroupRow(activity: Activity, row: View, topic: Tildes.Topic) {
            val may = "move" in topic.actions
            val chevron = activity.findViewById<View>(id(activity, "dropdown"))
            lockRow(activity, row, chevron, may)
            if (!may) return

            row.setOnClickListener {
                activity.startActivityForResult(
                    Intent().setClassName(activity, PICK_GROUP_SCREEN),
                    PICK_GROUP,
                )
            }
            activity.findViewById<TextView>(id(activity, "item_subreddit_name"))
                ?.addTextChangedListener(object : TextWatcher {
                    override fun afterTextChanged(s: Editable?) {
                        composerGroup = s?.toString()?.trim()
                            ?.removePrefix("~")?.substringBefore('@')?.ifEmpty { null }
                    }

                    override fun beforeTextChanged(s: CharSequence?, a: Int, b: Int, c: Int) = Unit
                    override fun onTextChanged(s: CharSequence?, a: Int, b: Int, c: Int) = Unit
                })
        }

        /**
         * Boost's own group picker, and the code it answers under. Both are
         * Boost's rather than ours: this only starts what its own row would
         * have started, so the result comes back to the handler already
         * written for it.
         *
         * The class keeps its name where Boost's fields do not, since it is in
         * the manifest.
         */
        private const val PICK_GROUP_SCREEN =
            "com.rubenmayayo.reddit.ui.search.PickSubredditActivity"

        private const val PICK_GROUP = 143

        /**
         * A row that is a tap rather than a field, on or off.
         *
         * [lock] would say nothing here: the three fields under this one are
         * material text layouts, which draw their own grey and carry a helper
         * line to put a reason on, and this is a picture, a name and a chevron.
         * So the lock is what the row itself can show -- it stops taking taps,
         * it dims, and the chevron goes.
         *
         * **The tap and the picture are two different views**, which is the
         * whole reason this takes three. `submit_select_subreddit` is an empty
         * `FrameLayout` the width of the screen, laid over a sibling holding
         * the icon, the name and the chevron, and it is the tap and nothing
         * else. Dimming it dims nothing, and the chevron is not under it to be
         * found. So the tap goes on the overlay and the grey goes on the
         * sibling, reached through the chevron's own parent.
         *
         * **The chevron is the half that matters.** It is the only thing on the
         * row saying it can be tapped at all, so a row without one reads as the
         * group this topic is in rather than as a control that refused.
         */
        private fun lockRow(activity: Activity, row: View, chevron: View?, allowed: Boolean) {
            row.isEnabled = allowed
            row.isClickable = allowed
            val shown = chevron?.parent as? View
                ?: activity.findViewById<View>(id(activity, "subreddit_view"))
            shown?.alpha = if (allowed) 1f else LOCKED_ALPHA
            hide(chevron, !allowed)
        }

        /** What a locked row dims to, which is material's own disabled alpha. */
        private const val LOCKED_ALPHA = 0.38f

        /**
         * The material wrapper around an input, for the one field that has no
         * id of its own to find it by.
         *
         * Title and Link are wrapped in a `TextInputLayout` Boost named; the
         * text box is wrapped in one it did not. So the wrapper is found by
         * what it can do rather than by what it is called, which is the same
         * helper line [lock] is about to write.
         */
        private fun wrapperOf(input: View?): View? =
            generateSequence(input?.parent as? View) { it.parent as? View }
                .firstOrNull { view ->
                    try {
                        view.javaClass.getMethod("setHelperText", CharSequence::class.java)
                        true
                    } catch (t: Throwable) {
                        false
                    }
                }

        /** One input, on or off, with [why] under it while it is off. */
        private fun lock(layout: View?, wrapper: String, allowed: Boolean, why: String) {
            if (layout == null) return
            // The wrapper, not the input inside it. A material text field draws
            // its outline, its floating label and its hint off its own enabled
            // state, so disabling the input alone greys the words already in it
            // and nothing else -- which reads as two different locks on a
            // filled Title and an empty Link. Its `setEnabled` walks its
            // children, and the input is set again after it so a version that
            // stops doing that costs the look rather than the lock.
            layout.isEnabled = allowed
            editTextIn(layout)?.isEnabled = allowed
            // And the label is floated out of the box while it is locked, which
            // is what a field with nothing in it needs.
            //
            // Disabling greys three things: the outline, the label and whatever
            // words are in the field. An empty one has only the first two, and
            // its label is not where the eye compares it -- a material field
            // draws the label inside the box until there is something to sit
            // above, so an empty locked field reads as an ordinary empty field
            // while the one above it, with a link in it, reads as locked. This
            // is the switch for that, and the two then look alike.
            set(layout, "setExpandedHintEnabled", allowed, wrapper)

            // The helper line is the material layout's, so it is set by name
            // like the end icon beside it. Worth nothing on its own, which is
            // why a version without it costs the explanation rather than the
            // lock.
            try {
                layout.javaClass
                    .getMethod("setHelperText", CharSequence::class.java)
                    .invoke(layout, if (allowed) null else why)
            } catch (t: Throwable) {
            }
        }

        /** One of the material layout's own booleans, set by name. */
        private fun set(layout: View, method: String, value: Boolean, wrapper: String) {
            try {
                layout.javaClass
                    .getMethod(method, Boolean::class.javaPrimitiveType)
                    .invoke(layout, value)
            } catch (t: Throwable) {
            }
        }

        /**
         * The input inside a wrapper, found by walking it rather than by asking
         * the material layout for it, since the ids inside a wrapper are the
         * one thing here with no name of their own.
         */
        private fun editTextIn(view: View?): EditText? = when (view) {
            null -> null
            is EditText -> view
            is ViewGroup -> (0 until view.childCount)
                .firstNotNullOfOrNull { editTextIn(view.getChildAt(it)) }
            else -> null
        }

        /** A resource id by name, since the numbers renumber every release. */
        private fun id(context: Context, name: String, type: String = "id"): Int =
            context.resources.getIdentifier(name, type, context.packageName)

        private fun hide(view: View?, gone: Boolean = true) {
            view?.visibility = if (gone) View.GONE else View.VISIBLE
        }

        /**
         * Takes the trailing button off a text field. Material's own name for
         * it, reached by reflection so the extension needs no dependency on a
         * library the app already carries.
         */
        private fun endIconOff(wrapper: View?) {
            if (wrapper == null) return
            wrapper.javaClass
                .getMethod("setEndIconMode", Int::class.javaPrimitiveType)
                .invoke(wrapper, END_ICON_NONE)
        }

        /** `TextInputLayout.END_ICON_NONE`. */
        private const val END_ICON_NONE = 0

        /**
         * Makes a menu Tildes' on its way in: the rows the site has nothing for
         * come out, and the sorts left read the way its own tabs do.
         *
         * What is left of a sort menu is Tildes' five orders and, under `From…`,
         * the five windows its dropdown offers plus all time. Hot and
         * Controversial are `activity` again, `Old` is the one that lies since
         * nothing on the site sorts ascending, and a month and a year are
         * windows the site does not put on offer.
         *
         * A **comment** sort menu is the same four strings again meaning four
         * different things, and it is told apart before anything is read off
         * it: nothing comes out of it, and its rows read relevance, most votes,
         * newest first and order posted, which is what the site's own dropdown
         * over a comment tree says.
         *
         * The same pass takes **Downvote**, **Report**, **Cross-posts** and
         * **Cross-post** off the menus a topic, a comment and a message carry,
         * which are the rows Tildes cannot answer. Downvote only appears where
         * the row has no button to tap, while the rest are always there.


         * Called from patched bytecode where every menu in the app is handed
         * to the view that draws it, rather than where any one of them is
         * built. Four separate methods build sort rows, one per model class,
         * and hooking the two that were found left the feed's menu whole with
         * nothing in the log.
         *
         * A row is found by which string it is labelled with rather than by the
         * id it carries, so this stays out of the way of every other menu that
         * passes through here. The id is read once, of the menu rather than of
         * a row, and only to answer which of the two sort menus this is.
         *
         * Scoped on [answering], like the answers above, so a Lemmy account in
         * the same app keeps all sixteen of its sorts under their own names and
         * both of its votes. A feed has always loaded before the menu inside it
         * can be opened, which is what makes the flag readable here.
         */
        @JvmStatic
        fun trimMenu(view: Any?, options: MutableList<Any>?) {
            // Read once and cleared whatever happens, so the next menu through
            // here cannot inherit it. See [groupSortMenu].
            val fromGroupsPage = options != null && groupsPageMenu === options
            groupsPageMenu = null
            val somebodyElses = somebodyElsesTopic
            somebodyElsesTopic = null

            if (!answering || options.isNullOrEmpty()) return
            val rows = rows() ?: return
            val comments = !fromGroupsPage && isCommentSort(options, rows)

            val table = when {
                fromGroupsPage -> rows.group
                comments -> rows.comment
                else -> rows.post
            }

            val before = rowsIn(options)

            // A profile's menu is a different menu with three of the same rows
            // in it, and what a row means there depends on which tab is open.
            // So it is answered whole, here, rather than by the tables above.
            val tab = profileMenuTab(view, options, rows)
            if (tab != null) {
                val worded = trimProfileMenu(options, rows, tab)
                dropTrailingBlanks(options, rows)
                return
            }

            // Ahead of the translate below, since that is what takes the year
            // row out and this reads it on the way past.
            val window = addOtherPeriod(options, rows)
            val worded = translate(options, rows, table, DEPTH)
            val listing = dropListingRows(options, rows)
            val delete = dropDeleteRow(options, rows, somebodyElses, DEPTH)
            val after = rowsIn(options)
            val shortened = shortenLinks(options, DEPTH)
            val twice = dropSaidTwice(options, rows, DEPTH)
            val added = addTitleAndTopic(options, rows, DEPTH)
            val logged = addTopicLog(options, rows)
            val labels = addCommentLabels(options, rows)

            if (before != after || worded > 0 || shortened > 0 || twice > 0 || added > 0 ||
                window || logged || labels
            ) {
                val kind = when {
                    fromGroupsPage -> "group sort menu"
                    comments -> "comment sort menu"
                    listing > 0 -> "search menu"
                    delete > 0 -> "menu on $somebodyElses"
                    else -> "menu"
                }
            }
        }

        /**
         * Which tab of a profile a menu was opened over, or null for every other
         * menu in the app.
         *
         * Two questions, and both have to answer. **Is this the sort menu** --
         * asked of the rows, since the same screen opens four other menus over a
         * row in its list and a long press on one is not a sort. **And whose** --
         * asked of the view, since the rows say nothing about it: `hj.m` builds a
         * profile's menu, a site browser's and three search screens', and only
         * the profile passes its fifth argument.
         *
         * The view answers because the callback is already on it by the time the
         * rows arrive: `UserContributionListFragment.onOptionsItemSelected` calls
         * `setCallback` one instruction before `setMenuOptions`, and that
         * callback holds the fragment, and [profileList] is that walk.
         *
         * The tab is then the fragment's own `contribution_type`, which is the
         * word the pager built it with rather than anything read off the screen.
         */
        private fun profileMenuTab(view: Any?, options: List<Any>, known: Rows): String? {
            if (view !is View || known.sortRows.isEmpty()) return null
            if (options.none { titleOf(it, known) in known.sortRows }) return null
            val fragment = profileList(view) ?: return null
            return contributionType(fragment)
        }

        /**
         * A profile's sort menu, cut down to what the tab under it can be asked
         * for.
         *
         * Boost draws the same menu on every tab: a group filter, then New, Old
         * and a **From...** submenu of six windows. Tildes has none of that. A
         * profile takes no window on any tab and no group filter on any tab, and
         * only two of the six tabs take an order at all.
         *
         * So the whole block comes off, and the rows for the orders this tab does
         * have go back on -- the same row objects, lifted out of the submenu they
         * were windows in, relabelled and laid down in the order tildes.net's own
         * dropdown lists them. Lifting rather than building is what keeps the tap
         * working: a row Boost built carries an id its own dispatcher has a case
         * for, so picking one sets the sort and reloads the list without this
         * having to find either.
         *
         * The divider under the group filter goes with it, having nothing left to
         * separate. The Bookmarks tab's two rows and the **Show all** beside them
         * are untouched: those are kind filters rather than orders, and they are
         * the one thing in this menu the site really does have two of.
         *
         * Answers how many rows were given a word of Tildes' own.
         */
        private fun trimProfileMenu(options: MutableList<Any>, known: Rows, tab: String): Int =
            try {
                // Every row that could carry an order, wherever it sits: two are
                // the menu's own and the rest hang under From....
                val carriers = HashMap<String, Any>()
                collectOrders(options, known, carriers)

                val allGroups = options.indexOfFirst { titleOf(it, known) == known.allGroupsRow }
                if (allGroups != -1 && allGroups + 1 < options.size &&
                    blankRow(options[allGroups + 1], known)
                ) {
                    options.removeAt(allGroups + 1)
                }
                options.removeAll { titleOf(it, known) in known.groupFilterRows }
                options.removeAll { titleOf(it, known) in known.sortRows }

                var worded = 0
                PROFILE_TAB_ORDERS[tab].orEmpty().forEach { order ->
                    val row = carriers[order] ?: return@forEach
                    val word = ORDER_WORDS[order] ?: return@forEach
                    relabel(row, word)
                    noIcon(row)
                    options.add(row)
                    worded++
                }
                worded
            } catch (t: Throwable) {
                0
            }

        /**
         * Takes a row's icon off, which is what makes five lifted rows read as
         * one list.
         *
         * Six of the eight windows carry no icon -- they were rows under a parent
         * that carried one for them -- and **New** does, so a menu built out of
         * both would draw one icon and four gaps. Rather than invent five, the
         * one goes.
         *
         * Which field it is comes from a fresh row rather than from a name: Boost
         * starts the icon at `-1` where every other int on a new one is zero, and
         * [iconOf] is the same read a row built here makes to copy one.
         */
        private fun noIcon(row: Any) {
            val fresh = row.javaClass.getDeclaredConstructor().newInstance()
            iconOf(fresh)?.apply {
                isAccessible = true
                setInt(row, NO_ICON)
            }
        }

        /** What Boost leaves in that field for a row it draws no icon on. */
        private const val NO_ICON = -1

        /** The first row carrying each order, the submenu counted with the menu. */
        private fun collectOrders(
            options: List<Any>,
            known: Rows,
            found: MutableMap<String, Any>,
        ) {
            options.forEach { row ->
                known.profileOrders[titleOf(row, known)]?.let {
                    if (!found.containsKey(it)) found[it] = row
                }
                submenusOf(row).forEach { collectOrders(it, known, found) }
            }
        }

        /** One row or none, for a count that has to add up. */
        private fun Boolean.toInt(): Int = if (this) 1 else 0

        /**
         * A divider, which is the one row Boost builds with neither a title nor
         * an id: `MenuOption.m` alone, drawn as a line. The rows this project
         * adds keep an id, so none of them reads as one.
         */
        private fun blankRow(row: Any, known: Rows): Boolean =
            titleOf(row, known) == 0 && rowIdOf(row) == 0

        /**
         * And a line with nothing under it any more, which is what a menu ending
         * in a divider draws. The Bookmarks tab is the one that gets there: its
         * two kind rows survive and everything the divider separated them from
         * does not.
         */
        private fun dropTrailingBlanks(options: MutableList<Any>, known: Rows) {
            while (options.isNotEmpty() && blankRow(options.last(), known)) {
                options.removeAt(options.size - 1)
            }
        }

        /**
         * The sort button itself, off the tabs whose menu this leaves empty.
         *
         * Three of the six have neither an order nor a kind filter -- All posts,
         * Votes and Ignored -- and an empty menu is not nothing on screen:
         * `MenuView` draws whatever the list holds and its dialog is shown either
         * way, so the button would open a sheet of padding. Boost has no such
         * case of its own, since `hj.m` always ends by adding the sort block.
         *
         * Taken off where the fragment inflates it, which is one item out of a
         * menu the activity has already put nine of its own into -- so it goes by
         * id rather than by clearing what is there. `menu_user_sort.xml` is the
         * only place in the app that inflates `action_sort` onto this screen.
         *
         * The two tabs that do have orders keep it. **Bookmarks used to as well**,
         * for its **Show topics** and **Show comments** rows, and those are a
         * strip inside the tab now -- see [bookmarksStrip], which is also what
         * decides this: a strip that could not be built leaves the button and
         * the rows where they were.
         *
         * Called from patched bytecode, once per tab, after the inflate.
         */
        @JvmStatic
        fun profileSortButton(fragment: Any?, menu: Menu?) {
            if (fragment == null || menu == null || !Session.wasTildes()) return
            try {
                val tab = contributionType(fragment) ?: return

                // And the row the site has that this menu is missing, put in
                // ahead of everything below because the two tabs it belongs on
                // are the two this returns early for. See [addSearchRow].
                addSearchRow(fragment, menu, tab)

                // The two tabs the site draws as two tabs get a strip. Bookmarks
                // used to keep this button for its three kind rows, and the strip
                // carries that choice now, so the rows have nothing left to say.
                // Votes never had an order either way.
                if (tab in TWO_TAB_PAGES) {
                    if (!kindStrip(fragment, tab) && tab == BOOKMARKS_TAB) return
                } else if (!PROFILE_TAB_ORDERS[tab].isNullOrEmpty()) {
                    return
                }
                val context = Session.application() ?: return
                val button = id(context, SORT_BUTTON)
                if (button == 0) {
                    return
                }
                menu.removeItem(button)
            } catch (t: Throwable) {
            }
        }

        /**
         * Puts **Search your topics** on your own profile's toolbar.
         *
         * Tildes draws a search box on a profile, and it is the one scope on
         * this site Boost has nothing for: its search screen searches the whole
         * site and its four tabs are spoken for. So the way in is the profile's
         * own toolbar, which is where the site puts it.
         *
         * **On the two tabs the site draws it on, and no others.** Tildes only
         * renders the box when a `type` is set, which is its Topics and its
         * Comments listing; All posts, Bookmarks, Votes and Ignored get nothing.
         * Those two tabs are exactly the two [PROFILE_TAB_ORDERS] has, so the
         * question is already asked and answered here.
         *
         * **Which is why it goes on from here rather than from the screen.** The
         * activity's own menu knows nothing about which tab is showing, so a row
         * added there was on all six -- and worse, it survived a tab change,
         * since the activity readies its menu again while the fragment's inflate
         * is what rebuilds it. Visiting Topics and going back to All posts left
         * the row behind. This runs once per tab, after that inflate, with the
         * tab in hand, so the row is rebuilt with the menu and cannot outlive
         * the tab it belongs to. **And it costs no bytecode**: this hook was
         * already here to take the sort button off four tabs.
         *
         * **Only on your own profile**, because that is the whole of who the
         * route is for: `search_posts` is granted to an account on itself and to
         * nobody else, so the row on anybody else's would be a 403 with a tap in
         * front of it. Whose profile this is comes off the fragment's own
         * arguments, where the tab beside it already comes from.
         *
         * **First on the toolbar**, ahead of **Sort** at ten, so that the three
         * controls sit in the order a group's screen already puts them in:
         * search, sort, overflow.
         *
         * **The results land in the tab the row is on**, which is what the site
         * does: submitting its box keeps you on a user page with the same tabs
         * and the same sort over them, filtered. So there is no screen to open
         * and no listing to name -- the query is remembered against the tab and
         * [userListing] asks the search route instead of the plain one. Which is
         * also what puts the comments half within reach, that tab being the one
         * place in the app that draws a person's comments.
         */
        private fun addSearchRow(fragment: Any, menu: Menu, tab: String) {
            if (PROFILE_TAB_ORDERS[tab].isNullOrEmpty()) return
            try {
                val me = mineToSearch(fragment) ?: return
                val context = Session.application() ?: return

                // The strip goes on from here as well as from the dialog. A tab
                // that was left searching is being built again, and its view is
                // rebuilt with it, so the strip has to be put back rather than
                // remembered -- and the words on the row have to say which of
                // the two states this tab is in before it is opened.
                searchStrip(fragment, tab, me)

                if (menu.findItem(SEARCH_POSTS_ROW) != null) return
                val icon = id(context, SEARCH_ICON, "drawable")
                menu.add(Menu.NONE, SEARCH_POSTS_ROW, SEARCH_POSTS_ORDER, searchWords(tab))
                    .apply {
                        if (icon != 0) setIcon(icon)
                        setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM)
                        setOnMenuItemClickListener {
                            // The screen is read at the tap rather than now: the
                            // menu is built before the fragment's view is, and
                            // by the time anything is pressed there is one.
                            screenOf(fragment)?.let { askForSearch(it, fragment, tab, me) }
                            true
                        }
                    }
            } catch (t: Throwable) {
            }
        }

        /**
         * The name whose posts that row would search, or null wherever it must
         * not be drawn.
         *
         * The name is the fragment's own `username` argument, which is where the
         * tab beside it comes from too -- so this asks the object already being
         * asked, rather than reflecting into the screen behind it for the flag
         * Boost works the same thing out with.
         *
         * **The instance comes off it first.** Boost writes `name@instance`
         * wherever it is not sure an account is local, and which spelling
         * reaches an argument is not worth depending on. Tildes federates with
         * nothing, so everything before the `@` is the whole name -- the same
         * reading [personName] makes of the same question.
         *
         * **A parked session answers null.** Parking leaves the name on disk on
         * purpose, so that picking the account again costs no two-factor login,
         * which means [ownName] still answers while nobody is signed in. A guest
         * holds no permission on anybody's posts.
         */
        private fun mineToSearch(fragment: Any): String? {
            if (Session.wasGuest()) return null
            val me = ownName() ?: return null
            val args = fragment.javaClass.getMethod(ARGUMENTS_GETTER)
                .invoke(fragment) as? Bundle ?: return null
            val whose = args.getString(PROFILE_USERNAME)?.substringBefore('@') ?: return null
            return me.takeIf { whose.equals(it, ignoreCase = true) }
        }

        /**
         * The box that row opens, and the tab it filters after it.
         *
         * A framework dialog, for the reason the typed window's two pickers are
         * in one: Boost's own builder is a trimmed Afollestad whose class and
         * methods are single letters out of R8, four of which cannot be told
         * apart by their signatures. Boost draws framework dialogs itself in two
         * places, so this is the app's own precedent rather than a departure.
         *
         * **An empty box is refused rather than sent.** `q` defaults to the
         * empty string on that route and the site answers the whole listing for
         * it, which is the tab the box was opened from with a strip over it
         * claiming to be a search. So the button is greyed until something is
         * typed, the way **OK** is greyed under a window of zero hours -- and
         * **Clear** is the row that means the empty one, offered only when there
         * is a search to clear.
         *
         * What is in the box is what the tab is searching for, so reopening it
         * on a filtered tab offers the query back rather than a blank line.
         */
        private fun askForSearch(screen: Activity, fragment: Any, tab: String, me: String) {
            val now = searchOn(me, tab)
            val box = EditText(screen).apply {
                setSingleLine()
                hint = searchWords(tab)
                setText(now.orEmpty())
                setSelection(text.length)
            }

            val gap = (20 * screen.resources.displayMetrics.density).toInt()
            val around = LinearLayout(screen).apply {
                orientation = LinearLayout.VERTICAL
                setPadding(gap, gap / 2, gap, 0)
                addView(
                    box,
                    LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT,
                    ),
                )
            }

            val builder = AlertDialog.Builder(screen)
                .setTitle(searchWords(tab))
                .setView(around)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton(SEARCH_BUTTON) { _, _ ->
                    box.text.toString().trim().takeIf { it.isNotEmpty() }
                        ?.let { searchFor(fragment, tab, me, it) }
                }
            if (now != null) {
                builder.setNeutralButton(CLEAR_BUTTON) { _, _ ->
                    searchFor(fragment, tab, me, null)
                }
            }

            val dialog = builder.create()
            val typed = {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE)?.isEnabled =
                    box.text.toString().trim().isNotEmpty()
            }
            box.addTextChangedListener(object : TextWatcher {
                override fun afterTextChanged(s: Editable?) = typed()
                override fun beforeTextChanged(s: CharSequence?, a: Int, b: Int, c: Int) = Unit
                override fun onTextChanged(s: CharSequence?, a: Int, b: Int, c: Int) = Unit
            })
            dialog.setOnShowListener { typed() }
            dialog.show()
        }

        /**
         * Setting it, or taking it off, which is the same three steps either
         * way: the query, the strip that says so, and a reload.
         *
         * **The reload is `onRefresh`**, which is what the kind strip on the
         * Bookmarks and Votes tabs already uses for exactly this -- a filter
         * changed on a tab, and the presenter asked for a fresh first page. It
         * is the one method on that fragment R8 left a name on, being a click
         * binding, and `:patches:test` pins it against every release in the repo.
         *
         * Paging takes care of itself: the cursor key [userListing] builds holds
         * the query, so the pages of one search are not the pages of another and
         * neither is the unfiltered tab's.
         */
        private fun searchFor(fragment: Any, tab: String, me: String, query: String?) {
            try {
                val key = searchKey(me, tab)
                if (query == null) INSTANCE.profileSearches.remove(key)
                else INSTANCE.profileSearches[key] = query

                searchStrip(fragment, tab, me)
                fragment.javaClass.getMethod(LIST_REFRESH).invoke(fragment)
            } catch (t: Throwable) {
            }
        }

        /**
         * The line over the list saying what it is filtered by, and the way off
         * it.
         *
         * **Because a mode with nothing on screen to say so is the whole risk
         * here.** The site has no such risk: its results are a page of their
         * own, at a URL that says what it is, reached by a form you can see. In
         * the app the tab looks exactly as it did with fewer rows in it, so the
         * strip stands in for all three -- it names the query, and the cross on
         * the end is the way back to the unfiltered tab.
         *
         * It goes where the Bookmarks and Votes strip goes, in the fragment's
         * own `RelativeLayout`, above the refresh wrapper rather than inside it:
         * inside, it would scroll with the list or be hidden along with it when
         * a search finds nothing -- which is exactly when it most needs reading.
         *
         * Put on from two places, since neither covers the other. The dialog is
         * where a search starts, and the view is certainly built by then. The
         * menu is where a tab that was already searching comes back, its view
         * rebuilt with it and the strip gone with the old one.
         */
        private fun searchStrip(fragment: Any, tab: String, me: String) {
            try {
                val root = viewOf(fragment) as? RelativeLayout ?: return
                val already = root.findViewWithTag<View>(SEARCH_STRIP)
                val query = searchOn(me, tab)

                if (query == null) {
                    already ?: return
                    root.removeView(already)
                    // What was anchored under it has nothing to be under.
                    for (at in 0 until root.childCount) {
                        val child = root.getChildAt(at)
                        (child.layoutParams as? RelativeLayout.LayoutParams)?.let {
                            it.removeRule(RelativeLayout.BELOW)
                            child.layoutParams = it
                        }
                    }
                    return
                }

                if (already is LinearLayout) {
                    (already.getChildAt(0) as? TextView)?.text = searchingFor(query)
                    return
                }

                val context = root.context
                val dp = context.resources.displayMetrics.density
                val words = TextView(context).apply {
                    text = searchingFor(query)
                    maxLines = 1
                    ellipsize = TextUtils.TruncateAt.END
                    gravity = Gravity.CENTER_VERTICAL
                }
                val off = TextView(context).apply {
                    text = CLEAR_BUTTON
                    gravity = Gravity.CENTER
                    setTextColor(accent(context, words.currentTextColor))
                    setPadding((12 * dp).toInt(), 0, 0, 0)
                    TypedValue().let {
                        if (context.theme.resolveAttribute(
                                android.R.attr.selectableItemBackground, it, true,
                            ) && it.resourceId != 0
                        ) {
                            setBackgroundResource(it.resourceId)
                        }
                    }
                }

                val strip = LinearLayout(context).apply {
                    tag = SEARCH_STRIP
                    id = View.generateViewId()
                    orientation = LinearLayout.HORIZONTAL
                    val side = (16 * dp).toInt()
                    setPadding(side, (8 * dp).toInt(), side, (8 * dp).toInt())
                    addView(
                        words,
                        LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f),
                    )
                    addView(
                        off,
                        LinearLayout.LayoutParams(
                            LinearLayout.LayoutParams.WRAP_CONTENT,
                            LinearLayout.LayoutParams.WRAP_CONTENT,
                        ),
                    )
                }
                off.setOnClickListener { searchFor(fragment, tab, me, null) }

                root.addView(
                    strip,
                    0,
                    RelativeLayout.LayoutParams(
                        RelativeLayout.LayoutParams.MATCH_PARENT,
                        RelativeLayout.LayoutParams.WRAP_CONTENT,
                    ).apply { addRule(RelativeLayout.ALIGN_PARENT_TOP) },
                )
                for (at in 0 until root.childCount) {
                    val child = root.getChildAt(at)
                    if (child === strip) continue
                    (child.layoutParams as? RelativeLayout.LayoutParams)?.let {
                        it.addRule(RelativeLayout.BELOW, strip.id)
                        child.layoutParams = it
                    }
                }
            } catch (t: Throwable) {
            }
        }

        /** What that tab is searching for, or null where it is not. */
        private fun searchOn(name: String, tab: String): String? =
            INSTANCE.profileSearches[searchKey(name, tab)]

        /**
         * One entry per person and per tab.
         *
         * **The person, because the query must not follow you onto somebody
         * else's profile.** `search_posts` is held on yourself alone, so a query
         * left keyed by tab alone would turn the next profile you opened into a
         * 403.
         *
         * **The tab, because the site's box is per type.** Its form carries a
         * hidden `type` and its placeholder says which -- *Search your topics*,
         * *Search your comments* -- so the two are two searches, and setting one
         * leaves the other where it was.
         */
        private fun searchKey(name: String, tab: String): String = name + "|" + tab

        /** The site's own placeholder, which says the scope and the kind. */
        private fun searchWords(tab: String): String =
            if (tab == COMMENTS_TAB) SEARCH_COMMENTS_WORDS else SEARCH_TOPICS_WORDS

        /** And what the strip over the results reads. */
        private fun searchingFor(query: String): String = SEARCHING_FOR + query

        /**
         * The marker that row carries, and the words around it.
         *
         * The id is one no switch in the app has a case for, the way
         * [OTHER_PERIOD_ROW] and [TITLE_AND_TOPIC_ROW] are, so a tap on it
         * cannot be answered by anything of Boost's -- and the row answers it
         * itself anyway, through a listener on the item.
         *
         * The two placeholders are the site's own, out of its search box, and
         * **Search** is what its own button says. No resource holds any of them,
         * so the words are ours.
         */
        private const val SEARCH_POSTS_ROW = 0x53524348
        private const val SEARCH_TOPICS_WORDS = "Search your topics"
        private const val SEARCH_COMMENTS_WORDS = "Search your comments"
        private const val SEARCH_BUTTON = "Search"
        private const val CLEAR_BUTTON = "Clear"
        private const val SEARCHING_FOR = "Search: "

        /**
         * Where it sits: **ahead of Sort at ten**, so the profile's toolbar
         * reads search, sort, overflow -- the order a group's screen already
         * puts the same three controls in. Settings at a thousand stays where it
         * was, and Tag user at fifteen and Block at thirty are both hidden on
         * your own profile, which is the only one this row is on.
         *
         * It asks to be an action item and takes the overflow when the toolbar
         * is full, which is Android's own answer and the one **Sort** beside it
         * already gives.
         */
        private const val SEARCH_POSTS_ORDER = 5

        /** Boost's own search icon, by the name its own menus reach it under. */
        private const val SEARCH_ICON = "ic_search_24dp"

        /** What marks the strip, so a second pass over the tab adds no second one. */
        private const val SEARCH_STRIP = "tildes_search_strip"

        /** The screen a tab is on, for the dialog that row opens. */
        private fun screenOf(fragment: Any): Activity? {
            var at: Context? = viewOf(fragment)?.context ?: return null
            while (at is ContextWrapper && at !is Activity) at = at.baseContext
            return at as? Activity
        }

        /** What the screen calls the person it is showing, in a tab's arguments. */
        private const val PROFILE_USERNAME = "username"

        /**
         * Tildes' two tabs, inside one of Boost's.
         *
         * `/bookmarks` and `/votes` are each exactly two tabs on the site, topics
         * and comments, with no merged view of either and nothing to filter --
         * the second page is rendered from the first's template, down to the two
         * tabs and the pagination. Boost draws one list of both kinds on each.
         *
         * Bookmarks had three rows in a menu doing what those two tabs do --
         * **Show all**, **Show topics** and **Show comments**, in a button at the
         * top of a tall screen, where a strip sits against the list it filters --
         * and Votes had nothing at all, having never been able to draw a comment
         * until this year. So both get the strip, and the rows go with the
         * button: see [profileSortButton], which takes it off both.
         *
         * `/ignored_topics` gets none of this. That page has no comment half.
         *
         * **Two `TextView`s rather than a `TabLayout`.** The real one is in the
         * APK and keeps its name, since Boost's own layouts name it, while every
         * method on it is a single letter -- `newTab`, `addTab` and the listener
         * are all renamed, and the listener is an interface with no name left at
         * all. That is the cost a dialog of ours was turned down for. A pair of
         * text views takes its colours off the theme and needs nothing named.
         *
         * **Above the list rather than over it.** The fragment's own layout is a
         * `RelativeLayout` holding a refresh layout and a progress bar, so the
         * strip is added to it and everything else is anchored below -- which is
         * checked rather than assumed, and a layout this does not recognise is
         * left alone. Inside the refresh layout the strip would scroll with the
         * list or be drawn over by it, and an empty result hides the list view
         * itself, which would take a strip inside it along.
         *
         * Answers whether it went in, which is what decides the button on the
         * Bookmarks tab: a strip that could not be built there leaves Boost's own
         * two rows as the way to the comments, which is what that tab had before
         * any of this. Votes has no such rows to fall back on, and a strip
         * missing there would leave it on topics -- the log line is what says so,
         * and the layout it needs is the one that fragment has had all along.
         *
         * Called from [profileSortButton], which is once per tab.
         */
        private fun kindStrip(fragment: Any, tab: String): Boolean {
            val root = viewOf(fragment) as? RelativeLayout ?: return false
            if (root.findViewWithTag<View>(KIND_STRIP) != null) return true
            val presenter = presenterOf(fragment) ?: return false
            val context = root.context
            val dp = context.resources.displayMetrics.density

            val chosen = kindShowing(presenter)
            val strip = LinearLayout(context).apply {
                tag = KIND_STRIP
                id = View.generateViewId()
                orientation = LinearLayout.HORIZONTAL
            }
            val segments = mutableListOf<View>()
            KINDS.forEach { (kind, label) ->
                val segment = stripSegment(context, label, kind == chosen)
                segment.setOnClickListener {
                    if (pickedKind(fragment, presenter, tab, kind)) {
                        segments.forEachIndexed { at, other ->
                            chose(other, KINDS[at].first == kind)
                        }
                    }
                }
                segments.add(segment)
                strip.addView(
                    segment,
                    LinearLayout.LayoutParams(0, (48 * dp).toInt(), 1f),
                )
            }

            root.addView(
                strip,
                0,
                RelativeLayout.LayoutParams(
                    RelativeLayout.LayoutParams.MATCH_PARENT,
                    RelativeLayout.LayoutParams.WRAP_CONTENT,
                ).apply { addRule(RelativeLayout.ALIGN_PARENT_TOP) },
            )

            // Everything that was already in that layout goes under it, which
            // is the list, the refresh wrapper around it and the progress bar
            // over them both.
            for (at in 0 until root.childCount) {
                val child = root.getChildAt(at)
                if (child === strip) continue
                (child.layoutParams as? RelativeLayout.LayoutParams)?.let {
                    it.addRule(RelativeLayout.BELOW, strip.id)
                    child.layoutParams = it
                }
            }
            return true
        }

        /**
         * One of them: the word, and the line under it that says which is on.
         *
         * The line is the theme's own accent where that can be found, which is
         * what Boost's own tab strip draws, and the words' own colour where it
         * cannot.
         */
        private fun stripSegment(context: Context, label: String, chosen: Boolean): View {
            val dp = context.resources.displayMetrics.density
            val word = TextView(context).apply {
                text = label
                gravity = Gravity.CENTER
                layoutParams = LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f,
                )
            }
            val line = View(context).apply {
                layoutParams = LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, (2 * dp).toInt(),
                )
                setBackgroundColor(accent(context, word.currentTextColor))
            }
            return LinearLayout(context).apply {
                orientation = LinearLayout.VERTICAL
                isClickable = true
                TypedValue().let {
                    if (context.theme.resolveAttribute(
                            android.R.attr.selectableItemBackground, it, true,
                        ) && it.resourceId != 0
                    ) {
                        setBackgroundResource(it.resourceId)
                    }
                }
                addView(word)
                addView(line)
                chose(this, chosen)
            }
        }

        /** And which of the two is on, which is an alpha and a line. */
        private fun chose(segment: View, chosen: Boolean) {
            val box = segment as? LinearLayout ?: return
            box.getChildAt(0)?.alpha = if (chosen) 1f else 0.6f
            box.getChildAt(1)?.visibility = if (chosen) View.VISIBLE else View.INVISIBLE
        }

        /** The theme's accent, or the words' own colour where it has none. */
        private fun accent(context: Context, fallback: Int): Int {
            val found = TypedValue()
            if (!context.theme.resolveAttribute(android.R.attr.colorAccent, found, true)) {
                return fallback
            }
            if (found.resourceId != 0) {
                return runCatching { context.getColor(found.resourceId) }
                    .getOrDefault(found.data)
            }
            return found.data
        }

        /**
         * A tap on one of them, which is the filter and then a reload.
         *
         * **The reload is `onRefresh`**, the one method on that fragment with a
         * name R8 left alone -- it is a click binding, so generated code names
         * it -- and what it does is the two halves of a filter change: the empty
         * view goes and the presenter is asked for a fresh first page. Every
         * other way into that presenter is a letter that moves between releases.
         * `:patches:test` pins the name against every release in the repo.
         *
         * Answers whether the strip should move, so a tap that changed nothing
         * leaves the words where they were.
         */
        private fun pickedKind(
            fragment: Any,
            presenter: Any,
            tab: String,
            kind: String,
        ): Boolean =
            try {
                val field = tabField(presenter)?.let { kindField(presenter, it) }
                when {
                    field == null -> false
                    read(field, presenter) == kind -> false
                    else -> {
                        field.isAccessible = true
                        field.set(presenter, kind)
                        INSTANCE.profileKinds[tab] =
                            if (kind == ONLY_COMMENTS) "comment" else "topic"
                        fragment.javaClass.getMethod(LIST_REFRESH).invoke(fragment)
                        true
                    }
                }
            } catch (t: Throwable) {
                false
            }

        /** Which kind the tab is on, as the strip draws it. */
        private fun kindShowing(presenter: Any): String {
            val tab = tabField(presenter) ?: return ONLY_TOPICS
            val field = kindField(presenter, tab) ?: return ONLY_TOPICS
            return if (read(field, presenter) == ONLY_COMMENTS) ONLY_COMMENTS else ONLY_TOPICS
        }

        /**
         * The presenter behind a profile tab, which is whatever the fragment
         * holds that knows which tab it is.
         *
         * By the value again: a tab key is a word Boost sends in a request, the
         * field holding it is a letter, and nothing else the fragment holds has
         * a field holding one of those words.
         */
        private fun presenterOf(fragment: Any): Any? =
            fieldsOf(fragment).asSequence()
                .mapNotNull { read(it, fragment) }
                .filterNot { isFramework(it.javaClass) }
                .firstOrNull { held -> tabField(held) != null }

        /** The fragment's own view, which is where the strip goes. */
        private fun viewOf(fragment: Any): View? =
            try {
                fragment.javaClass.getMethod(FRAGMENT_VIEW).invoke(fragment) as? View
            } catch (t: Throwable) {
                null
            }

        /** What marks the strip, so a second pass over the tab adds no second one. */
        private const val KIND_STRIP = "tildes_kind_strip"

        /**
         * The two, in the site's own order and under the site's own words:
         * tildes.net titles those tabs **Topics** and **Comments**, on both of
         * the pages that have them.
         */
        private val KINDS = listOf(
            ONLY_TOPICS to "Topics",
            ONLY_COMMENTS to "Comments",
        )

        /**
         * Two methods that keep their names through R8: androidx's own accessor
         * for a fragment's view, and Boost's click binding for the empty state's
         * Refresh button, which is the one reload on that fragment with a name.
         * `:patches:test` pins the second against every release in the repo.
         */
        private const val FRAGMENT_VIEW = "getView"
        private const val LIST_REFRESH = "onRefresh"

        /** Boost's own id for that button, resolved by name like every other. */
        private const val SORT_BUTTON = "action_sort"

        /**
         * And what a copy puts on the clipboard, under a stricter rule than a
         * share.
         *
         * **Copy link** and **Copy permalink** hand over an address and nothing
         * else, so they get the short form and agree with what their row says.
         * **Copy text** hands over a post, and **Copy link markdown** hands over
         * a link somebody could paste into one -- a topic address inside either
         * is a person's own writing rather than the app's, and it comes back
         * exactly as it went in.
         *
         * That is the whole difference from [sharedText]: a share is always
         * Boost composing something out of its own fields, so the address there
         * is rewritten wherever it sits.
         *
         * Called from patched bytecode, at the one method that reaches the
         * clipboard.
         */
        @JvmStatic
        fun copiedText(text: String?): String? {
            if (text.isNullOrEmpty() || !Session.wasTildes()) return text
            return try {
                Tildes.shortLink(text) ?: text
            } catch (t: Throwable) {
                text
            }
        }

        /**
         * And a group as Tildes spells it, for the same reason and in the same
         * place: the one method that names a community for comparing.
         *
         * Boost answers `comp@tildes.net` there while every line on the screen
         * says `~comp`, so **Muted Communities** never matched a group typed
         * into it. It reads `~comp` now, which is the spelling the site uses,
         * the one the app draws, and the one the interceptor writes when a
         * group is blocked.
         *
         * The two menu rows that print this under themselves come right with
         * it, since they are drawn from the same method.
         *
         * Called from patched bytecode, at the return of that method, and hands
         * back what it was given wherever it has nothing to say.
         */
        @JvmStatic
        fun groupHandle(handle: String?): String? {
            if (handle == null || !Session.wasTildes()) return handle
            return try {
                Lemmy.groupHandle(handle) ?: handle
            } catch (t: Throwable) {
                handle
            }
        }

        /**
         * The address a comment is shared by, which was one this site has never
         * had.
         *
         * Boost builds `<instance>/comment/<id>` for it, out of the numeric id
         * it was handed. That is a Lemmy route: tildes.net answers **404**, and
         * the number is one [Lemmy] invented for a comment that has an id36 of
         * its own. So **Share link**, **Copy link** and a long-pressed comment
         * have been handing over a dead address since the first day.
         *
         * Tildes' own permalink for a comment is the topic's address with
         * `#comment-<id36>` after it, which the interceptor already puts on the
         * comment as its `ap_id`. So this is a field away rather than a request
         * away, and it is found by its shape rather than by its name for the
         * reason a person's name is: the fields here are one letter each.
         *
         * The fragment is what makes it a comment's address rather than the
         * topic's, so this deliberately does not shorten: `tild.es` answers for
         * a topic, and a fragment on the short form is not something the site
         * offers.
         *
         * Called from patched bytecode, at the head of that method, and answers
         * null wherever Boost's own should run.
         */
        @JvmStatic
        fun commentLink(model: Any?): String? {
            if (model == null || !Session.wasTildes()) return null
            return try {
                addressIn(model)
            } catch (t: Throwable) {
                null
            }
        }

        /**
         * The first string on a model that is one of this site's own topic
         * addresses, walked up the class hierarchy the way [actorNameOf] is.
         */
        private fun addressIn(model: Any): String? {
            val prefix = "${Tildes.BASE}/~"
            var type: Class<*>? = model.javaClass
            while (type != null) {
                for (field in type.declaredFields) {
                    if (field.type != String::class.java) continue
                    field.isAccessible = true
                    val value = field.get(model) as? String ?: continue
                    if (value.startsWith(prefix)) return value
                }
                type = type.superclass
            }
            return null
        }

        /**
         * A person's name, with no instance after it.
         *
         * Boost writes `name@instance` wherever it is not sure an account is
         * local, and it works that out twice, differently. A byline compares
         * the host against the one signed in to and leaves it off when they
         * match, so a Tildes profile reads `Deimos`. What the app compares does
         * not compare anything: it appends the host off the actor URL whenever
         * there is one, which on Tildes is always.
         *
         * That gap is the whole of why **Muted Users** never worked. You read
         * `Deimos` and typed `Deimos`, and the filter asked whether
         * `Deimos@tildes.net` equalled it.
         *
         * Tildes federates with nothing, so a host says nothing about anybody:
         * every account is local. Taking it off leaves the mute list, the app's
         * own Mute… row, the filter and every byline agreeing on one spelling.
         *
         * Only ours comes off, and only on a Tildes account. A name from
         * anywhere else keeps whatever it arrived with, which on a Lemmy
         * account is the whole point of the suffix.
         *
         * Called from patched bytecode, at the head of the two methods that
         * name a person, and answers null wherever Boost's own should run.
         */
        @JvmStatic
        fun personName(model: Any?): String? {
            if (model == null || !Session.wasTildes()) return null
            return try {
                actorNameOf(model)
            } catch (t: Throwable) {
                null
            }
        }

        /**
         * The name out of a person's own URL, which is the one field on the
         * model this can find without being told a name.
         *
         * Boost's fields here are single letters and free to move between
         * releases, and the two that matter -- the name and the host -- are
         * both plain strings with nothing to tell them apart by value. The
         * actor URL beside them is the one field with a shape: it is this
         * site's own address for the person, and the name is its last segment.
         *
         * Answers null for a person built without one, which is Boost
         * constructing a model from a name it already has. Nothing is lost
         * there: with no URL there is no host either, so its own answer is the
         * bare name already.
         */
        private fun actorNameOf(model: Any): String? {
            val prefix = "${Tildes.BASE}/user/"
            var type: Class<*>? = model.javaClass
            while (type != null) {
                for (field in type.declaredFields) {
                    if (field.type != String::class.java) continue
                    field.isAccessible = true
                    val value = field.get(model) as? String ?: continue
                    if (!value.startsWith(prefix)) continue
                    return value.removePrefix(prefix).substringBefore('/').ifEmpty { null }
                }
                type = type.superclass
            }
            return null
        }

        /**
         * What a share hands over, with a topic's link in Tildes' own short
         * form.
         *
         * The site prints one on every topic page -- `tild.es/1vlp` under
         * **Short link** -- and the group and the slug in front of the id36 are
         * there to be read rather than to be resolved. A shared link is a line
         * instead of a paragraph and still says where it goes.
         *
         * **One method answers every share in the app.** Thirteen places hand
         * text to it -- the three rows under Share…, the same three on a media
         * screen, a topic's toolbar, a long-pressed link -- and the URL is a
         * string by the time it arrives: **Share title + link** builds the
         * title, a dash and the address as one, and no field holds the address
         * on its own by then. So the rewrite reads the text rather than a
         * model, and covers all thirteen without knowing about any of them.
         *
         * What is not a topic is left as it was. See [Tildes.shortLinks], which
         * is where that is decided and tested.
         *
         * Called from patched bytecode, with the text on its way to the
         * chooser.
         */
        @JvmStatic
        fun sharedText(text: String?): String? {
            if (text.isNullOrEmpty() || !Session.wasTildes()) return text
            return try {
                val short = Tildes.shortLinks(text)
                short
            } catch (t: Throwable) {
                text
            }
        }

        /**
         * The rows the Groups page is about to show, kept so that [trimMenu]
         * knows the menu when it arrives.
         *
         * Nothing in the rows themselves says which screen asked for them.
         * Boost builds this menu with one method that eight screens call, and
         * the Groups page's call and the site browser's are the same arguments,
         * so the same eleven rows come out of both. Telling them apart by what
         * is in them means reading the absence of a row, and two more screens
         * differ only by rows that are there some of the time.
         *
         * So the screen answers instead of the menu. This is the list itself
         * rather than a flag: `CommunitiesFragment.showDialogMenu` hands the
         * very same object to `MenuView.setMenuOptions` four instructions
         * later, so identity is exact where a flag would be a guess about
         * timing. A menu that is never shown leaves it behind, and the next
         * menu through [trimMenu] clears it without matching.
         *
         * Called from patched bytecode, at the head of that method.
         */
        @JvmStatic
        fun groupSortMenu(options: MutableList<Any>?) {
            groupsPageMenu = options
        }

        @Volatile
        private var groupsPageMenu: MutableList<Any>? = null

        /**
         * Whether a menu is the comment sort one rather than a post sort menu
         * carrying four of the same strings.
         *
         * Asked once per menu, of the list as it arrives, and the answer is
         * handed down to the submenus with it. A comment menu has none, so
         * there is nothing under it to decide again for.
         */
        private fun isCommentSort(options: List<Any>, known: Rows): Boolean =
            known.topRow != 0 && options.any {
                titleOf(it, known) == known.topRow && rowIdOf(it) == COMMENT_SORT_TOP_ROW
            }

        /**
         * The word to draw over a sort, for the toolbar under a feed's name and
         * for the preference summaries that name one.
         *
         * Boost has one method that turns a sort into something to read, and it
         * answers with a string resource per Lemmy sort. Those cannot be chosen
         * per account -- resources are fixed when the patch is applied -- and
         * three of the sixteen actively lie about what a Tildes feed is doing:
         * `Scaled` is the votes order, `Top` is the window dropdown, and `Hot`,
         * `Controversial` and `Old` are rows the menu no longer offers though
         * Boost can still open a feed on one, since it keeps a sort per
         * subscription and the front page follows its own preference.
         *
         * So the word is worked out from what the interceptor makes of the
         * sort rather than from a second table beside it, and a dropped sort
         * says what the feed is actually doing by construction.
         *
         * Called from patched bytecode with Boost's sort model. Answering null
         * hands the question back to Boost, which is every sort on every other
         * instance, and `Top`: that one is a row rather than an order, and
         * Boost draws nothing for it either.
         */

        /**
         * Gives the line under a feed's name the width the toolbar already
         * leaves it.
         *
         * Boost draws that line inside the toolbar's spinner, out of
         * `spinner_subscription_toolbar`, which is two `RelativeLayout`s of
         * `wrap_content` around a `maxLines="1"` text view. The spinner is laid
         * out to the whole space the toolbar has spare -- on a 1080-wide screen
         * that is x=202 to x=697, which is exactly up to the search button --
         * while the item inside it measures to 332 and ellipsizes there. So the
         * words ran out a third of the way short of the gap they had: **Last 1
         * year, 17 da...** with 149 pixels of nothing after it.
         *
         * The container that is widened holds **both** lines, the feed's name
         * above and the sort below, so a long listing name gets the room too.
         * Neither stretches: both are `wrap_content` and left-aligned.
         *
         * **Three things had to be true at once, and two builds each got one of
         * them wrong.**
         *
         * `MATCH_PARENT` is not a width here. The spinner is `wrap_content`, so
         * it hands its child `AT_MOST`, and `ViewGroup.getChildMeasureSpec`
         * turns a `MATCH_PARENT` under an `AT_MOST` parent into another
         * `AT_MOST` -- "be no bigger than me" rather than "be my size" -- which
         * a container answers by wrapping its own content again. **An exact
         * width is what turns it into `EXACTLY`**, so the container next to the
         * spinner takes a number of pixels and the one under it matches that.
         *
         * The pixels come off the **spinner's parent** rather than the spinner,
         * which is what stops it chasing itself: the spinner measures to
         * whatever its child asks for, so sizing the child from the spinner
         * would feed back. The parent is the toolbar's own custom-view slot and
         * is already the space between the navigation button and the menu.
         *
         * **And writing it once is no good, whenever that once is.** The first
         * build wrote during a layout pass, where the request to lay out again
         * is dropped. The second wrote from a frame later and still lost it:
         * the sort is worded a dozen times while a feed is starting, before the
         * subscription list has arrived, and the adapter builds the item view
         * again afterwards -- fresh, and `wrap_content` again. So this watches
         * instead. Every layout of that toolbar checks the item and fixes it,
         * which costs two field reads once it has settled and survives the view
         * being replaced under it.
         *
         * It settles rather than looping: the width is only written when it is
         * not already the number wanted, and writing it is what asks for the
         * layout that makes it true.
         *
         * **Boost's own words never needed any of it.** Its longest sort reads
         * *Top All Time*, and Tildes' longest reads *Last 10 years, 364 days,
         * 23 hours*, so this is a shape the app has that only these words
         * reach.
         *
         * Called from patched bytecode, at the head of the method that turns a
         * sort into a word -- which is handed the screen it is drawing on. Only
         * the first call through a given toolbar does anything; the rest find
         * it already watched.
         */
        @JvmStatic
        fun widenToolbarSubtitle(context: Context?) {
            if (context !is Activity || !Session.wasTildes()) return
            try {
                val wanted = id(context, SUBTITLE_VIEW)
                if (wanted == 0) return
                val subtitle = context.findViewById<View>(wanted) ?: return

                var above = subtitle.parent
                while (above is ViewGroup && above !is Spinner) above = above.parent
                val spinner = above as? Spinner ?: return

                synchronized(watchedToolbars) {
                    if (watchedToolbars.put(spinner, true) != null) return
                }
                spinner.viewTreeObserver.addOnGlobalLayoutListener {
                    fillTheToolbar(spinner, wanted)
                }
                fillTheToolbar(spinner, wanted)
            } catch (t: Throwable) {
            }
        }

        /**
         * The toolbars already being watched, held weakly: the listener lives
         * on the view tree and dies with it, and nothing here should keep a
         * screen alive.
         */
        private val watchedToolbars = java.util.WeakHashMap<View, Boolean>()

        /**
         * One pass of it, run after every layout of that toolbar. Silent and
         * two field reads deep once the item already fills its slot.
         */
        private fun fillTheToolbar(spinner: Spinner, subtitleId: Int) {
            try {
                val room = (spinner.parent as? View)?.width ?: 0
                if (room <= 0) return

                // Found again every time rather than remembered, since the
                // adapter builds this view again whenever its list changes.
                val subtitle = spinner.findViewById<View>(subtitleId) ?: return
                val between = ArrayList<ViewGroup>()
                var above = subtitle.parent
                while (above is ViewGroup && above !== spinner) {
                    between.add(above)
                    above = above.parent
                }
                if (above !== spinner) return
                val outermost = between.lastOrNull() ?: return

                // Where the words start inside that container, and what is left
                // of it after them. Both off the views rather than worked out,
                // so a wider screen, another button on the toolbar or a turn on
                // its side all answer themselves.
                var indent = 0
                var walk: View = subtitle
                while (walk !== outermost) {
                    indent += walk.left
                    walk = walk.parent as? View ?: return
                }
                val cap = room - indent - outermost.paddingRight

                val fits = outermost.layoutParams?.width == room &&
                    (subtitle as? TextView)?.maxWidth.let { it == null || it == cap }
                if (fits || cap <= 0) return

                between.forEach { view ->
                    val want =
                        if (view === outermost) room else ViewGroup.LayoutParams.MATCH_PARENT
                    view.layoutParams = (view.layoutParams ?: return@forEach).apply { width = want }
                }

                // **And the words have to be capped themselves.** The container
                // holding them is a `RelativeLayout` that measures a
                // `wrap_content` child `UNSPECIFIED` while its own width is
                // still unresolved, so the text view sized itself to the whole
                // sentence and was cut off mid-word by the container -- widened
                // and still clipped, with no ellipsis, since nothing had told
                // it that it did not fit. A `maxWidth` is what tells it.
                (subtitle as? TextView)?.maxWidth = cap
            } catch (t: Throwable) {
            }
        }

        /** The line under a feed's name, by the name Boost's own layout gives it. */
        private const val SUBTITLE_VIEW = "action_bar_subtitle"

        @JvmStatic
        fun sortName(model: Any?): String? {
            if (!answering || model == null) return null
            val sort = sortTypeOf(model)
            return if (sort == "Top") null else sortWord(sort)
        }

        /**
         * Which sort a model carries, by the one field on it that holds an
         * enum. Boost's own field names are down to single letters, while the
         * constants of `SortType` are what it puts in the query string, so the
         * name is both readable and the same thing [ORDERS] is keyed by.
         */
        private fun sortTypeOf(model: Any): String? =
            model.javaClass.declaredFields.firstNotNullOfOrNull { field ->
                try {
                    field.isAccessible = true
                    (field.get(model) as? Enum<*>)?.name
                } catch (t: Throwable) {
                    null
                }
            }

        /** Tildes' word for one of Boost's sorts, or null for one it has none for. */
        private fun sortWord(sort: String?): String? = when {
            sort == null -> null
            sort == "Top" -> WINDOW_MENU
            // Ahead of the table, since the sort carrying a typed window is a
            // window in that table too and the typed one is what is showing.
            customWindow(sort) != null -> Lemmy.windowWords(customWindow(sort))
            ORDERS.containsKey(sort) -> ORDER_WORDS[ORDERS[sort]]
            PERIODS.containsKey(sort) -> periodWords(PERIODS[sort])
            else -> null
        }

        /**
         * The word to draw over one of Boost's comment sorts, worked out from
         * the order the interceptor asks Tildes for rather than from a table
         * beside it, so the menu cannot say one thing while the tree under it
         * is in another order.
         */
        private fun commentSortWord(sort: String?): String? =
            COMMENT_ORDER_WORDS[COMMENT_ORDERS[sort]]

        /**
         * Which comment sort the toolbar is being written for, between the two
         * halves of [commentSortName].
         *
         * A field rather than an argument because Boost's own compiler leaves
         * no argument to pass. The method that writes that line reuses the
         * register the sort arrived in for the resource id and then for the
         * string, so the sort is readable at its first instruction and gone by
         * its last. Both halves run in the same method, microseconds apart, on
         * the thread drawing the screen.
         */
        @Volatile
        private var namingCommentSort: String? = null

        /** The first half: the sort, read while it is still there. */
        @JvmStatic
        fun namingCommentSort(sort: Any?) {
            namingCommentSort = (sort as? Enum<*>)?.name
        }

        /**
         * The second half, and the word that reaches the line under
         * **Comments** in a topic's toolbar.
         *
         * That line is set from a string resource per Lemmy comment sort,
         * straight out of the fragment rather than through the one method
         * [sortName] hooks, so a menu row saying **most votes** sat over a
         * toolbar still saying Top. Both are the same four orders now.
         *
         * Called from patched bytecode with the word Boost was about to draw.
         * Handing it straight back is what leaves a Lemmy account alone, and it
         * is also the answer for a sort Tildes has no order for, which is none
         * of the five today.
         */
        @JvmStatic
        fun commentSortName(boosts: String?): String? {
            if (!answering) return boosts
            return commentSortWord(namingCommentSort) ?: boosts
        }

        /**
         * A menu and the submenus hanging off it. Two windows are rows under
         * `From…` rather than rows of the menu itself, so filtering only what
         * is handed over leaves them in place.
         */
        private const val DEPTH = 2

        /** Answers how many rows were given a word of Tildes' own. */
        private fun translate(
            options: MutableList<Any>,
            known: Rows,
            table: Table,
            depth: Int,
        ): Int {
            if (depth == 0) return 0
            var worded = 0
            try {
                options.removeAll { titleOf(it, known) in table.dropped }
                options.forEach { row ->
                    table.words[titleOf(row, known)]?.let {
                        relabel(row, it)
                        worded++
                    }
                }
            } catch (t: Throwable) {
                return worded
            }
            options.forEach { row ->
                submenusOf(row).forEach { worded += translate(it, known, table, depth - 1) }
            }
            return worded
        }

        /**
         * Takes off a row that hands over exactly what the row beside it does.
         *
         * **Share link** and **Share topic** are one row on a text topic, and
         * so are **Copy link** and **Copy comments**: the first of each pair is
         * the topic's link target, which falls back to the topic's own address
         * when there is no link.
         *
         * The link row is the one that goes, since it is the one whose name is
         * untrue there. On a link topic the two say different things and
         * neither moves.
         *
         * Told by the address itself rather than by what kind of topic it is,
         * because the menu is the whole of what this can see. A row repeating
         * another row is the test, and it cannot fire where the two differ.
         */
        private fun dropSaidTwice(options: MutableList<Any>, known: Rows, depth: Int): Int {
            if (depth == 0) return 0
            var dropped = 0
            try {
                known.saidTwice.forEach { (linkRow, keptRow) ->
                    val link = options.firstOrNull { titleOf(it, known) == linkRow }
                    val kept = options.firstOrNull { titleOf(it, known) == keptRow }
                    if (link == null || kept == null) return@forEach

                    val address = addressOf(link) ?: return@forEach
                    if (address != addressOf(kept)) return@forEach
                    options.remove(link)
                    dropped++
                }
                options.forEach { row ->
                    submenusOf(row).forEach { dropped += dropSaidTwice(it, known, depth - 1) }
                }
            } catch (t: Throwable) {
            }
            return dropped
        }

        /**
         * Offers the topic beside the link on a **Share title + link** row.
         *
         * On a link topic the app can share two different addresses -- the
         * article, and the discussion of it -- and it says so twice over, with
         * Share link and Share topic. The row that puts the **title** in front
         * of one has no such pair: it takes the link, and there is no way to
         * ask for the other, which is the one worth sending somebody when the
         * discussion is the point.
         *
         * So a second one goes in under it, and only on a link topic: where the
         * two addresses agree there is nothing to choose between, and
         * [dropSaidTwice] has already taken the link row off by then, which is
         * what this reads to know.
         *
         * **The row is Boost's shape and nobody's id.** It is a fresh one of
         * whatever class the rows beside it are, carrying a marker no switch in
         * the app has a case for, so a tap on it reaches Boost's dispatcher and
         * falls through to nothing. [menuRowTapped] is what acts on it, one
         * method earlier, and the dialog still closes afterwards because the
         * dismiss sits after the dispatch rather than inside it.
         *
         * The words are ours rather than a resource's, since no resource says
         * this. Every other row in every menu keeps its own.
         */
        private fun addTitleAndTopic(options: MutableList<Any>, known: Rows, depth: Int): Int {
            if (depth == 0) return 0
            var added = 0
            try {
                val link = options.firstOrNull { titleOf(it, known) == known.shareLinkRow }
                val topic = options.firstOrNull { titleOf(it, known) == known.shareTopicRow }
                val titled = options.firstOrNull { titleOf(it, known) == known.shareTitleRow }
                val address = topic?.let { addressOf(it) }

                if (link != null && titled != null && address != null &&
                    addressOf(link) != address &&
                    // A list handed through here twice must not grow twice.
                    options.none { rowIdOf(it) == TITLE_AND_TOPIC_ROW }
                ) {
                    titleAndTopic(address)?.let { words ->
                        val row = titled.javaClass.getDeclaredConstructor().newInstance()
                        copyInt(iconOf(row), titled, row)
                        row.javaClass.getDeclaredField(ROW_ID_FIELD).apply {
                            isAccessible = true
                            setInt(row, TITLE_AND_TOPIC_ROW)
                        }
                        relabel(row, TITLE_AND_TOPIC_WORDS)
                        addressField(topic)?.set(row, address)
                        options.add(options.indexOf(titled) + 1, row)
                        synchronized(ourRows) { ourRows[row] = words }
                        added++
                    }
                }

                options.forEach { row ->
                    submenusOf(row).forEach { added += addTitleAndTopic(it, known, depth - 1) }
                }
            } catch (t: Throwable) {
            }
            return added
        }

        /**
         * Puts **Topic log** in a topic's menu, where the site has one to show.
         *
         * Tildes keeps its own account of everything done to a topic after it
         * was posted -- a tag added or taken off, a title or a link edited, a
         * move between groups, a lock -- and prints it in the topic's sidebar,
         * newest first, behind a `<details>` somebody opens. Nothing else on
         * the site says any of it, and Lemmy has no field for a word of it: a
         * topic three different people moved, renamed and retagged reads here
         * exactly like one nobody has touched.
         *
         * **The row only appears where there is something behind it.** Most
         * topics have an empty log, and the section is missing from the page
         * rather than empty when they do, so a row on every topic would open a
         * dialog saying nothing most times it was tapped. It also answers a
         * second question this cannot ask any other way: a listing draws no
         * sidebar, so a topic whose own page has never been read has no log
         * here, and offering the row anyway would mean fetching a page to fill
         * it.
         *
         * **Which topic is read off the menu rather than passed in.** The
         * **Share topic** row carries the topic's own address, and no other
         * menu in the app has that row -- a comment's Share submenu is three
         * different strings -- so it says both which topic this is and that
         * this is a topic's menu at all. It is found wherever it sits, since it
         * hangs under Share… rather than beside it.
         *
         * **The row goes above Share…**, which is the last row in a topic's
         * menu that is not a submenu of addresses, and which is there whether
         * the menu was opened inside the topic or off a row in a listing.
         * **Permalink** above it is only in the first of those.
         *
         * **The row is Boost's shape and nobody's id**, the way the two rows
         * added above it are: a fresh one of the class the rows beside it are,
         * carrying a marker no switch in the app has a case for, so a tap
         * reaches Boost's dispatcher and falls through to nothing.
         * [menuRowTapped] is what opens the dialog, one method earlier.
         *
         * The words are the site's own summary, count and all, since the count
         * is what says whether the row is worth opening.
         *
         * Answers whether the row went in.
         */
        private fun addTopicLog(options: MutableList<Any>, known: Rows): Boolean =
            try {
                val at = if (known.shareMenuRow == 0) -1
                else options.indexOfFirst { titleOf(it, known) == known.shareMenuRow }
                val log = topicIn(options, known, DEPTH)
                    ?.let { id36 -> INSTANCE.topicLogs[id36] }

                if (at == -1 || log.isNullOrEmpty() ||
                    // A list handed through here twice must not grow twice.
                    options.any { rowIdOf(it) == TOPIC_LOG_ROW }
                ) {
                    false
                } else {
                    val beside = options[at]
                    val row = beside.javaClass.getDeclaredConstructor().newInstance()
                    // Its own icon where the app has one, and the neighbour's
                    // otherwise: a row with no icon at all among rows that have
                    // them is a hole rather than a plainer row.
                    val icon = iconOf(row)
                    val drawn = Session.application()
                        ?.let { id(it, TOPIC_LOG_ICON, "drawable") }
                        ?.takeIf { it != 0 }
                    if (drawn != null && icon != null) {
                        icon.isAccessible = true
                        icon.setInt(row, drawn)
                    } else {
                        copyInt(icon, beside, row)
                    }
                    row.javaClass.getDeclaredField(ROW_ID_FIELD).apply {
                        isAccessible = true
                        setInt(row, TOPIC_LOG_ROW)
                    }
                    relabel(row, topicLogWords(log.size))
                    options.add(at, row)
                    synchronized(logRows) { logRows[row] = log }
                    true
                }
            } catch (t: Throwable) {
                false
            }

        /**
         * The topic a menu is about, read off the one row carrying its own
         * address, or null for every other menu in the app.
         *
         * Walked rather than looked for at the top: **Share topic** hangs under
         * Share… rather than beside it. The address is whichever of the two
         * forms the app last wrote on the row, which is why [Tildes.topicId36]
         * takes both.
         */
        private fun topicIn(options: List<Any>, known: Rows, depth: Int): String? {
            if (depth == 0 || known.shareTopicRow == 0) return null
            options.firstOrNull { titleOf(it, known) == known.shareTopicRow }
                ?.let { row -> addressOf(row)?.let { return Tildes.topicId36(it) } }
            options.forEach { row ->
                submenusOf(row).forEach { sub ->
                    topicIn(sub, known, depth - 1)?.let { return it }
                }
            }
            return null
        }

        /**
         * And the comment a menu is about, or null for every menu that is not
         * one comment's.
         *
         * Read the same way and off the same rows, since the difference is in
         * the address rather than in the menu: **Share link** and **Copy link**
         * carry `.../~group/1vjt#comment-iedn` on a comment and the topic's own
         * address on a topic. [Tildes.commentId36] takes only the first, so
         * asking every row on the menu and its submenus finds a comment's or
         * finds nothing.
         *
         * Which makes this the one thing that says a menu is a comment's at
         * all. Boost builds every comment menu in the app from one method --
         * the tree, a profile, the bookmarks, a search -- so there is no
         * screen to ask, and the rows in it are the rows a topic has.
         */
        private fun commentIn(options: List<Any>, depth: Int): String? {
            if (depth == 0) return null
            options.forEach { row ->
                addressOf(row)?.let { address ->
                    Tildes.commentId36(address)?.let { return it }
                }
            }
            options.forEach { row ->
                submenusOf(row).forEach { sub ->
                    commentIn(sub, depth - 1)?.let { return it }
                }
            }
            return null
        }

        /**
         * Puts **Label…** in a comment's menu, holding the labels Tildes has
         * where every other site has a report button.
         *
         * The site draws a **Label** button under every comment it will let you
         * label, and pressing it opens a row of five: exemplary, offtopic,
         * joke, noise and malice. They are what moves a comment down the sort
         * and what folds a noisy one, and there is nothing in Lemmy shaped like
         * any of it -- Boost's own **Report** row goes to a moderator, which
         * this site does not have. That row comes out in [DROPPED_ROWS] and
         * this goes in near where it was.
         *
         * **The row only appears where the site said it would.** Three of its
         * refusals -- your own comment, one it has taken down, an account under
         * a week old -- are answered by the attribute it writes on a comment
         * you may label, and the labels themselves come off the page too, so an
         * exemplary already used inside the last eight hours is simply not
         * among them. Nothing here keeps a clock or a rule of its own.
         *
         * **Two tabs supply nothing of their own**, and that is the site's
         * doing rather than this end's: the bookmarks page draws a **Label**
         * button on every comment and carries no template for it, and the
         * votes page is rendered from the same one. A row on either is there
         * because some earlier page carried the set, not because that page
         * did. See [Tildes.labelOptions].
         *
         * **The submenu is the site's own toggle.** A label you have put on
         * carries a tick and taking it off is the same tap again, which is what
         * the site's button does. The two that ask for a reason say so with the
         * ellipsis the site puts on them.
         *
         * The row goes above **Share…** for the reason [addTopicLog] does, and
         * lands under **Permalink**, which is where Boost drew Report.
         */
        private fun addCommentLabels(options: MutableList<Any>, known: Rows): Boolean {
            return try {
                val offered = Tildes.labelOptions
                val id36 = if (offered.isEmpty()) null else commentIn(options, DEPTH)
                val mine = id36?.let { labelledComments[it] }
                val at = if (known.shareMenuRow == 0) -1
                else options.indexOfFirst { titleOf(it, known) == known.shareMenuRow }

                if (at == -1 || id36 == null || mine == null ||
                    // A list handed through here twice must not grow twice.
                    options.any { rowIdOf(it) == LABEL_ROW }
                ) {
                    return false
                }

                val beside = options[at]
                // Found on the row beside it rather than on the fresh one: a
                // field is recognised by what it holds, and a row nothing has
                // been written to holds nothing anywhere. Share… is the one
                // row on this menu certain to carry a submenu.
                val holder = submenuField(beside) ?: return false

                val row = beside.javaClass.getDeclaredConstructor().newInstance()
                val icon = iconOf(row)
                val drawn = Session.application()
                    ?.let { id(it, LABEL_ICON, "drawable") }
                    ?.takeIf { it != 0 }
                if (drawn != null && icon != null) {
                    icon.isAccessible = true
                    icon.setInt(row, drawn)
                } else {
                    copyInt(icon, beside, row)
                }
                row.javaClass.getDeclaredField(ROW_ID_FIELD).apply {
                    isAccessible = true
                    setInt(row, LABEL_ROW)
                }
                relabel(row, LABEL_WORDS)

                val children = ArrayList<Any>()
                offered.forEach { option ->
                    val on = option.name in mine
                    val child = beside.javaClass.getDeclaredConstructor().newInstance()
                    child.javaClass.getDeclaredField(ROW_ID_FIELD).apply {
                        isAccessible = true
                        setInt(child, LABEL_ROW)
                    }
                    relabel(child, labelWords(option, on))
                    children.add(child)
                    synchronized(labelRows) { labelRows[child] = LabelTap(id36, option, on) }
                }
                holder.isAccessible = true
                holder.set(row, children)
                options.add(at, row)
                true
            } catch (t: Throwable) {
                false
            }
        }

        /**
         * Whichever field on a row holds its submenu, taken off a row that has
         * one. Same class as the row being built, so the field is the field.
         */
        private fun submenuField(row: Any): java.lang.reflect.Field? =
            row.javaClass.declaredFields.firstOrNull { field ->
                try {
                    field.isAccessible = true
                    (field.get(row) as? MutableList<*>)?.let { it !== row } == true
                } catch (t: Throwable) {
                    false
                }
            }

        /**
         * What a label row reads: the site's own name with a capital on it, a
         * tick where you have put that label on already, and the ellipsis the
         * site's own button carries where applying it asks for a reason.
         */
        private fun labelWords(option: Tildes.LabelOption, on: Boolean): String {
            val word = option.name.substring(0, 1).uppercase() + option.name.substring(1)
            return when {
                on -> "$word $LABEL_TICK"
                option.reasonPrompt != null -> word + "…"
                else -> word
            }
        }

        /** What one label row hands the tap handler. */
        private class LabelTap(
            val id36: String,
            val option: Tildes.LabelOption,
            /** Whether it was on when the menu was built, so a tap toggles. */
            val on: Boolean,
        )

        /**
         * The label rows this put into a menu, against what each one does. Held
         * weakly for the reason [ourRows] is: a menu is rebuilt every time it
         * opens, and nothing here should keep the old one alive.
         */
        private val labelRows = java.util.WeakHashMap<Any, LabelTap>()

        /**
         * The marker those rows carry, what the parent reads, and what it is
         * drawn with.
         *
         * The parent and its children share the marker: nothing in the app has
         * a case for it either way, and which row was tapped is answered by
         * [labelRows] rather than by the number. The words end in an ellipsis
         * the way Boost's own submenu rows do. The icon is the app's own tag,
         * which is the same shape of thing under the site's other word for it.
         */
        private const val LABEL_ROW = 0x4C424C53
        private const val LABEL_WORDS = "Label…"
        private const val LABEL_ICON = "ic_tag_24dp"
        private const val LABEL_TICK = "✓"

        /**
         * The marker that row carries, what it reads, and what it is drawn
         * with.
         *
         * Boost's own row ids are resource ids and a handful of small numbers,
         * and no switch in the app has a case for this one, so a tap on it
         * falls through everything of Boost's. The words are the site's own
         * `<summary>`, count and all. The icon is the app's own numbered list,
         * which is the element Tildes writes the log as.
         */
        private const val TOPIC_LOG_ROW = 0x544C4F47
        private const val TOPIC_LOG_WORDS = "Topic log"
        private const val TOPIC_LOG_ICON = "ic_format_list_numbered_24dp"

        private fun topicLogWords(entries: Int): String = "$TOPIC_LOG_WORDS ($entries)"

        /**
         * The **Topic log** rows this put into a menu, against the lines each
         * one shows. Held weakly for the reason [ourRows] is: a menu is rebuilt
         * every time it opens, and nothing here should keep the old one alive.
         */
        private val logRows = java.util.WeakHashMap<Any, List<String>>()

        /**
         * And the dialog behind the row, which is the site's own list under the
         * site's own heading.
         *
         * Android's rather than Boost's, for the reason [askForWindow] gives:
         * Boost's builder is single letters out of R8, and this wants a title,
         * a body and a button, none of which a framework dialog needs a method
         * pinned by name for.
         *
         * The lines go in as one message rather than as a list of rows. They
         * are sentences rather than choices -- there is nothing to pick -- and
         * a message is what scrolls on its own when a topic has been through
         * more hands than the screen has room for. The blank line between them
         * is what keeps a wrapped one from reading as two.
         */
        private fun showTopicLog(view: View, log: List<String>) {
            val context = view.context
            if (context !is Activity) {
                return
            }
            AlertDialog.Builder(context)
                .setTitle(topicLogWords(log.size))
                .setMessage(log.joinToString("\n\n"))
                .setPositiveButton(android.R.string.ok, null)
                .show()
        }

        /**
         * A tap on one of the five label rows, which toggles that label the way
         * the site's own button does.
         *
         * **Two of them ask something first**, and both questions are the
         * site's. Applying an exemplary or a malice label asks for a reason,
         * because they carry one to the comment's author and to the admins
         * respectively -- so the box goes up with the site's own sentence over
         * it. Taking one of those back off asks to be sure, since the reason
         * goes with it and nothing here can put it back.
         *
         * The other three go straight out. They say nothing to anybody: what
         * they do is weigh the comment down its thread's sort, and `noise`
         * folds it.
         */
        private fun tapLabel(view: View, tap: LabelTap) {
            val context = view.context
            if (context !is Activity) {
                return
            }
            val word = tap.option.name
            when {
                tap.on && tap.option.reasonPrompt != null ->
                    AlertDialog.Builder(context)
                        .setMessage("Remove your $word label?")
                        .setNegativeButton(android.R.string.cancel, null)
                        .setPositiveButton(android.R.string.ok) { _, _ -> sendLabel(tap, false, null) }
                        .show()

                tap.on -> sendLabel(tap, false, null)

                tap.option.reasonPrompt != null -> askForReason(context, tap)

                else -> sendLabel(tap, true, null)
            }
        }

        /**
         * The box the site puts up before an exemplary or a malice label, under
         * the site's own wording for it.
         *
         * Several lines rather than one: the exemplary prompt is a paragraph
         * and a warning about the eight hours it costs, which is the site
         * saying the label is worth spending rather than tapping. Nothing is
         * required here -- Tildes takes the label without a reason -- so an
         * empty box goes out as one.
         */
        private fun askForReason(screen: Activity, tap: LabelTap) {
            val box = EditText(screen).apply {
                setHorizontallyScrolling(false)
                maxLines = 4
            }
            val gap = (20 * screen.resources.displayMetrics.density).toInt()
            val around = LinearLayout(screen).apply {
                orientation = LinearLayout.VERTICAL
                setPadding(gap, gap / 2, gap, 0)
                addView(
                    box,
                    LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT,
                    ),
                )
            }
            AlertDialog.Builder(screen)
                .setMessage(tap.option.reasonPrompt)
                .setView(around)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton(android.R.string.ok) { _, _ ->
                    sendLabel(tap, true, box.text.toString().trim())
                }
                .show()
        }

        /**
         * And the write itself, on a thread of its own the way the filtered
         * tags are written: almost every write in this project rides a request
         * Boost made and is on OkHttp's thread by the time it gets here, while
         * this one is a menu row and nothing else.
         *
         * What the site answers with is the comment redrawn, which no screen
         * here is waiting for. The list of your own labels is updated in place
         * instead, so reopening the menu shows the tick without a fetch, and
         * the comment itself picks the label up on the next read of the page.
         *
         * **A refusal is said out loud.** Nothing on screen changes when this
         * works, so nothing on screen would change when it fails either, and a
         * label nobody can see is not something a person would think to check.
         */
        private fun sendLabel(tap: LabelTap, on: Boolean, reason: String?) {
            Thread {
                try {
                    Tildes.labelComment(tap.id36, tap.option.name, on, reason)
                    val was = labelledComments[tap.id36].orEmpty()
                    labelledComments[tap.id36] =
                        if (on) was + tap.option.name else was - tap.option.name
                    onMain { toast(labelDone(tap.option.name, on)) }
                } catch (t: Throwable) {
                    onMain { toast(LABEL_REFUSED) }
                }
            }.start()
        }

        private fun labelDone(name: String, on: Boolean): String =
            if (on) "Labelled $name" else "Label removed"

        private const val LABEL_REFUSED = "Tildes refused the label"

        /**
         * Puts **other period** at the bottom of a feed's window submenu.
         *
         * Tildes takes any window a listing is asked for, as `period=30h` or
         * `period=3d` off `SimpleHoursPeriod`, and its own dropdown says so: the
         * five it lists are followed by an **other period** row that prompts for
         * one. Boost has five windows of its own and no way to type a sixth, so
         * this is the row that asks.
         *
         * **The number cannot ride in the sort**, which is what makes this one
         * row rather than eight more. See [CUSTOM_WINDOW] for where it rides
         * instead.
         *
         * **The row is Boost's shape and nobody's id**, the way the share row
         * this same pass adds is: a fresh one of whatever class the windows
         * beside it are, carrying a marker no switch in the app has a case for,
         * so a tap reaches Boost's dispatcher and falls through to nothing.
         * [menuRowTapped] asks for the window one method earlier, and the row
         * kept beside it is what sorts by it afterwards.
         *
         * **Only on a feed's own menu.** Boost builds a shorter sort menu for a
         * search, a profile, the Groups page and the instance browser out of a
         * different method, and only a feed's carries **Active** -- which is why
         * that is the row this looks for. A profile takes no window at all and
         * neither does a search.
         *
         * Answers whether the row went in.
         */
        private fun addOtherPeriod(options: MutableList<Any>, known: Rows): Boolean =
            try {
                // Each of the three by an id that resolved, since `titleOf`
                // answers 0 for a row it knows nothing about and a row this was
                // looking for by 0 would be whichever came first.
                val known3 = known.activeRow != 0 && known.topRow != 0 && known.yearRow != 0
                val feed = known3 && options.any { titleOf(it, known) == known.activeRow }
                val windows = options.firstOrNull { known3 && titleOf(it, known) == known.topRow }
                    ?.let { top -> submenusOf(top).firstOrNull { it.isNotEmpty() } }

                // The row whose id sorts by a window Boost still knows and this
                // menu no longer shows, read before the translate takes it out.
                // Borrowing one rather than building one is what keeps the tap
                // working: the id has to be one Boost's own dispatcher has a
                // case for, and every one of those is on a row already.
                val carrier = windows?.firstOrNull { titleOf(it, known) == known.yearRow }

                if (!feed || windows == null || carrier == null ||
                    // A list handed through here twice must not grow twice.
                    windows.any { rowIdOf(it) == OTHER_PERIOD_ROW }
                ) {
                    false
                } else {
                    val row = carrier.javaClass.getDeclaredConstructor().newInstance()
                    row.javaClass.getDeclaredField(ROW_ID_FIELD).apply {
                        isAccessible = true
                        setInt(row, OTHER_PERIOD_ROW)
                    }
                    relabel(row, OTHER_PERIOD_WORDS)
                    windows.add(row)
                    synchronized(windowRows) { windowRows[row] = carrier }
                    true
                }
            } catch (t: Throwable) {
                false
            }

        /**
         * The marker that row carries, and what it reads.
         *
         * Boost's own row ids are resource ids and a handful of small numbers,
         * and no switch in the app has a case for this one, so a tap on it falls
         * through everything of Boost's. **other period** is the site's own word
         * for the row, off the last option in its own dropdown, capitalised to
         * sit with the five above it.
         */
        private const val OTHER_PERIOD_ROW = 0x57494E44
        private const val OTHER_PERIOD_WORDS = "Other period"

        /**
         * The **other period** rows this put into a menu, against the row whose
         * id sorts by the window that gets typed.
         *
         * Weak for the reason [ourRows] is: a menu is rebuilt every time it
         * opens, and nothing here should keep the old one alive.
         */
        private val windowRows = java.util.WeakHashMap<Any, Any>()

        /**
         * Asks for a window, and sorts by it.
         *
         * **Pickers rather than a box to type in**, which is the shape Three
         * Cheers for Tildes uses for the same question -- its
         * `time_period_prompt_dialog` is a `days_picker` and an `hours_picker`
         * side by side with a label each. It has no wrong answer to refuse:
         * every state of them is a window the site takes, bar all zero, which
         * greys **OK** instead of failing at it.
         *
         * **There are three of them, and the third is what the site counts
         * in.** `ago.human` splits a span into years, days and hours, so
         * tildes.net says *1 year, 35 days* where it never says *400 days* --
         * and a picker per unit is that split, which keeps what is set and what
         * the toolbar then reads the same shape. It also puts a year one move
         * away rather than 365 of them.
         *
         * A year is 365 days flat here because it is 365 days flat in `ago`,
         * so the pickers and the words cannot drift apart over a leap year.
         *
         * The labels sit **under** the pickers rather than beside them, which
         * is where three pairs fit that would not fit side by side, and each
         * one is as wide as its own plural whatever it is saying -- see
         * [unitLabel]. Three Cheers reserves the same width with an invisible
         * second label per picker.
         *
         * The dialog around them is Android's rather than Boost's. Boost's own
         * go through a trimmed Afollestad builder whose class, methods and
         * fields are all single letters out of R8, and four of the ones this
         * would want take an `int` and nothing else, so they cannot be told
         * apart by their signatures and would have to be pinned by name and
         * re-checked every release. A framework dialog needs none of that -- and
         * Boost's own `NumberPickerPreference` is a framework dialog around a
         * framework `NumberPicker`, which is this, so it is the app's own
         * precedent rather than a departure from it.
         *
         * The window is written before the sort is sent, since what comes back
         * is a listing for whatever [Session.customWindow] says by the time the
         * request is built.
         */
        private fun askForWindow(view: View, carrier: Any) {
            val context = view.context
            if (context !is Activity) {
                return
            }
            val callback = menuCallback(view)
            if (callback == null) {
                return
            }

            val was = Lemmy.windowHours(Session.customWindow()) ?: A_DAY
            val years = picker(context, MOST_YEARS, was / 24 / Lemmy.DAYS_IN_YEAR)
            val days = picker(context, Lemmy.DAYS_IN_YEAR - 1, was / 24 % Lemmy.DAYS_IN_YEAR)
            val hours = picker(context, 23, was % 24)
            val yearsWord = unitLabel(context, YEARS_WORD)
            val daysWord = unitLabel(context, DAYS_WORD)
            val hoursWord = unitLabel(context, HOURS_WORD)

            val gap = (8 * context.resources.displayMetrics.density).toInt()
            val row = LinearLayout(context).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER
                setPadding(gap * 2, gap * 2, gap * 2, 0)
                listOf(years to yearsWord, days to daysWord, hours to hoursWord)
                    .forEach { (picker, word) ->
                        addView(
                            column(context, picker, word),
                            LinearLayout.LayoutParams(
                                LinearLayout.LayoutParams.WRAP_CONTENT,
                                LinearLayout.LayoutParams.WRAP_CONTENT,
                            ).apply {
                                marginStart = gap
                                marginEnd = gap
                            },
                        )
                    }
            }

            val dialog = AlertDialog.Builder(context)
                .setTitle(OTHER_PERIOD_WORDS)
                .setView(row)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton(android.R.string.ok) { _, _ ->
                    // A number typed into a picker rather than scrolled to is
                    // still in its own box until it loses focus.
                    listOf(years, days, hours).forEach { it.clearFocus() }
                    val window = Lemmy.windowFor(
                        ((years.value * Lemmy.DAYS_IN_YEAR) + days.value) * 24 + hours.value,
                    )
                    if (window != null) {
                        Session.setCustomWindow(window)
                        sortBy(callback, carrier)
                    }
                }
                .create()

            val said = {
                yearsWord.text = if (years.value == 1) YEAR_WORD else YEARS_WORD
                daysWord.text = if (days.value == 1) DAY_WORD else DAYS_WORD
                hoursWord.text = if (hours.value == 1) HOUR_WORD else HOURS_WORD
                // Below an hour is the one window the site refuses, so it is
                // the one the button does not offer.
                dialog.getButton(AlertDialog.BUTTON_POSITIVE)?.isEnabled =
                    years.value > 0 || days.value > 0 || hours.value > 0
            }
            said()
            listOf(years, days, hours).forEach {
                it.setOnValueChangedListener { _, _, _ -> said() }
            }
            dialog.setOnShowListener { said() }
            dialog.show()
        }

        private fun picker(context: Context, most: Int, on: Int): NumberPicker =
            NumberPicker(context).apply {
                minValue = 0
                maxValue = most
                value = on.coerceIn(0, most)
            }

        /**
         * The unit under a picker, held at the width of its own plural so that
         * counting down to one does not move everything beside it.
         *
         * The plural is the wider of the two in every pair here, being the
         * singular with an `s`, so measuring it once at the start reserves
         * enough for both. Three Cheers does the same thing with a second
         * label per picker, kept invisible and laid out anyway.
         *
         * Measured before it is attached, which a `TextView` can be: nothing in
         * its width depends on the parent.
         */
        private fun unitLabel(context: Context, plural: String): TextView =
            TextView(context).apply {
                gravity = Gravity.CENTER
                text = plural
                measure(0, 0)
                minimumWidth = measuredWidth
            }

        /** A picker with its unit under it, which is one of the three. */
        private fun column(context: Context, picker: NumberPicker, word: TextView): LinearLayout =
            LinearLayout(context).apply {
                orientation = LinearLayout.VERTICAL
                gravity = Gravity.CENTER_HORIZONTAL
                addView(picker)
                addView(word)
            }

        /**
         * What the pickers open on and how far the first of them goes.
         *
         * A day, because it is the middle of the site's own five windows and
         * every state around it is one move away. Ten years at the far end,
         * which is past everything tildes.net has -- the site opened in 2018 --
         * and a window past that is the **All time** row one line up.
         */
        private const val A_DAY = 24
        private const val MOST_YEARS = 10

        /** The labels under them, which no resource in Boost says. */
        private const val YEAR_WORD = "year"
        private const val YEARS_WORD = "years"
        private const val DAY_WORD = "day"
        private const val DAYS_WORD = "days"
        private const val HOUR_WORD = "hour"
        private const val HOURS_WORD = "hours"

        /**
         * The screen that opened a menu, and the one method it takes a row
         * through.
         *
         * `MenuView` keeps the screen's callback on itself, which is how a tap
         * gets there at all, and the interface it implements has exactly one
         * method -- so the object is found by which field on the view holds one
         * of those, and the method by there being no other.
         *
         * Handing a row to it is the same call a tap makes, so a row Boost built
         * sorts by what it always sorted by, without this having to know which
         * screen is under the menu or how that screen reloads.
         */
        private fun menuCallback(view: View): Pair<Any, Method>? {
            val wanted = runCatching { Class.forName(MENU_CALLBACK) }.getOrNull() ?: return null
            val method = wanted.declaredMethods.singleOrNull() ?: return null
            val held = view.javaClass.declaredFields.firstNotNullOfOrNull { field ->
                try {
                    field.isAccessible = true
                    field.get(view)?.takeIf { wanted.isInstance(it) }
                } catch (t: Throwable) {
                    null
                }
            } ?: return null
            return held to method
        }

        /** And the call itself, which is a tap on that row without the tap. */
        private fun sortBy(callback: Pair<Any, Method>, row: Any) {
            try {
                val (held, method) = callback
                method.isAccessible = true
                method.invoke(held, row)
            } catch (t: Throwable) {
            }
        }

        /**
         * What a screen implements to be told which row was tapped. Nested in
         * `MenuView`, which keeps its name where its own fields do not.
         */
        private const val MENU_CALLBACK =
            "com.rubenmayayo.reddit.ui.customviews.menu.MenuView\$a"

        /**
         * The profile's list, from the menu drawn over it. The view is inside
         * the dialog, the dialog holds the callback the screen gave it, and the
         * callback holds the screen -- two hops, and the class at the end keeps
         * its name.
         */
        private fun profileList(view: View): Any? {
            val wanted = runCatching { Class.forName(PROFILE_LIST_FRAGMENT) }.getOrNull()
                ?: return null
            for (field in view.javaClass.declaredFields) {
                val held = read(field, view) ?: continue
                if (wanted.isInstance(held)) return held
                for (inner in held.javaClass.declaredFields) {
                    val deeper = read(inner, held) ?: continue
                    if (wanted.isInstance(deeper)) return deeper
                }
            }
            return null
        }

        /** The two words that mean a list has been filtered to one kind. */
        private val KIND_FILTERS = setOf(ONLY_TOPICS, ONLY_COMMENTS)

        /** The profile's own list, which is the screen those filters are on. */
        private const val PROFILE_LIST_FRAGMENT =
            "com.rubenmayayo.reddit.ui.profile.UserContributionListFragment"

        /**
         * What that row hands over: the topic's title in front of its address,
         * in the shape Boost's own title row uses, including the mark it puts
         * on one the site has tagged `nsfw`.
         *
         * The title is nowhere in the menu, so it comes off the topic the
         * address names. Every topic drawn has been parsed, and the id36 is the
         * whole of what a short link is.
         */
        private fun titleAndTopic(address: String): String? {
            val id36 = ID36_IN_LINK.find(address)?.groupValues?.get(1) ?: return null
            val topic = INSTANCE.topics[id36] ?: return null
            val mark = if (Lemmy.isNsfw(topic.tags)) " [NSFW]" else ""
            return topic.title + mark + " - " + address
        }

        /** The id36 out of either shape of a topic's address. */
        private val ID36_IN_LINK = Regex("(?:tild\\.es/|/~[A-Za-z0-9_.]+/)([a-z0-9]+)")

        /** Which field on a row holds the address, as a field rather than a value. */
        private fun addressField(row: Any): java.lang.reflect.Field? =
            row.javaClass.declaredFields.firstOrNull { field ->
                try {
                    field.isAccessible = true
                    val value = field.get(row) as? String
                    value != null &&
                        (value.startsWith(Tildes.SHORT_BASE) || value.startsWith(Tildes.BASE))
                } catch (t: Throwable) {
                    false
                }
            }

        /**
         * Which int field on a row holds its icon, which is the one Boost
         * starts at -1 where every other int on a fresh row is zero. Only
         * meaningful on a row nothing has been written to yet.
         */
        private fun iconOf(fresh: Any): java.lang.reflect.Field? =
            fresh.javaClass.declaredFields.firstOrNull { field ->
                field.type == Int::class.javaPrimitiveType &&
                    try {
                        field.isAccessible = true
                        field.getInt(fresh) == -1
                    } catch (t: Throwable) {
                        false
                    }
            }

        /** Copies one int field from the row beside it, for the icon. */
        private fun copyInt(field: java.lang.reflect.Field?, from: Any, to: Any) {
            field ?: return
            field.isAccessible = true
            field.setInt(to, field.getInt(from))
        }

        /**
         * The rows this put into a menu and what each hands over, held weakly:
         * a menu is rebuilt every time it opens, and nothing here should keep
         * the old one alive.
         */
        private val ourRows = java.util.WeakHashMap<Any, String>()

        /**
         * A tap on a menu row, before Boost decides what it means.
         *
         * Every row in the app reaches this: `MenuView` resolves a tap to a row
         * in one static method and hands it to whichever screen opened the
         * menu. A row this added carries a marker no switch has a case for, so
         * Boost's own dispatch runs and does nothing, and the dialog is
         * dismissed after it either way. Nothing here changes that -- this only
         * acts first.
         *
         * **Three rows are ours.** A share of the title beside the topic's own
         * address, **other period**, which asks for a window and then sorts by
         * it, and **Topic log**, which opens what the site says has been done
         * to the topic. See [addTitleAndTopic], [addOtherPeriod] and
         * [addTopicLog].
         *
         * The view is what both of them need anyway: it is inside the dialog,
         * so its context is the screen underneath rather than an application
         * one, and the screen's own callback is on it.
         *
         * Called from patched bytecode, at the head of that method.
         */
        @JvmStatic
        fun menuRowTapped(view: Any?, index: Int) {
            if (view !is View || !Session.wasTildes()) return
            try {
                val rows = view.javaClass.declaredFields.firstNotNullOfOrNull { field ->
                    field.isAccessible = true
                    field.get(view) as? List<*>
                } ?: return
                val row = rows.getOrNull(index) ?: return

                synchronized(windowRows) { windowRows[row] }?.let {
                    askForWindow(view, it)
                    return
                }

                synchronized(logRows) { logRows[row] }?.let {
                    showTopicLog(view, it)
                    return
                }

                synchronized(labelRows) { labelRows[row] }?.let {
                    tapLabel(view, it)
                    return
                }

                val words = synchronized(ourRows) { ourRows[row] } ?: return

                val intent = Intent(Intent.ACTION_SEND)
                    .setType("text/plain")
                    .putExtra(Intent.EXTRA_TEXT, words)
                val chooser = Intent.createChooser(intent, null)
                if (view.context !is Activity) chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                view.context.startActivity(chooser)
            } catch (t: Throwable) {
            }
        }

        /**
         * The marker that row carries. Boost's own are resource ids and a
         * handful of small numbers, and no switch in the app has a case for
         * this one, so a tap on it falls through everything of Boost's.
         */
        private const val TITLE_AND_TOPIC_ROW = 0x54494C44

        /** What it reads. No resource says this, so the words are ours. */
        private const val TITLE_AND_TOPIC_WORDS = "Share title + topic"

        /**
         * The address a row shows under itself, which is any string on it
         * pointing at this site. A row's fields are single letters, and the one
         * other string that can hold a URL is an icon's, which these rows do
         * not use and which never points here.
         */
        private fun addressOf(row: Any): String? =
            row.javaClass.declaredFields.firstNotNullOfOrNull { field ->
                try {
                    field.isAccessible = true
                    (field.get(row) as? String)?.takeIf {
                        it.startsWith(Tildes.SHORT_BASE) || it.startsWith(Tildes.BASE)
                    }
                } catch (t: Throwable) {
                    null
                }
            }

        /**
         * Writes the short form over the address a menu row shows.
         *
         * **Share…** and **Copy…** print the address under each row, so a row
         * said `https://tildes.net/~life/1vmq/new_worlds_and_what_was...` while
         * the share it fired handed over `tild.es/1vmq`. The rewrite was at the
         * far end -- one method every share goes out through -- and a menu is
         * built from the model long before anything reaches it.
         *
         * So the rows are rewritten too, and here rather than where they are
         * built: every menu in the app already comes through this method, and
         * the alternative is the four builders that make one.
         *
         * **Found by value, not by name.** A row's fields are single letters
         * and several of them are strings -- an icon URL, the title, the line
         * under it -- so every string on a row is offered to the rewrite and
         * only an address answers to it. Nothing else can change: the rewrite
         * matches a topic's own URL on this one host.
         *
         * Submenus too, which is where these two menus keep their rows.
         */
        private fun shortenLinks(options: MutableList<Any>, depth: Int): Int {
            if (depth == 0) return 0
            var written = 0
            try {
                options.forEach { row ->
                    row.javaClass.declaredFields.forEach field@{ field ->
                        if (field.type != String::class.java) return@field
                        field.isAccessible = true
                        val value = field.get(row) as? String ?: return@field
                        val short = Tildes.shortLinks(value)
                        if (short != value) {
                            field.set(row, short)
                            written++
                        }
                    }
                }
                options.forEach { row ->
                    submenusOf(row).forEach { written += shortenLinks(it, depth - 1) }
                }
            } catch (t: Throwable) {
            }
            return written
        }

        /**
         * Takes the listing-type rows off a search menu.
         *
         * Kept apart from [translate] and its tables because it is the one drop
         * decided by what else is in the menu rather than by the row alone.
         * `all` titles the inbox filter and the Notifications filter as well,
         * and both come through here, so it comes off only where `local` is
         * beside it -- which is the search menu and nothing else in the app.
         *
         * Top level only, since that is where the group sits. The sorts under
         * it are a feed's sorts and [translate] has already been over them.
         */
        private fun dropListingRows(options: MutableList<Any>, known: Rows): Int {
            if (known.localRow == 0) return 0
            return try {
                if (options.none { titleOf(it, known) == known.localRow }) return 0
                val before = options.size
                options.removeAll { titleOf(it, known) in known.listingRows }
                before - options.size
            } catch (t: Throwable) {
                0
            }
        }

        /**
         * Takes **Delete** off the Edit submenu on a topic somebody else wrote.
         *
         * That submenu is one guard's worth of rows -- Edit topic, Mark NSFW
         * and Delete -- and the guard is "the author is me", so all three
         * arrive together or not at all. [mayTagRow] opens it on a topic this
         * account may tag, and two of the three are that permission spelt
         * differently: the composer is a Tags field once [lockFields] has been
         * over it, and Mark NSFW adds and removes the `nsfw` tag. Delete is
         * not. Tildes lets nobody but the author delete a topic, so leaving the
         * row on would be an offer the site answers **403** to, after the
         * confirmation dialog and with the row already gone from the screen.
         *
         * Only for the menu [mayTagRow] marked, which is why the id is a
         * parameter rather than a flag read here: **Delete** is a real row on
         * your own topics and on every comment, and this must not touch either.
         *
         * Depth, because the row is a child of the Edit row rather than one of
         * the menu's own.
         */
        private fun dropDeleteRow(
            options: MutableList<Any>,
            known: Rows,
            somebodyElses: String?,
            depth: Int,
        ): Int {
            if (somebodyElses == null || known.deleteRow == 0 || depth == 0) return 0
            return try {
                var dropped = options.count { titleOf(it, known) == known.deleteRow }
                options.removeAll { titleOf(it, known) == known.deleteRow }
                options.forEach { row ->
                    submenusOf(row).forEach {
                        dropped += dropDeleteRow(it, known, somebodyElses, depth - 1)
                    }
                }
                dropped
            } catch (t: Throwable) {
                0
            }
        }

        private fun rowsIn(rows: MutableList<Any>): Int =
            rows.size + rows.sumOf { row -> submenusOf(row).sumOf { it.size } }

        /**
         * Whichever field on a row holds its submenu, found the same way the
         * title is: by what it contains rather than by a name that is one
         * letter and free to move.
         */
        @Suppress("UNCHECKED_CAST")
        private fun submenusOf(row: Any): List<MutableList<Any>> =
            row.javaClass.declaredFields.mapNotNull { field ->
                try {
                    field.isAccessible = true
                    (field.get(row) as? MutableList<Any>)?.takeIf { it !== row }
                } catch (t: Throwable) {
                    null
                }
            }

        /**
         * Which of the rows this knows about a menu row is labelled with, or
         * `0` for one carrying none of them, which no resource id ever is.
         *
         * Boost's row fields are down to single letters and the icon sits
         * beside the title, though the two never collide: a string resource is
         * `0x7f13xxxx` and a drawable `0x7f08xxxx`. Matching the value against
         * the names means no field has to be named.
         */
        private fun titleOf(row: Any, known: Rows): Int =
            row.javaClass.declaredFields.firstNotNullOfOrNull { field ->
                if (field.type != Int::class.javaPrimitiveType) {
                    null
                } else {
                    try {
                        field.isAccessible = true
                        field.getInt(row).takeIf { it in known.titles }
                    } catch (t: Throwable) {
                        null
                    }
                }
            } ?: 0

        /**
         * The id Boost gave a row when it built it, or null for a row this
         * cannot read one off.
         *
         * Nothing is decided per row from this. It answers one question about
         * the menu as a whole, in [isCommentSort], so a field that has moved
         * costs the comment menu its four words rather than putting the wrong
         * word anywhere.
         */
        private fun rowIdOf(row: Any): Int? =
            try {
                row.javaClass.getDeclaredField(ROW_ID_FIELD)
                    .apply { isAccessible = true }
                    .getInt(row)
            } catch (t: Throwable) {
                null
            }

        /** Writes Tildes' own word over a row, in front of the resource under it. */
        private fun relabel(row: Any, word: String) {
            row.javaClass.getDeclaredField(TITLE_TEXT_FIELD).apply {
                isAccessible = true
                set(row, word)
            }
        }

        /** The sort rows, looked up by name once the app can be reached. */
        private fun rows(): Rows? {
            rows?.let { return it }

            val context = Session.application() ?: return null
            val wanted =
                SORT_ROWS.keys + DROPPED_ROWS + RENAMED_ROWS.keys + DROPPED_LISTING_ROWS +
                    SAID_TWICE.flatMap { listOf(it.first, it.second) } + SHARE_TITLE_ROW +
                    SHARE_MENU_ROW + DELETE_ROW + PROFILE_GROUP_FILTER_ROWS + PROFILE_KIND_ROWS
            val ids = wanted.mapNotNull { name ->
                val id = context.resources.getIdentifier(name, "string", context.packageName)
                if (id == 0) null else name to id
            }.toMap()

            // A rename is not fatal -- the rows it covers keep Boost's word and
            // the dropped ones stay in the menu -- but it is silent otherwise,
            // since a wrong sort name reads like a decision rather than a miss.
            val missing = wanted - ids.keys
            if (missing.isNotEmpty()) {
            }
            if (ids.isEmpty()) return null

            // Every menu carries the rows Tildes has nothing behind, so both
            // tables drop and rename the same four. Only the sorts differ.
            val resolved = Rows(
                titles = ids.values.toSet(),
                topRow = ids["sort_top"] ?: 0,
                activeRow = ids["sort_active"] ?: 0,
                yearRow = ids["sort_year"] ?: 0,
                localRow = ids[LOCAL_ROW] ?: 0,
                listingRows = DROPPED_LISTING_ROWS.mapNotNull { ids[it] }.toSet(),
                saidTwice = SAID_TWICE.mapNotNull { (link, kept) ->
                    val one = ids[link]
                    val other = ids[kept]
                    if (one == null || other == null) null else one to other
                },
                deleteRow = ids[DELETE_ROW] ?: 0,
                shareLinkRow = ids[SHARE_LINK_ROW] ?: 0,
                shareTopicRow = ids[SHARE_TOPIC_ROW] ?: 0,
                shareTitleRow = ids[SHARE_TITLE_ROW] ?: 0,
                shareMenuRow = ids[SHARE_MENU_ROW] ?: 0,
                sortRows = SORT_ROWS.keys.mapNotNull { ids[it] }.toSet(),
                groupFilterRows = PROFILE_GROUP_FILTER_ROWS.mapNotNull { ids[it] }.toSet(),
                allGroupsRow = ids[ALL_GROUPS_ROW] ?: 0,
                profileOrders = PROFILE_ORDER_ROWS.mapNotNull { (row, order) ->
                    ids[row]?.let { it to order }
                }.toMap(),
                post = Table(
                    dropped = (DROPPED_SORTS + DROPPED_ROWS).mapNotNull { ids[it] }.toSet(),
                    words = ids.mapNotNull { (name, id) ->
                        (RENAMED_ROWS[name] ?: sortWord(SORT_ROWS[name]))?.let { id to it }
                    }.toMap(),
                ),
                comment = Table(
                    dropped = (DROPPED_COMMENT_SORTS + DROPPED_ROWS).mapNotNull { ids[it] }.toSet(),
                    words = ids.mapNotNull { (name, id) ->
                        (RENAMED_ROWS[name] ?: commentSortWord(COMMENT_SORT_ROWS[name]))
                            ?.let { id to it }
                    }.toMap(),
                ),
                // Every sort row but the two goes, which takes the Top row's
                // eight windows with it: `translate` drops a row before it
                // walks into what hangs under it.
                group = Table(
                    dropped = (SORT_ROWS.keys - GROUP_SORT_ROWS.keys + DROPPED_ROWS)
                        .mapNotNull { ids[it] }.toSet(),
                    words = ids.mapNotNull { (name, id) ->
                        (RENAMED_ROWS[name] ?: GROUP_SORT_ROWS[name])?.let { id to it }
                    }.toMap(),
                ),
            )

            rows = resolved
            return resolved
        }

        /**
         * The score under a comment, which Boost otherwise prints as a bare
         * `0` for anything nobody has voted on.
         *
         * Tildes prints no number at all until a comment has a vote --
         * `comment.num_votes > 0` guards both places its template writes one --
         * so a `0` is Boost's convention showing through rather than anything
         * the site said. The other way round it, adding the author's own vote
         * the way Lemmy and Reddit count it, would put every score in the app
         * one above what tildes.net shows for the same comment.
         *
         * Called from patched bytecode with the text Boost just built, which
         * at that point is `String.valueOf(score)` and nothing else, so it
         * reads "0" for exactly the comments meant here. Taking the number
         * instead would mean naming the register it came from, and Boost has
         * already reused that one for this string.
         */
        @JvmStatic
        fun scoreText(boostsOwn: String): String =
            if (answering && boostsOwn == "0") "" else boostsOwn

        /**
         * And the separator that was left standing beside the blank.
         *
         * A comment's byline is three views in a row -- the score, a middle
         * dot, and the time -- and the dot is a `TextView` in the layout with
         * `android:text="·"` on it that no code in the app ever touches. So
         * blanking the score took the number off and left `Apos    · 3 hours
         * ago`, a dot separating the time from nothing.
         *
         * **The blank is the whole of the scope.** Boost builds that text with
         * `String.valueOf(long)`, which is never empty, and its two other
         * branches write `"?"` or a dagger in front, so the only way it arrives
         * empty is [scoreText] having emptied it. Asking the account again here
         * would answer the same thing in more words -- and it would answer it
         * about the request rather than about the row, which is the crossing
         * that matters on a list recycled across an account switch.
         *
         * Which is also why the dot is put **back**: holders are reused, and a
         * row that drew a Tildes comment with no votes is the same object that
         * later draws one with some.
         *
         * Called from patched bytecode with the score view and the text just
         * set on it. The dot is found under the row rather than the window,
         * since a screen full of comments has one of each per row.
         */
        @JvmStatic
        fun commentDot(score: TextView, text: CharSequence?) {
            val row = score.parent as? ViewGroup ?: return
            // Looked up once. This runs per row, and a list of comments is the
            // one place in the app that binds several a second.
            if (dotId == 0) dotId = id(row.context, "item_comment_dot")
            hide(row.findViewById(dotId), text.isNullOrEmpty())
        }

        /** The separator's id, resolved by name on the first comment drawn. */
        private var dotId = 0

        /**
         * How many things are waiting, for the badge over the inbox.
         *
         * Boost asks the server this once an hour, from a background job and
         * from nowhere else, and every badge in the app is drawn off the answer
         * it stored last time. So a notification that arrived on tildes.net
         * five minutes ago was not on the screen and could not be put there:
         * nothing a person can do in the app asks the question.
         *
         * Here the question costs nothing to answer. Tildes prints the counts
         * into the header of every page it serves, so the interceptor knows
         * them as of whatever was fetched last -- a feed pulled down, a topic
         * opened -- and this hands that number to the badge in place of the
         * stored one.
         *
         * **The two are added the way Boost adds its own three.** Tildes counts
         * a reply and a mention as one thing and messages as another, and the
         * badge is the total of everything waiting either way.
         *
         * `-1` for "ask Boost", which is a Lemmy account and an account whose
         * pages have not been read yet. The counts outlive a switch to a Lemmy
         * account -- they are cleared when the session goes, not when the
         * account changes -- so the account is asked here rather than inferred
         * from having an answer.
         */
        /**
         * The comment a single-comment screen was opened under, which decides
         * whether it offers **Show context**.
         *
         * Boost has two ways of drawing one comment's thread and they are not
         * the same screen. Opened with a **parent**, it asks `/comment/list` for
         * that parent's subtree, adopts the oldest comment it is given as the
         * root whatever the root's own path says, and draws **Show context**
         * over it when that path names a comment it has not got -- tapping which
         * asks again one step further up. Opened with **no parent**, it asks by
         * topic, throws away everything whose path does not name the comment,
         * and drops what is left if its parent is not among it. So a comment
         * with a parent has to arrive claiming none, and a comment claiming none
         * gets **View all comments** instead: the row that redraws the whole
         * topic, where the comment is wherever the site put it -- which for a
         * chain the site folded is behind one `[+]` row.
         *
         * **Which of the two it is comes down to what opened the screen.** The
         * inbox passes the parent along, because a notification carries the
         * comment's whole path. A link tapped in a comment does not: Boost
         * resolves the address, takes the post and the comment off the answer
         * and starts the screen with those two, and the path it just read goes
         * nowhere. So following a link to a comment could never offer the row,
         * whatever this end answered with.
         *
         * This fills that in. The comment's parent is known here -- the page it
         * is on was read to answer the address in the first place -- and it goes
         * in where Boost left a blank, so the link route becomes the one the
         * inbox already takes.
         *
         * Boost's own answer is handed in and handed straight back where it has
         * one, so this only ever fills a gap. Off disk rather than [answering],
         * since the screen is built before it fetches anything.
         */
        @JvmStatic
        fun commentParent(comment: String?, parent: String?): String? {
            if (!parent.isNullOrEmpty()) return parent
            if (comment.isNullOrEmpty() || !Session.wasTildes()) return parent

            val id = comment.toIntOrNull() ?: return parent
            val above = INSTANCE.commentParents[Lemmy.intToId36(id)] ?: return parent
            val answer = Lemmy.id36ToInt(above).toString()
            return answer
        }

        /**
         * Fires Boost's own **the inbox count changed** broadcast, which makes
         * every screen holding a badge draw it again.
         *
         * **The body of this is written by the patch**, and it has to be,
         * because it names three things the extension cannot: the static Boost
         * keeps its count object in, the field on it, and the method that
         * stores one and broadcasts. All three are single letters after R8 and
         * all three move between releases, so hard-coding them here would break
         * silently on the next one. The patch finds the method by the action
         * string it broadcasts -- which is in three method bodies and is static
         * in only one -- and reads the two field references straight out of that
         * method's own body, so nothing is spelled out anywhere.
         *
         * What it writes is the null check the app's own method does not do,
         * and then the call:
         *
         * ```
         * sget-object p1, <the static>
         * if-eqz p1, :nothing
         * iget-object p1, p1, <the count on it>
         * if-eqz p1, :nothing
         * invoke-static { p0, p1 }, <store and broadcast>
         * :nothing
         * ```
         *
         * `spare` is why the second parameter exists. A patched body needs a
         * register to hold what it reads, and a parameter is the one way to be
         * sure of one: the register count of a compiled method is fixed and
         * nothing in the patcher grows it. It is always passed `null`.
         *
         * What is compiled here is a `return-void` that the insert goes in front
         * of, so an unpatched extension does nothing rather than the wrong
         * thing.
         */
        @JvmStatic
        @Suppress("UNUSED_PARAMETER")
        fun repaintBadge(context: Context, spare: Any?) {
        }

        @JvmStatic
        fun inboxTotal(): Int {
            if (!Session.wasTildes()) return -1
            val waiting = Tildes.unreadCounts ?: return -1
            return waiting.notifications + waiting.messages
        }

        /**
         * Called from patched bytecode, in the middle of Boost's own builder
         * chain, so it takes and returns the builder.
         */
        @JvmStatic
        fun addTo(builder: OkHttpClient.Builder): OkHttpClient.Builder =
            builder.addInterceptor(INSTANCE)
    }
}

/**
 * Reads a request body without ever naming okio.
 *
 * Boost keeps okhttp's class names but obfuscates okio to `km`, so
 * `RequestBody.writeTo` really has the signature `writeTo(km.g)`. A call
 * compiled against `okio.BufferedSink` resolves to nothing, and the failure
 * arrives as a `NoClassDefFoundError` -- an Error rather than an Exception, so
 * it walks through a `catch (e: Exception)` untouched and the HTTP call dies
 * with nothing in the log.
 *
 * The way out is that okio's `Buffer` implements `java.nio.channels.ByteChannel`
 * and `BufferedSink` implements `WritableByteChannel`. Those are JDK interfaces,
 * so no obfuscator can rename them, and the bytes come back through the channel
 * with real types on both ends. Only two names are looked up reflectively, both
 * of them okhttp's, which the patch already depends on staying put.
 */
/**
 * The block a topic's tags are drawn in, which puts them in rows and starts a
 * new one when it runs out of width.
 *
 * Android has no such container of its own, and the two that exist are both a
 * dependency: `FlexboxLayout` ships in a library, and `ConstraintLayout`'s
 * `Flow` wants its children inside a `ConstraintLayout`. This is written here
 * instead, which is a good deal less than either and needs nothing the app is
 * not already carrying.
 *
 * A scrolling row was the first shape of it and the wrong one. A topic on
 * tildes.net carries seven tags as often as one, and a row that scrolls
 * sideways hides the rest behind a gesture nothing on the screen suggests, on a
 * screen that is already scrolling the other way.
 *
 * Margins are what space the chips, both across a row and between rows, so the
 * same pill is at home here and in the composer's own row.
 */
private class TagFlow(context: Context) : ViewGroup(context) {

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val width = MeasureSpec.getSize(widthMeasureSpec)
        val limit = (width - paddingLeft - paddingRight).coerceAtLeast(0)
        val across = MeasureSpec.makeMeasureSpec(limit, MeasureSpec.AT_MOST)
        val down = MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED)

        var x = 0
        var rowHeight = 0
        var height = 0
        drawn { child ->
            child.measure(across, down)
            // A chip wider than the whole block still gets a row of its own
            // rather than being wrapped away, which is why this asks whether
            // the row has anything in it yet.
            if (x > 0 && x + child.spanWidth() > limit) {
                height += rowHeight
                x = 0
                rowHeight = 0
            }
            x += child.spanWidth()
            rowHeight = max(rowHeight, child.spanHeight())
        }

        setMeasuredDimension(
            width,
            resolveSize(height + rowHeight + paddingTop + paddingBottom, heightMeasureSpec),
        )
    }

    override fun onLayout(changed: Boolean, left: Int, top: Int, right: Int, bottom: Int) {
        val limit = (right - left - paddingLeft - paddingRight).coerceAtLeast(0)

        var x = 0
        var y = 0
        var rowHeight = 0
        drawn { child ->
            if (x > 0 && x + child.spanWidth() > limit) {
                y += rowHeight
                x = 0
                rowHeight = 0
            }
            val margins = child.layoutParams as? MarginLayoutParams
            val childLeft = paddingLeft + x + (margins?.leftMargin ?: 0)
            val childTop = paddingTop + y + (margins?.topMargin ?: 0)
            child.layout(
                childLeft,
                childTop,
                childLeft + child.measuredWidth,
                childTop + child.measuredHeight,
            )
            x += child.spanWidth()
            rowHeight = max(rowHeight, child.spanHeight())
        }
    }

    /** Every child there is something to draw, which is the same walk twice. */
    private inline fun drawn(each: (View) -> Unit) {
        for (i in 0 until childCount) {
            val child = getChildAt(i)
            if (child.visibility != GONE) each(child)
        }
    }

    private fun View.spanWidth(): Int {
        val margins = layoutParams as? MarginLayoutParams ?: return measuredWidth
        return measuredWidth + margins.leftMargin + margins.rightMargin
    }

    private fun View.spanHeight(): Int {
        val margins = layoutParams as? MarginLayoutParams ?: return measuredHeight
        return measuredHeight + margins.topMargin + margins.bottomMargin
    }

    override fun generateDefaultLayoutParams(): LayoutParams =
        MarginLayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT)

    override fun generateLayoutParams(p: LayoutParams): LayoutParams = MarginLayoutParams(p)

    override fun checkLayoutParams(p: LayoutParams?): Boolean = p is MarginLayoutParams
}

private object RequestBodies {

    @Volatile
    private var resolved = false
    private var writeTo: Method? = null
    private var source: Method? = null

    fun readUtf8(request: Request): String {
        val body = request.body ?: return ""
        resolve()
        val write = writeTo ?: return ""
        return try {
            val sink = emptyBuffer() ?: return ""
            write.invoke(body, sink)
            drain(sink as ReadableByteChannel)
        } catch (e: Throwable) {
            ""
        }
    }

    @Synchronized
    private fun resolve() {
        if (resolved) return
        resolved = true
        try {
            writeTo = RequestBody::class.java.methods.firstOrNull {
                it.name == "writeTo" && it.parameterTypes.size == 1
            }
            source = ResponseBody::class.java.methods.firstOrNull {
                it.name == "source" && it.parameterTypes.isEmpty()
            }

            // Prove the shape before trusting it, so a change in okhttp shows up
            // here rather than as an empty password three layers down.
            val probe = emptyBuffer()
            if (probe !is ReadableByteChannel || probe !is WritableByteChannel) {
                writeTo = null
            } else {
            }
        } catch (e: Throwable) {
            writeTo = null
        }
    }

    /**
     * A fresh, empty okio Buffer. A response body built from a string is backed
     * by one, and `source()` hands back that very buffer -- which is cheaper
     * than finding the obfuscated class and calling its constructor.
     */
    private fun emptyBuffer(): Any? = source?.invoke("".toResponseBody(null))

    private fun drain(channel: ReadableByteChannel): String {
        val out = ByteArrayOutputStream()
        val chunk = ByteBuffer.allocate(8192)
        while (true) {
            chunk.clear()
            if (channel.read(chunk) <= 0) break
            out.write(chunk.array(), 0, chunk.position())
        }
        return out.toString("UTF-8")
    }
}
