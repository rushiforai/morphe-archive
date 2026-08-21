package app.morphe.extension.boostforlemmy.tildes

import android.content.Context
import android.content.SharedPreferences
import org.json.JSONArray
import org.json.JSONObject

/**
 * Keeps the Tildes session on disk, so it outlives the process.
 *
 * Boost writes its own token down, so after a force-stop or a reboot it still
 * believes it is signed in. The cookies backing that belief live in memory in
 * [Tildes] and die with the app, which leaves reads coming back logged-out and
 * writes failing with `not_logged_in`. The standalone bridge never had this,
 * because it was a separate process that outlived Boost.
 *
 * This lands in the app's own private preferences, beside the token Boost
 * already keeps there. Anything able to read one can read the other.
 */
internal object Session {

    private const val PREFS = "tildes-session"
    private const val KEY = "session"
    private const val SUBSCRIBERS = "subscribers"
    private const val SIDEBARS = "sidebars"
    private const val GROUP_NAMES = "groups"
    private const val HISTORY = "history"
    private const val LISTING = "listing"
    private const val CUSTOM_WINDOW = "window"
    private const val DRAFTS = "drafts"
    private const val TILDES = "tildes"
    private const val GUEST = "guest"

    /**
     * How much of a topic's body is kept for a history row. Boost's listing
     * shows a couple of lines, and keeping whole posts would put megabytes of
     * text in a preferences file.
     */
    private const val BODY_LIMIT = 600

    /** The last thing written, so an unchanged session costs a string compare. */
    @Volatile
    private var lastWritten: String? = null

    private var prefs: SharedPreferences? = null
    private var said = false

    /**
     * A failure here is not remembered, only a hit.
     *
     * The earliest hook used to be one a screen calls, and by then there has
     * always been an Application. `guestHost` runs off the API client being
     * built, which for an account that already exists is inside
     * `Application.onCreate`, so this is now reachable while the app is still
     * starting. Caching a null taken at a moment like that would answer null
     * for the rest of the run, and every hook that reads the account would
     * quietly fall back together.
     *
     * The warning is printed once rather than per call.
     */
    @Synchronized
    private fun prefs(): SharedPreferences? {
        if (prefs == null) {
            prefs = application()?.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            if (prefs == null && !said) {
                said = true
            }
        }
        return prefs
    }

    /**
     * The Application, with no Context to start from.
     *
     * An interceptor is handed a request and nothing else, and the patch injects
     * one call into a builder chain, so nothing passes a Context in. Both of
     * these are hidden APIs, both on Android's `unsupported` list rather than
     * the blocked one, which means they resolve and log a warning. Two of them
     * because either can hand back null depending on how the app was started.
     *
     * Also what lets the sort menu resolve a string resource by name, which is
     * the only way to know an id that renumbers every release.
     */
    internal fun application(): Context? {
        val candidates = listOf(
            "android.app.ActivityThread" to "currentApplication",
            "android.app.AppGlobals" to "getInitialApplication",
        )
        for ((className, methodName) in candidates) {
            try {
                val app = Class.forName(className).getMethod(methodName).invoke(null)
                if (app is Context) return app
            } catch (e: Throwable) {
            }
        }
        return null
    }

    /**
     * Puts a stored session back into [Tildes] and hands back the token Boost
     * was given for it, or null when there is nothing to restore.
     */
    fun restore(): String? {
        val text = prefs()?.getString(KEY, null) ?: return null
        val session = try {
            JSONObject(text)
        } catch (e: Throwable) {
            forget()
            return null
        }

        val token = session.optString("token").ifEmpty { null }
        val stored = session.optJSONObject("cookies")
        val cookies = LinkedHashMap<String, String>()
        if (stored != null) for (name in stored.keys()) cookies[name] = stored.optString(name)

        // A token with no cookies would leave Boost believing it is signed in
        // against a session that cannot prove anything, which is the exact
        // state this exists to prevent.
        if (token == null || cookies.isEmpty()) {
            forget()
            return null
        }

        Tildes.cookies = cookies
        Tildes.csrfToken = session.optString("csrf").ifEmpty { null }
        Tildes.username = session.optString("username").ifEmpty { null }
        lastWritten = text
        return token
    }

