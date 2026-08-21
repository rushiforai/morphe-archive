package app.morphe.extension.boostforlemmy.tildes

import org.jsoup.Jsoup
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element
import java.io.BufferedReader
import java.io.File
import java.net.HttpURLConnection
import java.net.URL
import java.util.concurrent.Callable
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.ExecutionException
import java.util.concurrent.Future
import java.util.concurrent.FutureTask

/**
 * Everything that talks to tildes.net.
 *
 * A single global gate spaces requests out, because the whole point of running
 * on-device is that one phone should not look like a crawler. Tildes' robots.txt
 * welcomes scrapers that identify themselves and keep a reasonable rate; this
 * does both.
 */
object Tildes {

    const val BASE = "https://tildes.net"

    /**
     * The one page whose own header cannot be believed, since rendering it is
     * what empties the thing it is counting. See the read in [fetch].
     */
    const val NOTIFICATIONS_UNREAD = "/notifications/unread"

    /**
     * Lemmy error codes, passed through verbatim. Boost matches them (after
     * turning underscores into spaces) to decide what to show the user, so
     * these strings are part of the wire contract, not free text.
     */
    const val ERROR_MISSING_TOTP = "missing_totp_token"
    const val ERROR_INCORRECT_TOTP = "incorrect_totp_token"
    const val ERROR_INCORRECT_LOGIN = "incorrect_login"
    /**
     * Who this is, for the admin reading the logs. The `+` URL is the point of
     * it, so it has to be the repository the bundle ships from rather than the
     * one it is written in -- somewhere anyone can actually open.
     */
    private const val USER_AGENT =
        "Boost-for-Tildes (Morphe patch; +github.com/Apostolique/apos-morphe-patches)"
    private const val MIN_INTERVAL_MS = 700L
    private const val CACHE_TTL_MS = 30_000L

    private val lock = Any()
    private var lastRequestAt = 0L

    /** Cookies for the logged-in Tildes session, if any. */
    @Volatile
    var cookies: MutableMap<String, String> = mutableMapOf()

    @Volatile
    var csrfToken: String? = null

    @Volatile
    var username: String? = null

    /** What the header of the last page said was waiting. See [unreadCounts]. */
    class Unread(val notifications: Int, val messages: Int)

    @Volatile
    private var unread: Unread? = null

    /**
     * The unread counts, off the header of the last page fetched for anything.
     *
     * Tildes writes them into every page it serves a signed-in account --
     * `macros/user.jinja2` puts a `.logged-in-user-alert` beside the username
     * for each of the two, and `base.jinja2` puts the total on the sidebar
     * button -- so a front page fetched to draw a feed already carries them and
     * asking for them separately is a request spent on something already in
     * hand.
     *
     * **The point is not only the request.** `/notifications/unread` is not a
     * report, it is the page a person reads, and Tildes marks everything on it
     * read as it renders when the account has **auto_mark_notifications_read**
     * on. Fetching it to answer a poll is this end pretending somebody looked,
     * and it costs exactly the thing being counted.
     *
     * `null` until a signed-in page has been seen, which is what tells "nothing
     * is waiting" from "nobody has asked yet".
     */
    val unreadCounts: Unread?
        get() = unread

    /** Whose counts they were goes with the account. */
    fun forgetUnread() {
        unread = null
    }

    @Volatile
    private var offered: List<LabelOption> = emptyList()

    /**
     * The labels a comment's menu may offer, off the last page fetched that
     * carried them.
     *
     * **Which pages carry them is a decision the page makes.** The template is
     * built by a macro in `macros/comments.jinja2`, but it is not part of the
     * comment tree: a page has to call the macro from its own `templates`
     * block, and three do -- a topic's page, a profile (which the profile's
     * own search inherits), and the unread notifications page (which
     * `/notifications` inherits). **The bookmarks page does not**, and neither
     * does `/votes`, which is rendered from it. That is a gap on the site
     * itself rather than here: both draw a **Label** button on every comment
     * and the site's own script then looks for a template that is not on the
     * page.
     *
     * So this is read off every fetch rather than off a topic, the way the
     * unread counts are. Which comments an account may label is a different
     * question with a different answer, and it is on the comment -- see
     * [Comment.mayLabel].
     *
     * **Kept rather than replaced when a page carries none.** Most pages carry
     * none, a guest's carry none, and the set an account was offered does not
     * stop being true because a feed was read after it.
     */
    val labelOptions: List<LabelOption>
        get() = offered

    /** Whose labels they were goes with the account, like the counts above. */
    fun forgetLabelOptions() {
        offered = emptyList()
    }

    /**
     * Takes what was just marked read off the held counts.
     *
     * The badge is drawn from these, and marking something read does not fetch
     * a page, so without this the number would come back at the next screen
     * until something else was fetched -- which reads exactly like a mark that
     * did not take. The next page corrects it either way.
     */
    fun notificationsRead(all: Boolean) {
        val held = unread ?: return
        unread = Unread(
            if (all) 0 else (held.notifications - 1).coerceAtLeast(0),
            held.messages,
        )
    }

    /** The same for a conversation opened, which is what marks one read. */
    fun messageRead() {
        val held = unread ?: return
        unread = Unread(held.notifications, (held.messages - 1).coerceAtLeast(0))
    }

    private class CacheEntry(val at: Long, val body: String)

