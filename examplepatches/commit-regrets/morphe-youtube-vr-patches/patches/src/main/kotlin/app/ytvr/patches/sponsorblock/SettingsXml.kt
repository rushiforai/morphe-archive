package app.ytvr.patches.sponsorblock

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

/**
 * Restructures the app's preferences XML for the "Patch settings" hub, Morphe-style:
 *
 *   Settings -> "Patch settings" (row) -> hub screen with one entry per feature
 *             ("SponsorBlock" today) -> that feature's settings screen.
 *
 * The app builds its settings from `res/xml/settings_prefs.xml` (immersive) and
 * `res/xml/panel2_settings_prefs.xml` (panel mode), one `Preference` per element, and navigates
 * its own sub-screens by comparing the clicked row's key and swapping a whole fragment in. One of
 * those keys is `developer_settings`, whose screen inflates `res/xml/developer_settings_prefs.xml`
 * -- a screen whose list row the app removes at startup, i.e. dead UI. This patch:
 *
 * - adds a `Patch settings` row (key `ytvr_mod_settings`) to the top of both main lists,
 * - replaces the *contents* of `developer_settings_prefs.xml` with the hub's entry rows, and
 * - replaces the *contents* of a second dead XML -- the generic preferences screen of the app's
 *   unused framework `PreferenceFragment`, passed in as [sbScreenXmlId] (mined from the bytecode,
 *   resolved back to a file through `res/values/public.xml`) -- with the SponsorBlock rows.
 *
 * The companion bytecode edits in SponsorBlockPatch.kt (all structural, no names) then re-key the
 * click handlers, branch the reused fragment's XML choice and title on a fragment argument, and
 * add the hub's click handler. No class is created and no resource id is minted: both files and
 * their ids already exist, and the switches keep the same keys, persisting to the same
 * `<package>_preferences` file the extension reads.
 *
 * Why XML rather than building the rows from code: R8 keeps the androidx *class names* (inflating
 * from XML needs them) but renames their *members* -- `androidx.preference.Preference`'s `setTitle`,
 * `setKey`, `setSummary` and `addPreference` are `L(...)`, `X(...)` and so on in this APK. Reflection
 * by name silently did nothing, which is what the "I don't find Patch settings anywhere" report was.
 * XML attributes carry no such risk.
 *
 * The files are handed in, never guessed: until 2026-10-30 this function derived the decoded
 * resource tree from the bytecode patch's `fileWorkspace`, which worked only while every host
 * kept the tree under the workspace's ancestors. Morphe patcher 2.x added hosts that decode
 * resources *on request* (Desktop 2.x), where nothing exists under the decode tree until a
 * resource patch asks for it -- the walk found nothing and threw on a real Desktop 2.x run
 * (measured 2026-10-30). The discovery moved into [patchSettingsPatch], a resource patch whose
 * `decode(**)` is the sanctioned trigger, and this function now takes the decoded `res`
 * directories and does only what it is good at: editing the XML. A miss still throws and names
 * every directory it searched.
 */