    /**
     * The stored account's name on its own, without putting anything back.
     *
     * [restore] is the interceptor's, and it is called once per process from
     * inside a request. A screen opened before any request has gone out --  a
     * tildes.net address tapped on a cold start -- runs before that, so
     * [Tildes.username] is still null while the name is on disk. This reads it
     * and touches nothing else, where calling [restore] from a second place
     * would put cookies back underneath a restore already running.
     */
    fun storedUsername(): String? {
        val text = prefs()?.getString(KEY, null) ?: return null
        return try {
            JSONObject(text).optString("username").ifEmpty { null }
        } catch (e: Throwable) {
            null
        }
    }

    /**
     * Writes the session down when anything about it has moved.
     *
     * Called after every answered request rather than only after login, because
     * Tildes reissues its cookie as the session goes on and a copy taken at
     * login alone goes stale. A null token means signed out, and clears it.
     */
    fun saveIfChanged(token: String?) {
        // Never while the session is parked. A guest has no token and browses
        // on a jar of its own, so this would write a null over the stored
        // session and erase the very thing being kept -- and picking the
        // account again would want the whole two-factor flow. The guard is here
        // rather than at the call site because there is nothing this could
        // usefully write for a guest, ever.
        if (wasGuest()) return
        val text = if (token == null) null else serialise(token)
        if (text == lastWritten) return
        val prefs = prefs() ?: return
        lastWritten = text
        if (text == null) prefs.edit().remove(KEY).apply()
        else prefs.edit().putString(KEY, text).apply()
    }

    /**
     * Subscriber counts, which are only on each group's own page and so cost a
     * request each to learn. Tildes has some forty groups and the numbers move
     * slowly, so they are worth keeping between runs rather than gathering
     * again every launch.
     */
    fun loadSubscribers(): Map<String, Int> {
        val text = prefs()?.getString(SUBSCRIBERS, null) ?: return emptyMap()
        return try {
            val stored = JSONObject(text)
            val out = HashMap<String, Int>()
            for (name in stored.keys()) out[name] = stored.optInt(name)
            out
        } catch (e: Throwable) {
            emptyMap()
        }
    }

    fun saveSubscribers(counts: Map<String, Int>) {
        val stored = JSONObject()
        counts.forEach { (name, count) -> stored.put(name, count) }
        prefs()?.edit()?.putString(SUBSCRIBERS, stored.toString())?.apply()
    }

    /**
     * Group sidebars, as the markdown Boost renders one in.
     *
     * Kept for the same reason the counts are: the sidebar only exists on a
     * group's own page, so a panel opened before that page has been read draws
     * nothing. Any group listing refreshes the one it passes through, so this
     * costs no request of its own after the first.
     *
     * These are the site's words rather than the account's, so one file for
     * all of them is right -- switching accounts does not change what ~comp
     * says about itself.
     */
    fun loadSidebars(): Map<String, String> {
        val text = prefs()?.getString(SIDEBARS, null) ?: return emptyMap()
        return try {
            val stored = JSONObject(text)
            val out = HashMap<String, String>()
            for (name in stored.keys()) out[name] = stored.optString(name)
            out
        } catch (e: Throwable) {
            emptyMap()
        }
    }

    fun saveSidebars(sidebars: Map<String, String>) {
        val stored = JSONObject()
        sidebars.forEach { (name, markdown) -> stored.put(name, markdown) }
        prefs()?.edit()?.putString(SIDEBARS, stored.toString())?.apply()
    }

    /**
     * Every group the site lists, by name and in the site's own order.
     *
     * Kept for one reader: the rows a **guest** is given in place of the
     * subscriptions it has none of. Those are drawn as a screen is built, which
     * on a cold start is before the first request has come back -- the drawer
     * went up half a second before `/groups` was read -- so a list held only in
     * memory would leave the first launch of every run empty and fill itself
     * on the next.
     *
     * The site's words rather than the account's, like the sidebars above: one
     * file for all of them, since switching accounts does not change which
     * groups exist.
     */
    fun loadGroupNames(): List<String> {
        val text = prefs()?.getString(GROUP_NAMES, null) ?: return emptyList()
        return try {
            val stored = JSONArray(text)
            (0 until stored.length()).mapNotNull { stored.optString(it).ifEmpty { null } }
        } catch (e: Throwable) {
            emptyList()
        }
    }

