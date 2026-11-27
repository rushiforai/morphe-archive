// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.reseam.patch.PatchRuntime
import app.reseam.patch.Type
import app.reseam.patch.alwaysReturn
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.klass
import app.reseam.patch.methods
import app.reseam.patch.points

private const val RESTORE_FLAG = "ultra_restore"
private const val RESTORE_PREFERENCE = "ultra_removed"

private val commentRestoreEnabled = methods("Read the comment restore flag") {
    strings("RemoteConfigHelper", RESTORE_FLAG)
    flags(AccessFlags.PUBLIC or AccessFlags.STATIC)
    params()
    returns(Type.Boolean)
    calls {
        owner("android.content.SharedPreferences")
        name("getBoolean")
        params(Type.String, Type.Boolean)
        returns(Type.Boolean)
    }
}.single()

private val commentOptions = methods("Build comment options") {
    strings("Restore comment", "[removed]", "[deleted]", "Read aloud")
    params()
    returns(Type.Void)
}.single()

private val logUpdatedConfig = methods("Log the updated comment restore flag") {
    strings(RESTORE_FLAG, "Restore value updated: ")
    flags(AccessFlags.STATIC)
    params("com.google.firebase.remoteconfig.FirebaseRemoteConfig", "com.google.android.gms.tasks.Task")
    returns(Type.Void)
}.single()

private val settingsSearch = klass("Settings search") {
    sourceFile("SearchPreferencesFragment.java")
    hasInstanceField("java.util.ArrayList")
    strings("ultra_disabled")
}

internal val indexablePreference = methods("Check whether a preference belongs in Settings Search") {
    inClass(settingsSearch)
    strings("ultra_", "ultra_disabled")
    flags(AccessFlags.PRIVATE)
    params(Type.String)
    returns(Type.Boolean)
}.single()

private val indexPreferences = methods("Index settings from a preference layout") {
    inClass(settingsSearch)
    params(Type.Int, "java.util.ArrayList")
    returns(Type.Void)
    calls(indexablePreference)
}.single()

internal fun PatchRuntime.resolveCommentRestoreEdit(): () -> Unit {
    val expectedCallers = listOf(commentOptions, ultraSettings, logUpdatedConfig)
    expectedCallers.forEach { caller ->
        caller.points("Read the comment restore flag once") { calls(commentRestoreEnabled) }.single()
    }
    val callers = methods("Callers of the comment restore flag") { calls(commentRestoreEnabled) }.all
    check(callers.map { it.descriptor }.toSet() == expectedCallers.map { it.descriptor }.toSet()) {
        "Unexpected callers of the comment restore flag"
    }
    val searchChecks = indexPreferences.points("Check a preference or its child before indexing") {
        calls(indexablePreference)
    }.all
    check(searchChecks.size == 2) { "Expected two Settings Search filter calls, found ${searchChecks.size}" }

    return {
        // This flag controls the menu action and Ultra settings. Search indexes the layout independently.
        commentRestoreEnabled.alwaysReturn(false)
        indexablePreference.before {
            whenTrue(string(RESTORE_PREFERENCE).callVirtual(Type.String, "equals", "(Ljava/lang/Object;)Z", param(0))) {
                returnFalse()
            }
        }
    }
}