internal fun restructureSettingsXmls(
    resDirs: List<File>,
    sbScreenXmlId: Int,
    categoryDefaults: Map<String, String>,
) {
    val roots = resDirs
    val mainFiles = MAIN_SETTINGS_XML_NAMES.flatMap { name -> findInRoots(roots, name) }
    if (mainFiles.isEmpty()) {
        throw PatchException(
            "Patch settings: no settings preferences XML in " + describeRoots(roots) +
                "; looked for " + MAIN_SETTINGS_XML_NAMES.joinToString(),
        )
    }
    mainFiles.forEach { addModSettingsEntry(it) }
    val hubFiles = findInRoots(roots, HUB_XML_NAME)
    if (hubFiles.isEmpty()) {
        throw PatchException(
            "Patch settings: no $HUB_XML_NAME in " + describeRoots(roots) +
                " -- the hub has nothing to be inflated from",
        )
    }
    hubFiles.forEach { fillHubScreen(it) }
    val sbName = resolveResourceName(roots, sbScreenXmlId)
    val sbFiles = findInRoots(roots, "$sbName.xml")
    if (sbFiles.isEmpty()) {
        throw PatchException(
            "Patch settings: the mined xml id ${"0x%08x".format(sbScreenXmlId)} resolves to " +
                "'$sbName' but no $sbName.xml exists in " + describeRoots(roots),
        )
    }
    sbFiles.forEach { fillSponsorBlockScreen(it, categoryDefaults) }
    // The behaviour pickers are `ListPreference` rows, so their `entries`/`entryValues` have to
    // exist as arrays. They go into the values file that already holds arrays rather than a new
    // one, so the encoder only has to accept new *names* in a file it already knows.
    addBehaviourArrays(sbFiles.first(), categoryDefaults)
    findInRoots(roots, DEPRECATED_HOLDER_LAYOUT_NAME)
        .forEach { moveHolderBackButtonToLeft(it) }
}

/**
 * How deep below one `res` directory the tree may sit: `res/xml/settings_prefs.xml` is two levels,
 * and the budget exists so a mis-shaped directory cannot turn a miss into a filesystem crawl.
 */
private const val MAX_RESOURCE_TREE_DEPTH = 4

/**
 * The directories searched for the decoded resource files: the decoded `res` directories the
 * caller discovered. The first directory that holds a file answers for it.
 */
private fun describeRoots(roots: List<File>): String = "any of " + roots.joinToString("; ") { it.absolutePath }

/**
 * The files named [name] under the *first* root that has any.
 */
private fun findInRoots(roots: List<File>, name: String): List<File> {
    for (root in roots) {
        val found = findFiles(root, name, 0)
        if (found.isNotEmpty()) {
            return found
        }
    }
    return emptyList()
}

private val MAIN_SETTINGS_XML_NAMES = listOf("settings_prefs.xml", "panel2_settings_prefs.xml")
private const val HUB_XML_NAME = "developer_settings_prefs.xml"

/**
 * The settings holder layout whose back arrow renders at the card's top-center -- directly below
 * Horizon OS's own panel back affordance, which floats above the card's top edge. Two identical
 * arrows stacked reads as "which one?"; the card's arrow moves to the top-left corner (the
 * standard back position) so the two controls read as different things.
 */
private const val DEPRECATED_HOLDER_LAYOUT_NAME = "deprecated_settings_holder_fragment.xml"

/**
 * Moves the back-button container of one holder layout from top-center to the top-left corner.
 * Idempotence is by the attribute itself.
 */
private fun moveHolderBackButtonToLeft(xml: File) = editXml(xml) { root ->
    val containers = root.getElementsByTagName("*")
    var found = false
    for (index in 0 until containers.length) {
        val element = containers.item(index) as? Element ?: continue
        val id = element.getAttribute("android:id")
        if (id.isNotEmpty() && id.substringAfterLast('/') == "back_button_container") {
            element.setAttribute("android:layout_centerHorizontal", "false")
            element.setAttribute("android:layout_alignParentStart", "true")
            element.setAttribute("android:layout_marginStart", "16dp")
            element.setAttribute("android:layout_marginTop", "16dp")
            found = true
        }
    }
    if (!found) {
        throw PatchException("Patch settings: no back button to move in ${xml.name}")
    }
}

/** Maps a resource id to its name through the decode's `res/values/public.xml` files. */
private fun resolveResourceName(roots: List<File>, id: Int): String {
    val publicFiles = findInRoots(roots, "public.xml")
    if (publicFiles.isEmpty()) {
        throw PatchException(
            "Patch settings: no public.xml in " + describeRoots(roots) +
                " -- cannot resolve the mined xml id to a file",
        )
    }
    for (file in publicFiles) {
        val doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)
        val nodes = doc.getElementsByTagName("public")
        for (index in 0 until nodes.length) {
            val element = nodes.item(index) as? Element ?: continue
            val parsed = element.getAttribute("id").removePrefix("0x").toLongOrNull(16) ?: continue
            if (parsed.toInt() == id && element.getAttribute("type") == "xml") {
                return element.getAttribute("name")
            }
        }
    }
    throw PatchException(
        "Patch settings: the mined xml id ${"0x%08x".format(id)} is not in any public.xml",
    )
}