    fun saveGroupNames(names: List<String>) {
        if (names.isEmpty()) return
        val stored = JSONArray()
        names.forEach { stored.put(it) }
        prefs()?.edit()?.putString(GROUP_NAMES, stored.toString())?.apply()
    }

    /**
     * Boost's own list of muted users, which is where blocking somebody goes
     * on Tildes.
     *
     * The site has no block of any kind -- an admin can ban an account and an
     * account can filter tags, and that is the whole of it -- while Boost has a
     * list of its own that its feeds already run every row against. So the one
     * that exists answers for the one that does not.
     *
     * **This is Boost's file rather than ours.** The list belongs to the app's
     * own preferences, under the key its Filters screen writes, so a name put
     * here shows up on that screen and one typed there is honoured here. The
     * file is named the way both `PreferenceManager`s name a default one, which
     * saves the extension a dependency on either.
     *
     * A `Set` is what Boost stores, so the order the names come back in is not
     * ours to decide and does not matter: everything reading it compares.
     */
    fun muted(): Set<String> =
        boostsOwn()?.getStringSet(MUTED_USERS, null)?.toSet().orEmpty()

    /**
     * Whether a name is on that list, compared the way Boost's own filter
     * compares it.
     *
     * The filter matches with `equalsIgnoreCase` while the screen that writes
     * the list dedupes with `contains`, so `Deimos` and `deimos` can both sit
     * in it and either one has to match. This asks the same question the filter
     * asks, so a name that hides somebody's topics hides their comments too
     * rather than nearly.
     *
     * Read per comment, which is cheap: `SharedPreferences` holds the file in
     * memory once it is loaded, and the list is a handful of names. It is read
     * rather than cached because the Filters screen writes it behind our back,
     * and a name typed there has to count on the next page.
     */
    fun isMuted(name: String?): Boolean = name != null && matches(name, muted())

    /** The comparison itself, kept separate so a test can reach it. */
    internal fun matches(name: String, list: Set<String>): Boolean =
        list.any { it.equals(name, ignoreCase = true) }

    /** Adds a name to that list, or takes it off. Answers what changed. */
    fun mute(name: String, muted: Boolean): Boolean = mute(MUTED_USERS, name, muted)

    /**
     * And the same for a group, which is a second list on the same screen and
     * behaves the same way: **Muted Communities**, read by the same filter one
     * loop earlier.
     *
     * Written as `~comp` rather than `comp`, since that is how the site spells
     * a group, how the app draws one, and so what somebody adding one by hand
     * would type. See `Lemmy.groupHandle`, which is the other end of it.
     */
    fun muteGroup(name: String, muted: Boolean): Boolean = mute(MUTED_GROUPS, name, muted)

    private fun mute(key: String, name: String, muted: Boolean): Boolean {
        val prefs = boostsOwn() ?: return false
        val current = prefs.getStringSet(key, null)?.toMutableSet() ?: HashSet()
        val changed = applyMute(current, name, muted)
        if (changed) prefs.edit().putStringSet(key, current).apply()
        return changed
    }

    /**
     * The change itself, over a plain set, so a test can reach it without a
     * preferences file.
     *
     * **Both halves compare the way [matches] does**, which they did not at
     * first, and the gap was a bug worth keeping the shape of. A name goes onto
     * this list from two places -- the interceptor, which writes whatever
     * spelling the site uses, and Boost's own Filters screen, which writes
     * whatever was typed. So the list can hold `deimos` while an unblock arrives
     * saying `Deimos`, and an exact `Set.remove` walks straight past it: the row
     * said unmuted, nothing came off, and the comments stayed folded.
     *
     * The add side had the mirror of it. An exact `add` beside a case-blind read
     * would put `Deimos` on a list already holding `deimos`, leaving one person
     * twice over and two rows to take off before they came back. That is the
     * duplicate Boost's own `j.a` can make, and there is no reason to make it
     * here as well.
     *
     * So a removal takes off **every** spelling of the name -- which repairs a
     * list that already has two -- and an addition is skipped where any spelling
     * is already there.
     */
    internal fun applyMute(current: MutableSet<String>, name: String, muted: Boolean): Boolean =
        if (muted) {
            if (matches(name, current)) false else current.add(name)
        } else {
            current.removeAll { it.equals(name, ignoreCase = true) }
        }

