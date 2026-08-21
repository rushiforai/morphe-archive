package app.morphe.extension.boostforlemmy.tildes

import org.json.JSONArray
import org.json.JSONObject
import org.jsoup.Jsoup
import org.jsoup.nodes.Element
import org.jsoup.nodes.Node
import org.jsoup.nodes.TextNode
import java.util.zip.CRC32

/**
 * Dresses Tildes objects up as Lemmy v3 API objects.
 *
 * Boost reads these with Gson, so unknown fields are ignored and missing ones
 * become null or zero. The names below are therefore load-bearing.
 */
object Lemmy {

    const val VERSION = "0.19.11"
    private const val INSTANCE_ID = 1

    /* ---------------------------------------------------------------- */
    /* Identifiers                                                      */
    /* ---------------------------------------------------------------- */

    /**
     * Tildes' base-36 ids decode to the integers Lemmy wants, so topics and
     * comments round-trip with no stored mapping.
     */
    fun id36ToInt(id36: String): Int = id36.toLong(36).toInt()

    fun intToId36(id: Int): String = id.toLong().toString(36)

    /**
     * Groups and users have no numeric id upstream. A CRC32 of the name is
     * stable across restarts, which matters because Boost caches ids.
     */
    private fun stableId(kind: String, name: String): Int {
        val crc = CRC32()
        crc.update("$kind:$name".toByteArray())
        return (crc.value and 0x7fffffffL).toInt()
    }

    private val groupNames = HashMap<Int, String>()
    private val userNames = HashMap<Int, String>()

    fun groupId(name: String): Int =
        stableId("group", name).also { synchronized(groupNames) { groupNames[it] = name } }

    fun groupName(id: Int): String? = synchronized(groupNames) { groupNames[id] }

    fun userId(name: String): Int =
        stableId("user", name).also { synchronized(userNames) { userNames[it] = name } }

    fun userName(id: Int): String? = synchronized(userNames) { userNames[id] }

    /**
     * A person as one conversation with them rather than as themselves.
     *
     * Tildes files private messages under a subject and lets you hold several
     * threads with the same person, while Lemmy's are flat between two people.
     * Boost keeps one inbox row per person id it is handed -- its inbox model
     * drops a message whose person already has a row -- so a conversation only
     * gets a row of its own if it arrives as a person of its own.
     *
     * The name stays the real one, so a profile opened off the row resolves and
     * a reply still knows who it is for. Only the id is synthetic, and it
     * cannot collide with a real account's: a Tildes username is letters,
     * digits, underscores and hyphens, so no name contains the `#` this puts
     * between the two halves.
     */
    fun conversationPersonId(name: String, id36: String): Int =
        stableId("user", "$name#$id36").also { synchronized(userNames) { userNames[it] = name } }

    /* ---------------------------------------------------------------- */
    /* HTML -> Markdown                                                 */
    /* ---------------------------------------------------------------- */

    /**
     * Tildes serves rendered HTML, Lemmy stores Markdown. Only the tags Tildes
     * actually emits are handled, which is why this fits in one function
     * instead of pulling in a conversion library.
     */
    fun htmlToMarkdown(html: String?): String {
        if (html.isNullOrBlank()) return ""
        val sb = StringBuilder()
        Jsoup.parseBodyFragment(html, Tildes.BASE).body().childNodes().forEach { render(it, sb, "") }
        return sb.toString().replace(Regex("\n{3,}"), "\n\n").trim()
    }

    private fun render(node: Node, sb: StringBuilder, listPrefix: String) {
        when (node) {
            is TextNode -> sb.append(node.text())
            is Element -> when (node.tagName()) {
                "p" -> { renderChildren(node, sb, listPrefix); sb.append("\n\n") }
                "br" -> sb.append("  \n")
                "strong", "b" -> wrap(node, sb, "**", listPrefix)
                "em", "i" -> wrap(node, sb, "*", listPrefix)
                "del", "s" -> wrap(node, sb, "~~", listPrefix)
                "code" ->
                    if (node.parent()?.tagName() == "pre") renderChildren(node, sb, listPrefix)
                    else sb.append('`').append(node.text()).append('`')
                "pre" -> sb.append("\n```\n").append(node.text().trimEnd()).append("\n```\n\n")
                "a" -> {
                    val text = StringBuilder().also { renderChildren(node, it, listPrefix) }.toString()
                    val href = node.attr("href").let {
                        if (it.startsWith("/")) Tildes.BASE + it else it
                    }
                    if (text.isNotBlank()) sb.append('[').append(text).append("](").append(href).append(')')
                }
                "img" -> sb.append("![](").append(node.attr("src")).append(')')
                "blockquote" -> {
                    val inner = StringBuilder().also { renderChildren(node, it, listPrefix) }
                    inner.toString().trim().lines().forEach { sb.append("> ").append(it).append('\n') }
                    sb.append('\n')
                }
                "ul", "ol" -> {
                    sb.append('\n')
                    var i = 1
                    // A plain loop, not .filter {}: jsoup's Elements has its own
                    // filter(NodeFilter), which shadows the Kotlin extension.
                    for (li in node.children()) {
                        if (li.tagName() != "li") continue
                        val marker = if (node.tagName() == "ol") "${i++}. " else "- "
                        val inner = StringBuilder().also { renderChildren(li, it, "$listPrefix  ") }
                        val lines = inner.toString().trim().lines()
                        lines.forEachIndexed { idx, line ->
                            sb.append(listPrefix)
                                .append(if (idx == 0) marker else "  ")
                                .append(line).append('\n')
                        }
                    }
                    sb.append('\n')
                }
                "h1", "h2", "h3", "h4", "h5", "h6" -> {
                    val level = node.tagName().substring(1).toInt()
                    sb.append('\n').append("#".repeat(level)).append(' ')
                    renderChildren(node, sb, listPrefix)
                    sb.append("\n\n")
                }
                "details" -> {
                    val summary = node.selectFirst("summary")?.text() ?: "spoiler"
                    val clone = node.clone().also { it.select("summary").remove() }
                    sb.append("\n::: spoiler ").append(summary).append('\n')
                    renderChildren(clone, sb, listPrefix)
                    sb.append("\n:::\n\n")
                }
                "hr" -> sb.append("\n---\n\n")
                else -> renderChildren(node, sb, listPrefix)
            }
        }
    }

    private fun renderChildren(el: Element, sb: StringBuilder, listPrefix: String) {
        el.childNodes().forEach { render(it, sb, listPrefix) }
    }

    private fun wrap(el: Element, sb: StringBuilder, token: String, listPrefix: String) {
        val inner = StringBuilder().also { renderChildren(el, it, listPrefix) }.toString()
        if (inner.isNotBlank()) sb.append(token).append(inner).append(token) else sb.append(inner)
    }

    /* ---------------------------------------------------------------- */
    /* Views                                                            */
    /* ---------------------------------------------------------------- */

    private fun ts(v: String?): String = v ?: "1970-01-01T00:00:00Z"

    /**
     * [id] is for the inbox alone, where a person stands for one conversation
     * rather than for themselves. See [conversationPersonId].
     */
    fun person(
        username: String?,
        registered: String? = null,
        bioHtml: String? = null,
        id: Int? = null,
    ): JSONObject {
        val name = username ?: "[deleted]"
        val bio = htmlToMarkdown(bioHtml)
        return JSONObject()
            .put("id", id ?: userId(name))
            .put("name", name)
            .put("banned", false)
            // Only a profile page carries the registration date, so everywhere
            // else this is the epoch rather than a guess.
            .put("published", ts(registered))
            .apply { if (bio.isNotEmpty()) put("bio", bio) }
            .put("actor_id", "${Tildes.BASE}/user/$name")
            .put("local", true)
            .put("deleted", username == null)
            .put("bot_account", false)
            .put("instance_id", INSTANCE_ID)
    }