private fun findFiles(directory: File, name: String, depth: Int): List<File> {
    if (depth > MAX_RESOURCE_TREE_DEPTH || !directory.isDirectory) {
        return emptyList()
    }
    val found = mutableListOf<File>()
    directory.listFiles()?.forEach { child ->
        if (child.isDirectory) {
            found += findFiles(child, name, depth + 1)
        } else if (child.name == name) {
            found += child
        }
    }
    return found
}

/** The key of the main-list row that opens the sub-screen (the click handler is re-keyed to it). */
private const val MOD_SETTINGS_KEY = "ytvr_mod_settings"

/** Parses [xml], hands the root element to [edit], and writes the result back. */
private inline fun editXml(xml: File, edit: (root: Element) -> Unit) {
    val doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml)
    edit(doc.documentElement)
    TransformerFactory.newInstance().newTransformer().apply {
        setOutputProperty(OutputKeys.INDENT, "yes")
        setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no")
    }.transform(DOMSource(doc), StreamResult(xml))
}

/**
 * Puts the "Patch settings" row at the top of one main settings list. Idempotence is by the row's
 * key; rows of an older flat layout of this patch (same `ytvr_mod_` key prefix) are removed so a
 * reused decode migrates instead of doubling.
 */
private fun addModSettingsEntry(xml: File) = editXml(xml) { root ->
    root.childElements().forEach { row ->
        val key = row.getAttribute("android:key")
        if (key.startsWith("ytvr_mod_") && !(row.tagName == "Preference" && key == MOD_SETTINGS_KEY)) {
            root.removeChild(row)
        }
    }
    val existing = root.childElements().firstOrNull { it.getAttribute("android:key") == MOD_SETTINGS_KEY }
    if (existing != null) {
        existing.setAttribute("android:title", MAIN_ROW_TITLE)
    } else {
        val row = root.ownerDocument.createElement("Preference")
        row.setAttribute("android:key", MOD_SETTINGS_KEY)
        row.setAttribute("android:title", MAIN_ROW_TITLE)
        root.insertBefore(row, root.firstChild)
    }
}

private const val MAIN_ROW_TITLE = "Patch settings"

/**
 * Replaces the whole content of the hub's preferences XML with the feature entry rows plus the
 * one setting that is not a feature. The root element (and with it the resource id and the
 * inflation path) stays the app's own.
 *
 * Idempotence is by *every* row's key **and** the quality row's shape: a decode reused from an
 * earlier revision of this patch has the older row set -- and, for the quality row, the older
 * `ListPreference` widget -- so requiring the whole set *and* a plain `Preference` there means such
 * a tree is cleared and rewritten rather than being left one row short or with an inert row.
 */
private fun fillHubScreen(xml: File) = editXml(xml) { root ->
    val rows = root.getElementsByTagName("*").let { nodes ->
        (0 until nodes.length).mapNotNull { index -> nodes.item(index) as? Element }
    }
    val present = rows.mapNotNull { row ->
        row.getAttribute("android:key").takeIf { key -> key.isNotEmpty() }
    }.toSet()
    val qualityRowIsPlain = rows.any { row ->
        row.getAttribute("android:key") == VIDEO_QUALITY_KEY &&
            row.tagName == PLAIN &&
            !row.hasAttribute("android:entries")
    }
    if (HUB_ROW_KEYS.all { it in present } && qualityRowIsPlain) {
        return@editXml
    }
    while (root.firstChild != null) {
        root.removeChild(root.firstChild)
    }
    HUB_ROWS.forEach { row ->
        val element = root.ownerDocument.createElement(row.first)
        row.second.forEach { attribute -> element.setAttribute(attribute.first, attribute.second) }
        root.appendChild(element)
    }
}