    /**
     * The third of Boost's filter lists, which is where Tildes' filtered tags
     * are kept while the app is looking at them.
     *
     * Boost's Filters screen has six lists and applies four. This is one of the
     * two it writes and never reads -- a post's flair, which nothing on Lemmy
     * fills -- so what it holds is the app's own copy of the site's list and
     * nothing here filters anything by it. Tildes does that itself, before the
     * HTML is built.
     *
     * Read back the way Boost's own dialog reads it, which is sorted with case
     * ignored. **A `Set` is what Boost stores**, so the order the site had is
     * not kept and cannot be: the list goes back up alphabetically whatever
     * order it arrived in, which changes nothing about what is filtered.
     */
    fun filteredTags(): List<String> =
        boostsOwn()?.getStringSet(FILTERED_TAGS, null)
            ?.sortedWith(java.lang.String.CASE_INSENSITIVE_ORDER)
            .orEmpty()

    /** Replaces it, which is the only edit the site's own form has. */
    fun setFilteredTags(tags: List<String>) {
        boostsOwn()?.edit()?.putStringSet(FILTERED_TAGS, tags.toSet())?.apply()
    }

    /**
     * Says when that list has been edited on Boost's own screen.
     *
     * The editor behind that row is Boost's, and it writes straight into the
     * preferences without telling anybody. So the preferences are what is
     * listened to, rather than the screen -- which also means a change made
     * anywhere else in the app arrives here too.
     *
     * **The listener is held here on purpose.** `SharedPreferences` keeps only
     * a weak reference to one, so a listener that nothing else holds is
     * collected at the next GC and stops firing with nothing said. That is the
     * whole reason this lives in a field rather than in the caller.
     *
     * Registered once per process. The screen it is set up from is built fresh
     * every time it is opened, and a second registration of the same listener
     * would be ignored anyway, but the field is what says which of those two is
     * meant.
     */
    fun watchFilteredTags(edited: () -> Unit) {
        if (tagWatcher != null) return
        val prefs = boostsOwn() ?: return
        val watcher = SharedPreferences.OnSharedPreferenceChangeListener { _, key ->
            if (key == FILTERED_TAGS) edited()
        }
        tagWatcher = watcher
        prefs.registerOnSharedPreferenceChangeListener(watcher)
    }

    private var tagWatcher: SharedPreferences.OnSharedPreferenceChangeListener? = null

    private var boostsOwn: SharedPreferences? = null
    private var lookedForBoosts = false

    @Synchronized
    private fun boostsOwn(): SharedPreferences? {
        if (!lookedForBoosts) {
            lookedForBoosts = true
            val app = application()
            boostsOwn = app?.getSharedPreferences(
                app.packageName + "_preferences", Context.MODE_PRIVATE,
            )
            if (boostsOwn == null) {
            }
        }
        return boostsOwn
    }

    /**
     * The key Boost files that list under. A preference key is a good thing to
     * name here for the reason it is a good fingerprint anchor: renaming one
     * loses whatever the user had set, so it does not move.
     */
    private const val MUTED_USERS = "pref_filter_username"
    private const val MUTED_GROUPS = "pref_filter_subreddit"
    private const val FILTERED_TAGS = "pref_filter_flair"

    /**
     * The order and time window a listing was last asked for.
     *
     * Tildes takes both while Lemmy has one field for the pair, so Boost only
     * ever sends whichever of the two was picked last and the other has to be
     * remembered here. Boost keeps its own sort per subscription, so without
     * this a restart would arrive with a period and no order, or the reverse.
     */
    fun loadListing(): Pair<String, String>? {
        val text = prefs()?.getString(LISTING, null) ?: return null
        return try {
            val stored = JSONObject(text)
            stored.getString("order") to stored.getString("period")
        } catch (e: Throwable) {
            null
        }
    }

