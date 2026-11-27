// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.reseam.patch.PatchRuntime
import app.reseam.patch.Type
import app.reseam.patch.XmlDocument
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.methods
import app.reseam.patch.points

internal const val ULTRA_XML = "cat_ultra"
internal const val SETTINGS_XML = "cat_root"
private const val CLOUD_SHORTCUT = "ultra_cloud"
internal const val SUBSCRIBER_SECTION = "ultra_cloud_section"
internal const val GUEST_SECTION = "ultra_perks"
internal const val TRANSLATE = "ultra_translate"
private const val SUMMARY = "android:summary"
private const val CATEGORY_TITLE = "app:categoryTitle"
private const val INFO_TITLE = "app:categoryInfoTitle"

internal val ultraSettings = methods("Set up the Ultra settings page") {
    strings("ultra_removed", TRANSLATE, "ultra_manage_preference")
    flags(AccessFlags.PRIVATE)
    params()
    returns(Type.Void)
}.single()

internal fun PatchRuntime.resolveCloudBackupShortcutEdit(): () -> Unit {
    val start = ultraSettings.points("Find the Ultra cloud backup shortcut key") {
        string(CLOUD_SHORTCUT)
    }.single().index
    val registration = ultraSettings.points("Register the Ultra cloud backup shortcut") {
        string(CLOUD_SHORTCUT)
        then {
            invokeVirtual {
                params("java.lang.CharSequence")
                returns(PREFERENCE)
            }
            argument(1) { string(CLOUD_SHORTCUT) }
        }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
        then { opcode(Opcode.NEW_INSTANCE) }
        then {
            invokeDirect {
                name("<init>")
                params(ultraSettings.owner)
                returns(Type.Void)
            }
        }
        then {
            invokeVirtual {
                owner(PREFERENCE)
                params(CLICK_LISTENER)
                returns(Type.Void)
            }
            argument(0) { resultOf(PREFERENCE) }
        }
    }.single()
    val count = registration.index - start + 1
    check(count == 6) { "Unexpected Ultra cloud backup shortcut registration" }
    val method = ultraSettings.method

    return { method.removeInstructions(start, count) }
}

internal fun XmlDocument.resolveUltraSettingsLayoutEdits(): () -> Unit {
    check(root.tag == "PreferenceScreen") { "Unexpected $ULTRA_XML root" }
    listOf(SUBSCRIBER_SECTION, GUEST_SECTION).forEach { key ->
        val section = requirePreference(ULTRA_XML, key, "PreferenceCategory")
        check(section.parent?.tag == "PreferenceScreen") { "Unexpected $key section in $ULTRA_XML" }
    }
    fun row(key: String, section: String, oldSummary: String) =
        requirePreference(ULTRA_XML, key, SYNC_PREFERENCE).also {
            check(it.parent?.get(KEY) == section && it.children.isEmpty() && it[SUMMARY] == oldSummary) {
                "Unexpected $key row in $ULTRA_XML"
            }
        }

    val shortcut = row(CLOUD_SHORTCUT, SUBSCRIBER_SECTION, "Backup and restore settings per-account to the cloud")
    val perk = row("ultra_disabled_cloud", GUEST_SECTION, "Backup setting to the cloud and share across devices")
    val paints = listOf(
        row("ultra_paint", SUBSCRIBER_SECTION, "Highlight users with custom colors and built-in automatic cloud-sync"),
        row("ultra_disabled_paint", GUEST_SECTION, "Tag users with custom colors and automatically sync across devices"),
    )
    val tags = listOf(
        row("ultra_tag", SUBSCRIBER_SECTION, "Tag users with custom text and built-in automatic cloud-sync"),
        row("ultra_disabled_tag", GUEST_SECTION, "Tag users with custom tags and automatically sync across devices"),
    )
    val header = requireElement(ULTRA_XML, CATEGORY_TITLE, "Cloud services", CATEGORY_HEADER)
    check(header.parent?.get(KEY) == SUBSCRIBER_SECTION) { "Unexpected Cloud services header in $ULTRA_XML" }
    val cloudTerms = requireElement(
        ULTRA_XML,
        INFO_TITLE,
        "Cloud backups are available for the duration of your subscription and will be automatically removed " +
            "when your subscription expires. Backups can also be manually removed from the backups page of the settings.",
        INFO_HEADER,
    )
    val terms = cloudTerms.parent
    check(
        terms?.tag == "PreferenceCategory" && terms.parent?.tag == "PreferenceScreen" &&
            terms.children.count { it.tag == CATEGORY_HEADER && it[CATEGORY_TITLE] == "Terms and conditions" } == 1 &&
            cloudTerms.children.isEmpty()
    ) { "Unexpected cloud backup terms in $ULTRA_XML" }

    return {
        shortcut.remove()
        perk.remove()
        cloudTerms.remove()
        header[CATEGORY_TITLE] = "On this device"
        paints.forEach { it[SUMMARY] = "Highlight users with colors saved on this device" }
        tags.forEach { it[SUMMARY] = "Add custom tags saved on this device" }
    }
}

internal fun XmlDocument.resolveUltraEntryEdit(): () -> Unit {
    check(root.tag == "PreferenceScreen") { "Unexpected $SETTINGS_XML root" }
    val entry = requireElement(
        SETTINGS_XML,
        SUMMARY,
        "Website previews, cloud backup, translation & more",
        "com.laurencedawson.reddit_sync.ui.preferences.custom.RootPreference",
    )
    val parent = entry.parent
    check(
        entry["android:title"] == "Sync Ultra" && entry.children.isEmpty() &&
            parent?.tag == "PreferenceCategory" && parent[KEY] == "ultra_wrapper" &&
            parent.parent?.tag == "PreferenceScreen"
    ) { "Unexpected Sync Ultra entry in $SETTINGS_XML" }

    return { entry[SUMMARY] = "Translation & more" }
}