/** The hub's SponsorBlock entry. */
private const val HUB_ENTRY_KEY = "ytvr_mod_sb_screen"

/**
 * The hub's log gate: the row the extension's {@code VerboseLog} reads, and the thing that makes a
 * *released* build quiet while still letting a developer turn the diagnostics back on without a
 * rebuild. `ytvr_mod_*` like every other row this port adds, and a Boolean-writing
 * `SwitchPreference`, so it persists to the same preference file every other row uses.
 */
private const val VERBOSE_LOGGING_KEY = "ytvr_mod_verbose_logging"
private const val VERBOSE_LOGGING_TITLE = "Verbose logging"

/**
 * The hub's "Default video quality" row: the resolution every video starts at, read at runtime by
 * the extension the Default video quality patch injects. The patch's build option seeds the value
 * on first launch, and the extension's own row UI paints the current choice under the name --
 * [VIDEO_QUALITY_SUMMARY] is only what shows before that runs.
 *
 * **A plain `Preference`, never a `ListPreference`.** Measured on the device, twice over: this app
 * replaces androidx's preference adapter with its own and that adapter dispatches a row click
 * itself, doing nothing for a row type it does not know, and androidx's `ListPreference` picker is
 * an `AlertDialog`, which is never composited into the VR panel. Either one reads exactly like the
 * bug report this replaced -- the row is there, tapping it opens nothing (2026-10-13). The options
 * live in the extension, which builds the picker *inside* the row, the same way the behaviour
 * pickers work (see `CategoryRows`), and that is also why no `entries`/`entryValues` arrays are
 * written for this row any more.
 */
private const val VIDEO_QUALITY_KEY = "ytvr_mod_video_quality"
private const val VIDEO_QUALITY_TITLE = "Default video quality"
private const val VIDEO_QUALITY_SUMMARY = "Highest available"

/**
 * The hub's "QUIC (HTTP/3)" switch: read by the extension's `QuicTransport` where Cronet builds its
 * engine. Positive-sense on purpose -- on means QUIC is allowed -- so the row, the patch option and
 * the description all read the same direction. A change only applies after the app restarts.
 */
private const val QUIC_ENABLED_KEY = "ytvr_mod_quic_enabled"
private const val QUIC_TITLE = "QUIC (HTTP/3)"
private const val QUIC_SUMMARY =
    "HTTP/3 over UDP. Turn off if playback stalls on a network that blocks UDP (restart to apply)."

/**
 * The hub's rows: the feature entries, the runtime settings this port owns (video quality, QUIC),
 * then the diagnostic log gate. They sit on the hub rather than inside a feature's screen because
 * they configure patches, not SponsorBlock. A `SwitchPreference` does *not* get to own its own
 * value here -- see the note on the switch below.
 */
private val HUB_ROWS: List<Pair<String, List<Pair<String, String>>>> = listOf(
    "Preference" to listOf(
        "android:key" to HUB_ENTRY_KEY,
        "android:title" to "SponsorBlock",
        "android:summary" to "Skips crowd-sourced sponsor segments automatically",
    ),
    PLAIN to listOf(
        "android:key" to VIDEO_QUALITY_KEY,
        "android:title" to VIDEO_QUALITY_TITLE,
        // No `android:defaultValue`: a plain `Preference` does not persist one, and the extension
        // seeds the setting from the build option on its first read anyway.
        "android:summary" to VIDEO_QUALITY_SUMMARY,
    ),
    // Carries NO `android:defaultValue`, deliberately. androidx persists a `SwitchPreference`'s XML
    // default the first time the row is bound, which would shadow the value the extension seeded
    // from the patch option; `CategoryRows` renders the *effective* state and performs the write
    // instead, exactly as it already does for the log gate.
    SWITCH to listOf(
        "android:key" to QUIC_ENABLED_KEY,
        "android:title" to QUIC_TITLE,
        "android:summary" to QUIC_SUMMARY,
    ),
    SWITCH to listOf(
        "android:key" to VERBOSE_LOGGING_KEY,
        "android:title" to VERBOSE_LOGGING_TITLE,
        // Off in the XML as well as in the extension: a build nobody has touched logs nothing.
        "android:defaultValue" to "false",
        "android:summary" to "Logs this port's diagnostics to logcat, for troubleshooting",
    ),
)