    fun saveListing(order: String, period: String) {
        val stored = JSONObject().put("order", order).put("period", period)
        prefs()?.edit()?.putString(LISTING, stored.toString())?.apply()
    }

    /**
     * The window typed into **other period**, in the short form Tildes takes.
     *
     * Kept here rather than beside the sort because Boost has nowhere for it:
     * the sort a feed is on is one of a closed set of small ints, so the number
     * cannot ride inside it and rides beside it instead. Which sort means "the
     * one typed here" is the interceptor's business -- see its `CUSTOM_WINDOW`.
     *
     * One window for the app rather than one per feed, the way [LISTING] is one
     * order and one period. A feed remembers **that** it is on a custom window,
     * since that is the sort Boost stores against it, and this is what the
     * window is.
     */
    fun customWindow(): String? = prefs()?.getString(CUSTOM_WINDOW, null)

    fun setCustomWindow(shortForm: String) {
        prefs()?.edit()?.putString(CUSTOM_WINDOW, shortForm)?.apply()
    }

    /**
     * Whether the last account the app was pointed at was this one.
     *
     * Everything else scoped on the account is answered while a request is in
     * flight, and by then the host is known. The wording is not: it is chosen
     * as each screen attaches, and the first screen of a run attaches before
     * anything has been asked for. Without this the app would open on Lemmy's
     * words every time and correct itself one screen later.
     *
     * So the flag outlives the process, and the first `/api/v3` call of the
     * run overwrites it. It is only ever wrong across a restart that changed
     * accounts, which cannot happen: switching accounts is a thing you do in
     * the app, and it writes this on the way past.
     *
     * **An install that has never asked for anything answers yes**, which is
     * the one thing here that is a choice rather than a record. A freshly
     * patched app has made no `/api/v3` call, so there is nothing written
     * down and no account to read -- and this is a patch whose whole purpose
     * is tildes.net, so the honest default is the site it exists for. That is
     * what lets a guest see the front page before anybody signs in to
     * anything.
     *
     * It corrects itself on the way to a Lemmy account rather than after it.
     * Signing in builds a client of its own against the host you typed, so
     * the login call itself is an `/api/v3` request to that host, and this is
     * false by the time the screen behind it is rebuilt.
     */
    fun wasTildes(): Boolean = prefs()?.getBoolean(TILDES, true) ?: true

    fun rememberTildes(tildes: Boolean) {
        if (wasTildes() == tildes) return
        prefs()?.edit()?.putBoolean(TILDES, tildes)?.apply()
    }

    /**
     * Whether Boost has no account, so this end browses signed out too.
     *
     * Boost's account picker offers **Guest** as a row you can choose -- it is
     * Boost for Reddit's Anonymous, renamed -- and on Lemmy it does what it
     * says, the token being Boost's to withhold. Here the session is a cookie
     * in this jar rather than a token in Boost's, so picking it left the site
     * still knowing exactly who you were: a guest read its own front page,
     * filtered by its own tags, while the app called itself Guest.
     *
     * So the session is **parked** rather than dropped. Nothing is sent while
     * this is on, and nothing is written to disk either, so picking the account
     * again brings it back without the two-factor flow. That is the whole
     * reason this is a flag and not a `forget()`.
     *
     * On disk for the same reason [wasTildes] is: the first request of a run
     * goes out before any screen has been built, so the answer has to outlive
     * the process. **The default is no**, which is the opposite of that one:
     * an install that has never had an account has nothing parked, and reading
     * yes would leave a signed-in reader browsing logged out until something
     * built a drawer.
     */
    fun wasGuest(): Boolean = prefs()?.getBoolean(GUEST, false) ?: false

    fun rememberGuest(guest: Boolean) {
        if (wasGuest() == guest) return
        prefs()?.edit()?.putBoolean(GUEST, guest)?.apply()
    }