    /**
     * `title` is what Boost puts in the toolbar, by way of the display name on
     * its own subscription model, so it is worth overriding for a community
     * that is not a Tildes group at all.
     */
    fun community(
        name: String,
        description: String? = null,
        title: String? = null,
    ): JSONObject =
        JSONObject()
            .put("id", groupId(name))
            .put("name", name)
            .put("title", title ?: "~$name")
            .put("description", description)
            .put("removed", false)
            .put("published", ts(null))
            .put("deleted", false)
            .put("nsfw", false)
            .put("actor_id", "${Tildes.BASE}/~$name")
            .put("local", true)
            .put("hidden", false)
            .put("posting_restricted_to_mods", false)
            .put("instance_id", INSTANCE_ID)
            .put("visibility", "Public")

    /**
     * A group as Tildes spells it, out of the handle Boost builds.
     *
     * Boost writes a community as `name@instance` wherever it is not sure the
     * community is local, and it never is sure: the host comes off the actor
     * URL, which every community has. So the one thing in the app that names a
     * group for comparing answered `comp@tildes.net` where the site, and every
     * other line in the app, says `~comp`.
     *
     * That is what **Muted Communities** compares against, so it is why a group
     * typed in there was never matched -- the same gap the muted users list
     * had.
     *
     * The tilde goes back on, since it is how Tildes writes a group everywhere
     * and so is what somebody would type. A name that is not a plain group --
     * the URL a tag listing arrives under is one -- keeps whatever it had,
     * because a tilde in front of that would say something untrue.
     */
    fun groupHandle(handle: String): String? {
        val bare = handle.removeSuffix("@${Tildes.BASE.substringAfter("://")}")
        if (bare == handle || bare.isEmpty()) return null
        return if (PLAIN_GROUP.matches(bare)) "~$bare" else bare
    }

    /** A group name and nothing else: no path, no query, no tilde yet. */
    private val PLAIN_GROUP = Regex("[A-Za-z0-9_.]+")

    /**
     * The groups a reader with no account is given, out of every group the site
     * lists.
     *
     * Tildes has no way to subscribe to anything without an account, so a
     * guest's list of subscriptions is empty by the site's own rules rather
     * than by accident -- and what the site gives instead is every group.
     * Signed out, its front page is all of them and `/groups` lists all of
     * them, and its own answer to what a new account should be subscribed to is
     * the same list minus one:
     *
     * ```python
     * for group in all_groups:
     *     if group.path == "test":
     *         continue
     *     request.db_session.add(GroupSubscription(user, group))
     * ```
     *
     * So `~test` is the one left out here too, the site's sandbox group being
     * the site's to leave out. Everything else keeps the order it was read in,
     * which is the site's own.
     */
    fun guestGroups(names: List<String>): List<String> = names.filter { it != SANDBOX_GROUP }

    /** The group Tildes keeps out of a new account's subscriptions. */
    private const val SANDBOX_GROUP = "test"

    /**
     * A group's sidebar as the markdown Lemmy keeps a community's in.
     *
     * Lemmy has one field for the whole panel and stores it as markdown, which
     * is what makes this a translation rather than a screen to build: the
     * description, the free text and the link lists all go into
     * `community.description` and Boost renders them where it renders a
     * Lemmy community's sidebar.
     *
     * The headings come out as `##` because they are headings on the site too,
     * and the links keep Tildes' own words. A subgroup's link is a group page,
     * so it lands where any other tildes.net link the app draws lands.
     *
     * The short description goes first because one other view reads the same
     * field: the group screen's collapsing header draws it at two lines and
     * ellipsizes, so whatever opens this is what that header says about the
     * group. Leading with the line Tildes leads with keeps that header reading
     * as it did when the field held nothing else.
     *
     * **One row is added, and only to the list of subgroups.** Tildes serves a
     * parent's topics and its children's together at `?all_subgroups=true`, and
     * the only thing on the site linking there is a line above the listing that
     * Boost has nowhere to draw. So the row goes in the panel that lists the
     * children, which is the one place already about them -- see
     * [SubgroupListing]. A group with no subgroups has no such list and gets
     * nothing, which is 43 of the 51: 19 subgroups sit under 8 parents.
     *
     * The words are the site's own, off that line's own link.
     *
     * The `group` is what the row needs and the panel itself never says, since
     * a sidebar is about a group rather than naming it. **It is also what says
     * whether to draw the row at all**: signed out, Tildes puts every subgroup
     * in the parent's page already, so the row would open the listing it was
     * pressed from. The caller passes null there, and the site hides its own
     * line for the same reason.
     */
    fun groupSidebar(sidebar: Tildes.GroupSidebar, group: String? = null): String = buildString {
        sidebar.shortDescription?.let { append(it).append("\n\n") }
        htmlToMarkdown(sidebar.textHtml).let { if (it.isNotEmpty()) append(it).append("\n\n") }
        sidebar.sections.forEach { section ->
            append("## ").append(section.heading).append("\n\n")
            section.links.forEach {
                append("- [").append(it.text).append("](").append(it.url).append(")\n")
            }
            if (group != null && listsSubgroupsOf(section, group)) {
                append("- [").append(ALL_SUBGROUPS_ROW).append("](")
                    .append(subgroupUrl(group)).append(")\n")
            }
            append('\n')
        }
    }.trim()

    /**
     * Whether a section is the list of a group's subgroups.
     *
     * By where the links go rather than by the heading over them, which is the
     * reading [Tildes.parseGroupSidebar] takes for the same reason: a heading
     * is copy and a path is a route. A subgroup's page is the parent's name and
     * a dot, so one link like that is the whole test -- no other list on that
     * panel points inside the group at all.
     */
    private fun listsSubgroupsOf(section: Tildes.GroupSection, group: String): Boolean =
        section.links.any {
            it.url.startsWith(Tildes.BASE + "/~" + group + ".") ||
                it.url.startsWith(Tildes.BASE + "/%7E" + group + ".")
        }

    /**
     * What that row reads, which is what the site's own link reads.
     *
     * Tildes draws *Includes topics from subscribed subgroups.* over a group's
     * listing with **View with all subgroups** after it, and the sentence is
     * the half this has nowhere to put. The link is the half that does
     * something, and it says enough on its own under a list of the subgroups
     * it means.
     */
    private const val ALL_SUBGROUPS_ROW = "View with all subgroups"

    /**
     * `sidebar` is the whole panel, from [groupSidebar], where a group's own
     * `description` is the one line a listing row draws. Lemmy has one field
     * for both, so the two are told apart by which call is being answered:
     * only a group's own screen asks for the panel.
     */
    fun communityView(
        g: Tildes.Group,
        subscribers: Int = 0,
        title: String? = null,
        sidebar: String? = null,
    ): JSONObject =
        JSONObject()
            .put("community", community(g.name, sidebar ?: g.description, title))
            .put("subscribed", if (g.subscribed) "Subscribed" else "NotSubscribed")
            .put("blocked", false)
            .put("banned_from_community", false)
            .put(
                "counts",
                JSONObject()
                    .put("community_id", groupId(g.name))
                    .put("subscribers", subscribers)
                    .put("subscribers_local", subscribers)
                    // Tildes publishes daily activity rather than totals.
                    .put("posts", g.dailyTopics)
                    .put("comments", g.dailyComments)
                    .put("published", ts(null))
                    .put("users_active_day", 0)
                    .put("users_active_week", 0)
                    .put("users_active_month", 0)
                    .put("users_active_half_year", 0)
            )

    /**
     * A topic's tags, as the line that goes under its body.
     *
     * Lemmy has no field for them and Boost draws none, so they ride on the
     * text as code spans, which is the one place a topic can carry something
     * the app will render. The composer's own Tags field is where they are
     * written; this is only how they read.
     *
     * Built here rather than inline because the edit route has to take it off
     * again: Boost hands the body it drew straight back on a `PUT`, so a topic
     * edited through the app would otherwise have its own tags written into its
     * markdown, one copy per edit.
     *
     * **With a group, each span is a link**, to the same listing tildes.net
     * sends a tag to. Boost renders a code span inside a link as both -- the
     * span is what it looks like and the link is what it does -- so the line
     * reads exactly as it did before and now opens something. The group is what
     * says which listing, and without one this is the plain line it always was:
     * [withoutTagLine] has to rebuild the line character for character to take
     * it off again, so both ends are asked the same question.
     */
    /**
     * Whether a topic is one Tildes marks not safe for work.
     *
     * The site has no flag for it. `nsfw` is an ordinary tag, and what makes it
     * special is that Tildes calls it an *important* tag: those are drawn in
     * every listing and styled bold and red, where the rest are hidden unless
     * you ask for them. Sub-tags count the same way and are common in practice
     * -- `nsfw.lyrics`, `nsfw.gore`, `nsfw.blood` are all on the site's own
     * `?tag=nsfw` listing -- so the prefix is matched the way `important_tags`
     * matches it.
     *
     * Lemmy has a boolean for this, and Boost draws a badge off it, so the tag
     * ends up meaning what the site means by it.
     */
    fun isNsfw(tags: List<String>): Boolean = hasTag(tags, NSFW)

    /**
     * Tildes' own `Topic.has_tag`: the tag itself, or anything filed under it.
     *
     * Both of the site's two global important tags are matched this way, and
     * sub-tags of them are common in practice.
     */
    private fun hasTag(tags: List<String>, tag: String): Boolean =
        tags.any { it == tag || it.startsWith("$tag.") }

    /** Tildes' own tag, which is also what Lemmy's `nsfw` boolean maps onto. */
    const val NSFW = "nsfw"

    /**
     * Whether Tildes counts a topic as a spoiler, which is the site's other
     * global important tag and the one Lemmy has no field for at all.
     */
    fun isSpoiler(tags: List<String>): Boolean = hasTag(tags, SPOILER)

    /** The tag itself, which is only ever a tag: there is no flag to map it to. */
    const val SPOILER = "spoiler"

    /**
     * The tags a listing row still has to draw, once the badges have spoken.
     *
     * Boost draws **NSFW** and **SPOILER** on a row already, off the two flags
     * the interceptor fills in, so a row that also lists `nsfw` among its tags
     * is saying the same thing twice in the same inch of screen.
     *
     * **Only the tags themselves come off.** A sub-tag says what the badge
     * cannot -- `nsfw.gore` is a warning of a particular kind, and a reader who
     * wants that is exactly the reader the badge is too blunt for -- so it
     * stays. The badge covers it either way, since both flags match a family
     * rather than a word.
     *
     * A topic's own screen keeps all of them. It has room, and its pills are
     * the way to the tag's listing, which is worth having for these two as much
     * as for any other tag.
     */
    fun tagsBesideBadges(tags: List<String>): List<String> =
        tags.filterNot { it == NSFW || it == SPOILER }

    /**
     * The same tags with `nsfw` added or taken away, for the NSFW chip in the
     * composer and the Mark NSFW row in a topic's menu. Both are booleans in
     * Boost and a tag on Tildes.
     *
     * Taking it away drops sub-tags with it, since a topic tagged `nsfw.gore`
     * reads as NSFW and would come straight back otherwise.
     */
    fun withNsfw(tags: List<String>, nsfw: Boolean): List<String> = when {
        nsfw && !isNsfw(tags) -> tags + NSFW
        !nsfw -> tags.filterNot { it == NSFW || it.startsWith("$NSFW.") }
        else -> tags
    }

    fun tagLine(tags: List<String>, group: String? = null): String =
        tags.joinToString(" ") {
            val span = "`" + it + "`"
            if (group == null) span else "[" + span + "](" + tagUrl(group, it) + ")"
        }

    /**
     * A tag as Tildes spells it in a URL.
     *
     * The site stores a tag as an ltree label and draws it with the underscores
     * read back as spaces, so `three cheers` is `three_cheers` in every link it
     * writes. The parser takes the drawn text, which means the underscore form
     * only exists here. Nothing is lost either way round: a drawn tag can never
     * contain an underscore, since the site would have drawn it as a space.
     */
    fun tagSlug(tag: String): String = tag.replace(' ', '_')

    /** And back, for a tag read off a URL rather than off a page. */
    fun tagText(slug: String): String = slug.replace('_', ' ')

    /**
     * Where Tildes sends a tag: its own group listing, filtered.
     *
     * This is the link the site writes under a topic, give or take the one
     * character below. Which is the point of building it rather than inventing
     * one: the app takes it in [TildesInterceptor.openTag] and opens the
     * listing inside, and anything that does not -- an older build, a tag drawn
     * in a feed row's excerpt, a link somebody pasted into a comment -- hands a
     * real page to a browser instead of a tap that does nothing.
     *
     * **The `~` is the character**, which it was not for a while. Boost used
     * to rewrite `~text~` into `<sub>text</sub>` over the whole body before it
     * parsed any of it, so two tags on one topic put two tildes on one line and
     * the second closed what the first opened -- one URL's tail and the next
     * one's head went inside the tag. That was worked around here by writing
     * `%7E`, which Tildes serves as the same page.
     *
     * The rewrite is off on this account now, at
     * [TildesInterceptor.scriptMarkup], since Tildes has no syntax for `~text~`
     * to begin with. So the workaround has nothing left to work around, and the
     * link reads the way the site writes it -- which is what a long press
     * copies, what a share sends, and what a browser is handed when a tap falls
     * through. Both spellings still read back, so a link an older build wrote
     * still opens.
     *
     * Scoped to the group when there is one, because that is what the site
     * writes under a topic. A tag means something inside a group and something
     * else outside it, and the same choice on the site is a second link rather
     * than the same one.
     *
     * **A null group is the whole site**, which Tildes serves at `/?tag=` and
     * describes as *Showing only topics with the tag "music"* over the front
     * page. Nothing under a topic links there -- it is the scope you reach by
     * asking for a tag rather than by pressing one.
     */
    fun tagUrl(group: String?, tag: String): String =
        if (group == null) Tildes.BASE + "/?tag=" + tagSlug(tag)
        else Tildes.BASE + "/" + TILDE + group + "?tag=" + tagSlug(tag)

    /**
     * `~`, as it goes into a link the app is going to render. See [tagUrl] for
     * why this was the encoded form for a while.
     */
    private const val TILDE = "~"

    /**
     * A tag listing, as the tag it filters by and the group it is scoped to.
     *
     * **A null group is the whole site.** Tildes filters by tag at both
     * scopes -- `/~group?tag=x` and `/?tag=x` -- and calls the second one Home
     * with a line over it reading *Showing only topics with the tag "x"*. The
     * site links to the first from every tag it draws and to the second from
     * nowhere, which is why one is reached by pressing a tag and the other by
     * asking for one.
     */
    data class TagListing(val group: String?, val tag: String) {
        /**
         * What Boost carries this as, which is the name of a community it will
         * ask for by name and the words drawn over the tab.
         *
         * Tildes' own URL for the listing, minus the host. It reads as what the
         * screen is showing, it cannot collide with a group -- no group name
         * holds a `?` -- and it survives everything Boost does to a community
         * name on the way to a request, which is a split on `@` and nothing
         * else.
         *
         * The site-wide one is the same URL with nothing in front of the `?`,
         * so it round-trips through [tagListing] the way the scoped one does.
         */
        val name: String get() =
            if (group == null) "?tag=" + tagSlug(tag)
            else "~" + group + "?tag=" + tagSlug(tag)

        /** And the path to fetch, which is that name with the host back on. */
        val path: String get() = if (group == null) "/" else "/~" + group

        /**
         * What the screen over it says, which is the tag and the scope.
         *
         * Not the site's own sentence. Tildes writes *Showing only topics with
         * the tag "music"* on a line above the listing, where this has one
         * toolbar to say it in, so it says the same two things in the space a
         * title has.
         */
        val title: String get() =
            if (group == null) tag + " in every group" else tag + " in ~" + group
    }

    /**
     * Reads a tag listing back out of the community name Boost is carrying.
     *
     * The leading `~` is optional because the interceptor takes it off every
     * community name it is handed, so this is asked both ways round.
     */
    fun tagListing(name: String?): TagListing? {
        if (name == null) return null
        val found = TAG_NAME.find(name) ?: return null
        return TagListing(
            found.groupValues[1].ifEmpty { null },
            tagText(found.groupValues[2]),
        )
    }

    /** The same, off the link a topic's body carries. */
    fun tagListingFor(url: String?): TagListing? {
        if (url == null) return null
        val found = TAG_URL.find(url) ?: return null
        return TagListing(
            found.groupValues[1].ifEmpty { null },
            tagText(found.groupValues[2]),
        )
    }

    /**
     * A group and a tag, in the shapes both of them actually take.
     *
     * A group is lowercase letters, digits and underscores, with a dot between
     * a group and its subgroup. A tag is an ltree label, which is the same set
     * without the dot meaning anything: `nsfw.gore` is a tag filed under
     * `nsfw`, and it is one tag rather than two.
     *
     * The group is optional, and absent it is the whole site. Nothing else can
     * arrive that way: a community name with no group and no `?tag=` fails the
     * rest of the pattern.
     */
    private const val TAGGED = """\?tag=([A-Za-z0-9_.]+)$"""
    private const val GROUP = """([A-Za-z0-9_.]+)"""

    private val TAG_NAME = Regex("""^(?:~?""" + GROUP + """)?""" + TAGGED)

    /**
     * Both spellings of the `~`, since [tagUrl] writes one and a person
     * pasting a link out of a browser writes the other. Either is the same
     * page, so either opens here.
     */
    private val TAG_URL = Regex(
        "^" + Regex.escape(Tildes.BASE) + """/(?:(?:~|%7E)""" + GROUP + """)?""" + TAGGED
    )

    /**
     * A group's topics with its subgroups' among them.
     *
     * Tildes files a subgroup **inside** its parent rather than beside it, and
     * what a parent's page draws depends on who is asking: signed in it is the
     * group's own topics plus the subgroups **you subscribe to**, and signed
     * out it is every subgroup there is. `?all_subgroups=true` is the site's
     * own way to ask for the second while signed in, and it is a filter over a
     * page the way a tag is rather than a page of its own.
     *
     * So this only ever means something for an account. `~sports` has seven
     * children and a reader subscribed to none of them sees a group that looks
     * dead, which is the case the flag is for.
     *
     * Which is why it rides exactly the way [TagListing] does: the community
     * name Boost carries is tildes.net's own URL for the listing minus the
     * host, so nothing has to be remembered between the tap and the request.
     *
     * **There is no site-wide half.** Every group sits under the front page
     * already, so the flag has nothing to add there, and Tildes takes it on a
     * group page only.
     */
    data class SubgroupListing(val group: String) {
        /** What Boost carries this as, which is that URL minus the host. */
        val name: String get() = "~" + group + "?" + ALL_SUBGROUPS

        /** And the page to fetch, which is the group's own. */
        val path: String get() = "/~" + group

        /**
         * What the screen over it says, which is the group and the scope --
         * the shape [TagListing.title] takes, since the two are the same kind
         * of thing: a listing that is not a community.
         */
        val title: String get() = "~" + group + " and its subgroups"
    }

    /**
     * Where Tildes serves that, which is the group's own page with the flag on.
     *
     * The `~` is the character, for the reason [tagUrl] gives, and both
     * spellings read back, so a link written here, a link an older build wrote
     * and a link pasted out of a browser are all the same listing.
     */
    fun subgroupUrl(group: String): String =
        Tildes.BASE + "/" + TILDE + group + "?" + ALL_SUBGROUPS

    /** Reads one back out of the community name Boost is carrying. */
    fun subgroupListing(name: String?): SubgroupListing? {
        if (name == null) return null
        val found = SUBGROUP_NAME.find(name) ?: return null
        return SubgroupListing(found.groupValues[1])
    }

    /** The same, off the link a group's sidebar carries. */
    fun subgroupListingFor(url: String?): SubgroupListing? {
        if (url == null) return null
        val found = SUBGROUP_URL.find(url) ?: return null
        return SubgroupListing(found.groupValues[1])
    }

    /**
     * The site's own query for it, and the whole of what tells this listing
     * from the group under it. No regex character in it, so it goes into both
     * patterns below as itself.
     */
    private const val ALL_SUBGROUPS = "all_subgroups=true"

    /** The `~` is optional here, since the interceptor takes it off every name. */
    private val SUBGROUP_NAME = Regex("""^~?""" + GROUP + """\?""" + ALL_SUBGROUPS + "$")

    private val SUBGROUP_URL = Regex(
        "^" + Regex.escape(Tildes.BASE) + """/(?:~|%7[Ee])""" + GROUP + """\?""" + ALL_SUBGROUPS + "$"
    )

    /**
     * A time window as tildes.net writes one, out of a number of hours.
     *
     * `period` on a listing is a `SimpleHoursPeriod`, which is **a number of
     * hours**: `\d+[hd]` is its short form, so `3d` and `72h` are the same
     * window and a day is only how it can be written. Which of the two the site
     * writes is `as_short_form`, quoted here -- days for an exact number of
     * them, except for 24 hours itself, which stays hours.
     *
     * Null below an hour, the way `SimpleHoursPeriod` refuses one.
     */
    fun windowFor(hours: Int): String? = when {
        hours < 1 -> null
        hours % 24 == 0 && hours != 24 -> (hours / 24).toString() + "d"
        else -> hours.toString() + "h"
    }

    /** And back the other way, a day being 24 hours. */
    fun windowHours(shortForm: String?): Int? {
        val found = WINDOW.find(shortForm?.trim().orEmpty().lowercase()) ?: return null
        val count = found.groupValues[1].toIntOrNull() ?: return null
        return if (found.groupValues[2] == "d") {
            if (count > Int.MAX_VALUE / 24) null else count * 24
        } else {
            count
        }
    }

    /** `SimpleHoursPeriod._SHORT_FORM_REGEX`, which is a count and a unit. */
    private val WINDOW = Regex("""^(\d+)([hd])$""")

    /**
     * What the site calls a window, in the words its own dropdown uses.
     *
     * Tildes writes `last {{ period }}` over each row, and the period says
     * itself through `ago.human`, which the site pins at 0.0.93. That splits a
     * span into **years, days and hours** -- a year being 365 days flat, in its
     * own `delta2dict` -- and prints the largest two that are not zero. So 400
     * days is "1 year, 35 days" and never "400 days", and a window carrying all
     * three drops the hours rather than saying them.
     *
     * The one exception is exactly one day, which `SimpleHoursPeriod.__str__`
     * rewrites to "24 hours" -- a special case in the site's own code rather
     * than an accident, and the reason its dropdown reads *last 24 hours*.
     *
     * **All three units are said here where the site says two**, which is the
     * one place this wording leaves the site's. `ago` stops at two, so
     * tildes.net renders `period=8790h` as *last 1 year, 1 day* and drops the
     * six hours that are filtering the listing all the same -- checked against
     * the live page. That is a fair trade on a site whose only way to a window
     * like that is typing `8790h` into a prompt, and a poor one here, where
     * three pickers reach it in one gesture. The hours are applied either way.
     * This says so.
     *
     * **More than one unit is abbreviated, and one is spelled out.** A window
     * of one unit is short however it is written, so it reads the way the site
     * writes it -- *Last 7 days*, *Last 24 hours* -- and those are the only
     * ones the site's own dropdown offers, so nothing the menu already had
     * changes. Two or three of them is where it stops fitting the line under a
     * feed's name, and `ago`'s own abbreviation is what the site uses where
     * space is short: the first letter of each unit, and no commas, which is
     * `descriptive_timedelta` stripping them for exactly that reason. So
     * *Last 1y 35d*, and *Last 10y 364d 23h* at the far end.
     */
    fun windowWords(shortForm: String?): String? {
        val hours = windowHours(shortForm)?.takeIf { it > 0 } ?: return null
        val parts = listOf(
            hours / 24 / DAYS_IN_YEAR to "year",
            hours / 24 % DAYS_IN_YEAR to "day",
            hours % 24 to "hour",
        ).filter { it.first > 0 }
        val said =
            if (parts.size == 1) units(parts[0].first, parts[0].second)
            else parts.joinToString(" ") { (count, unit) -> count.toString() + unit.first() }
        return "Last " + if (said == ONE_DAY) "24 hours" else said
    }

    /** What `ago` counts a year as, which is 365 days and no leap anything. */
    const val DAYS_IN_YEAR = 365

    private const val ONE_DAY = "1 day"

    private fun units(n: Int, unit: String): String =
        n.toString() + " " + unit + if (n == 1) "" else "s"

    /**
     * What Tildes puts in place of a spoiler topic's excerpt, quoted from
     * `topic_excerpt_expandable`.
     *
     * Its own word here is **post**, where the site says topic everywhere else,
     * so this is the site's sentence rather than one written to match it. The
     * wording rules never see it: it is the extension's string, not one of
     * Boost's resources.
     */
    const val SPOILER_WARNING = "Warning: this post may contain spoilers"

    /** Lemmy's own syntax for it, which Boost has drawn since 1.0.15. */
    private const val SPOILER_OPEN = "::: spoiler $SPOILER_WARNING"
    private const val SPOILER_CLOSE = ":::"

    /**
     * A topic's text behind a spoiler warning, when it carries the tag.
     *
     * Tildes does something specific with `spoiler` rather than blurring
     * anything the way `nsfw` is blurred: a listing draws **Warning: this post
     * may contain spoilers** where the excerpt would go, with the real text
     * behind an expander. Lemmy has no field for any of that, so the tag
     * arrives as one more code span under the body and nothing reads it.
     *
     * It goes in the body instead, as the fenced block Lemmy uses for the same
     * shape. That is a wrapper Boost's own renderer collapses, which is what
     * makes this drawable at all -- and it is why the wrap is on the whole body
     * rather than only on what a listing shows. Tildes leaves the topic page
     * itself plain, so an opened topic here asks for one tap the site does not.
     *
     * Sub-tags count, the way they do for `nsfw`, so `spoiler.ending` is one.
     */
    fun spoilered(markdown: String, tags: List<String>): String =
        if (markdown.isBlank() || !isSpoiler(tags)) markdown
        else "$SPOILER_OPEN\n$markdown\n$SPOILER_CLOSE"

    /**
     * A topic's body as Boost is handed it: the text, then the tags under it.
     *
     * This is what the editor is filled from, so [withoutTagLine] and
     * [withoutSpoiler] between them have to leave exactly the markdown that
     * went in. The edit route compares the two to decide whether the text was
     * touched at all, and a mismatch there would write a topic back over itself
     * on every save -- wrapped again each time, for the spoiler.
     *
     * The tag line stays outside the wrapper. It is what says the topic is a
     * spoiler at all, so hiding it behind the warning would take the answer
     * with the question.
     */
    fun topicBody(
        bodyHtml: String?,
        tags: List<String>,
        group: String? = null,
    ): String = buildString {
        append(spoilered(htmlToMarkdown(bodyHtml), tags))
        val line = tagLine(tags, group)
        if (line.isNotEmpty()) {
            if (isNotEmpty()) append("\n\n")
            append(line)
        }
    }

    /**
     * The same body without that line, for handing back to Tildes.
     *
     * Only the exact line [tagLine] would have written comes off, so a topic
     * whose author typed something shaped like one keeps it, and a body the
     * editor changed enough not to match is left whole rather than truncated.
     *
     * Which is why the group is asked for here too. The line is links now, and
     * a line rebuilt without the group is the old plain one -- it would match
     * nothing, and every edit would write the topic's own tags into its
     * markdown again.
     */
    fun withoutTagLine(text: String, tags: List<String>, group: String? = null): String {
        val line = tagLine(tags, group)
        if (line.isEmpty()) return text
        return text.removeSuffix(line).trimEnd()
    }

    /**
     * And without the spoiler wrapper, which is the exact reverse of
     * [spoilered] and nothing looser.
     *
     * Both ends have to be the ones this wrote. A topic whose author fenced a
     * spoiler of their own keeps it, since theirs carries their own summary
     * rather than the site's sentence, and an edit that broke the wrapper is
     * sent as it was typed rather than half unwrapped.
     *
     * Text edited **inside** the wrapper still comes back clean, which is the
     * case that matters: the inline body edit on a topic screen is filled with
     * the body as drawn, wrapper and tag line and all, and only the composer
     * takes those off before the box is shown.
     */
    fun withoutSpoiler(text: String, tags: List<String>): String {
        if (!isSpoiler(tags)) return text
        val trimmed = text.trim()
        if (!trimmed.startsWith("$SPOILER_OPEN\n") || !trimmed.endsWith("\n$SPOILER_CLOSE")) {
            return text
        }
        return trimmed.removePrefix("$SPOILER_OPEN\n").removeSuffix("\n$SPOILER_CLOSE")
    }

    /** Both wrappers off, in the order [topicBody] put them on. */
    fun withoutMarkup(text: String, tags: List<String>, group: String? = null): String =
        withoutSpoiler(withoutTagLine(text, tags, group), tags)

    /**
     * Somebody else's words, quoted a line at a time.
     *
     * Boost writes one marker for the whole selection -- `"\n>"`, then what was
     * selected, then a blank line -- and markdown's lazy continuation carries
     * the quote over the lines that follow it, so a one-paragraph parent comes
     * out right and looks like the rule. It is not the rule. **A blank line
     * ends the quote**, and every paragraph after the first renders as the
     * replier's own words, under their own name, with nothing to say it was
     * somebody else's. Anything that opens a block of its own -- a list item, a
     * heading, a fence -- leaves the quote a line earlier still, since lazy
     * continuation only ever extends a paragraph.
     *
     * So every line takes the marker, and a blank one takes it bare, which is
     * what holds a quote together across a paragraph break.
     *
     * **The marker is Boost's own**, read off the head it was about to write
     * rather than spelt again here: whatever follows the last newline is the
     * marker and whatever precedes it goes back in front. The space after it is
     * the one thing added, and it is what the site writes and what
     * [htmlToMarkdown] already puts on a `<blockquote>` coming the other way.
     *
     * Blank lines at either end come off first. The head and the tail are the
     * separators, and a marker on a line of its own at the end of a quote is a
     * stray `>` in somebody's reply.
     */
    fun quoted(head: String, text: String, tail: String): String {
        val cut = head.lastIndexOf('\n') + 1
        val marker = head.substring(cut)
        val body = text.trim('\n', '\r')
        if (marker.isEmpty() || body.isEmpty()) return head + text + tail

        return head.substring(0, cut) + body.split('\n').joinToString("\n") { line ->
            // A `\r` where the source was typed into a browser's textarea,
            // which is where most of Tildes is written. It is whitespace either
            // way, so a line holding nothing else is still a blank one.
            val words = line.trimEnd('\r')
            if (words.isBlank()) marker else marker + " " + words
        } + tail
    }

    fun postView(
        t: Tildes.Topic,
        subscribed: Boolean = false,
        deleted: Boolean = false,
    ): JSONObject {
        val postId = id36ToInt(t.id36)
        // The fallback goes here rather than in the parser, so that a row's
        // real author still wins: the merge keeps a known author over a page
        // that names nobody, and by the time this runs that has happened.
        val creator = person(t.author ?: if (t.scheduled) Tildes.SCHEDULED_POSTER else null)
        val body = topicBody(t.bodyHtml, t.tags, t.group)

        return JSONObject()
            .put(
                "post",
                JSONObject()
                    .put("id", postId)
                    .put("name", t.title)
                    .put("url", t.linkUrl)
                    .put("body", body.ifBlank { null })
                    .put("creator_id", creator.getInt("id"))
                    .put("community_id", groupId(t.group))
                    .put("removed", false)
                    .put("locked", t.locked)
                    .put("published", ts(t.postedAt))
                    .put("deleted", deleted)
                    .put("nsfw", isNsfw(t.tags))
                    .put("ap_id", "${Tildes.BASE}${t.path}")
                    .put("local", true)
                    .put("language_id", 0)
                    .put("featured_community", false)
                    .put("featured_local", false)
            )
            .put("creator", creator)
            .put("community", community(t.group))
            .put("creator_banned_from_community", false)
            .put("banned_from_community", false)
            .put("creator_is_moderator", false)
            .put("creator_is_admin", t.author == "Deimos")
            .put(
                "counts",
                JSONObject()
                    .put("post_id", postId)
                    .put("comments", t.numComments)
                    // Tildes has no downvotes, so score and upvotes agree.
                    .put("score", t.numVotes)
                    .put("upvotes", t.numVotes)
                    .put("downvotes", 0)
                    .put("published", ts(t.postedAt))
                    // Boost keeps this as the watermark for what it has already
                    // shown you, so the topic's own time here marks every
                    // comment new on every visit.
                    .put("newest_comment_time", ts(t.newestCommentAt ?: t.postedAt))
                    .put("community_id", groupId(t.group))
                    .put("creator_id", creator.getInt("id"))
                    .put("instance_id", INSTANCE_ID)
            )
            .put("subscribed", if (subscribed) "Subscribed" else "NotSubscribed")
            .put("saved", t.bookmarked)
            .put("read", false)
            // Boost's hidden is Tildes' ignored, and it was a literal `false`
            // until 2026-08-16: a topic ignored on the site read as visible
            // here however many times it was ignored, and the tab that lists
            // them offered Hide on every row.
            .put("hidden", t.ignored)
            .put("creator_blocked", false)
            .put("my_vote", if (t.voted) 1 else 0)
            // Counted by Tildes, against the visit it records for you.
            .put("unread_comments", t.newCommentsSinceVisit)
    }

    /**
     * A comment, as Lemmy would answer it.
     *
     * [muted] is whether its author is on Boost's own muted-users list, which
     * is where a block goes on a site that has none. It arrives as a parameter
     * rather than being read here so a test can ask for either answer: the read
     * itself wants an Android context and a preferences file.
     */
    /**
     * A comment and its replies, with everything above it dropped and the
     * comment itself made the root.
     *
     * This is what a topic opened **on a comment** has to come back as. Boost
     * asks for the topic carrying that comment's id and then asks for the
     * comments without it, and what it does with the answer is keep every
     * comment whose `path` holds that id as a whole component and throw the
     * rest away -- then build a tree, in which a comment whose parent is not in
     * what is left is dropped with no branch for it. On a reply that discards
     * everything it had just kept, which is a topic screen with a header and
     * nothing under it.
     *
     * Cutting the answer to the same subtree and re-rooting it there is what
     * agrees with all of that: the comment's own `path` becomes `0.<id>`, which
     * is what Boost reads as top level, and each reply keeps its place under it.
     * The rows above it are gone, and Boost draws its own **View all comments**
     * above the first row when the first row has no parent -- which asks for the
     * topic again with no comment on the request, and gets the whole tree back.
     *
     * A comment that is not in the list leaves it alone. A topic that draws in
     * full is better than a screen with a header and no way off it, and Boost
     * draws no empty state at all in this mode.
     */
    fun rootedAt(comments: List<Tildes.Comment>, id36: String): List<Tildes.Comment> {
        val subtree = below(comments, id36)
        if (subtree.isEmpty()) return comments
        return subtree.map { comment ->
            val from = comment.ancestors.indexOf(id36)
            if (from < 0) {
                comment.copy(ancestors = emptyList(), depth = 0)
            } else {
                comment.copy(
                    ancestors = comment.ancestors.subList(from, comment.ancestors.size),
                    depth = comment.ancestors.size - from,
                )
            }
        }
    }

    /**
     * A comment and its replies, with every path left as it is.
     *
     * This is what a thread asked for by **parent** comes back as, which is the
     * request Boost makes when the row it was opened from claimed a parent. It
     * keeps the real ancestry, and that is the point: Boost roots the answer at
     * whichever comment it holds is oldest and draws **Show context** above it
     * when that comment's path says it has a parent of its own. So the ancestry
     * that is *not* returned is what the row offers to go and fetch.
     *
     * Which is safe only because a `parent_id` was asked for. Boost adopts the
     * first comment as a root whether or not its parent is in the answer, where
     * a thread asked for by post drops it -- see [rootedAt] for that half.
     */
    fun below(comments: List<Tildes.Comment>, id36: String): List<Tildes.Comment> =
        comments.filter { it.id36 == id36 || id36 in it.ancestors }

    /**
     * A comment's labels as the line the site draws above it.
     *
     * Tildes puts them between the byline and the text, as small pills, and
     * Lemmy has no field for any of it. So they go where a topic's tags go: in
     * the markdown, as code spans, which is the one span markdown has that
     * reads as a token rather than as something the author emphasised. Above
     * the text rather than under it, since that is where the site draws them
     * and since it is the reason to read the comment differently.
     *
     * The count rides along where the page gave one, in the site's own `x2`
     * form. A one is left off: the site prints it, and a lone `x1` beside a
     * word says nothing the word did not.
     *
     * See [Tildes.Label] for why the word is almost always `Exemplary`.
     */
    fun labelLine(labels: List<Tildes.Label>): String =
        labels.joinToString(" ") { "`" + it.name + "`" + countAfter(it) }

    /** And the same words with no markup on them, for a spoiler's summary. */
    private fun labelWords(labels: List<Tildes.Label>): String =
        labels.joinToString(" ") { it.name + countAfter(it) }

    private fun countAfter(label: Tildes.Label): String =
        if (label.count > 1) " x" + label.count else ""

    /**
     * The body with the labels over it.
     *
     * **Two shapes, which is what the site draws too.** An exemplary label
     * requires a reason and shows it to the comment's author alone, which
     * makes those few sentences the one piece of writing on the site that
     * exists in exactly one place -- somebody thanking you, with their name
     * off. Tildes puts them behind a `<details>` under the pill, so a comment
     * carrying any comes through as the same fold: `::: spoiler`, which is what
     * Boost draws a `<details>` as everywhere else here.
     *
     * The summary carries no backticks, since Boost draws that line as plain
     * text with a `▶` in front of it rather than as markdown. So the pill is
     * the shape a comment with no reasons on it gets, and a fold is the shape
     * your own gets.
     *
     * Each reason is quoted the way the site quotes it, and they are a blank
     * line apart so two of them do not read as one sentence.
     */
    fun labelled(markdown: String, labels: List<Tildes.Label>): String {
        if (labels.isEmpty()) return markdown
        val reasons = labels.flatMap { it.reasons }
        val head = if (reasons.isEmpty()) {
            labelLine(labels)
        } else {
            "::: spoiler " + labelWords(labels) + "\n" +
                reasons.joinToString("\n\n") { "\"" + it + "\"" } +
                "\n" + SPOILER_CLOSE
        }
        return when {
            head.isEmpty() -> markdown
            markdown.isBlank() -> head
            else -> head + "\n\n" + markdown
        }
    }

    /**
     * And the line off again, for a comment on its way back to Tildes.
     *
     * Editing your own comment fills the box with the body as drawn, labels
     * and all, so without this an exemplary comment would have the word
     * written into it the first time its author fixed a typo.
     *
     * **The shape is the whole check**, where a topic's tag line is stripped
     * by rebuilding the exact line from the tags. A tag is any word and has to
     * be known to be matched, while a label is one of five, so the line this
     * writes is one of a small set of strings and can be recognised without
     * being told which comment it came off. What that costs is a comment whose
     * author opened it with nothing but a code-spanned label word and a blank
     * line, which loses that line on the next edit.
     */
    fun withoutLabelLine(text: String): String {
        val head = text.substringBefore('\n').trimEnd()

        // The fold, which is the shape your own comment carries and so the one
        // that matters here: nobody can edit a comment that is not theirs. It
        // ends on the first line that is nothing but the fence, and no reason
        // this wrote can be that line -- every one of them is inside quotes.
        if (LABEL_FOLD.matches(head)) {
            val lines = text.split("\n")
            val close = lines.indexOfFirst { it.trimEnd() == SPOILER_CLOSE }
            if (close <= 0) return text
            var next = close + 1
            if (next < lines.size && lines[next].isBlank()) next++
            return lines.drop(next).joinToString("\n")
        }

        if (!LABEL_LINE.matches(head)) return text
        val rest = text.substringAfter('\n', "")
        // Only a line this wrote comes off, and this always writes a blank
        // line under it. A body starting straight under the labels is
        // somebody's own text that happens to match, so it is left whole.
        if (rest.isNotEmpty() && !rest.startsWith("\n")) return text
        return rest.trimStart('\n')
    }

    /**
     * The labels a body's first line names, drawn as they read, or nothing at
     * all where the line is not one this wrote.
     *
     * This is the pill shape only. A comment carrying reasons opens on a fold
     * instead, and that one stays in the body: it holds writing that has
     * nowhere else to go, where a pill holds a word a badge can say.
     */
    fun labelsInLine(text: String): List<String> {
        val head = text.substringBefore('\n').trimEnd()
        if (!LABEL_LINE.matches(head)) return emptyList()
        return LABEL_SPAN_ONE.findAll(head).map { found ->
            val count = found.groupValues[2]
            found.groupValues[1] + if (count.isEmpty()) "" else " x$count"
        }.toList()
    }

    private const val LABEL_NAME = "(?:Exemplary|Offtopic|Joke|Noise|Malice)"

    private const val LABEL_SPAN = "`$LABEL_NAME`(?: x\\d+)?"

    private val LABEL_LINE = Regex("$LABEL_SPAN(?: $LABEL_SPAN)*")

    private val LABEL_SPAN_ONE = Regex("`($LABEL_NAME)`(?: x(\\d+))?")

    private const val LABEL_PLAIN = "$LABEL_NAME(?: x\\d+)?"

    private val LABEL_FOLD = Regex("::: spoiler $LABEL_PLAIN(?: $LABEL_PLAIN)*")

    fun commentView(
        c: Tildes.Comment,
        t: Tildes.Topic,
        muted: Boolean = Session.isMuted(c.author),
    ): JSONObject {
        val commentId = id36ToInt(c.id36)
        val creator = person(c.author)
        val post = postView(t)

        // Tildes' own line where the comment was, rather than one written
        // here, because the wording is not one string: a single comment reads
        // "Comment deleted by author" or "Comment removed by site admin", and
        // a run of adjacent removed ones collapses into a single article
        // reading "Removed by admin: 3 comments by 3 users". The two fixed
        // strings under it are the fallback for a marker with no words in it.
        val content = when {
            c.placeholder != null -> "*${c.placeholder}*"
            c.deleted -> "*Comment deleted by author*"
            c.removed -> "*Comment removed by site admin*"
            else -> labelled(htmlToMarkdown(c.bodyHtml), c.labels)
        }

        // Lemmy nests by materialised path, which is exactly the ancestry the
        // nested <ol> structure gave us -- and, on a listing, the one ancestor
        // its **Parent** link names. Which is the whole of what Boost needs:
        // it derives a comment's parent from the second-to-last part of this
        // string and from nothing else, so a comment that arrives here saying
        // it is top level is opened as a thread of its own and has its real
        // replies dropped a step later.
        val path = (listOf("0") + c.ancestors.map { id36ToInt(it).toString() } +
                listOf(commentId.toString())).joinToString(".")

        return JSONObject()
            .put(
                "comment",
                JSONObject()
                    .put("id", commentId)
                    .put("creator_id", creator.getInt("id"))
                    .put("post_id", id36ToInt(t.id36))
                    .put("content", content)
                    // Both answered false however Tildes drew this comment.
                    // Boost draws its own words over a comment carrying either
                    // -- "Removed by moderator" and "Deleted by creator", off
                    // its Lemmy ancestry -- and throws away the content that
                    // came with it. Tildes has no moderators, and it is the
                    // count in a run that would be lost: "Removed by admin: 3
                    // comments by 3 users" is not something a fixed string can
                    // say. So a taken-down comment arrives as an ordinary one
                    // whose body is the line Tildes drew. What that costs is
                    // the red mark Boost puts beside a removed comment, and
                    // nothing else: the two flags are read in `CommentViewHolder`
                    // and nowhere else in the app, and the fourth read -- the
                    // one that labels a mod row Approve rather than Remove --
                    // is behind `can_auth_user_moderate`, which never comes
                    // true here because the interceptor answers no moderators.
                    .put("removed", false)
                    .put("published", ts(c.postedAt))
                    .put("updated", c.editedAt)
                    .put("deleted", false)
                    .put("ap_id", "${Tildes.BASE}${t.path}#comment-${c.id36}")
                    .put("local", true)
                    .put("path", path)
                    .put("distinguished", false)
                    .put("language_id", 0)
            )
            .put("creator", creator)
            .put("post", post.getJSONObject("post"))
            .put("community", post.getJSONObject("community"))
            .put(
                "counts",
                JSONObject()
                    .put("comment_id", commentId)
                    .put("score", c.numVotes)
                    .put("upvotes", c.numVotes)
                    .put("downvotes", 0)
                    .put("published", ts(c.postedAt))
                    .put("child_count", 0)
            )
            .put("creator_banned_from_community", false)
            .put("banned_from_community", false)
            .put("creator_is_moderator", false)
            .put("creator_is_admin", c.author == "Deimos")
            .put("subscribed", "NotSubscribed")
            .put("saved", c.bookmarked)
            // Tildes has no block, so blocking somebody in the app writes their
            // name into Boost's own muted-users list instead. This is the other
            // end of that: a comment by somebody on it arrives blocked, and
            // Boost's whole treatment for a blocked author runs -- the chain
            // folds, the subtree folds with it, and the byline reads "Blocked
            // user" rather than the name. A tap opens it again, and an opened
            // one offers Unblock in its menu, which comes back through
            // `/user/block` and takes the name off the list. The folded row
            // draws no menu button at all, which is why that needs the tap.
            //
            // Which matters because the filter that hides a muted person's
            // topics only ever runs on a feed. Their comments were drawn in
            // full, inside every topic, which on this site is most of what
            // anybody says.
            .put("creator_blocked", muted)
            // Whether Tildes folded this one used to ride in on `activity_alert`,
            // since Boost's fold read a field rather than asking anything. It
            // asks now, so the answer goes back through `commentFolded` and
            // this field means what Lemmy means by it again -- which matters,
            // because it is also what puts a PieFed-only entry in the comment's
            // menu. See "Collapsing the chains with nothing new" in RESEARCH.md.
            .put("activity_alert", false)
            .put("my_vote", if (c.voted) 1 else 0)
    }

    /**
     * Tildes threads messages into a conversation with a subject, while Lemmy
     * has a flat list between two people and no subject at all. Each message
     * becomes one Lemmy message, and the subject rides on the first of them so
     * it is not simply lost.
     */
    fun privateMessageView(
        conversation: Tildes.Conversation,
        message: Tildes.Message,
        index: Int,
        me: String,
    ): JSONObject {
        val other = conversation.otherUser ?: me
        val from = message.sender ?: if (message.mine) me else other
        val to = if (from == me) other else me
        val body = htmlToMarkdown(message.bodyHtml)

        return JSONObject()
            .put(
                "private_message",
                JSONObject()
                    .put("id", stableId("message", conversation.id36 + ":" + index))
                    .put("creator_id", userId(from))
                    .put("recipient_id", userId(to))
                    .put(
                        "content",
                        if (index == 0) "**" + conversation.subject + "**\n\n" + body else body,
                    )
                    .put("deleted", false)
                    .put("read", !conversation.unread)
                    .put("published", ts(message.sentAt))
                    .put("ap_id", Tildes.BASE + Tildes.conversationPath(conversation.id36))
                    .put("local", true)
            )
            .put("creator", person(from))
            .put("recipient", person(to))
    }

    /**
     * A whole thread as a single message, which is all the inbox list needs.
     * Tildes shows the subject there and nothing else, and its own inbox page
     * carries no message text at all, so filling in a preview would cost a
     * page load per thread before the list could be drawn.
     *
     * The person on it is the thread rather than the correspondent, which is
     * what gives each conversation a row of its own. See [conversationPersonId].
     */
    fun conversationView(conversation: Tildes.Conversation, me: String): JSONObject {
        val other = conversation.otherUser ?: me
        val personId = conversationPersonId(other, conversation.id36)
        return JSONObject()
            .put(
                "private_message",
                JSONObject()
                    .put("id", stableId("conversation", conversation.id36))
                    .put("creator_id", personId)
                    .put("recipient_id", userId(me))
                    .put("content", conversation.subject)
                    .put("deleted", false)
                    .put("read", !conversation.unread)
                    .put("published", ts(conversation.lastActivity))
                    .put("ap_id", Tildes.BASE + Tildes.conversationPath(conversation.id36))
                    .put("local", true)
            )
            .put("creator", person(other, id = personId))
            .put("recipient", person(me))
    }

    /**
     * A reply or a mention. Lemmy carries both as an ordinary comment view with
     * a small wrapper naming who it is for and whether it has been read.
     */
    fun inboxCommentView(
        c: Tildes.Comment,
        t: Tildes.Topic,
        me: String,
        read: Boolean,
        mention: Boolean,
    ): JSONObject =
        commentView(c, t)
            .put(
                if (mention) "person_mention" else "comment_reply",
                JSONObject()
                    .put("id", inboxId(c.id36, mention))
                    .put("recipient_id", userId(me))
                    .put("comment_id", id36ToInt(c.id36))
                    .put("read", read)
                    .put("published", ts(c.postedAt))
            )
            .put("recipient", person(me))

    /** The id Boost sends back when marking one of the above read. */
    fun inboxId(id36: String, mention: Boolean): Int =
        stableId(if (mention) "mention" else "reply", id36)

    /**
     * Post and comment counts stay at zero because Tildes has none. It does not
     * total anyone's posting anywhere on the site, and the twenty items a
     * profile shows are a recent-activity window rather than a total, so
     * counting those would report the same number for everybody.
     */
    fun personView(
        username: String,
        registered: String? = null,
        bioHtml: String? = null,
    ): JSONObject =
        JSONObject()
            .put("person", person(username, registered, bioHtml))
            .put(
                "counts",
                JSONObject().put("person_id", userId(username)).put("post_count", 0)
                    .put("comment_count", 0)
            )
            .put("is_admin", username == "Deimos")

    /**
     * `bio` is the signed-in account's own, as markdown. It rides on the
     * person inside `my_user`, which is where Boost's account editor reads it
     * from, and it is markdown already rather than a rendered bio, so it goes
     * on straight rather than through [person].
     *
     * `settings` is Tildes' own account settings, keyed by the `local_user`
     * field each is drawn on. That editor is the only screen in the app that
     * reads anything out of `local_user`, and it fills one switch per field, so
     * a Tildes setting travels by sitting in the field whose switch it wants.
     * Which fields those are is the interceptor's table rather than this one's
     * business.
     */
    fun siteResponse(
        groups: List<Tildes.Group>,
        loggedIn: String?,
        bio: String? = null,
        settings: Map<String, Boolean> = emptyMap(),
    ): JSONObject {
        val site = JSONObject()
            .put("id", 1)
            .put("name", "Tildes")
            .put("sidebar", "Tildes, read through a patched Boost. Not affiliated with Tildes.")
            .put("published", "2018-04-01T00:00:00Z")
            .put("icon", "${Tildes.BASE}/images/mobile-icon-192.png")
            .put("description", "a non-profit community site")
            .put("actor_id", Tildes.BASE)
            .put("instance_id", 1)

        val localSite = JSONObject()
            .put("id", 1)
            .put("site_id", 1)
            .put("site_setup", true)
            // Tildes has no downvotes, so Boost hides the control.
            .put("enable_downvotes", false)
            .put("enable_nsfw", false)
            .put("community_creation_admin_only", true)
            .put("require_email_verification", false)
            .put("private_instance", false)
            .put("default_theme", "browser")
            .put("default_post_listing_type", "All")
            .put("actor_name_max_length", 32)
            .put("federation_enabled", false)
            .put("captcha_enabled", false)
            .put("published", "2018-04-01T00:00:00Z")
            .put("registration_mode", "Closed")

        val response = JSONObject()
            .put(
                "site_view",
                JSONObject()
                    .put("site", site)
                    .put("local_site", localSite)
                    .put("local_site_rate_limit", JSONObject().put("local_site_id", 1))
                    .put(
                        "counts",
                        JSONObject().put("site_id", 1).put("users", 0).put("posts", 0)
                            .put("comments", 0).put("communities", groups.size)
                    )
            )
            .put("admins", JSONArray().put(personView("Deimos")))
            .put("version", VERSION)
            .put(
                "all_languages",
                JSONArray().put(JSONObject().put("id", 0).put("code", "und").put("name", "Undetermined"))
            )
            .put("discussion_languages", JSONArray().put(0))
            .put("taglines", JSONArray())
            .put("custom_emojis", JSONArray())

        if (loggedIn != null) {
            val me = person(loggedIn).apply { if (!bio.isNullOrEmpty()) put("bio", bio) }
            val follows = JSONArray()
            groups.filter { it.subscribed }.forEach {
                follows.put(JSONObject().put("community", community(it.name)).put("follower", me))
            }
            response.put(
                "my_user",
                JSONObject()
                    .put(
                        "local_user_view",
                        JSONObject()
                            .put(
                                "local_user",
                                JSONObject().put("id", me.getInt("id"))
                                    .put("person_id", me.getInt("id"))
                                    .put("show_nsfw", true).put("default_sort_type", "Active")
                                    .put("default_listing_type", "Subscribed")
                                    .put("show_scores", true).put("show_read_posts", true)
                                    .put("email_verified", true).put("accepted_application", true)
                                    .put("admin", false)
                                    .apply { settings.forEach { (key, on) -> put(key, on) } }
                            )
                            .put("person", me)
                            .put(
                                "counts",
                                JSONObject().put("person_id", me.getInt("id"))
                                    .put("post_count", 0).put("comment_count", 0)
                            )
                    )
                    // Drives Boost's subscribed feed and community drawer.
                    .put("follows", follows)
                    .put("moderates", JSONArray())
                    .put("community_blocks", JSONArray())
                    .put("instance_blocks", JSONArray())
                    .put("person_blocks", JSONArray())
                    .put("discussion_languages", JSONArray().put(0))
            )
        }

        return response
    }
}