    private val cache = object : LinkedHashMap<String, CacheEntry>(16, 0.75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, CacheEntry>) = size > 200
    }

    private fun gate() {
        synchronized(lock) {
            val wait = MIN_INTERVAL_MS - (System.currentTimeMillis() - lastRequestAt)
            if (wait > 0) Thread.sleep(wait)
            lastRequestAt = System.currentTimeMillis()
        }
    }

    private fun cookieHeader(): String =
        cookies.entries.joinToString("; ") { "${it.key}=${it.value}" }

    /**
     * The cookies a response sets, kept.
     *
     * Tildes reissues its session cookie as it goes, so the jar has to take
     * what comes back rather than keep the copy login left. It also hands an
     * anonymous session to a request that carries none, and **that one is
     * refused**: a fetch that went out with an empty jar and comes back to a
     * full one is a read that raced the restore, and letting its cookie land
     * would put an anonymous session over the real one. The next page then
     * reads logged out and the account is signed out for real, which is what
     * happened on 2026-08-17 -- `PITFALLS.md` has it.
     *
     * By what the request **sent** rather than by what it answered, since that
     * is the half that says whether this response knows about the session at
     * all.
     */
    private fun absorbCookies(conn: HttpURLConnection, sent: Map<String, String>) {
        val lines = conn.headerFields["Set-Cookie"] ?: return
        if (sent.isEmpty() && cookies.isNotEmpty()) {
            return
        }
        // Swapped in rather than edited in place. Other request threads read
        // this map while this one writes it, and editing it under them fails
        // their read with a ConcurrentModificationException, which surfaces as
        // an HTTP call that died for no visible reason.
        val next = LinkedHashMap(cookies)
        lines.forEach { line ->
            val pair = line.substringBefore(';')
            val name = pair.substringBefore('=').trim()
            val value = pair.substringAfter('=', "").trim()
            if (name.isNotEmpty()) {
                if (value.isEmpty()) next.remove(name) else next[name] = value
            }
        }
        cookies = next
    }

    /** Fetches already running, so the same page is never asked for twice at once. */
    private val inflight = ConcurrentHashMap<String, FutureTask<String>>()

    /**
     * GET an HTML page, cached briefly so repeat views cost nothing upstream.
     *
     * Boost fires the same page from several threads at once -- opening a user
     * profile asks for it three times over about a second -- and the cache
     * catches none of that, since all three start before any of them finishes.
     * A fetch already in flight is joined instead of repeated.
     */
    /**
     * Until when a page is fetched again rather than read out of the cache.
     *
     * Set by a pull to refresh, which is the one fetch somebody actually asked
     * for. See [pulledToRefresh].
     */
    @Volatile
    private var readPastCacheUntil = 0L

    /**
     * Reads the next few seconds of fetches past the cache.
     *
     * A page is kept for 30 seconds so that going back and forth between a feed
     * and a topic costs nothing upstream, which is right for everything the app
     * does on its own and wrong for the one thing a person does deliberately:
     * something changed, and they pulled the list down to see it. Before this,
     * a bookmark added on tildes.net and a refresh in the app inside that window
     * showed the page as it was, which reads exactly like a write that did not
     * take.
     *
     * The other two limits are untouched, and they are the ones that matter to
     * the site: requests are still spaced 700 ms apart, and a fetch already in
     * flight is still joined rather than repeated. This only decides whether a
     * copy already in hand is good enough, and only for a few seconds after a
     * gesture, so a refresh costs the page it asked for rather than a session
     * with no cache at all.
     */
    fun readPastCache() {
        readPastCacheUntil = System.currentTimeMillis() + REFRESH_WINDOW_MS
    }

    /** How long a pull to refresh keeps reading past the cache. */
    private const val REFRESH_WINDOW_MS = 5_000L

    fun getHtml(path: String, noCache: Boolean = false): String {
        val key = "${username ?: "-"}|$path"
        if (!noCache && System.currentTimeMillis() >= readPastCacheUntil) {
            synchronized(cache) {
                cache[key]?.let {
                    if (System.currentTimeMillis() - it.at < CACHE_TTL_MS) return it.body
                }
            }
        }

        val task = FutureTask(Callable { fetch(key, path) })
        val running = inflight.putIfAbsent(key, task)
        if (running != null) return await(running)
        return try {
            task.run()
            await(task)
        } finally {
            inflight.remove(key, task)
        }
    }

    /** Unwraps what the fetch threw, so a TildesException keeps its status. */
    private fun await(task: Future<String>): String =
        try {
            task.get()
        } catch (e: ExecutionException) {
            throw e.cause ?: e
        }

    private fun fetch(key: String, path: String): String {
        gate()
        val sent = cookies
        val conn = (URL(if (path.startsWith("http")) path else BASE + path).openConnection()
                as HttpURLConnection).apply {
            requestMethod = "GET"
            instanceFollowRedirects = true
            setRequestProperty("User-Agent", USER_AGENT)
            setRequestProperty("Accept-Language", "en-US,en;q=0.9")
            if (sent.isNotEmpty()) setRequestProperty("Cookie", cookieHeader())
        }

        try {
            val code = conn.responseCode
            absorbCookies(conn, sent)
            val stream = if (code >= 400) conn.errorStream else conn.inputStream
            val body = stream?.bufferedReader()?.use(BufferedReader::readText) ?: ""
            if (code >= 400) throw TildesException("GET $path -> $code", code)
            synchronized(cache) { cache[key] = CacheEntry(System.currentTimeMillis(), body) }
            // Off every page but the one that is about to make its own header
            // wrong. Tildes marks everything on the unread notifications page
            // read as it renders, for an account with **Automatically mark all
            // notifications read when you view the Unread Notifications page**
            // switched on, so the count printed on it is what it just spent.
            // Reading it there put the number back a second after the inbox had
            // cleared it, and which of the two landed last was a race between
            // two requests. Every other page carries the same header and none
            // of them changes what it is counting.
            (if (path.startsWith(NOTIFICATIONS_UNREAD)) null else parseUnread(body))?.let { seen ->
                val held = unread
                if (held == null ||
                    held.notifications != seen.notifications ||
                    held.messages != seen.messages
                ) {
                }
                unread = seen
            }
            // And the labels this account is being offered, off whichever page
            // carried them. See [labelOptions] for why that is three pages
            // rather than one, and why a page with none leaves them alone.
            parseLabelOptions(body).takeIf { it.isNotEmpty() }?.let { now ->
                if (now.map(LabelOption::name) != offered.map(LabelOption::name)) {
                }
                offered = now
            }
            return body
        } finally {
            conn.disconnect()
        }
    }

    /** Where the icons live, under the same host as everything else. */
    private const val ICON_PATH = "/images/site-icons/"

    /** The folder they are kept in, under the app's own cache. */
    private const val ICON_DIR = "tildes-site-icons"

    /**
     * What a slug is allowed to look like, so a class name off a page cannot
     * name a file outside that folder.
     */
    private val ICON_SLUG = Regex("^[A-Za-z0-9][A-Za-z0-9_.-]*$")

    /**
     * One site icon's PNG, from the cache where there is one and from the site
     * where there is not.
     *
     * **Kept on disk rather than refetched**, because these do not change:
     * Tildes serves them with `Cache-Control: max-age=315360000` and an
     * `Expires` in 2037, which is the site saying so itself. So the cost is one
     * request per domain per install, and a feed of the same few dozen sites
     * costs nothing after the first day.
     *
     * **A 404 is an answer and is remembered too.** Around 4% of the domains
     * Tildes draws a class for have no file behind it, and without the marker
     * every one of those would cost a request every time its row was drawn.
     *
     * Anything else -- a timeout, a 500 -- throws, and the caller remembers
     * nothing. A flaky minute should not blank a domain's icon for the rest of
     * the install.
     *
     * Blocking, and on the same 700 ms gate as every other request. See
     * [TildesInterceptor.siteIcon] for the one thread this is called from,
     * which is what keeps a page's fetch from queueing behind a screenful of
     * icons.
     */
    fun siteIconBytes(slug: String): ByteArray? {
        if (!ICON_SLUG.matches(slug)) return null

        val dir = Session.application()?.cacheDir?.let { File(it, ICON_DIR) }
        val file = dir?.let { File(it, "$slug.png") }
        val absent = dir?.let { File(it, "$slug.none") }
        if (absent?.exists() == true) return null
        if (file?.exists() == true) {
            try {
                return file.readBytes()
            } catch (e: Throwable) {
            }
        }

        gate()
        val path = "$ICON_PATH$slug.png"
        val conn = (URL(BASE + path).openConnection() as HttpURLConnection).apply {
            requestMethod = "GET"
            instanceFollowRedirects = true
            setRequestProperty("User-Agent", USER_AGENT)
        }
        try {
            val code = conn.responseCode
            if (code == 404) {
                remember(dir, absent, ByteArray(0))
                return null
            }
            if (code >= 400) throw TildesException("GET $path -> $code", code)
            val bytes = conn.inputStream.use { it.readBytes() }
            remember(dir, file, bytes)
            return bytes
        } finally {
            conn.disconnect()
        }
    }

    /** Writes one of the two, and a cache that cannot be written is not an error. */
    private fun remember(dir: File?, file: File?, bytes: ByteArray) {
        if (dir == null || file == null) return
        try {
            dir.mkdirs()
            file.writeBytes(bytes)
        } catch (e: Throwable) {
        }
    }

    /**
     * Any group name resolves a topic, so a bare id is enough to find the
     * canonical path without having seen the topic before.
     */
    fun resolveTopicPath(id36: String): String {
        pathCache[id36]?.let { return it }

        gate()
        val conn = (URL("$BASE/~tildes/$id36").openConnection() as HttpURLConnection).apply {
            requestMethod = "HEAD"
            instanceFollowRedirects = false
            setRequestProperty("User-Agent", USER_AGENT)
        }
        try {
            conn.responseCode
            val location = conn.getHeaderField("Location")
            val path = location?.replace(Regex("^https?://[^/]+"), "") ?: "/~tildes/$id36"
            rememberPath(id36, path)
            return pathCache.getValue(id36)
        } finally {
            conn.disconnect()
        }
    }

    private val pathCache = ConcurrentHashMap<String, String>()

    fun rememberPath(id36: String, path: String) {
        pathCache[id36] = withoutFragment(path)
    }

    /**
     * A path with the fragment taken off, which is how every path is kept.
     *
     * Tildes points a listing's comment link at `<permalink>#comments` when
     * the topic has comments posted since your last visit, and at the bare
     * permalink otherwise. A link topic's row carries no other internal href
     * -- its title goes to the site being linked -- so that is the one the
     * path is remembered from, and the fragment arrives on exactly the topics
     * worth reopening. Logged out there is no last visit and no fragment,
     * which is why every fixture here is clean and the app was not.
     *
     * Everything downstream treats what is remembered as a path. The comment
     * order goes on the end as a query, and `#comments?comment_order=newest`
     * asks for nothing at all: the query sits inside the fragment, so it never
     * leaves the phone and Tildes answers in its own default order with
     * nothing to say it ignored anything. A comment's `ap_id` is the same path
     * with `#comment-<id36>` after it, which lands two fragments deep.
     */
    fun withoutFragment(path: String): String = path.substringBefore('#')

    /** What a write answered: its body, and the redirect it pointed at. */
    data class Sent(val body: String, val location: String?)

    /**
     * Write requests. Tildes checks CSRF on every state change.
     *
     * `intercooler` marks the request as coming from the site's own
     * intercooler.js, which is what the `/api/web/` endpoints answer. Posting a
     * topic goes through an ordinary form endpoint instead, and that one wants
     * the header absent.
     */
    fun send(
        method: String,
        path: String,
        form: Map<String, String> = emptyMap(),
        intercooler: Boolean = true,
    ): Sent {
        gate()
        val sent = cookies
        val body = StringBuilder()
        csrfToken?.let { body.append("csrf_token=").append(enc(it)) }
        form.forEach { (k, v) ->
            if (body.isNotEmpty()) body.append('&')
            body.append(enc(k)).append('=').append(enc(v))
        }

        val conn = (URL(BASE + path).openConnection() as HttpURLConnection).apply {
            useMethod(method)
            instanceFollowRedirects = false
            doOutput = true
            setRequestProperty("User-Agent", USER_AGENT)
            setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
            if (intercooler) {
                setRequestProperty("X-IC-Request", "true")
                setRequestProperty("Accept", "text/html, */*; q=0.01")
            }
            setRequestProperty("Referer", "$BASE/")
            setRequestProperty("Origin", BASE)
            csrfToken?.let { setRequestProperty("X-CSRF-Token", it) }
            if (sent.isNotEmpty()) setRequestProperty("Cookie", cookieHeader())
        }

        try {
            conn.outputStream.use { it.write(body.toString().toByteArray()) }
            val code = conn.responseCode
            absorbCookies(conn, sent)
            val stream = if (code >= 400) conn.errorStream else conn.inputStream
            val text = stream?.bufferedReader()?.use(BufferedReader::readText) ?: ""
            val location = conn.getHeaderField("Location")
            if (code >= 400) throw TildesException("$method $path -> $code", code)
            synchronized(cache) { cache.clear() }
            return Sent(text, location)
        } finally {
            conn.disconnect()
        }
    }

    /**
     * A GET of one of the site's own intercooler endpoints, which answer a
     * fragment rather than a page and only to a request saying it came from
     * intercooler.js.
     *
     * Not [send], which writes a form body: asking for an output stream on a
     * `GET` promotes it to `POST`, the route has no view for that method, and
     * the whole thing comes back 404 while the log still says GET. And not
     * [getHtml], which sends no such header and caches, where the one fragment
     * read here is a form whose only job is to be current.
     */
    private fun getFragment(path: String): String {
        gate()
        val sent = cookies
        val conn = (URL(BASE + path).openConnection() as HttpURLConnection).apply {
            requestMethod = "GET"
            instanceFollowRedirects = true
            setRequestProperty("User-Agent", USER_AGENT)
            setRequestProperty("X-IC-Request", "true")
            setRequestProperty("Accept", "text/html, */*; q=0.01")
            setRequestProperty("Referer", "$BASE/")
            if (sent.isNotEmpty()) setRequestProperty("Cookie", cookieHeader())
        }

        try {
            val code = conn.responseCode
            absorbCookies(conn, sent)
            val stream = if (code >= 400) conn.errorStream else conn.inputStream
            val body = stream?.bufferedReader()?.use(BufferedReader::readText) ?: ""
            if (code >= 400) throw TildesException("GET $path -> $code", code)
            return body
        } finally {
            conn.disconnect()
        }
    }

    private fun enc(s: String) = java.net.URLEncoder.encode(s, "UTF-8")

    /**
     * Android's HttpURLConnection is okhttp underneath and takes PATCH, which
     * the JDK's own list of methods does not. The override header is the way
     * back if some other stack refuses it, though nothing here has needed it.
     */
    private fun HttpURLConnection.useMethod(method: String) {
        try {
            requestMethod = method
        } catch (e: java.net.ProtocolException) {
            requestMethod = "POST"
            setRequestProperty("X-HTTP-Method-Override", method)
        }
    }

    /* ---------------------------------------------------------------- */
    /* Parsing                                                          */
    /* ---------------------------------------------------------------- */

    data class Group(
        val name: String,
        val description: String?,
        val subscribed: Boolean,
        val dailyTopics: Int,
        val dailyComments: Int,
    )

    data class Topic(
        val id36: String,
        val title: String,
        val group: String,
        val author: String?,
        val postedAt: String?,
        val numComments: Int,
        val numVotes: Int,
        val tags: List<String>,
        val linkUrl: String?,
        val bodyHtml: String?,
        val path: String,
        val voted: Boolean,
        val bookmarked: Boolean,
        /**
         * Whether this account has ignored the topic, which is Tildes' word
         * for what Boost calls hiding: the topic stops appearing in listings
         * and lands on a page of its own.
         *
         * Read wherever it is drawn rather than only on a topic's own page. A
         * listing row carries the same toggle, inside the Actions dropdown
         * Tildes draws for any signed-in account, and `/ignored_topics` is a
         * listing like any other -- so the rows of the tab that lists them are
         * where this matters most.
         */
        val ignored: Boolean,

        /**
         * Whether Tildes posted this on a schedule rather than a person
         * posting it.
         *
         * A group can run a recurring topic -- "What have you been working
         * on?" every week -- and the site posts it from an account of its own.
         * A listing row says so with `.topic-info-source-scheduled` and carries
         * the account in `data-topic-posted-by`, while the topic's own page
         * says so in its byline and names nobody at all.
         *
         * Which is the whole reason this is a field. A page with no author on
         * it is otherwise indistinguishable from one whose author closed their
         * account, and those two want opposite answers: a deleted account is
         * `[deleted]` and this is not.
         */
        val scheduled: Boolean = false,
        val locked: Boolean,
        /**
         * Whether Tildes has taken this topic down, which closes it to new
         * top-level comments while leaving the ones already on it alone.
         *
         * Two different gates, and this is only the first. The topic ACL denies
         * `comment` on a removed topic, a deleted one, a locked one and a
         * superseded scheduler post, and that permission is what draws the box
         * for a new comment. A comment's own ACL grants `reply` to anyone
         * signed in unless the comment itself is removed or the *topic is
         * locked* -- it never asks whether the topic was taken down. So every
         * comment already on a removed topic still takes a reply, while the
         * topic itself takes none.
         *
         * [locked] is the other half and stays separate for that reason: it
         * closes both.
         *
         * False until [fromTopicPage] says otherwise, since a listing does not
         * draw the line this is read off.
         */
        val rootCommentsClosed: Boolean = false,
        /**
         * Which of its own edit controls Tildes drew on this topic, by the
         * name on the button: `edit-title`, `edit-link`, `tag`, `move` and the
         * rest. Each one is rendered behind the permission that runs it, so
         * this is the site's own answer to what this account may do here, and
         * it costs nothing to read -- the page was fetched anyway.
         *
         * Empty until [fromTopicPage] says otherwise, since a listing draws
         * none of them.
         */
        val actions: Set<String> = emptySet(),
        /**
         * Whether [tags] and [actions] are what a topic's own page said.
         *
         * A listing sees less than the page does. It draws the important tags
         * -- `nsfw` and `spoiler` -- to everyone and the rest only to an
         * account with **show tags in listings** switched on, and it draws no
         * edit controls at all. So a topic parsed out of a listing starts
         * false and inherits the page's answer wherever there is one.
         *
         * Which is why this is not a "has tags" check: a topic tagged
         * `nsfw, music` reads as tagged in a listing and is still missing one.
         */
        val fromTopicPage: Boolean = false,
        /**
         * The tags a **listing** drew for this topic, which is a different
         * question from [tags] and the one a row has to answer.
         *
         * Tildes draws the important ones to everyone and the rest only to an
         * account with **show tags in listings** on, so a listing is already
         * the site's own answer to what this reader should see in a row. A
         * topic page draws all of them, and [tags] keeps that -- which is right
         * for the topic's own screen and wrong for a row, where it would give a
         * topic you had opened more tags than the one beside it purely because
         * you had opened it.
         *
         * Empty for a topic only ever seen on its own page, since a listing has
         * said nothing about it yet.
         */
        val tagsInListing: List<String> = emptyList(),
        /**
         * What a listing says this topic **is**, in Tildes' own words: `Ask`,
         * `Ask (survey)`, `Text`, `Link` and the rest of `TopicContentType`.
         *
         * Only a listing draws it -- a topic's own page has no such element --
         * and it is drawn beside the tags rather than among them, which is the
         * whole reason it is here: the `Ask` family is worked out from the
         * `ask` tag family, and a row that shows one **leaves that tag out of
         * its tag list**. So a topic tagged `ask.survey` reads as untagged in a
         * listing unless this is read too.
         *
         * The rest of the types are the topic's own nature rather than a tag --
         * whether it is a link or text, and what is behind the link -- which is
         * why what a row draws is narrowed at the point of drawing rather than
         * here. Kept whole in case the others are ever worth something.
         */
        val contentType: String? = null,
        /**
         * And what Tildes measured about it: `300 words`, `2:45`, or
         * `1:34:22, published Jul 15 2021`.
         *
         * This and [contentType] read as one label on the site -- `Article: 696
         * words` -- and are separate elements in the markup, which is worth
         * knowing because reading only the first is what a row drew for a
         * while: `Article`, where the number was the part worth having.
         *
         * A text topic carries one too, so this is not only a thing links have.
         * See [contentMetadataOf] for why it is more than one element itself.
         */
        val contentMetadata: String? = null,
        /**
         * Which of Tildes' own site icons goes with this topic's link, by the
         * slug the site names it with: `github_com`, `hollywoodreporter_com`.
         *
         * Tildes hosts 6,749 of these, a 32x32 PNG each at
         * `/images/site-icons/<slug>.png`, and draws one beside the source of
         * every link topic. The slug is the link's domain with its dots turned
         * into underscores, and it is **read off the page rather than worked
         * out**: the site takes the domain from what its own scraper stored,
         * which is the registrable domain by the public suffix list, so
         * `https://indieforums.linklists.net/` is `linklists_net` and no amount
         * of parsing the URL here would agree with that.
         *
         * A text topic has none, and neither does a link topic Tildes has no
         * icon for -- the class is on the page either way, and the icon is
         * whether the file exists. See [siteIconBytes] for what happens then.
         */
        val siteIcon: String? = null,
        /** When the newest comment was posted. Only a topic page knows it. */
        val newestCommentAt: String? = null,
        /** Tildes' own count of comments posted since your last visit. */
        val newCommentsSinceVisit: Int = 0,
        /**
         * Whether Tildes would refuse a vote on this, which it does 30 days
         * after a topic is posted, on your own topics, and on removed ones.
         * See [votingClosedIn].
         */
        val votingClosed: Boolean = false,
    )

    /**
     * A label somebody has put on a comment, as the page draws it.
     *
     * Tildes has five of these -- `exemplary`, `offtopic`, `joke`, `noise` and
     * `malice` -- and they are what the site has where every other site has a
     * report button. Four of them are read by the site and never shown: they
     * weigh a comment down the sort, and `noise` folds it. **Exemplary is the
     * one the site prints**, on every comment carrying an active one, to
     * everybody.
     *
     * So most of what arrives here is that one word. The rest reaches a reader
     * only through `comment.view_labels`, which is a permission an account is
     * granted rather than one it has, and this reads them the same way when it
     * does.
     *
     * [name] is the site's own word for it, capitalised the way its own pill
     * is: `Exemplary`. It is taken off the `label-comment-<name>` class rather
     * than off the text, since the two branches of the template disagree about
     * the capital and the class never does.
     */
    data class Label(
        val name: String,
        /**
         * How many people put it there, where the page says. It only ever says
         * on **your own** comment: `view_exemplary_reasons` is the author's
         * permission and nobody else's, so every other comment carries the
         * word alone. Zero means the page did not say rather than nobody did.
         */
        val count: Int = 0,
        /**
         * And what each of them wrote. Exemplary asks for a reason and will not
         * take the label without one, so a count here comes with as many lines.
         * Malice asks too, and those go to admins rather than to the author.
         *
         * The site shows them to the author with the names off, which is what
         * makes them worth carrying: somebody wrote you a note and the site is
         * the only place it exists.
         */
        val reasons: List<String> = emptyList(),
    )

    data class Comment(
        val id36: String,
        val depth: Int,
        val ancestors: List<String>,
        val author: String?,
        val postedAt: String?,
        val editedAt: String?,
        val numVotes: Int,
        val bodyHtml: String,
        val voted: Boolean,
        /**
         * Tildes bookmarks comments as well as topics, off the same button in
         * the same menu, and a Lemmy comment carries a `saved` of its own for
         * it. This used to be answered `false` for every comment, so a comment
         * bookmarked in the app came back unbookmarked the moment the page was
         * read again, and one bookmarked on the site never showed at all.
         */
        val bookmarked: Boolean = false,
        /** Same as a topic's, and by the same rules. See [votingClosedIn]. */
        val votingClosed: Boolean = false,
        val byOp: Boolean,
        val removed: Boolean,
        val deleted: Boolean,
        /**
         * The line Tildes drew where the comment was, on the ones it has taken
         * down. It is read off the page rather than written here because the
         * wording is not one string: a single comment reads **Comment removed
         * by site admin** or **Comment deleted by author**, and a run of
         * adjacent removed ones collapses into one article reading **Removed by
         * admin: 3 comments by 3 users**, which no fixed wording covers.
         *
         * It is also the one honest test for a comment with nothing under it.
         * A removed comment has no `.comment-text`, no byline and no time, so
         * every other field on it reads like a parse that went wrong.
         */
        val placeholder: String? = null,
        /**
         * Whether Tildes folded this comment, which it works out as it renders
         * the page. Reopening a topic folds the chains holding nothing posted
         * since your last visit, and a comment labelled "noise" folds on every
         * visit. This is that answer, not one recomputed here.
         */
        val collapsed: Boolean = false,
        /**
         * Whether Tildes counts this as posted since your last visit. It marks
         * these against the visit it records for the account, so it knows about
         * reading the topic on the website while Boost's own watermark does
         * not, and it never marks your own comments.
         */
        val isNew: Boolean = false,
        /**
         * What the page says has been put on it. Usually nothing, and usually
         * `Exemplary` when it is something. See [Label], and [collapsed] for
         * the other half of what a label does: `noise` folds the comment, and
         * that arrives already worked out.
         */
        val labels: List<Label> = emptyList(),
        /**
         * Whether this account may label this comment, which the site answers
         * by writing `data-comment-user-labels` on the article at all. It is
         * an account a week old, on somebody else's comment, that Tildes has
         * not taken down.
         *
         * Asked of the page rather than worked out here. All three of those
         * are the site's rules and any of them can move, and the attribute is
         * the site applying them to this comment for this reader.
         */
        val mayLabel: Boolean = false,
        /**
         * And which of them you have put on it, which is that attribute's
         * value: the site's own lowercase names, space separated.
         *
         * Nobody else's labels are in here, and nothing else on the page says
         * yours. A label you applied is invisible on the comment itself unless
         * enough people agree with you, so this is the only way to know a
         * second tap would take yours off rather than add another.
         */
        val myLabels: List<String> = emptyList(),
    )

    /**
     * A label the site is offering this account right now, off the `<template>`
     * a page carries for its own label buttons.
     *
     * Read rather than listed here because **the set moves**. Exemplary is
     * dropped from it for eight hours after you use one, which is a rule this
     * end would otherwise have to keep a clock for, and a sixth label added
     * upstream would arrive on its own.
     *
     * Only a signed-in account is offered any, and only some pages carry them.
     * See [labelOptions] for which.
     */
    data class LabelOption(
        /** The site's own lowercase name, which is what the route takes. */
        val name: String,
        /**
         * What to ask before applying it, where the site asks. Exemplary and
         * malice each carry a sentence of their own, the rest carry none, and
         * the wording is the site's rather than ours.
         */
        val reasonPrompt: String? = null,
    )

    /** A message thread, as the inbox lists it. The bodies are not on that page. */
    data class Conversation(
        val id36: String,
        val subject: String,
        val otherUser: String?,
        val lastActivity: String?,
        val messageCount: Int,
        val unread: Boolean,
    )

    data class Message(
        val sender: String?,
        val sentAt: String?,
        val bodyHtml: String,
        val mine: Boolean,
    )

    fun conversationPath(id36: String) = "/messages/conversations/$id36"

    /**
     * The inbox, which is a table of threads rather than of messages: subject,
     * who it is with and how many messages, but no text at all. Reading one
     * means opening it.
     */
    fun parseConversations(html: String): List<Conversation> =
        Jsoup.parse(html, BASE).select("table.message-list tr").mapNotNull { row ->
            val link = row.selectFirst("td.message-list-subject a") ?: return@mapNotNull null
            val id36 = Regex("/messages/conversations/([A-Za-z0-9]+)")
                .find(link.attr("href"))?.groupValues?.get(1) ?: return@mapNotNull null
            Conversation(
                id36 = id36,
                subject = link.text().trim(),
                otherUser = row.selectFirst("a.link-user")?.text()?.trim(),
                lastActivity = row.selectFirst("time[datetime]")?.attr("datetime"),
                messageCount = row.select("td").lastOrNull()?.text()?.trim()?.toIntOrNull() ?: 1,
                unread = row.hasClass("message-list-unread"),
            )
        }

    /** The messages in one thread, oldest first, as the page renders them. */
    fun parseConversation(html: String): List<Message> =
        Jsoup.parse(html, BASE).select("article.message").map { art ->
            Message(
                sender = art.selectFirst("header a.link-user")?.text()?.trim(),
                sentAt = art.selectFirst("header time[datetime]")?.attr("datetime"),
                bodyHtml = art.selectFirst(".message-text")?.html()?.trim() ?: "",
                mine = art.hasClass("is-message-mine"),
            )
        }

    /** The two things Tildes puts in a user's sidebar. */
    data class Profile(val username: String?, val registered: String?, val bioHtml: String?)

    /**
     * A user's sidebar. Tildes publishes no post or comment counts anywhere,
     * on purpose, so there is nothing here to fill those in with.
     */
    fun parseUserProfile(html: String): Profile {
        val doc = Jsoup.parse(html, BASE)
        val registered = doc.select("aside dt")
            .firstOrNull { it.text().trim().equals("Registered", ignoreCase = true) }
            ?.nextElementSibling()?.text()?.let { registeredAt(it) }
        // Tildes resolves /user/ without regard to case while the name it
        // stores has one, and the header context is where the page spells it
        // back. Names are hashed into Lemmy ids, so "deimos" and "Deimos"
        // would otherwise be two different people.
        val username = doc.selectFirst(".site-header-context a[href^=\"/user/\"]")
            ?.attr("href")?.substringAfterLast('/')?.ifEmpty { null }
        return Profile(
            username,
            registered,
            doc.selectFirst(".user-bio dd")?.html()?.trim()?.ifEmpty { null },
        )
    }

    /**
     * The signed-in account's bio, as markdown rather than as it is drawn.
     *
     * A profile page carries the rendered bio and [parseUserProfile] reads it,
     * which is right for drawing somebody else's. Filling an editor with it
     * would hand back whatever the HTML converted into, so an unedited save
     * would rewrite the bio in a shape the account never typed. Tildes renders
     * the source itself into the textarea on its own settings page, and that
     * is the one place it appears.
     */
    fun myBio(): String =
        Jsoup.parse(getHtml("/settings/bio", noCache = true))
            .selectFirst("textarea[name=markdown]")?.wholeText()?.trim().orEmpty()

    /**
     * And the same for a comment or a topic: the markdown its author typed,
     * rather than what its HTML converts back into.
     *
     * The site keeps both forms and fills its own edit box from the first,
     * which is why editing on the site keeps things this end loses. Two of them
     * have no mark left in the HTML at all, so no converter could get them
     * back. **A fence's language** is read by Pygments and spent there -- what
     * reaches the page is `class="highlight"` and a tree of `syntax-` spans,
     * and the sanitiser drops everything else -- so ` ```python ` renders,
     * converts back as a bare fence, and an edit saved over it takes the
     * highlighting off the site for good. **A backslash escape** is gone the
     * same way: `\*not italic\*` renders as plain asterisks, converts back
     * without the backslashes, and the next save turns it into italics.
     *
     * The same route the site's own **View Markdown** uses, and `view` is all
     * it asks for, so it answers for somebody else's post too.
     *
     * **One `GET` per box opened**, on the same 700 ms gate as everything else.
     * Which is why it is asked here rather than wherever a body is drawn: a
     * page of comments would be one request each, and a person about to edit
     * one post is a person who has already tapped for it.
     *
     * Answers null rather than throwing. The box already holds the converted
     * body, which is what it held before this existed.
     */
    fun markdownSource(id36: String, comment: Boolean): String? {
        val path = sourcePath(id36, comment)
        heldSource(path)?.let { return it }
        return try {
            val source = Jsoup.parse(getFragment(path), BASE)
                .selectFirst("textarea[name=markdown-source]")
                ?.wholeText()
                ?.trim()
                ?.ifEmpty { null }
            if (source != null) {
                synchronized(sources) { sources[path] = CacheEntry(System.currentTimeMillis(), source) }
            }
            source
        } catch (t: Throwable) {
            null
        }
    }

    /**
     * The same answer if it is already held, and nothing at all otherwise.
     *
     * For the quote dialog, which is built on the main thread: it is opened off
     * a screen that asked for this on its way up, so by the second tap the
     * answer is usually here, and where it is not the caller shows the body it
     * always showed and takes the source when it lands.
     */
    fun heldMarkdownSource(id36: String, comment: Boolean): String? =
        heldSource(sourcePath(id36, comment))

    private fun sourcePath(id36: String, comment: Boolean): String =
        "/api/web/" + (if (comment) "comments" else "topics") +
            "/$id36?ic-trigger-name=markdown-source"

    private fun heldSource(path: String): String? = synchronized(sources) {
        sources[path]?.takeIf { System.currentTimeMillis() - it.at < CACHE_TTL_MS }?.body
    }

    /**
     * Held on the same thirty seconds a page is, and for the same reason: one
     * composer opens two boxes off the same post, and a source only changes
     * when somebody edits it -- which, here, is the person holding the phone.
     */
    private val sources = HashMap<String, CacheEntry>()

    /**
     * The account settings Tildes draws on `/settings`, read as the page draws
     * them: a checkbox name against whether it is ticked.
     *
     * A map rather than a class of its own, because the half that has to be
     * right is which boxes were *found*. A box the site has renamed comes back
     * missing rather than false, so the row for it is left off the editor and
     * nothing writes it -- where a `false` would look like a setting somebody
     * had turned off, and the next save would turn it off for real.
     *
     * Every checkbox on the page is in here, including the five under **Open
     * links in new tabs**, which mean nothing in an app. Which ones are drawn
     * is [TildesInterceptor]'s table rather than this one's business.
     */
    fun settingsPage(): String = getHtml("/settings", noCache = true)

    fun parseSettings(html: String): Map<String, Boolean> =
        Jsoup.parse(html)
            .select("input[type=checkbox][name]")
            .associate { it.attr("name") to it.hasAttr("checked") }

    /**
     * One of the orders Tildes' own settings page offers a comment tree in.
     *
     * The words are the site's rather than ours. Every other setting on that
     * page is a box that is ticked or not, so what the row says is a label this
     * project wrote. This one is a list, and the list is on the page. Reading
     * it means the row says exactly what the site says, in the site's own
     * order, and a fifth order appearing there appears here with it.
     */
    class SortChoice(
        /** What goes up: `VOTES`, `NEWEST`, `POSTED` or `RELEVANCE`. */
        val value: String,
        /** What the site's own dropdown draws for it. */
        val label: String,
        /** Whether it is the one the account is set to. */
        val chosen: Boolean,
    )

    /**
     * The default comment sort order, off the same page as the checkboxes.
     *
     * An empty list is a select this could not find, which is the same answer
     * [parseSettings] gives for a checkbox that has been renamed: the control
     * is left off the screen rather than drawn saying something that was
     * guessed at, and nothing writes it.
     */
    fun parseCommentSort(html: String): List<SortChoice> =
        Jsoup.parse(html)
            .select("select[name=$COMMENT_SORT_FIELD] option[value]")
            .map { SortChoice(it.attr("value"), it.text().trim(), it.hasAttr("selected")) }
            .filter { it.value.isNotEmpty() }

    /**
     * Writes one of them.
     *
     * Same endpoint and the same shape as [editBio], under its own trigger
     * name: Tildes gives every setting on that page a form of its own, and the
     * form's `name` is what tells the routes apart.
     *
     * A checkbox goes up the way a browser sends one -- present for on,
     * missing for off. The far side reads `bool(request.params.get(...))`, so
     * an empty value would read as off just like a missing one, and there is
     * no third state to say "leave this alone".
     *
     * One trigger name per box here, which is why the **Open links in new
     * tabs** group is not offered: its five boxes share a form, and writing one
     * of them through this would clear the other four.
     */
    /**
     * Writes the default comment sort order, which is the one setting on that
     * page that is not a checkbox.
     *
     * Same endpoint and the same shape as [editSetting] beside it, under a
     * trigger name of its own. It carries a value rather than being present or
     * absent, which is the whole of the difference: Tildes' own form submits on
     * change instead of on a save, and so does this.
     */
    fun editCommentSort(order: String) {
        val name = username ?: throw TildesException("not signed in", 401)
        ensureCsrf()
        send(
            "PATCH",
            "/api/web/user/$name",
            mapOf(
                "ic-trigger-name" to COMMENT_SORT_TRIGGER,
                COMMENT_SORT_FIELD to order,
            ),
        )
    }

    /** The select on `/settings`, and the form it sits in. */
    private const val COMMENT_SORT_FIELD = "comment-sort-order"
    private const val COMMENT_SORT_TRIGGER = "account-default-comment-sort-order"

    fun editSetting(trigger: String, field: String, on: Boolean) {
        val name = username ?: throw TildesException("not signed in", 401)
        ensureCsrf()
        val form = mutableMapOf("ic-trigger-name" to trigger)
        if (on) form[field] = "on"
        send("PATCH", "/api/web/user/$name", form)
    }

    /**
     * The tags the account filters, which live on a page of their own.
     *
     * Not on `/settings` with the rest: Tildes gives them
     * `/settings/filters`, one textarea holding the whole list a line at a
     * time, the way [myBio] has a page to itself. The site's own words for
     * what it does are "if a topic has *any* of these tags, it will be
     * filtered out (not shown) by default", and "these filters are *global*
     * and will apply both to your home page as well as inside specific
     * groups".
     *
     * It is a filter the **site** applies rather than one the app could: the
     * listing view drops those topics out of the query, so a filtered topic
     * never reaches the HTML this parses and there is nothing here to hide.
     * Which is what makes the list worth drawing at all -- it is the only
     * place in the app where what somebody sees can be changed rather than
     * reported.
     */
    fun filtersPage(): String = getHtml("/settings/filters", noCache = true)

    /**
     * Reads that page.
     *
     * Null is a page this could not recognise, which is [parseInvites]' rule
     * and for the same reason: what has to be right is what was *found*. A
     * page with no `textarea[name=tags]` on it is not the filters page, so the
     * row is left off the screen rather than drawn saying an account filters
     * nothing -- where an empty list is that account really filtering nothing,
     * which is most accounts and is worth drawing.
     *
     * The values are the site's own spelling, kept as they come. Tildes stores
     * a tag with underscores and draws it with spaces, and this list is the
     * stored form; the same shape goes back up, so nothing here has to know
     * which one it is holding.
     */
    fun parseFilteredTags(html: String): List<String>? {
        val box = Jsoup.parse(html).selectFirst("textarea[name=$FILTERED_TAGS_FIELD]")
            ?: return null
        return box.wholeText().split('\n').map { it.trim() }.filter { it.isNotEmpty() }
    }

    /**
     * Writes the whole list back, which is the only way the site takes it.
     *
     * A `PUT` rather than the `PATCH` every other setting rides on: this one
     * has an endpoint of its own instead of a trigger name on the shared one,
     * so there is nothing to tell apart. It answers intercooler's no-op --
     * nothing to render, since the page the form is on is not being redrawn --
     * so an empty body here is success rather than the empty answer a Lemmy
     * write must never give.
     *
     * An empty list is how the filters are cleared: Tildes reads a blank field
     * as "keep none", which is what a browser sends when the textarea is
     * emptied, so nothing here refuses one.
     */
    fun editFilteredTags(tags: List<String>) {
        val name = username ?: throw TildesException("not signed in", 401)
        ensureCsrf()
        send(
            "PUT", "/api/web/user/$name/filtered_topic_tags",
            mapOf(FILTERED_TAGS_FIELD to tags.joinToString("\n")),
        )
    }

    /** The textarea it is read out of, and the field it goes back up under. */
    private const val FILTERED_TAGS_FIELD = "tags"

    /**
     * The invite codes an account carries, off `/invite`.
     *
     * Tildes is invite-only and every account is given a few codes to hand
     * out. Lemmy has nothing of the kind, so there is no call of Boost's this
     * arrives through and no row of its own to land on -- it is read here and
     * drawn on the account editor beside the settings.
     *
     * Two halves, and they are counted separately on the site: how many codes
     * are left to generate, and the codes already generated that nobody has
     * registered with yet. The second list only shrinks when somebody uses
     * one, and Tildes says so on the page -- "the active invite codes will stay
     * visible on this page until they're used".
     */
    class Invites(
        /**
         * How many more can be generated, or null where the page had a button
         * to generate one and no number this could read off it.
         *
         * Zero is the site drawing no button at all, which is what it does at
         * zero. Null keeps the button on the screen rather than claiming a
         * limit that was never read -- Tildes answers **403** when there are
         * none left, so a tap finds out for certain.
         */
        val remaining: Int?,
        /** The register links already handed out, newest first, as the page has them. */
        val links: List<String>,
    )

    fun invitePage(): String = getHtml("/invite", noCache = true)

    /**
     * Reads that page.
     *
     * Null is a page this could not recognise, which is the rule the settings
     * follow: what has to be right is what was *found*, and a page with no
     * `.code-gen-btn` on it is not the invite page. The row is then left off
     * the screen rather than drawn saying an account has no codes.
     */
    fun parseInvites(html: String): Invites? {
        val doc = Jsoup.parse(html, BASE)
        val generate = doc.selectFirst(".code-gen-btn") ?: return null
        val button = generate.selectFirst("button")
        return Invites(
            if (button == null) 0 else inviteCount(button.text()),
            doc.select("input.input-invite-code[value]")
                .map { it.attr("value") }
                .filter { it.isNotEmpty() },
        )
    }

    /**
     * Generates one, which the site does with a `GET` of an endpoint that
     * changes something.
     *
     * That is Tildes' own shape rather than a shortcut taken here: the button
     * on `/invite` carries `data-ic-get-from`, so intercooler asks for the
     * fragment and drops it in place of the button. The fragment carries the
     * new link and the count after the decrement, so one request answers both
     * halves of [Invites].
     *
     * A **403** is the site saying there are none left, and it travels: the row
     * puts itself right on it rather than the app claiming a code it never got.
     */
    fun mintInvite(): Invites {
        val name = username ?: throw TildesException("not signed in", 401)
        val fragment = getFragment("/api/web/user/$name/invite_code")
        return parseInvites(fragment)
            ?: throw TildesException("the new invite code was not in the answer", 500)
    }

    /**
     * The code out of a register link, which is what a row draws.
     *
     * The link is what gets copied, since that is the thing somebody can be
     * sent, while `ABCDE-FGHIJ-KLMNO` is what reads as a code on a phone. The
     * dashes are the site's own: a code is 15 characters of `A-Z0-9` stored
     * without them and drawn in three groups of five.
     */
    fun inviteCode(link: String): String? =
        Regex("[?&]code=([^&]+)").find(link)?.groupValues?.get(1)
            ?.let { java.net.URLDecoder.decode(it, "UTF-8") }
            ?.ifEmpty { null }

    /** "Generate new code (3 left)", which is where the number is. */
    private fun inviteCount(button: String): Int? =
        Regex("\\((\\d+)\\s+left\\)").find(button)?.groupValues?.get(1)?.toIntOrNull()

    private val MONTHS = listOf(
        "january", "february", "march", "april", "may", "june",
        "july", "august", "september", "october", "november", "december",
    )

    /**
     * "June 11, 2018" as Lemmy wants it. Read by month name rather than by a
     * date formatter, so the machine's locale cannot change the answer.
     */
    private fun registeredAt(text: String): String? {
        val parts = Regex("([A-Za-z]+)\\s+(\\d{1,2}),\\s*(\\d{4})").find(text)
            ?: return null
        val month = MONTHS.indexOf(parts.groupValues[1].lowercase()) + 1
        if (month == 0) return null
        return "%04d-%02d-%02dT00:00:00Z".format(
            parts.groupValues[3].toInt(), month, parts.groupValues[2].toInt(),
        )
    }

    fun parseCsrfToken(html: String): String? =
        Jsoup.parse(html).selectFirst("input[name=csrf_token]")?.attr("value")?.ifEmpty { null }

    fun parseLoggedInUser(html: String): String? {
        val doc = Jsoup.parse(html)
        doc.selectFirst(".logged-in-user-username")?.text()?.trim()?.let {
            if (it.isNotEmpty()) return it.removePrefix("@")
        }
        return null
    }

    /**
     * What the page says is waiting, off the two links beside the username.
     *
     * ```html
     * <a class="logged-in-user-alert" href="/messages/unread">2 new messages</a>
     * <a class="logged-in-user-alert" href="/notifications/unread">1 new comment</a>
     * ```
     *
     * Each is written only when its count is above zero, so a signed-in page
     * with neither says both are nothing. That is why the marker read first is
     * the **username**: a page served to a guest, or one that came back signed
     * out, carries no alert either and means nothing about the account, so it
     * answers `null` and leaves the last real reading alone.
     *
     * A guest is signed in to nothing and has no counts, which is the same
     * `null` and right for the same reason.
     *
     * The whole document is parsed only when there is an alert on it, which is
     * the rare page. Every other one is settled by two string searches, and
     * this runs on every fetch.
     */
    fun parseUnread(html: String): Unread? {
        if (!html.contains("logged-in-user-username")) return null
        if (!html.contains("logged-in-user-alert")) return Unread(0, 0)
        val alerts = Jsoup.parse(html).select("a.logged-in-user-alert")
        fun count(href: String): Int =
            alerts.firstOrNull { it.attr("href").startsWith(href) }
                ?.let { Regex("\\d[\\d,]*").find(it.text())?.value }
                ?.replace(",", "")?.toIntOrNull() ?: 0
        return Unread(count("/notifications/unread"), count("/messages/unread"))
    }

    /**
     * The subscriber count from a group's sidebar, which is the only place
     * Tildes prints one. The group list carries daily activity instead.
     */
    fun parseSubscribers(html: String): Int? =
        Jsoup.parse(html).selectFirst(".group-subscription-count")
            ?.text()?.replace(",", "")
            ?.let { Regex("\\d+").find(it)?.value?.toIntOrNull() }

    /**
     * Every group Tildes lists, subgroups among them.
     *
     * A subgroup is not a sibling of its parent. `~comp.advent_of_code` sits in
     * an `<ol>` of its own, nested inside `ol.group-list` under `~comp` and
     * carrying no class, so a direct-child selector reads the 32 top-level
     * groups and none of the 19 under them. Nothing errors: the list is a page
     * short rather than wrong, which is why it stood.
     */
    fun parseGroups(html: String): List<Group> =
        Jsoup.parse(html).select(".group-list li").mapNotNull { li ->
            val name = li.selectFirst("a.link-group")?.text()?.trim()?.removePrefix("~")
                ?: return@mapNotNull null
            val activity = li.selectFirst(".group-list-activity")?.text() ?: ""
            val nums = Regex("(\\d+)\\s+topics?,\\s+(\\d+)\\s+comments?").find(activity)
            Group(
                name = name,
                description = li.selectFirst(".group-list-description")?.text()?.trim(),
                subscribed = li.hasClass("group-list-item-subscribed"),
                dailyTopics = nums?.groupValues?.get(1)?.toIntOrNull() ?: 0,
                dailyComments = nums?.groupValues?.get(2)?.toIntOrNull() ?: 0,
            )
        }

    /**
     * A group's sidebar, which is everything on the page that is about the
     * group rather than about its topics.
     *
     * Four things live there and only the count was being read. The rest is
     * what a group tells you about itself: a line of description, a block of
     * free text some groups write, and up to three lists of links -- the
     * subgroups filed under it, the recurring topics it runs on a schedule,
     * and its wiki pages.
     *
     * The headings are Tildes' own words rather than ours, since the site
     * writes them into the page and a group with none of a kind draws no
     * heading for it.
     */
    data class GroupSidebar(
        val shortDescription: String?,
        /** Rendered HTML, since only some groups write one and it is markdown there. */
        val textHtml: String?,
        val sections: List<GroupSection>,
    )

    data class GroupSection(val heading: String, val links: List<GroupLink>)

    data class GroupLink(val text: String, val url: String)

    /**
     * Reads that sidebar off any group page.
     *
     * The link lists are `<ul class="nav">`, each opening with a plain `<li>`
     * that is the heading and continuing into a nested `<ul class="nav">` of
     * `li.nav-item`. That nesting is invalid HTML -- a `<ul>` is a direct
     * child of a `<ul>` there, not of the `<li>` before it -- so a parser is
     * free to move it, and jsoup does. Reading the heading off `ownText` and
     * the links off every `li.nav-item` under the list survives either shape,
     * and skipping a list that sits inside another keeps the moved one from
     * being counted twice.
     *
     * Null when the page has no sidebar at all, which is how the caller tells
     * a page it could not read from a group that has written nothing.
     */
    fun parseGroupSidebar(html: String): GroupSidebar? {
        val aside = Jsoup.parse(html, BASE).selectFirst("#sidebar") ?: return null

        val sections = ArrayList<GroupSection>()
        // A plain loop, not .filter {}: jsoup's Elements has its own
        // filter(NodeFilter), which shadows the Kotlin extension.
        for (ul in aside.select("ul.nav")) {
            if (ul.parents().any { it.tagName() == "ul" }) continue
            val heading = ul.children().firstOrNull { it.tagName() == "li" }
                ?.ownText()?.trim().orEmpty()
            val links = ul.select("li.nav-item a").mapNotNull { a ->
                val text = a.text().trim()
                val url = a.absUrl("href").ifEmpty { a.attr("href") }
                if (text.isEmpty() || url.isEmpty()) null else GroupLink(text, url)
            }
            // A section every link of which points into the account's own
            // settings is the site's chrome rather than anything about the
            // group. Tildes adds one to every group page for a signed-in
            // reader -- headed "User settings", carrying its filtered tags and
            // a **Settings page** link -- and drawing it here would put the
            // same dead end on all 51 panels, leading out of the app at that.
            //
            // Matched on where the links go rather than on the heading, since
            // the heading is copy and the paths are routes.
            if (heading.isNotEmpty() && links.isNotEmpty() &&
                links.any { !it.url.startsWith("$BASE/settings") }
            ) {
                sections.add(GroupSection(heading, links))
            }
        }

        val short = aside.selectFirst(".group-short-description")?.text()?.trim()?.ifEmpty { null }
        val text = aside.selectFirst(".group-sidebar-text")?.html()?.trim()?.ifEmpty { null }
        if (short == null && text == null && sections.isEmpty()) return null
        return GroupSidebar(short, text, sections)
    }

    /**
     * A wiki page, as the HTML Boost's own wiki screen takes.
     *
     * This one stays HTML rather than becoming markdown, which is the opposite
     * of everywhere else here. The screen it is for renders a string of HTML
     * straight into a text view, and Tildes serves rendered HTML, so the two
     * meet without a conversion in between.
     *
     * What comes off is the breadcrumb, which says the group the toolbar
     * already says. Links are made absolute on the way out, since a page
     * writes some of its own as `/user/name` and a tap has no page to resolve
     * them against by then.
     *
     * The same read answers a group's list of wiki pages, which is a page of
     * the same shape with a list on it where an article would be.
     */
    fun parseWikiPage(html: String): String? {
        val main = Jsoup.parse(html, BASE).selectFirst("main") ?: return null
        main.select("ol.breadcrumb").remove()
        main.select("a[href]").forEach { a ->
            a.absUrl("href").let { if (it.isNotEmpty()) a.attr("href", it) }
        }
        return main.html().trim().ifEmpty { null }
    }

    /**
     * A name off a listing row, or null where the row is not naming anybody.
     *
     * `data-topic-posted-by` is written on every row whatever the reader may
     * see, and where the author is hidden it carries **unknown user** rather
     * than being left out. That is the site's own words for "you cannot see
     * who", and it is a space away from being a username: Tildes names are
     * letters, digits, underscores and hyphens.
     *
     * So the shape is what decides. Taking the string at its word drew a
     * feed row bylined "unknown user" over a topic that opened as `[deleted]`,
     * the two disagreeing about the same topic, and made a profile link out of
     * a phrase.
     */
    private fun username(attribute: String?): String? =
        attribute?.trim()?.takeIf { it.isNotEmpty() && USERNAME.matches(it) }

    private val USERNAME = Regex("[A-Za-z0-9_-]+")

    /**
     * Whether a topic page says the site posted this rather than a person.
     *
     * Its byline is the one place that shows, and the three shapes are worth
     * having side by side. A topic with an author reads **Posted <time> by
     * <a>name</a>**, one whose author has closed their account reads **Posted
     * <time> by unknown user** with no link, and a scheduled one reads
     * **Automatically posted <time>** with no `by` at all.
     *
     * So the absence of a link says nothing on its own, and this is what tells
     * the last of the three from the middle one.
     */
    private fun automaticallyPosted(article: Element): Boolean =
        article.selectFirst(".topic-full-byline")
            ?.ownText()?.trim()?.startsWith(AUTOMATIC_BYLINE, ignoreCase = true) == true

    private const val AUTOMATIC_BYLINE = "Automatically posted"

    /**
     * Who Tildes posts a scheduled topic as, for a topic reached without its
     * listing row ever being read -- from the sidebar's own link to it, say.
     *
     * A guess in the sense that the page does not say, and not much of one:
     * every scheduled topic in the hundred most recent on the site carries
     * this name, and `/user/Tildes` resolves like any other profile, so a tap
     * on it lands somewhere real.
     *
     * It is a fallback rather than an answer. A row for the same topic wins
     * whenever one has been read, which is what makes a group posting its own
     * under some other name right on the next listing rather than wrong until
     * someone notices.
     */
    const val SCHEDULED_POSTER = "Tildes"

    private fun firstInt(s: String?): Int =
        Regex("-?\\d+").find(s?.replace(",", "") ?: "")?.value?.toIntOrNull() ?: 0

    /**
     * Whether Tildes would refuse a vote on what this element draws.
     *
     * The site closes voting 30 days after a topic or a comment is posted, off
     * `VOTING_PERIOD` in both models, and denies it outright on your own posts
     * and on anything removed. All three arrive the same way rather than as
     * anything to work out: the templates draw a **button** where the account
     * may vote and a plain `div` where it may not, so the button's absence is
     * the site's own permission check, already made.
     *
     * Only asked while signed in, since logged out there is never a button and
     * every topic on the site would read as closed.
     */
    private fun votingClosedIn(el: Element, selector: String): Boolean =
        username != null && el.selectFirst(selector) == null

    /**
     * Whether the page says the topic has been taken down.
     *
     * Tildes draws one line for either state, and only on the topic's own page:
     *
     * ```html
     * <div class="text-error">Topic deleted by author</div>
     * <div class="text-error">Topic removed by site admin</div>
     * ```
     *
     * Matched on the wording as well as the class, since `text-error` is
     * spectre's own and a form that failed validation wears it too. The site
     * ships one language, so the words are as stable as the markup.
     */
    private fun takenDown(doc: Document): Boolean =
        doc.select(".text-error").any {
            val said = it.text().trim()
            said.startsWith("Topic removed") || said.startsWith("Topic deleted")
        }

    /** What a topic's vote control is when it is one, in a listing and on its own page. */
    private const val VOTE_BUTTON = "button.topic-voting"

    /** And a comment's, which is the same button the score is read off. */
    private const val COMMENT_VOTE_BUTTON =
        "[data-ic-put-to*=/vote], [data-ic-delete-from*=/vote]"

    /**
     * The used half of one of Tildes' toggles: the button drawn once the action
     * is on, which deletes rather than puts.
     *
     * Matched on the endpoint the button points at rather than on the word it
     * says, and by **containing** that path rather than ending in it. Both
     * halves of that matter, and cost a session between them.
     *
     * Tildes draws these through `post_action_toggle_button`, which builds the
     * URL by calling a second macro, and a Jinja macro's own newlines are part
     * of what it hands back. So a comment's button really arrives as
     *
     * ```html
     * data-ic-delete-from="
     *   https://tildes.net/api/web/comments/ifen/vote
     *
     * "
     * ```
     *
     * while a topic's own vote button is written inline in the listing macro
     * and carries none of that. A pattern anchored on `/vote"` therefore
     * matched every topic and no comment at all, and a comment vote read as
     * cast until the page was next read.
     *
     * The word moves too: the toggled label for a vote is **Voted** now, where
     * this used to look for Unvote.
     */
    private fun usedToggle(action: String) = "[data-ic-delete-from*=/$action]"

    /**
     * Whether a **topic** draws the used half of that toggle.
     *
     * A topic's own page renders its comments inside the same `<article>`, and
     * every comment carries the same two buttons, so a button under one of them
     * answers about the comment rather than about the topic.
     */
    private fun toggledFrom(el: Element, action: String): Boolean =
        el.select(usedToggle(action)).any { button ->
            button.parents().none { it.hasClass("comment") }
        }

    private fun votedFrom(el: Element): Boolean = toggledFrom(el, "vote")

    private fun bookmarkedFrom(el: Element): Boolean = toggledFrom(el, "bookmark")

    /**
     * And the ignore beside them, which is drawn in two different places.
     *
     * A topic's own page puts it in the same `menu.btn-post` as the bookmark.
     * A listing row puts it in an **Actions** dropdown instead, and gives it a
     * `name` where the topic page leaves it off -- so the button's endpoint is
     * the only thing the two shapes have in common, which is what this matches
     * on anyway.
     */
    private fun ignoredFrom(el: Element): Boolean = toggledFrom(el, "ignore")

    /**
     * And the same question of a comment, which needs no such care: what is
     * passed in is `.comment-itself`, and a comment's replies are its siblings
     * rather than its children.
     */
    private fun commentToggled(self: Element, action: String): Boolean =
        self.selectFirst(usedToggle(action)) != null

    /**
     * Logged out, Tildes prints the score as text ("119 votes"). Logged in that
     * element is gone entirely and the count lives in the vote button's label
     * ("Vote (28)" / "Voted (29)"), so both shapes have to be read.
     */
    private fun commentVotes(self: Element?): Int {
        if (self == null) return 0
        self.selectFirst(".comment-votes")?.let { return firstInt(it.text()) }
        return firstInt(self.selectFirst(COMMENT_VOTE_BUTTON)?.text())
    }

    /**
     * The labels on a comment, which the site draws in two shapes.
     *
     * A plain one for everybody: `<ul class="comment-labels">` holding one
     * `<li>` per label. On your own comment the exemplary ones come as a
     * `<details>` instead, whose `<summary>` carries the same pill plus `x2`
     * and whose list is what each person wrote. A comment can carry both at
     * once -- the second shape is exemplary only -- so the first one found
     * wins and the other is skipped, since it says less about the same label.
     *
     * The name comes off the `label-comment-<name>` class rather than off the
     * text. The two branches disagree about the capital, one printing
     * `Exemplary` and the other `exemplary`, and the class says the same thing
     * in both.
     *
     * Scoped to `.comment-itself` by its caller, which is what keeps a reply's
     * label off its parent: replies live in a sibling `<ol>` under the same
     * `<article>`.
     */
    private fun labelsOf(self: Element?): List<Label> {
        if (self == null) return emptyList()
        val found = LinkedHashMap<String, Label>()

        self.select("details.comment-exemplary-reasons").forEach { details ->
            val name = labelNameIn(details.selectFirst("summary")) ?: return@forEach
            // "x2", where the x is the site's own and not a multiplication.
            val count = details.selectFirst(".comment-label-count")
                ?.text()?.trim()?.removePrefix("x")?.trim()?.toIntOrNull() ?: 0
            // Each reason is printed inside its own quotes, which are the
            // site's punctuation rather than part of what was written.
            val reasons = details.select("li")
                .map { it.text().trim().removeSurrounding("\"").trim() }
                .filter { it.isNotEmpty() }
            found[name] = Label(labelWord(name), count, reasons)
        }

        self.select("ul.comment-labels > li").forEach { li ->
            val name = labelNameIn(li) ?: return@forEach
            if (!found.containsKey(name)) found[name] = Label(labelWord(name))
        }

        return found.values.toList()
    }

    /**
     * Which label an element is about, off the class the site names it with.
     *
     * The class is on the `<li>` itself in the plain shape and on a `<span>`
     * inside it in the other two, so both the element and its descendants are
     * looked at.
     */
    private fun labelNameIn(el: Element?): String? {
        if (el == null) return null
        val carrier = if (labelSlug(el) != null) el else el.selectFirst(".label-comment")
        return carrier?.let { labelSlug(it) }
    }

    private fun labelSlug(el: Element): String? =
        el.classNames().mapNotNull { LABEL_CLASS.find(it)?.groupValues?.get(1) }.firstOrNull()

    /** `label-comment-exemplary`, beside the `label-comment` the whole set carries. */
    private val LABEL_CLASS = Regex("^label-comment-([a-z]+)$")

    /** The site's own pill wording, which is the name with a capital on it. */
    private fun labelWord(slug: String): String =
        slug.substring(0, 1).uppercase() + slug.substring(1)

    fun parseTopicListing(html: String): List<Topic> =
        Jsoup.parse(html, BASE).select("article.topic").mapNotNull { parseTopicArticle(it) }

    private fun parseTopicArticle(a: Element): Topic? {
        val id36 = a.id().removePrefix("topic-").ifEmpty { return null }
        val titleLink = a.selectFirst(".topic-title a")
        val titleHref = titleLink?.attr("href") ?: ""
        val commentsHref = a.selectFirst(".topic-info-comments a")?.attr("href") ?: ""
        val internal = if (titleHref.startsWith("/")) titleHref else commentsHref
        val group = Regex("^/~([A-Za-z0-9_.]+)/").find(internal)?.groupValues?.get(1)
            ?: a.selectFirst(".topic-group a")?.text()?.trim()?.removePrefix("~")
            ?: return null

        val excerpt = a.selectFirst(".topic-text-excerpt")
        val bodyHtml = excerpt?.clone()?.also { it.select("summary").remove() }?.html()?.trim()

        val path = withoutFragment(internal).ifEmpty { "/~$group/$id36" }
        rememberPath(id36, path)

        return Topic(
            id36 = id36,
            title = titleLink?.text()?.trim() ?: "",
            group = group,
            author = username(a.attr("data-topic-posted-by")),
            scheduled = a.selectFirst(".topic-info-source-scheduled") != null,
            postedAt = a.selectFirst(".topic-info time[datetime]")?.attr("datetime"),
            numComments = firstInt(a.selectFirst(".topic-info-comments")?.text()),
            // "(3 new)", which Tildes prints only when it has a visit to
            // compare against, so it is absent logged out.
            newCommentsSinceVisit = firstInt(a.selectFirst(".topic-info-comments-new")?.text()),
            numVotes = firstInt(a.selectFirst(".topic-voting-votes")?.text()),
            tags = tagsOf(a),
            // The same tags, kept apart because a page is about to overwrite
            // the ones above with everything it can see. See [Topic.tagsInListing].
            tagsInListing = tagsOf(a),
            contentType = a.selectFirst(".topic-content-type")?.text()?.trim()?.ifEmpty { null },
            contentMetadata = contentMetadataOf(a),
            siteIcon = siteIconOf(a),
            linkUrl = if (titleHref.startsWith("http")) titleHref else null,
            bodyHtml = bodyHtml?.ifEmpty { null },
            path = path,
            voted = votedFrom(a),
            votingClosed = votingClosedIn(a, VOTE_BUTTON),
            bookmarked = bookmarkedFrom(a),
            ignored = ignoredFrom(a),
            locked = a.hasClass("is-topic-locked"),
        )
    }

    /**
     * A topic's link as Tildes' own short form of it.
     *
     * The site offers one on every topic page -- `tild.es/1vlp` under **Short
     * link** -- and it is the whole address: the group and the slug in front of
     * the id36 are there to be read rather than to be resolved. So a link
     * shared out of the app is a line rather than a paragraph, and it still
     * says where it goes.
     *
     * Written over the text rather than over a field, because a share is a
     * string by the time it leaves: **Share title + link** hands over the
     * title, a dash and the URL as one, and there is no field left holding the
     * URL on its own.
     *
     * **A comment link is left alone.** The short form answers for a topic, and
     * a comment's address is the topic's with `#comment-<id36>` after it, which
     * is a fragment on a URL rather than an id of its own. Same for a listing
     * with a query on it.
     */
    fun shortLinks(text: String): String =
        TOPIC_LINK.replace(text) { match ->
            val after = text.getOrNull(match.range.last + 1)
            if (after == '#' || after == '?') match.value
            else "$SHORT_BASE/${match.groupValues[1]}"
        }

    /**
     * The same, for a string that is a link and nothing else.
     *
     * Answers null for anything that is not one whole topic address, which is
     * the difference between rewriting what the app composed and rewriting what
     * somebody wrote. **Copy link** hands over an address; **Copy text** hands
     * over a post, and a topic link quoted inside one is that person's words.
     */
    fun shortLink(text: String): String? =
        TOPIC_LINK.matchEntire(text.trim())?.let { "$SHORT_BASE/${it.groupValues[1]}" }

    /**
     * A topic's own address, which is a group, an id36 and a slug that is only
     * there to be read.
     *
     * The three paths a group has that are not topics are named rather than
     * guessed at, since an id36 is lowercase letters and digits and so is
     * `wiki`. Nothing tells them apart by shape.
     */
    private val TOPIC_LINK = Regex(
        "https?://" + Regex.escape(BASE.substringAfter("://")) +
            "/~[A-Za-z0-9_.]+/(?!wiki\\b|search\\b|new_topic\\b)([a-z0-9]+)(?:/[A-Za-z0-9_-]*)?",
    )

    /** Where a short link points, which is the site under another name. */
    const val SHORT_BASE = "https://tild.es"

    /**
     * And back: the topic a short link names, or null for anything else.
     *
     * The whole path is the id36, so there is nothing to strip and nothing to
     * mistake it for -- a `tild.es` address has no other shape. Which is what
     * makes it worth answering separately from the long form: `tildes.net/x`
     * could be `login` or `groups`, and this cannot.
     *
     * Both schemes, since this reads a link somebody else wrote as often as one
     * the app wrote itself.
     */
    fun shortLinkId36(url: String): String? =
        SHORT_LINK.matchEntire(url.trim())?.groupValues?.get(1)

    private val SHORT_LINK = Regex(
        "https?://" + Regex.escape(SHORT_BASE.substringAfter("://")) + "/([a-z0-9]+)/?",
    )

    /**
     * And the topic behind either form, for a caller holding an address rather
     * than a shape.
     *
     * A menu row carries whichever of the two the app last wrote on it -- the
     * long one as it was built, the short one once `shortenLinks` has been past
     * -- so anything reading a topic back off a row has to take both. The long
     * form is matched whole rather than searched for, so a comment quoting a
     * topic link is not mistaken for one.
     */
    fun topicId36(url: String): String? =
        shortLinkId36(url) ?: TOPIC_LINK.matchEntire(url.trim())?.groupValues?.get(1)

    /**
     * And the comment behind one, which is the same address with the comment's
     * own fragment on the end.
     *
     * That fragment is the whole difference between the two, so it is also what
     * says a menu is a comment's rather than a topic's: **Share link** and
     * **Copy link** carry this on a comment and the bare topic address on a
     * topic. The short form is not matched, since `tild.es` answers for a topic
     * and the site publishes no short form of a comment.
     */
    fun commentId36(url: String): String? =
        COMMENT_LINK.matchEntire(url.trim())?.groupValues?.get(1)

    private val COMMENT_LINK = Regex(
        "https?://" + Regex.escape(BASE.substringAfter("://")) +
            "/~[A-Za-z0-9_.]+/[a-z0-9]+(?:/[A-Za-z0-9_-]*)?#comment-([a-z0-9]+)",
    )

    /**
     * An address on this site broken into the page it names and whatever
     * followed, or null for an address that is not on it.
     *
     * The **path is what a caller decides on**: empty for the root of either
     * host, `/groups` for the groups page, and so on. It is normalised only by
     * dropping a trailing slash, so a page this knows nothing about comes back
     * as itself rather than as null -- the caller hands those on to whatever
     * would have run anyway.
     *
     * A group, a topic, a person and a short link do **not** come back here at
     * all: the character class stops at `~` and the rest are left to the resolve
     * route, which is the thing that already reads a shape off a path. That is
     * deliberate rather than incidental. Anything this matched and did not
     * recognise would still fall through, but not matching is one less way for
     * a working address to change hands.
     *
     * The **query is handed back rather than acted on**, since the pages this
     * reaches have nowhere to put one. Both hosts and both schemes, for the
     * reason [shortLinkId36] takes both, and a fragment is allowed and ignored.
     */
    fun sitePage(url: String): Page? {
        val found = SITE_PAGE.matchEntire(url.trim()) ?: return null
        return Page(found.groupValues[1].trimEnd('/'), found.groupValues[2])
    }

    /** One of those: what the address named, and what came after it. */
    class Page(val path: String, val query: String)

    private val SITE_PAGE = Regex(
        "https?://(?:www\\.)?(?:" + Regex.escape(BASE.substringAfter("://")) + "|" +
            Regex.escape(SHORT_BASE.substringAfter("://")) +
            ")(/[A-Za-z0-9_/-]*)?(\\?[^#]*)?(?:#.*)?",
    )

    /**
     * Whether an address is on this site at all, which is the host and nothing
     * else.
     *
     * [sitePage] answers a much narrower question -- it stops at `~`, so a
     * group, a topic, a person and a short link all come back null from it --
     * and a caller that only wants to know **whose address this is** would read
     * that null as "somewhere else". This is the wider one, and every path is a
     * yes: `tildes.net`, `tild.es`, either scheme, with or without `www.`
     *
     * The trailing group is what keeps `tildes.network` out. A host is over at
     * the first `/`, `?` or `#`, so an address that carries on with letters is
     * a different site with a longer name.
     */
    fun onThisSite(url: String): Boolean =
        SITE_ADDRESS.matches(url.trim())

    private val SITE_ADDRESS = Regex(
        "https?://(?:www\\.)?(?:" + Regex.escape(BASE.substringAfter("://")) + "|" +
            Regex.escape(SHORT_BASE.substringAfter("://")) + ")(?:[/?#].*)?",
        RegexOption.IGNORE_CASE,
    )

    /**
     * What Tildes measured about a topic, all of it.
     *
     * It looks like one label -- `Video: 1:34:22, published Jul 15 2021` -- and
     * it is a span per field, every one under the same class, with the
     * separator written **inside** a span rather than between them:
     *
     * ```html
     * <span class="topic-content-metadata">1:34:22,&nbsp;</span>
     * <span class="topic-content-metadata">published Jul 15 2021</span>
     * ```
     *
     * So taking the first one answered `1:34:22,` -- a number with a comma
     * hanging off it and nothing after it -- on every video Tildes knows a
     * publication date for, and nothing looked wrong on the rows it does not,
     * which is most of them. A word count is one field and reads the same
     * either way.
     *
     * The trailing comma comes off whatever happens, so a field Tildes writes
     * a separator on and then draws nothing after still reads as a number.
     */
    private fun contentMetadataOf(article: Element): String? =
        article.select(".topic-content-metadata")
            .joinToString(" ") { it.text().trim() }
            .trim()
            .trimEnd(',')
            .ifEmpty { null }

    /**
     * The site icon's slug, off the empty `<div>` Tildes marks it with.
     *
     * `<div class="topic-icon topic-icon-github_com">`, in a listing row's
     * `.topic-info-source` and in a topic page's `.topic-full-link`, with
     * nothing in it and no other attribute. So the class is the whole of what
     * the page says, and the same selector answers on both.
     */
    private fun siteIconOf(article: Element): String? =
        article.selectFirst(".topic-icon")
            ?.classNames()
            ?.firstNotNullOfOrNull { SITE_ICON_CLASS.find(it)?.groupValues?.get(1) }

    /** `topic-icon-github_com`, beside the plain `topic-icon` every one carries. */
    private val SITE_ICON_CLASS = Regex("^topic-icon-(.+)$")

    /**
     * What a listing says a topic is, as much of it as a row can use.
     *
     * Tildes writes this as two spans side by side: the kind, which is `Text`,
     * `Link`, `Article`, `Video`, `Image` or one of the `Ask` family, and then
     * how long the thing is, which is `300 words` or `2:45` and is often
     * absent. Together they read as `Article: 696 words`.
     *
     * **The length wins where there is one.** A row is short of width, and
     * `696 words` cannot be anything but an article while `2:45` cannot be
     * anything but a video, so the kind in front of it is a word spent saying
     * what the number already says. This is the case a text topic hits too:
     * they carry word counts, which is why `Text` is not simply dropped.
     *
     * **With no length, `Text` and `Link` say nothing worth a line.** They are
     * the bare kind of post, which a row already answers in its own way -- an
     * excerpt under the one, a domain and a thumbnail on the other -- and bare
     * `Text` was on sixteen of the fifty rows in the group fixture.
     *
     * Every other kind keeps its word, having nothing else to give: `Image`,
     * `PDF`, `Ask (survey)`, and whatever the site adds next.
     */
    fun contentTypeInRow(type: String?, length: String?): String? {
        if (!length.isNullOrEmpty()) return length
        if (type == null || type in PLAIN_CONTENT_TYPES) return null
        return type
    }

    /** The ones a row shows without being told. Tildes' own words. */
    private val PLAIN_CONTENT_TYPES = setOf("Text", "Link")

    /**
     * A topic's tags, which Tildes marks up two ways.
     *
     * A listing gives them a `<ul class="topic-tags">` of labels, while a
     * topic's own page writes them into a `<div class="topic-full-tags">` as
     * plain links after the word "Tags:", with the separating commas outside
     * the anchors. Nothing on a topic page carries the listing's class at all,
     * so reading only that one answered "no tags" for every topic opened from
     * its own page, which is where Boost draws its menu from.
     *
     * Both are read here rather than at each call site, since the two parsers
     * had already drifted once.
     */
    private fun tagsOf(article: Element): List<String> =
        article.select(".topic-tags li a, .topic-full-tags a").map { it.text().trim() }

    /**
     * A topic's log, which is the site's own account of everything done to a
     * topic after it was posted.
     *
     * Tildes keeps one line per change -- a tag added or removed, a title or a
     * link edited, a move between groups, a lock, a removal -- and prints them
     * newest first under **Topic log** in the topic's own sidebar, behind a
     * `<details>` the reader opens. Eight event types are shown out of rather
     * more that are recorded, and nothing else on the site says any of it: a
     * topic that was moved, renamed and retagged by three different people
     * reads exactly like one nobody has touched.
     *
     * Each line is kept as the sentence the site wrote rather than as parts.
     * The site builds it in Python -- `added tags 'x', 'y' and removed tag
     * 'z'`, `moved from ~misc to ~tech`, `changed title from "..." to "..."` --
     * and taking that apart here to put it back together the same way would be
     * a second implementation of wording this project does not own. So the
     * whole `<li>` is read, which is the person, what they did, and how long
     * ago in the site's own short form, in that order.
     *
     * It costs nothing. The log rides on the topic page that was fetched to
     * draw the topic anyway, so no reader of this ever asks the site for
     * anything, and a guest reads it: the section is not gated behind an
     * account.
     */
    data class TopicPage(
        val topic: Topic?,
        val comments: List<Comment>,
        val log: List<String> = emptyList(),
    )

    fun parseTopicPage(html: String, knownPath: String): TopicPage {
        val doc: Document = Jsoup.parse(html, BASE)
        val article = doc.selectFirst("article.topic-full")
        val group = Regex("^/~([A-Za-z0-9_.]+)/").find(knownPath)?.groupValues?.get(1) ?: ""

        val topicPostedAt = article?.selectFirst(".topic-full-byline time[datetime]")?.attr("datetime")

        val walked = mutableListOf<Comment>()
        doc.selectFirst("ol.comment-tree#comments")?.let { walk(it, emptyList(), walked) }
        val comments = datedFromNeighbours(walked, topicPostedAt)

        val topic = article?.let { a ->
            Topic(
                id36 = a.id().removePrefix("topic-"),
                title = a.selectFirst("h1")?.text()?.trim() ?: "",
                group = group,
                author = a.selectFirst(".topic-full-byline a.link-user")?.text()?.trim(),
                scheduled = automaticallyPosted(a),
                postedAt = topicPostedAt,
                // The comments Tildes counts, which is not the articles it
                // draws: a taken-down one keeps its place in the tree and is
                // left out of the number, so counting articles read 234 on a
                // topic whose own sidebar -- and whose row in a feed -- both
                // said 233.
                numComments = comments.count { it.placeholder == null },
                numVotes = firstInt(a.selectFirst(".topic-voting-votes")?.text()),
                tags = tagsOf(a),
                linkUrl = a.selectFirst(".topic-full-link a")?.attr("href"),
                siteIcon = siteIconOf(a),
                bodyHtml = a.selectFirst(".topic-full-text")?.html()?.trim()?.ifEmpty { null },
                path = knownPath,
                voted = votedFrom(a),
                votingClosed = votingClosedIn(a, VOTE_BUTTON),
                bookmarked = bookmarkedFrom(a),
                ignored = ignoredFrom(a),
                locked = doc.select(".topic-comments-locked, .is-topic-locked").isNotEmpty(),
                rootCommentsClosed = takenDown(doc),
                // The buttons Tildes drew for this account on this topic,
                // which is a permission check already made. The topic's own
                // menu is the first one on the page, and it has to be picked
                // out rather than searched for: the comments are rendered
                // inside the same article, each with a menu of its own.
                actions = a.selectFirst("menu.btn-post")
                    ?.select("button[name]")
                    ?.map { it.attr("name") }
                    ?.filter { it.isNotEmpty() }
                    ?.toSet()
                    .orEmpty(),
                // A topic page draws every tag and every control it allows,
                // which is the only place either is all on offer.
                fromTopicPage = true,
                // Every Tildes timestamp is the same fixed-width UTC string,
                // so the largest is the latest.
                newestCommentAt = comments.mapNotNull { it.postedAt }.maxOrNull(),
                // Tildes records this visit as it renders the page, so this
                // counts against the visit before it.
                newCommentsSinceVisit = doc.select("article.comment.is-comment-new").size,
            )
        }

        return TopicPage(topic, comments, logOf(doc))
    }

    /**
     * The label buttons a page is holding for this account.
     *
     * Tildes puts them in a `<template id="comment-label-options">`, one
     * `<button>` per label, and its own script clones that template into
     * whichever comment you press **Label** on. Which is why they are on the
     * page once rather than on each comment: the set is the same for every
     * comment on it, while whether you may label *this* one is on the comment.
     * See [Comment.mayLabel], and [labelOptions] for which pages carry it.
     *
     * The name comes off `data-js-label-name` and the prompt off
     * `data-js-reason-prompt`, both the site's own. The button's visible word
     * is skipped: it carries a trailing `...` where there is a prompt, which is
     * punctuation about the button rather than the label's name.
     *
     * **Only the template is parsed, not the page.** This runs on every fetch,
     * and the page it usually runs on is a topic's, which is the largest thing
     * this end reads and is about to be parsed again in full by whatever asked
     * for it. The template names itself, it closes, and nothing else on the
     * page is wanted, so the window between the two is what Jsoup is handed.
     * A page whose marker turns up somewhere other than the opening tag reads
     * as a page with no buttons, which is what every page without the template
     * already answers.
     */
    fun parseLabelOptions(html: String): List<LabelOption> {
        val marker = html.indexOf(LABEL_TEMPLATE_ID)
        if (marker == -1) return emptyList()
        val opened = html.indexOf('>', marker)
        if (opened == -1) return emptyList()
        val shut = html.indexOf("</template>", opened)
        val inside = if (shut == -1) html.substring(opened + 1) else html.substring(opened + 1, shut)
        return Jsoup.parseBodyFragment(inside).select("button[data-js-label-name]")
            .mapNotNull { button ->
                val name = button.attr("data-js-label-name").trim().ifEmpty { return@mapNotNull null }
                LabelOption(name, button.attr("data-js-reason-prompt").trim().ifEmpty { null })
            }
    }

    /** What the site names that template, which is what its own script finds it by. */
    private const val LABEL_TEMPLATE_ID = "id=\"comment-label-options\""

    /**
     * The lines under **Topic log**, newest first, as the site prints them.
     *
     * The entries are the only thing taken off the section: the `<summary>`
     * says `Topic log (4)`, which is a count of what follows, and a heading
     * saying how many of something there are belongs to whatever draws them.
     *
     * A topic nobody has touched carries no `<details>` at all, so an empty
     * list is the ordinary answer rather than a failure.
     */
    private fun logOf(doc: Document): List<String> =
        doc.select("details.topic-log li.topic-log-entry")
            .map { it.text().trim() }
            .filter { it.isNotEmpty() }

    /**
     * Tildes nests replies in real <ol> elements, so ancestry is exact rather
     * than inferred -- which is what Lemmy's materialised path needs.
     */
    private fun readComment(art: Element, ancestors: List<String>): Comment? {
        val id36 = art.attr("data-comment-id36").ifEmpty { art.id().removePrefix("comment-") }
        if (id36.isEmpty()) return null

        val self = art.children().firstOrNull { it.hasClass("comment-itself") }
        val header = self?.children()?.firstOrNull { it.hasClass("comment-header") }
        val body = self?.children()?.firstOrNull { it.hasClass("comment-text") }

        // What Tildes drew instead of the comment, if it drew anything. The
        // class naming the reason is on this <div> and not on the <article>,
        // which is what looking for it on the article had wrong: no comment on
        // any page ever read removed or deleted, so a taken-down comment came
        // back as an ordinary one with an empty body, nobody's name on it and
        // the epoch for a date -- which Boost drew as "56 years ago".
        //
        // Scoped to `.comment-itself`, which holds this comment's own header
        // and text and not its replies: those live in a sibling <ol> under the
        // same <article>, so a removed reply would otherwise take its whole
        // ancestry down with it.
        val marker = self?.selectFirst(".is-comment-removed, .is-comment-deleted")

        return Comment(
            id36 = id36,
            depth = art.attr("data-comment-depth").toIntOrNull() ?: ancestors.size,
            ancestors = ancestors,
            author = header?.selectFirst("a.link-user")?.text()?.trim(),
            postedAt = header?.selectFirst("time.comment-posted-time")?.attr("datetime"),
            editedAt = header?.selectFirst(".comment-edited-time time")?.attr("datetime"),
            numVotes = commentVotes(self),
            bodyHtml = body?.html()?.trim() ?: "",
            // Scoped to .comment-itself, not the whole <article>: the article
            // also holds this comment's replies, whose vote buttons would make
            // every ancestor look voted.
            voted = self?.let { commentToggled(it, "vote") } ?: false,
            bookmarked = self?.let { commentToggled(it, "bookmark") } ?: false,
            // Scoped to .comment-itself for the reason above: a reply's vote
            // button would answer for its parent.
            votingClosed = self == null || votingClosedIn(self, COMMENT_VOTE_BUTTON),
            byOp = art.hasClass("is-comment-by-op"),
            removed = marker?.hasClass("is-comment-removed") == true,
            deleted = marker?.hasClass("is-comment-deleted") == true,
            placeholder = marker?.text()?.trim()?.ifEmpty { null },
            // "full" in Tildes' own terms, which is the whole chain folded.
            // Its other state, `is-comment-collapsed-individual`, folds one
            // comment while leaving its replies showing, and Boost's collapse
            // always takes the replies with it, so there is nothing to map it
            // to.
            collapsed = art.hasClass("is-comment-collapsed"),
            isNew = art.hasClass("is-comment-new"),
            // Scoped to .comment-itself for the reason the three above it are:
            // a reply's label would otherwise read as its parent's.
            labels = labelsOf(self),
            // These two are on the article rather than inside it, so they are
            // this comment's own either way.
            mayLabel = art.hasAttr(MY_LABELS_ATTR),
            myLabels = art.attr(MY_LABELS_ATTR).split(' ').filter { it.isNotEmpty() },
        )
    }

    /**
     * The attribute the site writes on a comment it will let you label, whose
     * value is the labels you have already put there. Written empty rather than
     * left off where you have used none, so its presence is the permission and
     * its value is the state.
     */
    private const val MY_LABELS_ATTR = "data-comment-user-labels"

    /**
     * A date for the comments Tildes publishes none for.
     *
     * A taken-down comment is drawn with no byline and no `<time>` at all, so
     * it arrived here with a null [Comment.postedAt] and left as the epoch,
     * which Boost drew as **56 years ago** in the middle of a thread from last
     * week.
     *
     * There is a real answer on the page. A comment's id36 is Tildes' own row
     * id in base 36, handed out in order, so ordering the tree by it is
     * ordering it by when each comment was written -- 360 of the 374 comments
     * on `~tildes.official/167q` carry a time, and sorting those by id36 puts
     * them in time order with not one pair out of place. The comment written
     * immediately before a taken-down one therefore bounds it from below, and
     * on a topic with any traffic that bound is minutes out rather than
     * decades. Where there is no earlier comment the topic's own time serves,
     * being the one thing every comment on it was written after.
     *
     * Only the taken-down ones are filled. A comment missing its time for any
     * other reason is a parse that went wrong, and giving that one a plausible
     * date would hide it.
     *
     * A comment listed on its own -- a profile, a notification, the bookmarks
     * -- has no neighbours to be bounded by and keeps the epoch. Tildes leaves
     * removed comments off those listings, so none has been seen there.
     */
    private fun datedFromNeighbours(comments: List<Comment>, topicPostedAt: String?): List<Comment> {
        if (comments.none { it.placeholder != null && it.postedAt == null }) return comments

        val dated = comments.filter { it.postedAt != null }.sortedBy { seq(it.id36) }
        return comments.map { c ->
            if (c.placeholder == null || c.postedAt != null) return@map c
            val before = dated.lastOrNull { seq(it.id36) < seq(c.id36) }
            c.copy(postedAt = before?.postedAt ?: topicPostedAt)
        }
    }

    /** Where a comment sits in the order Tildes wrote them, out of its id36. */
    private fun seq(id36: String): Long = id36.toLongOrNull(36) ?: 0L

    private fun walk(list: Element, ancestors: List<String>, out: MutableList<Comment>) {
        for (li in list.children()) {
            if (!li.hasClass("comment-tree-item")) continue
            val art = li.children().firstOrNull { it.tagName() == "article" && it.hasClass("comment") }
                ?: continue
            val comment = readComment(art, ancestors) ?: continue
            out.add(comment)

            art.children().firstOrNull { it.tagName() == "ol" && it.hasClass("comment-tree") }
                ?.let { walk(it, ancestors + comment.id36, out) }
        }
    }

    /** A comment under a heading naming its topic, as profiles and notifications list them. */
    data class UserComment(val comment: Comment, val topic: Topic, val mention: Boolean = false)

    /**
     * The comments on a user page. Each sits under a heading naming the topic
     * it was left on, which is the only place that topic is described, so the
     * two are read together.
     *
     * A profile is mostly these: twenty items with one or two topics among
     * them, so reading only the topics leaves an active account looking empty.
     */
    fun parseUserComments(html: String): List<UserComment> =
        parseHeadedComments(html, "h2.heading-post-listing")

    /**
     * The cursor on a listing's Next link, which is what pages everything here.
     *
     * **Read out of the pagination block only.** A topic's own text can carry a
     * link reading "Next thread ->", that link renders above the pagination and
     * its href has no `after=` at all, so taking the first "Next" anchor on the
     * page answered `next_page: null` for a whole listing -- a feed that would
     * not scroll, coming and going with whatever was on the page.
     *
     * **And taken whole.** It used to be read as `after=([A-Za-z0-9]+)`, which
     * is every cursor Tildes hands out for a listing of one kind of thing --
     * an id36 and nothing else. A listing of **both** kinds has to say which
     * table its anchor is in, so `MixedPagination` writes `c-<id36>` for a
     * comment and `t-<id36>` for a topic, and a character class of letters and
     * digits stopped at the hyphen. What went back was `after=c`, which Tildes
     * answers with an empty page, so the profile's All posts tab drew its first
     * page and would not scroll past it.
     */
    fun nextCursor(html: String): String? {
        val next = Jsoup.parse(html, BASE)
            .select(".pagination a")
            .firstOrNull { it.text().trim().startsWith("Next") }
            ?: return null
        return Regex("[?&]after=([^&#]+)").find(next.attr("href"))?.groupValues?.get(1)
    }

    /**
     * Which kind each item on a merged profile listing is, in the order Tildes
     * drew them.
     *
     * A profile's first tab is one list of both kinds -- `/user/Deimos` came
     * back nineteen comments and one topic with the topic seventeenth -- and
     * Lemmy has no shape for that: a person's contributions arrive as an array
     * of posts and an array of comments, and putting one after the other would
     * float that topic to the top of the page. So the order is read here, where
     * the page still has it, and carried beside the two arrays.
     *
     * `true` is a comment. Counted off the same two selectors the two parsers
     * use -- a topic's own `<article>`, and the heading a listed comment sits
     * under -- so the trues and falses are exactly as many as the two arrays
     * they describe, whatever else is on the page.
     */
    fun mergedOrder(html: String): List<Boolean> =
        Jsoup.parse(html, BASE)
            .select("article.topic, h2.heading-post-listing")
            .map { it.tagName() == "h2" }

    /**
     * Notifications: replies to your comments and topics, and mentions of you.
     * Same single-comment markup as a profile under a different heading, and
     * the heading's wording is the only thing separating a mention from a
     * reply.
     */
    fun parseNotifications(html: String): List<UserComment> =
        parseHeadedComments(html, "h2.heading-notification")

    /**
     * The one ancestor a comment drawn out of its thread knows about.
     *
     * Tildes puts a **Parent** link beside **Link** on every comment that has
     * one, pointing at the parent's own anchor in the topic. So a comment on a
     * profile, a bookmarks page or a notification says who it is replying to,
     * which is exactly what Boost needs to open it as a thread: the app derives
     * a comment's parent from its path and from nothing else, and one that
     * claims to be top level has its own replies dropped when the thread is
     * built.
     *
     * Found by the anchor rather than by the word. Both nav links point into
     * the same topic and only their fragments differ, so the one naming a
     * comment other than this one is the parent -- which needs no wording and
     * survives the site being read in another language.
     */
    private fun parentOf(art: Element): List<String> {
        val id36 = art.attr("data-comment-id36").ifEmpty { art.id().removePrefix("comment-") }
        val parent = art.select("a.comment-nav-link")
            .mapNotNull { COMMENT_ANCHOR.find(it.attr("href"))?.groupValues?.get(1) }
            .firstOrNull { it != id36 }
        return listOfNotNull(parent)
    }

    /** Which comment an anchor points at, out of a link into a topic. */
    private val COMMENT_ANCHOR = Regex("#comment-([a-z0-9]+)$")

    private fun parseHeadedComments(html: String, heading: String): List<UserComment> =
        Jsoup.parse(html, BASE).select(heading).mapNotNull { head ->
            val li = head.parent() ?: return@mapNotNull null
            val art = li.children()
                .firstOrNull { it.tagName() == "article" && it.hasClass("comment") }
                ?: return@mapNotNull null
            val comment = readComment(art, parentOf(art)) ?: return@mapNotNull null

            val link = head.select("a").firstOrNull {
                Regex("^/~[A-Za-z0-9_.]+/[A-Za-z0-9]+").containsMatchIn(it.attr("href"))
            } ?: return@mapNotNull null
            val href = withoutFragment(link.attr("href"))
            val parts = Regex("^/~([A-Za-z0-9_.]+)/([A-Za-z0-9]+)").find(href)
                ?: return@mapNotNull null
            rememberPath(parts.groupValues[2], href)

            UserComment(
                comment = comment,
                mention = head.text().contains("mentioned", ignoreCase = true),
                topic = Topic(
                    id36 = parts.groupValues[2],
                    title = link.text().trim(),
                    group = parts.groupValues[1],
                    author = null,
                    postedAt = null,
                    numComments = 0,
                    numVotes = 0,
                    tags = emptyList(),
                    linkUrl = null,
                    bodyHtml = null,
                    path = href,
                    voted = false,
                    bookmarked = false,
                    ignored = false,
                    locked = false,
                ),
            )
        }

    /* ---------------------------------------------------------------- */
    /* Actions                                                          */
    /* ---------------------------------------------------------------- */

    fun login(user: String, password: String, totp: String?): Boolean {
        cookies = mutableMapOf()
        csrfToken = null
        username = null

        csrfToken = parseCsrfToken(getHtml("/login", noCache = true))
            ?: throw TildesException("could not read the login form", 500)

        val body = send(
            "POST", "/login",
            mapOf("username" to user, "password" to password, "keep" to "on", "from_url" to "")
        ).body

        val wantsTotp =
            Regex("two.?factor|login_two_factor", RegexOption.IGNORE_CASE).containsMatchIn(body)

        if (wantsTotp) {
            // Lemmy's own error codes, because Boost keys off them to decide
            // whether to show its 2FA field rather than a generic failure.
            if (totp.isNullOrEmpty()) throw TildesException(ERROR_MISSING_TOTP, 400)
            parseCsrfToken(body)?.let { csrfToken = it }
            val after =
                send("POST", "/login_two_factor", mapOf("code" to totp, "from_url" to "")).body
            if (Regex("two.?factor|invalid|incorrect", RegexOption.IGNORE_CASE).containsMatchIn(after) &&
                parseLoggedInUser(after) == null
            ) {
                throw TildesException(ERROR_INCORRECT_TOTP, 400)
            }
        }

        val home = getHtml("/", noCache = true)
        username = parseLoggedInUser(home)
        if (username == null) {
            // Either the credentials were wrong, or the marker this reads moved.
            return false
        }
        parseCsrfToken(home)?.let { csrfToken = it }
        return true
    }

    private fun ensureCsrf() {
        if (csrfToken == null) csrfToken = parseCsrfToken(getHtml("/", noCache = true))
    }

    fun voteTopic(id36: String, up: Boolean) {
        ensureCsrf()
        send(if (up) "PUT" else "DELETE", "/api/web/topics/$id36/vote")
    }

    fun voteComment(id36: String, up: Boolean) {
        ensureCsrf()
        send(if (up) "PUT" else "DELETE", "/api/web/comments/$id36/vote")
    }

    /**
     * Puts a label on a comment, or takes yours back off.
     *
     * The same route both ways, the way a vote and a bookmark are, and the
     * name is the site's own lowercase one out of [LabelOption]. The reason
     * rides in the form body, which is where the site's own prompt puts it --
     * `data-ic-prompt-name="reason"` on the button -- and only two labels ask
     * for one.
     *
     * The answer is the comment redrawn, which nothing here reads: the screen
     * that asked for this is a menu rather than a list, and the labels come
     * back with the page on the next read.
     */
    fun labelComment(id36: String, name: String, on: Boolean, reason: String? = null) {
        ensureCsrf()
        val path = "/api/web/comments/$id36/labels/" + name.lowercase()
        if (!on) {
            send("DELETE", path)
            return
        }
        send("PUT", path, if (reason.isNullOrEmpty()) emptyMap() else mapOf("reason" to reason))
    }

    fun bookmarkTopic(id36: String, on: Boolean) {
        ensureCsrf()
        send(if (on) "PUT" else "DELETE", "/api/web/topics/$id36/bookmark")
    }

    fun subscribeGroup(group: String, on: Boolean) {
        ensureCsrf()
        // No tilde here. That belongs to the /~name page URL, and this route
        // takes the bare name, answering 422 for anything else.
        send(if (on) "PUT" else "DELETE", "/api/web/group/$group/subscribe")
    }

    fun postComment(topicId36: String?, parentId36: String?, markdown: String): String? {
        ensureCsrf()
        val path = if (parentId36 != null) "/api/web/comments/$parentId36/replies"
        else "/api/web/topics/$topicId36/comments"
        val html = send("POST", path, mapOf("markdown" to markdown)).body
        return Jsoup.parse(html).selectFirst("article.comment")?.attr("data-comment-id36")
    }

    /**
     * Marks a notification read, and every notification older than it when
     * `andOlder` is set, which is what the site's own "Mark all read" does.
     */
    fun markNotificationRead(id36: String, andOlder: Boolean = false) {
        ensureCsrf()
        val query = if (andOlder) "?mark_all_previous=true" else ""
        send("PUT", "/api/web/comments/$id36/mark_read$query")
    }

    /** Starts a thread. Tildes requires a subject, which Lemmy has no field for. */
    fun sendMessage(username: String, subject: String, markdown: String) {
        ensureCsrf()
        send(
            "POST", "/user/" + enc(username) + "/messages",
            mapOf("subject" to subject, "markdown" to markdown),
        )
    }

    fun replyToConversation(id36: String, markdown: String) {
        ensureCsrf()
        send("POST", "/api/web/messages/conversations/$id36/replies", mapOf("markdown" to markdown))
    }

    /** Ignoring is what Tildes has where Lemmy hides, and it keeps a list of them. */
    fun ignoreTopic(id36: String, on: Boolean) {
        ensureCsrf()
        send(if (on) "PUT" else "DELETE", "/api/web/topics/$id36/ignore")
    }

    fun editTopic(id36: String, markdown: String) {
        ensureCsrf()
        send("PATCH", "/api/web/topics/$id36", mapOf("markdown" to markdown))
    }

    /**
     * Retitles a topic.
     *
     * The title, the link and the group a topic sits in are all edited through
     * the same `PATCH /api/web/topics/<id36>` its text goes through, told apart
     * by the `ic-trigger-name` the site's own forms send beside the field. The
     * one arriving without any is the text edit, which is why [editTopic] sends
     * nothing of the sort.
     *
     * That name rides in the form body rather than the query, because that is
     * where intercooler.js puts it on anything but a GET. Tildes reads it as a
     * view predicate, so it decides which of the three edits this is before the
     * field beside it is looked at, and a request missing it is read as an edit
     * of the text with no text in it.
     *
     * `edit_title` is the author's for five minutes and a group's moderators'
     * after that, so a refusal here is an ordinary answer rather than a broken
     * one.
     */
    fun retitleTopic(id36: String, title: String) {
        ensureCsrf()
        send(
            "PATCH", "/api/web/topics/$id36",
            mapOf("ic-trigger-name" to "topic-title-edit", "title" to title),
        )
    }

    /**
     * Repoints a link topic somewhere else. Same endpoint and same shape as
     * [retitleTopic], under its own trigger name.
     *
     * `edit_link` is nobody's by default. The author never holds it, however
     * new the topic, and Tildes grants it per group the way it grants tagging,
     * so this is refused for most accounts on most topics. A text topic refuses
     * it outright, since a topic's kind is fixed once it is posted.
     */
    fun relinkTopic(id36: String, link: String) {
        ensureCsrf()
        send(
            "PATCH", "/api/web/topics/$id36",
            mapOf("ic-trigger-name" to "topic-link-edit", "link" to link),
        )
    }

    /**
     * Moves a topic into another group, which is what Tildes has where Reddit
     * has a cross-post: one topic that changes address rather than a second one
     * pointing at the first.
     *
     * Same endpoint and same shape as [retitleTopic] again, under a trigger
     * name of its own. The field is `path` and it takes the group with no `~`
     * in front of it. Tildes lowercases what arrives and then checks each
     * dot-separated element against `[a-z0-9_]`, so a tilde is refused as an
     * invalid path rather than read as decoration.
     *
     * `move` is granted per group the way tagging is, so an account holds it on
     * some groups and not on others, and the topic's own page is what says
     * which: it draws a **Move** button only where the account has one, and
     * that is [Topic.actions], read off a page fetched anyway.
     *
     * The site's own form behind that button is a text box rather than a list,
     * so nothing here fetches `/api/web/topics/<id36>/group`. It would cost a
     * request to be told the group the topic is already in.
     */
    fun moveTopic(id36: String, group: String) {
        ensureCsrf()
        send(
            "PATCH", "/api/web/topics/$id36",
            mapOf("ic-trigger-name" to "topic-move", "path" to group),
        )
    }

    /** A topic's tags as its own edit form gives them, and the token beside them. */
    data class TagForm(val tags: List<String>, val conflictCheck: String)

    /**
     * The tag form Tildes draws for a topic, which is the only place its tags
     * appear in the order a retag has to name them in.
     *
     * The page renders `tags_ordered`, important tags first, while the site's
     * edit-conflict check compares against the stored list in the order the
     * tags were entered. The two agree right up until a topic carries `nsfw`,
     * which is important and moves to the front of what is drawn, and from then
     * on a retag built from the page is refused as somebody else's edit. That
     * is silent: the write is rejected, the tags stay, and nothing on screen
     * says why.
     *
     * The form carries both halves in the order the check wants, which is what
     * the site's own tagging does. It is the permission check as well, since an
     * account that may not tag is refused here rather than after the write.
     */
    fun topicTagForm(id36: String): TagForm {
        val html = getFragment("/api/web/topics/$id36/tags")
        val doc = Jsoup.parse(html, BASE)
        return TagForm(
            tags = doc.selectFirst("input#tags")?.attr("value")
                ?.split(',')?.map { it.trim() }?.filter { it.isNotEmpty() }.orEmpty(),
            conflictCheck = doc.selectFirst("input[name=conflict_check]")?.attr("value").orEmpty(),
        )
    }

    /**
     * A tag put onto a comma-separated line where the caret is, and where the
     * caret goes afterwards.
     *
     * **The caret is the whole of it.** The composer's suggestion row completes
     * the tag it is standing in, which is what typing `mus` and tapping
     * **music** wants, and that same rule is why a caret left at the start of
     * the line replaces the first tag instead of adding one. So a field filled
     * from a draft ends in a separator with the caret past it, which is the
     * state the field is in after any tap on that row anyway.
     *
     * Here rather than beside the row it draws, so a test can work it without
     * a view: the interceptor implements an OkHttp interface, and loading that
     * class needs OkHttp on the classpath.
     */
    fun completeTag(line: String, at: Int, tag: String): Pair<String, Int> {
        val caret = at.coerceIn(0, line.length)
        val start = line.substring(0, caret).lastIndexOf(',') + 1
        val end = line.indexOf(',', caret).let { if (it < 0) line.length else it }

        val before = line.substring(0, start).trimEnd()
        val after = line.substring(end).trimStart(',', ' ')
        val head = (if (before.isEmpty()) "" else "$before ") + tag + ", "

        return (head + after) to head.length
    }

    /**
     * The tags a group suggests, off its own new-topic form.
     *
     * Tildes has no endpoint for these. Every form that takes tags is rendered
     * with `group.autocomplete_topic_tags` already in it, as JSON on the
     * `data-js-autocomplete-input` attribute of `input#tags`, and the list is
     * the group's common tags plus `nsfw`, `spoiler` and
     * `coronaviruses.covid19` where those are not among them.
     *
     * The new-topic page is the one read here rather than a topic's own tag
     * form, because it answers for a topic being written as well as one being
     * edited and it needs nothing but the group's name. It is a whole page, so
     * it goes through the 30 second cache like any other.
     */
    fun groupTagSuggestions(group: String): List<String> =
        parseTagSuggestions(getHtml("/~$group/new_topic"))

    /**
     * The suggestions out of a page that carries them.
     *
     * The attribute is a JSON array of strings, and it is read with a regex
     * rather than a parser: `org.json` is Android's, which puts anything using
     * it out of reach of the tests here, and a tag matches `[\w .]` so an
     * escape is a shape the site cannot currently produce. Both are handled
     * anyway, since the reader is three lines either way.
     */
    fun parseTagSuggestions(html: String): List<String> {
        val json = Jsoup.parse(html, BASE).selectFirst("input#tags")
            ?.attr("data-js-autocomplete-input").orEmpty()
        return JSON_STRING.findAll(json)
            .map { JSON_ESCAPE.replace(it.groupValues[1]) { escape -> escape.groupValues[1] } }
            .filter { it.isNotEmpty() }
            .distinct()
            .toList()
    }

    private val JSON_STRING = Regex("\"((?:[^\"\\\\]|\\\\.)*)\"")
    private val JSON_ESCAPE = Regex("\\\\(.)")

    /**
     * Retags a topic. Tags are their own endpoint on Tildes rather than a field
     * of the topic, and they carry their own edit-conflict check, so what the
     * form was drawn with goes up beside the new tags. See [topicTagForm].
     */
    fun retagTopic(id36: String, tags: List<String>, form: TagForm) {
        ensureCsrf()
        send(
            "PUT", "/api/web/topics/$id36/tags",
            mapOf("tags" to tags.joinToString(","), "conflict_check" to form.conflictCheck),
        )
    }

    /** One way. Tildes has no undelete, so Lemmy's deleted=false cannot be honoured. */
    fun deleteTopic(id36: String) {
        ensureCsrf()
        send("DELETE", "/api/web/topics/$id36")
    }

    fun bookmarkComment(id36: String, on: Boolean) {
        ensureCsrf()
        send(if (on) "PUT" else "DELETE", "/api/web/comments/$id36/bookmark")
    }

    fun editComment(id36: String, markdown: String) {
        ensureCsrf()
        send("PATCH", "/api/web/comments/$id36", mapOf("markdown" to markdown))
    }

    /**
     * Writes the signed-in account's bio.
     *
     * Same shape as [retitleTopic]: one PATCH endpoint behind several forms,
     * told apart by the `ic-trigger-name` the site's own form sends beside the
     * field. Tildes takes an empty string here, which is how a bio is removed,
     * so nothing about this refuses a blank.
     *
     * The permission is `change_settings`, which is your own account and
     * nobody else's, so the name is the signed-in one rather than a parameter
     * worth passing around.
     */
    fun editBio(markdown: String) {
        val name = username ?: throw TildesException("not signed in", 401)
        ensureCsrf()
        send(
            "PATCH", "/api/web/user/$name",
            mapOf("ic-trigger-name" to "user-bio", "markdown" to markdown),
        )
    }

    /**
     * Tildes keeps a deleted comment's place in the tree and blanks it, so the
     * replies under it survive.
     */
    fun deleteComment(id36: String) {
        ensureCsrf()
        send("DELETE", "/api/web/comments/$id36")
    }

    /**
     * Posting a topic goes to the group's own form endpoint rather than an
     * `/api/web/` one, so it answers with a redirect to the new topic instead
     * of an HTML fragment. That redirect is the only place the new id appears,
     * and Boost needs the topic back, so it is what this returns.
     */
    fun createTopic(
        group: String,
        title: String,
        link: String?,
        markdown: String?,
        tags: String?,
    ): String? {
        ensureCsrf()
        val location = send(
            "POST", "/~$group/topics",
            mapOf(
                "title" to title,
                "link" to (link ?: ""),
                "markdown" to (markdown ?: ""),
                "tags" to (tags ?: ""),
            ),
            intercooler = false,
        ).location
        // The redirect carries the canonical path as well as the id, so
        // reading the topic back costs no extra request to find it.
        return location?.let {
            val path = it.replace(Regex("^https?://[^/]+"), "")
            Regex("^/~[^/]+/([A-Za-z0-9]+)").find(path)?.groupValues?.get(1)
                ?.also { id36 -> rememberPath(id36, path) }
        }
    }
}

class TildesException(message: String, val status: Int) : Exception(message)