    /**
     * The topics you have opened, for Boost's History tab.
     *
     * Every one of these was parsed in full when you read it, so the tab costs
     * no requests at all. Refetching them would, and worse: an authenticated
     * fetch of a topic page is what Tildes records a visit from, so refreshing
     * a history list would mark every topic in it read and leave nothing new to
     * fold or highlight next time.
     *
     * A row is a listing row rather than a whole topic. The body is the bulk of
     * a topic and a listing only shows an excerpt of it, so it is kept short
     * here and the full text comes back when the topic is opened.
     */
    /**
     * One page of that list, in the order and window the screen asked for.
     *
     * The History screen is an ordinary feed to Boost, so it draws Tildes' own
     * five orders and the same windows under `From…`. Four of the five say
     * something about a topic a row already carries, so they are answered here
     * rather than left drawing rows that do nothing.
     *
     * **Activity is what you opened last**, which is the one place this parts
     * company with the site. Tildes means the newest comment on a topic by it,
     * and nothing here knows that -- a row is a topic as it looked when you saw
     * it. What a list of visits has instead is the visit, and it is the order
     * the tab has always come up in. **All activity** is the same answer for
     * the same reason: what separates those two upstream is which comments
     * count, and neither is on a stored row.
     *
     * **And the window is when you opened it**, for the same reason the other
     * way round. A listing's window is the age of what is in it, while what
     * this list records is the reading, so asking for the last day and getting
     * nothing back because the topics were old would be true and useless.
     *
     * [now] is passed in rather than read, so the window can be tested.
     */
    fun historyPage(
        rows: Collection<StoredTopic>,
        order: String,
        period: String,
        now: Long,
        skip: Int,
        take: Int,
    ): List<StoredTopic> {
        val inWindow = rows.filter { within(it.seenAt, period, now) }
        val sorted = when (order) {
            "new" -> inWindow.sortedByDescending { it.topic.postedAt ?: "" }
            "comments" -> inWindow.sortedByDescending { it.topic.numComments }
            "votes" -> inWindow.sortedByDescending { it.topic.numVotes }
            else -> inWindow.sortedByDescending { it.seenAt }
        }
        return sorted.drop(skip).take(take)
    }

    /**
     * Whether a visit falls inside one of Tildes' windows.
     *
     * The site writes them as `1h` or `30d`, off `SimpleHoursPeriod`, where
     * hours and days are separate units rather than a pair. Anything else,
     * `all` included, is the whole list.
     */
    private fun within(seenAt: Long, period: String, now: Long): Boolean {
        val found = WINDOW.find(period) ?: return true
        val hours = found.groupValues[1].toLong() *
            if (found.groupValues[2] == "d") 24 else 1
        return seenAt >= now - hours * 60 * 60 * 1000
    }

    /** `SimpleHoursPeriod`'s own short form, which is a count and a unit. */
    private val WINDOW = Regex("^(\\d+)([hd])$")

    fun loadHistory(): List<StoredTopic> {
        val text = prefs()?.getString(HISTORY, null) ?: return emptyList()
        return try {
            val stored = JSONArray(text)
            (0 until stored.length()).mapNotNull { i ->
                val row = stored.optJSONObject(i) ?: return@mapNotNull null
                StoredTopic(
                    seenAt = row.optLong("seen"),
                    topic = Tildes.Topic(
                        id36 = row.optString("id"),
                        title = row.optString("title"),
                        group = row.optString("group"),
                        author = row.optString("by").ifEmpty { null },
                        postedAt = row.optString("at").ifEmpty { null },
                        numComments = row.optInt("comments"),
                        numVotes = row.optInt("votes"),
                        tags = row.optJSONArray("tags")?.let { tags ->
                            (0 until tags.length()).map { tags.optString(it) }
                        }.orEmpty(),
                        linkUrl = row.optString("url").ifEmpty { null },
                        bodyHtml = row.optString("body").ifEmpty { null },
                        // Stripped on the way in as well as on the way out,
                        // since a row stored before [Tildes.withoutFragment]
                        // existed outlives the install that wrote it.
                        path = Tildes.withoutFragment(row.optString("path")),
                        voted = row.optBoolean("voted"),
                        bookmarked = row.optBoolean("saved"),
                        ignored = row.optBoolean("ignored"),
                        locked = row.optBoolean("locked"),
                        // Nothing reaches this list without having been opened,
                        // and opening a topic reads its own page, which is the
                        // one place every tag is drawn. So a row read back is
                        // as complete as it was when it was written, and a
                        // listing scrolled past afterwards cannot cut it down.
                        // The edit controls are not stored with it, since what
                        // Tildes allows on a topic runs out with time.
                        fromTopicPage = true,
                    ),
                )
            }.filter { it.topic.id36.isNotEmpty() }
        } catch (e: Throwable) {
            emptyList()
        }
    }

