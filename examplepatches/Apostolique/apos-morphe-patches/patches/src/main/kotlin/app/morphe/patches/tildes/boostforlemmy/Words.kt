package app.morphe.patches.tildes.boostforlemmy

/**
 * Boost's wording, translated into Tildes'.
 *
 * Two halves. [WORD_RULES] rewrites the nouns wherever they appear, so a string
 * added in Boost's next release comes out translated without anyone touching
 * this file. [OVERRIDES] carries the ones a rule cannot reach: the words Tildes
 * has that Boost spells differently, and the sentences where the rule would
 * produce something true of Lemmy and false here.
 *
 * The sort names are wording as well and are not here, because they are the
 * ones that have to follow the account rather than the install. See [sortNames].
 *
 * The rules read values, never resource names. Boost's names keep their Reddit
 * heritage throughout -- `go_to_subreddit` reads "Community" -- so a name is
 * the wrong thing to match on and renaming one is not this patch's business.
 */
internal object Words {
    /**
     * Applied to every string value, case preserved: "Community" becomes
     * "Group" while "communities" becomes "groups".
     *
     * `post` is guarded against `cross-post`, since Tildes has no crossposting
     * and "cross-topic" would name something that does not exist. Nothing else
     * in the file needs guarding: `repost` and `posted` carry no word boundary
     * before `post`, so the rule never sees them.
     */
    private val WORD_RULES = listOf(
        """\bcommunities\b""" to "groups",
        """\bcommunity\b""" to "group",
        """\bsubreddits\b""" to "groups",
        """\bsubreddit\b""" to "group",
        """(?<!cross-)\bposts\b""" to "topics",
        """(?<!cross-)\bpost\b""" to "topic",
        """\binstances\b""" to "sites",
        """\binstance\b""" to "site",
    ).map { (pattern, replacement) ->
        Regex(pattern, RegexOption.IGNORE_CASE) to replacement
    }

    /** Values that are configuration rather than wording, like `boost-for-lemmy`. */
    private val TOKEN = Regex("""[a-z0-9._/-]+""")

    /**
     * Strings the rules would rewrite into a lie. Boost's changelog is about
     * Boost's own releases and the subscribe prompt points at a real Lemmy
     * community, so both mean `post` and `community` literally.
     */
    private val KEEP = setOf(
        "boost_subscribe_dialog",
        "changelog_dialog_text",
        "new_changelog_dialog_text",
    )

    /**
     * What the rules cannot work out. Tildes' own words, taken off the site
     * rather than invented: `post_action_toggle_button` for Bookmark, Ignore
     * and Vote.
     */
    private val OVERRIDES = mapOf(
        // Saving is bookmarking. `button_save` is not here, though its rows
        // read Bookmark: see [menuRowNames].
        "action_saved" to "Bookmarks",
        "profile_saved" to "Bookmarks",
        "saved" to "Bookmarks",
        "post_saved" to "Bookmarked",
        "tooltip_saved_posts" to "To view bookmarked comments go to Profile-Bookmarks",
        "upvote_on_save" to "Vote on bookmark",

        // Tildes votes without downvoting, and hiding a topic is ignoring it.
        // The downvoted tab is the one that lists ignored topics.
        "button_upvote" to "Vote",

        // The row over a thread opened on one comment, which reads "Show
        // context" where the app this one is descended from said "View the full
        // context". The resource names across this file are that app's strings
        // written out -- `you_are_viewing_a_single_comment_s_thread` still holds
        // its own name as its value -- so the longer wording is what these two
        // rows have always been called, and it says plainly what the row does
        // where the short one reads like a heading. The arrow stays, since the
        // row under it carries one and the pair is drawn together.
        "view_the_full_context" to "View the full context →",

        // What Boost says when it refuses a vote, which is Reddit's archived
        // post. Tildes closes voting 30 days after posting, refuses it on your
        // own posts, and refuses it on removed ones, and none of those is an
        // archive. Commenting is not affected by any of them.
        "archived_warning" to "Tildes is not taking votes on this.",
        "archived_warning_title" to "Voting is closed",
        "profile_liked" to "Votes",
        "profile_disliked" to "Ignored",
        "button_hide" to "Ignore",
        "button_hidden" to "Ignored",
        "popup_hide" to "Ignore",
        "popup_unhide" to "Unignore",
        "post_hidden" to "Topic ignored",

        // Where Boost names Lemmy to the reader.
        "about_reddit_title" to "Tildes",
        "copy_markdown_explanation" to "Formatted link for Tildes",
        "pref_header_account_summary" to "Tildes account preferences",
        "search_all_reddit_snackbar" to "Search all of Tildes",
        "search_generic_hint" to "Search Tildes",
        "search_in_all" to "in all of Tildes",
        "title_activity_login" to "Login to Tildes",

        // "Post" the verb, which the noun rule would take.
        "submit" to "Post",
        "submit_resubmit" to "Post anyway?",
        "crosspost_explanation" to "Post to Lemmy",

        // The composer, whose four inputs are Tildes' four and are labelled
        // the way its own form labels them. `custom_url` is the odd one: it
        // hints Boost's thumbnail field, which Tildes has nothing behind and
        // the patch borrows for the tags. See `composerFields`.
        "custom_url" to "Tags (comma-separated)",
        "submit_caption" to "Text (Markdown)",
        "url_hint" to "Link",

        // Reddit leftovers no rule reaches. Which prefix Boost draws in front
        // of a group is bytecode, so the label says there is one and stops.
        "draft_manage_summary" to "View or delete saved drafts",
        "pref_show_subreddit_prefix_title" to "Show the group prefix",

        // Sentences the rules leave half true. Tildes federates with nothing,
        // and the filter summary was ungrammatical before the rule ran.
        "pref_filter_instance_summary" to "Hide topics from these sites",
        "delete_account_explanation" to
            "Warning: this will permanently delete your account. " +
            "Enter your password to confirm.",
    )