/** Every hub row's key, which is what makes the screen's edit idempotent (see [fillHubScreen]). */
private val HUB_ROW_KEYS: Set<String> = HUB_ROWS
    .flatMap { row -> row.second }
    .filter { attribute -> attribute.first == "android:key" }
    .map { attribute -> attribute.second }
    .toSet()

/**
 * Replaces the whole content of the SponsorBlock screen's preferences XML with the SponsorBlock
 * rows. The root element (and with it the resource id and the inflation path) stays the app's own.
 *
 * [categoryDefaults] is the patch's baked per-category behaviour. It becomes each row's
 * `android:defaultValue` on purpose: androidx's `ListPreference` *persists* its default the first
 * time it is bound, so a row whose XML default disagreed with the baked one would silently
 * overwrite the configured behaviour the moment the screen was opened.
 */
private fun fillSponsorBlockScreen(
    xml: File,
    categoryDefaults: Map<String, String>,
) = editXml(xml) { root ->
    if (root.getElementsByTagName("*").let { nodes ->
            (0 until nodes.length).any { index ->
                val element = nodes.item(index)
                element is Element && element.getAttribute("android:key") == SUBSCREEN_MASTER_KEY
            }
        }
    ) {
        return@editXml
    }
    while (root.firstChild != null) {
        root.removeChild(root.firstChild)
    }
    subScreenRows(categoryDefaults).forEach { row ->
        val element = root.ownerDocument.createElement(row.first)
        row.second.forEach { attribute -> element.setAttribute(attribute.first, attribute.second) }
        root.appendChild(element)
    }
}

private const val CATEGORY_LAYOUT = "@layout/settings_pref_title_with_divider"
private const val SWITCH = "androidx.preference.SwitchPreference"
private const val LIST = "androidx.preference.ListPreference"
private const val PLAIN = "androidx.preference.Preference"
private const val SEEK_BAR = "androidx.preference.SeekBarPreference"

private const val BEHAVIOUR_ENTRIES = "@array/ytvr_sb_behaviour_entries"
private const val BEHAVIOUR_VALUES = "@array/ytvr_sb_behaviour_values"
private const val HIGHLIGHT_ENTRIES = "@array/ytvr_sb_highlight_entries"
private const val HIGHLIGHT_VALUES = "@array/ytvr_sb_highlight_values"

/**
 * The pickers' key prefix. **Deliberately not the switches' old `ytvr_mod_cat_` prefix**: androidx's
 * `ListPreference` reads its own key with `getString`, and `SharedPreferencesImpl.getString` throws
 * `ClassCastException` when a Boolean is stored there -- which is exactly what the old per-category
 * switch left behind, so reusing the key made opening this screen crash for anyone who had ever
 * touched a category switch (verified: `Boolean cannot be cast to String` at
 * `ListPreference.h → Preference.t → SharedPreferencesImpl.getString`). The extension migrates the
 * old values into these keys, so nothing is lost.
 */
private const val BEHAVIOUR_KEY_PREFIX = "ytvr_mod_sb_behaviour_"

/**
 * The pickers' options, in the order the dialog shows them -- upstream's own order and wording,
 * `manual-skip` ("Show a Skip button") included now that the port has a button to offer: it is the
 * app's own skip-button card, shown while a segment the viewer has set to this behaviour is
 * playing. The values are the phone patch's `CategoryBehaviour` keys verbatim, so a settings
 * export/import round trip means the same thing on both.
 */