    fun saveHistory(rows: List<StoredTopic>) {
        val stored = JSONArray()
        rows.forEach { (seenAt, t) ->
            stored.put(
                JSONObject()
                    .put("id", t.id36)
                    .put("seen", seenAt)
                    .put("title", t.title)
                    .put("group", t.group)
                    .put("by", t.author ?: "")
                    .put("at", t.postedAt ?: "")
                    .put("comments", t.numComments)
                    .put("votes", t.numVotes)
                    .put("tags", JSONArray().also { a -> t.tags.forEach { a.put(it) } })
                    .put("url", t.linkUrl ?: "")
                    .put("body", t.bodyHtml?.take(BODY_LIMIT) ?: "")
                    .put("path", t.path)
                    .put("voted", t.voted)
                    .put("saved", t.bookmarked)
                    .put("ignored", t.ignored)
                    .put("locked", t.locked)
            )
        }
        prefs()?.edit()?.putString(HISTORY, stored.toString())?.apply()
    }

    /** A topic as it was when you last read it, and when that was. */
    data class StoredTopic(val seenAt: Long, val topic: Tildes.Topic)

    /**
     * The rest of a draft, beside the body Boost already files.
     *
     * Boost's own drafts table is four columns -- Date, Parent, Text and User
     * -- and the composer writes into it with the body and nothing else, so a
     * draft picked back up is a body in an empty screen. A topic here is a
     * title, a link, a set of tags and a group, and all four of those were on
     * the screen when the draft was taken.
     *
     * So the row stays Boost's and this rides beside it, keyed on the same
     * text the row is deduplicated on. Nothing here replaces what Boost stores:
     * a draft written before this existed, or by a build without it, comes back
     * exactly as it always did.
     */
    data class DraftFields(
        val title: String,
        val link: String,
        val tags: String,
        val group: String,
        /**
         * The body, where Boost's own row is not carrying it.
         *
         * Boost will not write a row with an empty text column, so a link topic
         * -- a title, a URL and tags with nothing typed under them, which is
         * most of a Tildes front page -- files its title in that column instead
         * and its real body here. Which is usually the empty string, and the
         * point is that it goes back in as one.
         *
         * `null` means the row's own text is the body, as it is for every draft
         * with something typed in it and for every draft written before this
         * existed.
         */
        val body: String?,
        /** The start of the row's text, so a key collision reads as no draft. */
        val head: String,
        /** When it was written, which is what the oldest ones are dropped by. */
        val at: Long,
    ) {
        /** Whether there is anything here worth putting back. */
        val empty: Boolean
            get() = title.isEmpty() && link.isEmpty() && tags.isEmpty() &&
                group.isEmpty() && body == null
    }

    /**
     * How many of these are kept. Boost's own table is unbounded and lives in
     * SQLite, while this is a preferences file the whole app loads at startup,
     * so it holds the recent ones and lets the rest fall back to Boost's own
     * behaviour rather than growing without a limit.
     */
    private const val DRAFT_LIMIT = 40

    /** How much of the body is kept to tell two drafts apart. */
    private const val DRAFT_HEAD = 60

    /**
     * What a draft is filed under: the account, and the text Boost's own row
     * carries, which is the body except where [DraftFields.body] says otherwise.
     *
     * That text is not the key itself, since it is a whole post and this file
     * is read into memory at startup. A length and a hash of it is, which
     * cannot collide by accident often enough to matter and cannot be wrong
     * when it does: [DraftFields.head] is compared on the way out, so a
     * collision answers with nothing rather than with somebody else's title.
     *
     * The account is in the key because Boost deduplicates a draft per user,
     * so two accounts can each hold a draft with the same body.
     */
    internal fun draftKey(user: String, text: String): String =
        user + ":" + text.length + ":" + text.hashCode()

