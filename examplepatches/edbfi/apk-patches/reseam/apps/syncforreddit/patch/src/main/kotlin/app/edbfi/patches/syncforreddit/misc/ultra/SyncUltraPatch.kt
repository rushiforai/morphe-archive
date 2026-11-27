// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.XmlDocument
import app.reseam.patch.alwaysReturn
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.methods
import app.reseam.patch.patch
import app.reseam.patch.points

private const val BACKUP_XML = "cat_backup"
internal const val KEY = "android:key"
internal const val PREFERENCE = "Landroidx/preference/Preference;"
// Sync's build obfuscates the AndroidX preference click listener interface.
internal const val CLICK_LISTENER = "Landroidx/preference/Preference\$d;"
internal const val SYNC_PREFERENCE = "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncPreference"
internal const val CATEGORY_HEADER = "com.laurencedawson.reddit_sync.ui.preferences.defaults.CategoryHeaderPreference"
internal const val INFO_HEADER = "com.laurencedawson.reddit_sync.ui.preferences.CategoryInfoHeaderPreference"
private const val DIVIDER = "com.laurencedawson.reddit_sync.ui.preferences.custom.DividerPreference"

private val localActions = listOf("backup_dir", "backup_all", "backup_restore")
private val cloudActions = listOf("ultra_backup_all", "ultra_backup_restore", "ultra_backup_delete")

private val configureBackup = methods("Configure backup preferences") {
    strings(*(localActions + cloudActions + "ultra_backup_divider").toTypedArray())
    params("android.os.Bundle", Type.String)
    returns(Type.Void)
    flags(AccessFlags.PUBLIC)
}.single()

private val refreshCloudBackup = methods("Refresh cloud backup availability") {
    strings("backupExistsCallable", "ultra_backup_restore", "ultra_backup_delete")
    params()
    returns(Type.Void)
    flags(AccessFlags.PRIVATE)
    calls {
        owner("com.google.firebase.functions.HttpsCallableReference")
        params("java.lang.Object")
        returns("com.google.android.gms.tasks.Task")
    }
}.single()

internal fun XmlDocument.requirePreference(layout: String, key: String, tag: String) =
    requireElement(layout, KEY, key, tag)

internal fun XmlDocument.requireElement(layout: String, attribute: String, value: String, tag: String) =
    checkNotNull(findByAttribute(attribute, value).singleOrNull()) {
        "Expected one element with $attribute=$value in $layout"
    }.also {
        check(it.tag == tag) { "Expected $attribute=$value to be a $tag in $layout" }
    }

private fun XmlDocument.resolveBackupLayoutEdits(): () -> Unit {
    check(root.tag == "PreferenceScreen") { "Unexpected $BACKUP_XML root" }
    val category = requirePreference(BACKUP_XML, "ultra_backup", "PreferenceCategory")
    val divider = requirePreference(BACKUP_XML, "ultra_backup_divider", DIVIDER)
    check(listOf(category, divider).all { it.parent?.tag == "PreferenceScreen" } && divider.children.isEmpty()) {
        "Unexpected cloud backup layout"
    }
    val expectedChildren = listOf(
        CATEGORY_HEADER to null,
        INFO_HEADER to null,
    ) + cloudActions.map { SYNC_PREFERENCE to it }
    check(category.children.map { it.tag to it[KEY] } == expectedChildren) {
        "Unexpected preferences in the cloud backup category"
    }
    cloudActions.forEach { requirePreference(BACKUP_XML, it, SYNC_PREFERENCE) }
    localActions.forEach { key ->
        val action = requirePreference(BACKUP_XML, key, SYNC_PREFERENCE)
        val parent = action.parent
        check(
            parent?.tag == "PreferenceCategory" && parent[KEY] == null &&
                parent.parent?.tag == "PreferenceScreen"
        ) { "Expected $key in a local backup category" }
    }
    return {
        category.remove()
        divider.remove()
    }
}