private val BEHAVIOUR_ENTRY_LABELS = listOf(
    "Skip automatically",
    "Skip automatically once",
    "Show a Skip button",
    "Show in seekbar only",
    "Disable",
)
private val BEHAVIOUR_ENTRY_VALUES =
    listOf("skip", "skip-once", "manual-skip", "seekbar-only", "ignore")

/**
 * Highlight is "the part most people are looking for", not a stretch to skip past, and upstream
 * refuses `skip-once` for it (its API rejects the value). Same shape here, so the export/import
 * round trip matches -- and its "Show a Skip button" reads "Skip to Highlight" in the player, which
 * is what a highlight is for.
 */
private val HIGHLIGHT_ENTRY_LABELS = listOf(
    "Skip automatically",
    "Show a Skip button",
    "Show in seekbar only",
    "Disable",
)
private val HIGHLIGHT_ENTRY_VALUES = listOf("skip", "manual-skip", "seekbar-only", "ignore")

/** The master switch, whose key doubles as the sub-screen's idempotence marker. */
private const val SUBSCREEN_MASTER_KEY = "ytvr_mod_sb_enabled"

private val CATEGORIES = listOf(
    "sponsor" to "Sponsor",
    "selfpromo" to "Unpaid / self-promotion",
    "interaction" to "Interaction reminder",
    "intro" to "Intro / intermission",
    "outro" to "Outro / endcards",
    "poi_highlight" to "Highlight",
    "preview" to "Preview / recap",
    "hook" to "Hook / greetings",
    "filler" to "Filler / tangent",
    "music_offtopic" to "Non-music section",
)

private fun subScreenRows(
    categoryDefaults: Map<String, String>,
): List<Pair<String, List<Pair<String, String>>>> = buildList {
    add(
        SWITCH to listOf(
            "android:title" to "SponsorBlock",
            "android:key" to SUBSCREEN_MASTER_KEY,
            "android:defaultValue" to "true",
            "android:summary" to "Skips crowd-sourced sponsor segments",
        ),
    )
    add(
        SWITCH to listOf(
            "android:title" to "Seek-bar markers",
            "android:key" to "ytvr_mod_sb_markers",
            "android:defaultValue" to "true",
            "android:summary" to "Shows the segment categories on the seek bar",
        ),
    )
    // The old global "Skip each segment only once" switch is gone: every category carries its own
    // behaviour now, which is what that switch was standing in for. The key is still read by the
    // extension so a choice made with it is not lost (see SponsorBlockSettings.behaviour).
    add(
        "PreferenceCategory" to listOf(
            "android:layout" to CATEGORY_LAYOUT,
            "android:title" to "Categories",
            "android:selectable" to "false",
        ),
    )
    for ((key, title) in CATEGORIES) {
        val highlight = key == "poi_highlight"
        add(
            LIST to listOf(
                "android:title" to title,
                "android:key" to BEHAVIOUR_KEY_PREFIX + key,
                "android:defaultValue" to rowDefault(categoryDefaults[key], highlight),
                "android:entries" to (if (highlight) HIGHLIGHT_ENTRIES else BEHAVIOUR_ENTRIES),
                "android:entryValues" to (if (highlight) HIGHLIGHT_VALUES else BEHAVIOUR_VALUES),
                // ListPreference replaces %s with the selected entry, so the row itself says what it
                // currently does -- the same "Skip automatically once" subtitle the phone patch shows.
                "android:summary" to "%s",
            ),
        )
    }
    // The two rows that are not per-category.
    //
    // "Stats" is display-only (`selectable=false`), and the extension writes its summary at bind
    // time -- a static XML summary could never show a running total.
    add(
        PLAIN to listOf(
            "android:title" to STATS_TITLE,
            "android:key" to STATS_KEY,
            "android:selectable" to "false",
        ),
    )
    // A plain SeekBarPreference on purpose: its `min`/`max`/`showSeekBarValue` are *app*-namespace
    // attributes, and injecting those would mean declaring another namespace inside the app's own
    // preference file. The range defaults to 0..100 and the extension writes the current value into
    // the summary at bind time instead, which reads better than the widget's own value label.
    add(
        SEEK_BAR to listOf(
            "android:title" to MIN_DURATION_TITLE,
            "android:key" to MIN_DURATION_KEY,
            "android:defaultValue" to "0",
        ),
    )
}

