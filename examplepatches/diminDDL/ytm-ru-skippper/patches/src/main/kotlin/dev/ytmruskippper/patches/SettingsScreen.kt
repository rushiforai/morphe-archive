package dev.ytmruskippper.patches

import app.morphe.patcher.patch.resourceFile

/**
 * The official Morphe Settings patch merges this file into Settings > Morphe while it finalizes,
 * then deletes it. That is how a separate bundle adds preferences to the Morphe screen.
 */
private const val ADD_ON_PREFERENCES = "morphe_addon_prefs.xml"
private const val ROOT_TAG = "morphe-add-on-preferences"
private const val MORPHE_PREFERENCES = "app.morphe.extension.shared.settings.preference"

/**
 * Declares the Settings > Morphe > Auto-skip screen. The keys match MorpheSettings.java,
 * which registers the settings the preferences read and write.
 */
internal fun addSettingsScreen() {
    val screen = element(
        "PreferenceScreen", "ytm_ru_skip_screen", "Auto-skip",
        category(
            "ytm_ru_skip_category_general", "General",
            switch(
                "ytm_ru_skip_enabled", "Enable auto-skip",
                on = "Tracks that match the rules below are skipped",
                off = "Tracks are not skipped",
            ),
            switch(
                "ytm_ru_skip_toast", "Show skip toast",
                on = "A toast names each skipped track and why",
                off = "Tracks are skipped silently",
            ),
            switch(
                "ytm_ru_skip_flags", "Show artist flags",
                on = "Now Playing shows a flag beside each artist, using MusicBrainz",
                off = "Now Playing shows artists without flags",
            ),
        ),
        category(
            "ytm_ru_skip_category_rules", "Rules",
            switch(
                "ytm_ru_skip_title_markers", "Skip russian titles",
                on = "Titles containing ы, э or ъ are skipped",
                off = "Titles are not checked for russian letters",
            ),
            switch(
                "ytm_ru_skip_keep_ukrainian", "Keep Ukrainian titles",
                on = "Titles containing і, ї, є or ґ are never skipped by country",
                off = "Ukrainian titles are checked like any other",
            ),
            switch(
                "ytm_ru_skip_country_lookup", "Skip by artist country",
                on = "Artists are looked up on MusicBrainz",
                off = "Artist countries are not checked",
            ),
            text(
                "ytm_ru_skip_blocked_countries", "Blocked countries",
                "Country codes, separated by commas. For example: RU, BY", inputType = "textCapCharacters",
            ),
        ),
        category(
            "ytm_ru_skip_category_lists", "Artist lists",
            text(
                "ytm_ru_skip_always_keep", "Never skip",
                "Artist names, one per line. Overrides every other rule", inputType = "textMultiLine",
            ),
            text(
                "ytm_ru_skip_always_skip", "Always skip",
                "Artist names, one per line, skipped regardless of country", inputType = "textMultiLine",
            ),
        ),
        category(
            "ytm_ru_skip_category_timing", "Timing",
            text(
                "ytm_ru_skip_delay_seconds", "Skip delay",
                "Seconds to play a matching track before skipping it (0 to 60)", inputType = "number",
            ),
            text(
                "ytm_ru_skip_lookup_window_seconds", "Country lookup time limit",
                "Seconds into a track after which a late country result no longer skips it (3 to 120)",
                inputType = "number",
            ),
        ),
    )
    // A <screen> without a key or "after" attribute is added to the root of Settings > Morphe.
    val declaration = "<screen>$screen</screen>"

    // Another add-on bundle may have declared its preferences already.
    val file = resourceFile(ADD_ON_PREFERENCES)
    val closingTag = "</$ROOT_TAG>"
    val existing = if (file.exists()) file.readText() else ""
    file.writeText(
        if (closingTag in existing) {
            existing.replace(closingTag, "$declaration$closingTag")
        } else {
            """<?xml version="1.0" encoding="utf-8"?>""" +
                """<$ROOT_TAG xmlns:android="http://schemas.android.com/apk/res/android">$declaration$closingTag"""
        }
    )
}

private fun category(key: String, title: String, vararg children: String) =
    element("PreferenceCategory", key, title, *children)

private fun switch(key: String, title: String, on: String, off: String) =
    element(
        "$MORPHE_PREFERENCES.BooleanSettingPreference", key, title,
        attributes = mapOf("summaryOn" to on, "summaryOff" to off),
    )

private fun text(key: String, title: String, summary: String, inputType: String) =
    element(
        "$MORPHE_PREFERENCES.ResettableEditTextPreference", key, title,
        attributes = mapOf("summary" to summary, "inputType" to inputType),
    )

private fun element(
    tag: String,
    key: String,
    title: String,
    vararg children: String,
    attributes: Map<String, String> = emptyMap(),
): String {
    val allAttributes = mapOf("key" to key, "title" to title) + attributes
    val attributeText = allAttributes.entries.joinToString("") { (name, value) ->
        """ android:$name="${escapeXml(value)}""""
    }
    return if (children.isEmpty()) "<$tag$attributeText/>"
    else "<$tag$attributeText>${children.joinToString("")}</$tag>"
}

private fun escapeXml(value: String) = value
    .replace("&", "&amp;")
    .replace("<", "&lt;")
    .replace(">", "&gt;")
    .replace("\"", "&quot;")