    /**
     * The sort rows, which are wording too and are deliberately not rewritten
     * here.
     *
     * Tildes takes an order and a time window where Lemmy takes one sort, so
     * five of Boost's rows are read as orders, six as windows, and five have no
     * answer at all. Saying that in resources would say it on a Lemmy account
     * as well, where `Scaled` is not Votes and `Top` is not a time window. The
     * extension writes the words onto the rows as they are drawn instead, which
     * follows the account, and works out each one from what the interceptor
     * makes of that sort rather than from a table beside this one.
     *
     * What is left here is the check: these are the names the extension
     * resolves against the app's own resources, and [tildesMenuNamesPatch]
     * fails at apply time if Boost stops using one.
     */
    internal val sortNames = setOf(
        "sort_active",
        "sort_all",
        "sort_controversial",
        "sort_day",
        "sort_hot",
        "sort_hour",
        "sort_month",
        "sort_most_comments",
        "sort_new",
        "sort_new_comments",
        "sort_old",
        "sort_scaled",
        "sort_six_hours",
        "sort_top",
        "sort_twelve_hours",
        "sort_week",
        "sort_year",
    )

    /**
     * The other menu rows the extension resolves by name.
     *
     * Four come out. **Downvote**, because Tildes votes one way. **Report**,
     * because the site has no such thing, only comment labels, which are a
     * feature of their own. And both crossposting rows, **Cross-posts** and
     * **Cross-post** the verb, because nothing there is a copy of anything
     * else: what Tildes does with a topic in the wrong group is move it.
     *
     * The fifth is renamed rather than dropped, and it is here rather than in
     * [OVERRIDES] because the string behind it is not the word it looks like.
     * `button_save` is Boost's **Save**, used in ten places, and only the topic
     * and comment menus mean bookmarking by it. Rewriting the string turned the
     * profile editor's Save button into "Bookmark" and the save-a-draft dialog
     * with it, so the word goes on the row instead, where the sort names
     * already go. `button_unsave` is gone from here for the same reason it was
     * never right: nothing in the app draws it, and the row keeps one title and
     * swaps its icon.
     *
     * Mark NSFW is not one of them. It looked like the same kind of row and is
     * not: Tildes has no flag for it while it does have the tag, so the row
     * adds and removes `nsfw` and means what it says.
     *
     * The last two are neither dropped nor renamed. They are what the **Topic
     * log** row is placed by: `menu_submission_share` is the row it goes above,
     * and `share_permalink_comments` is the one carrying the topic's own
     * address, which is how that pass knows which topic a menu is about and
     * that it is a topic's menu at all. Losing either is a row that never
     * appears, which looks exactly like a topic with an empty log.
     *
     * Here for the same reason [sortNames] is. A rename costs the row keeping
     * Lemmy's word or staying in a menu it has nothing behind, which reads like
     * a decision, so [tildesMenuNamesPatch] fails at apply time instead.
     */
    internal val menuRowNames =
        setOf(
            "button_downvote",
            "popup_report",
            "crossposts",
            "crosspost",
            "button_save",
            "menu_submission_share",
            "share_permalink_comments",
        )

    /** Every resource name this expects to find, for the tests to check. */
    internal val named: Set<String> get() = OVERRIDES.keys + KEEP

    /** What Boost should say instead, or [value] itself when nothing changes. */
    fun translate(name: String, value: String): String {
        OVERRIDES[name]?.let { return it }
        if (name in KEEP || TOKEN.matches(value)) return value
        return rules(value)
    }

    /**
     * The rules alone, for the values that have no name of their own.
     *
     * A plural is one element carrying an item per quantity, so the name on it
     * belongs to all of them and [OVERRIDES] is written for single strings. The
     * rules are the half that generalises, and they are all four of the plurals
     * that change need: `%s posts`, `%d communities`, `%d cross-posts` and
     * `%d subreddits in this feed`.
     */
    fun rules(value: String): String {
        if (TOKEN.matches(value)) return value

        return WORD_RULES.fold(value) { text, (rule, replacement) ->
            rule.replace(text) { match -> matchCase(match.value, replacement) }
        }
    }

    private fun matchCase(source: String, replacement: String) = when {
        source.length > 1 && source.none { it.isLowerCase() } -> replacement.uppercase()
        source.first().isUpperCase() -> replacement.replaceFirstChar { it.uppercaseChar() }
        else -> replacement
    }
}