/** The rows' titles as the extension's row hook recognises them (see CategoryRows). */
private const val STATS_TITLE = "Stats"
private const val MIN_DURATION_TITLE = "Minimum segment duration"
private const val STATS_KEY = "ytvr_mod_sb_stats"
internal const val MIN_DURATION_KEY = "ytvr_mod_sb_min_duration"

/**
 * The baked behaviour as a row default that is one of that row's own entries. Every behaviour the
 * extension implements is now one of the entries, so the only coercion left is a `skip-once`
 * highlight (which upstream refuses and this row does not offer) falling back to `skip`, rather
 * than leaving the picker with a value it cannot display.
 */
private fun rowDefault(configured: String?, highlight: Boolean): String {
    val allowed = if (highlight) HIGHLIGHT_ENTRY_VALUES else BEHAVIOUR_ENTRY_VALUES
    if (configured != null && configured in allowed) {
        return configured
    }
    return allowed.first()
}

/**
 * Adds the pickers' `entries`/`entryValues` arrays to the tree's existing arrays file, beside the
 * SponsorBlock screen's XML. Idempotent by the first array's name, like every other edit here.
 */
private fun addBehaviourArrays(screenXml: File, categoryDefaults: Map<String, String>) {
    val resDir = screenXml.parentFile?.parentFile
        ?: throw PatchException("Patch settings: ${screenXml.absolutePath} has no res/ ancestor")
    val valuesDir = File(resDir, "values")
    val arraysFile = File(valuesDir, "arrays.xml")
    if (!arraysFile.exists()) {
        throw PatchException(
            "Patch settings: no ${arraysFile.absolutePath} to put the behaviour arrays in; the " +
                "category pickers would inflate without entries",
        )
    }
    // A guard, not a nicety: this is the one place where the patch assumes `poi_highlight` is a
    // category, and the arrays must line up with the rows element for element.
    check(CATEGORIES.any { it.first == "poi_highlight" }) {
        "Patch settings: the highlight category is missing, so its picker would share the " +
            "skip-once list upstream refuses for it"
    }
    check(categoryDefaults.isNotEmpty()) {
        "Patch settings: no per-category defaults were passed, so every picker would default to " +
            "the first entry (" + BEHAVIOUR_ENTRY_VALUES.first() + ") regardless of the options"
    }
    editXml(arraysFile) { root ->
        val existingNames = root.getElementsByTagName("string-array").let { nodes ->
            (0 until nodes.length).mapNotNull { index ->
                (nodes.item(index) as? Element)?.getAttribute("name")
            }
        }.toSet()
        // Per-name idempotence, not an early return: the arrays are two features' worth now, and a
        // decode reused from an older revision may have one set but not the other.
        val arrays = listOf(
            "ytvr_sb_behaviour_entries" to BEHAVIOUR_ENTRY_LABELS,
            "ytvr_sb_behaviour_values" to BEHAVIOUR_ENTRY_VALUES,
            "ytvr_sb_highlight_entries" to HIGHLIGHT_ENTRY_LABELS,
            "ytvr_sb_highlight_values" to HIGHLIGHT_ENTRY_VALUES,
        )
        for ((name, items) in arrays) {
            if (name in existingNames) {
                continue
            }
            val array = root.ownerDocument.createElement("string-array")
            array.setAttribute("name", name)
            for (item in items) {
                val entry = root.ownerDocument.createElement("item")
                entry.textContent = item
                array.appendChild(entry)
            }
            root.appendChild(array)
        }
    }
}

private fun Element.childElements(): List<Element> = (0 until childNodes.length).mapNotNull { index ->
    childNodes.item(index) as? Element
}