    /** The start of a body, as it is stored and as it is compared. */
    internal fun draftHead(text: String): String = text.take(DRAFT_HEAD)

    /**
     * What Boost's own row carries: the body, or the first thing typed [beside]
     * it where there is no body.
     *
     * The table has one text column and the writer returns early when it would
     * be empty, so a Tildes link topic -- a title and a URL with nothing under
     * them -- had no row to be a draft in. The title stands in for it, which is
     * also what the picker draws and what a topic is known by, and the link and
     * the tags are there for a topic whose title has not been typed yet.
     *
     * Null where nothing has been typed anywhere, which is a screen with nothing
     * to keep. Boost's own discard is right there.
     *
     * The rule rather than the reading, so a test can work it without a screen.
     */
    internal fun draftText(body: String, beside: List<String>): String? =
        if (body.isNotEmpty()) body else beside.firstOrNull { it.isNotEmpty() }

    fun saveDraft(user: String, text: String, fields: DraftFields) {
        val prefs = prefs() ?: return
        val stored = readDrafts()
        stored.put(
            draftKey(user, text),
            JSONObject()
                .put("title", fields.title)
                .put("link", fields.link)
                .put("tags", fields.tags)
                .put("group", fields.group)
                .put("head", draftHead(text))
                .put("at", fields.at)
                // Only where the row is standing in for the body, so a draft
                // that carries its own comes back through the shape it always
                // did rather than through a second copy of itself.
                .apply { fields.body?.let { put("body", it) } },
        )
        prefs.edit().putString(DRAFTS, prune(stored).toString()).apply()
    }

    fun draft(user: String, text: String): DraftFields? {
        val row = readDrafts().optJSONObject(draftKey(user, text)) ?: return null
        if (row.optString("head") != draftHead(text)) {
            return null
        }
        return DraftFields(
            title = row.optString("title"),
            link = row.optString("link"),
            tags = row.optString("tags"),
            group = row.optString("group"),
            body = if (row.has("body")) row.optString("body") else null,
            head = row.optString("head"),
            at = row.optLong("at"),
        )
    }

    private fun readDrafts(): JSONObject {
        val text = prefs()?.getString(DRAFTS, null) ?: return JSONObject()
        return try {
            JSONObject(text)
        } catch (e: Throwable) {
            JSONObject()
        }
    }

    /**
     * Drops the oldest once there are more than [DRAFT_LIMIT] of them.
     *
     * Boost's own rows are deleted from the picker one at a time and wiped on
     * sign-out, and neither of those is visible from here, so this is the only
     * thing keeping the file from growing for as long as the install lasts. A
     * dropped one costs a title rather than a draft: the row is still Boost's
     * and still comes back as its body.
     *
     * Pure, and internal, so a test can reach it without a preferences file.
     */
    internal fun prune(stored: JSONObject): JSONObject {
        if (stored.length() <= DRAFT_LIMIT) return stored
        val newest = stored.keys().asSequence().toList()
            .sortedByDescending { stored.optJSONObject(it)?.optLong("at") ?: 0L }
            .take(DRAFT_LIMIT)
            .toSet()
        val kept = JSONObject()
        newest.forEach { kept.put(it, stored.get(it)) }
        return kept
    }

    private fun forget() {
        lastWritten = null
        prefs()?.edit()?.remove(KEY)?.apply()
    }

    private fun serialise(token: String): String {
        val cookies = JSONObject()
        // One read of the field, then iterate that map. Another request thread
        // can swap in a new one at any point, and Tildes swaps rather than
        // edits in place so whichever map is in hand stays whole.
        Tildes.cookies.forEach { (name, value) -> cookies.put(name, value) }
        return JSONObject()
            .put("token", token)
            .put("username", Tildes.username ?: "")
            .put("csrf", Tildes.csrfToken ?: "")
            .put("cookies", cookies)
            .toString()
    }
}