val syncUltra = patch(SyncPatchStrings.fixWebsitePreviewsAndBackup) {
    description(SyncPatchStrings.fixWebsitePreviewsAndBackupDescription)
    compatibleWith(syncForReddit)

    execute {
        val backupXmlId = checkNotNull(resources.id("xml", BACKUP_XML)) { "Missing $BACKUP_XML" }
        check(resources.paths("xml", BACKUP_XML).size == 1) { "Multiple $BACKUP_XML layouts" }
        val inflateBackup = configureBackup.points("Inflate the backup preferences") {
            invokeVirtual {
                params(Type.Int)
                returns(Type.Void)
            }
            argument(1) { literal(backupXmlId.toLong()) }
        }.single()
        val localListeners = localActions.map { key ->
            configureBackup.points("Register the $key listener") {
                string(key)
                then {
                    invokeVirtual {
                        params("java.lang.CharSequence")
                        returns(PREFERENCE)
                    }
                    argument(1) { string(key) }
                }
                then { opcode(Opcode.MOVE_RESULT_OBJECT) }
                then { opcode(Opcode.NEW_INSTANCE) }
                then {
                    invokeDirect {
                        name("<init>")
                        params(configureBackup.owner)
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
            }.single().index
        }
        val cloudSetup = configureBackup.points("Start configuring cloud backup") {
            string(cloudActions.first())
        }.single()
        val statusCall = configureBackup.points("Check for a cloud backup") {
            calls(refreshCloudBackup)
        }.single()
        val setupOrder = listOf(inflateBackup.index) + localListeners + listOf(cloudSetup.index, statusCall.index)
        check(refreshCloudBackup.owner == configureBackup.owner && setupOrder.zipWithNext().all { (a, b) -> a < b }) {
            "Unexpected backup preference setup order"
        }

        val applyWebsitePreviews = resolveWebsitePreviewEdits()
        val hideCommentRestore = resolveCommentRestoreEdit()
        val keepUserAnnotationsLocal = resolveUserAnnotationEdits()
        val addAuthorColors = resolveAuthorColorEdits()
        val removeCloudBackupShortcut = resolveCloudBackupShortcutEdit()
        val removeUltraPreviewVisibility = resolveUltraPreviewVisibilityEdit()
        val enableImageText = resolveImageTextEdits()
        val enableTranslation = resolveTranslationEdits()

        listOf(ULTRA_XML, SETTINGS_XML, LINKS_XML).forEach { layout ->
            check(resources.paths("xml", layout).size == 1) { "Expected one $layout layout" }
        }
        resources.xml("xml", BACKUP_XML).use { backup ->
            resources.xml("xml", ULTRA_XML).use { ultra ->
                resources.xml("xml", SETTINGS_XML).use { settings ->
                    resources.xml("xml", LINKS_XML).use { links ->
                        val removeCloudBackup = backup.resolveBackupLayoutEdits()
                        val updateUltraSettings = ultra.resolveUltraSettingsLayoutEdits()
                        val addAuthorColorSettings = ultra.resolveAuthorColorSettingsEdit()
                        val updateUltraEntry = settings.resolveUltraEntryEdit()
                        val moveWebsitePreviewSettings = ultra.resolveWebsitePreviewSettingsEdit(links)
                        val updateTranslationSettings = ultra.resolveTranslationSettingsLayoutEdit()
                        moveWebsitePreviewSettings()
                        removeCloudBackup()
                        updateUltraSettings()
                        addAuthorColorSettings()
                        updateUltraEntry()
                        updateTranslationSettings()
                    }
                }
            }
        }
        // The shortcut uses a saved instruction index. Remove it before the visibility edit shifts that index.
        removeCloudBackupShortcut()
        removeUltraPreviewVisibility()
        cloudSetup.before { returnVoid() }
        // The backup status event also calls this method after the screen has been created.
        refreshCloudBackup.alwaysReturn()
        applyWebsitePreviews()
        hideCommentRestore()
        keepUserAnnotationsLocal()
        addAuthorColors()
        enableImageText()
        enableTranslation()
    }
}
