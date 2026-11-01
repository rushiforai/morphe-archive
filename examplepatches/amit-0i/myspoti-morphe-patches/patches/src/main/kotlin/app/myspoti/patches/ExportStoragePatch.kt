package app.myspoti.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MYSPOTI_STABLE

private const val EXT = "Lapp/myspoti/extension/DownloadPatch;"
private const val DOWNLOAD_TOOLS_ACTIVITY = "app.myspoti.extension.DownloadToolsActivity"

/**
 * The extension bundle contributes DEX classes, not host-app manifest entries.
 * Register DownloadToolsActivity in Myspoti's actual APK manifest so Android can launch it.
 */
private val downloadToolsActivityManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val applications = manifest.getElementsByTagName("application")
            require(applications.length > 0) { "Myspoti AndroidManifest.xml has no <application> element" }
            val application = applications.item(0) as org.w3c.dom.Element

            val existingActivities = manifest.getElementsByTagName("activity")
            val alreadyDeclared = (0 until existingActivities.length).any { index ->
                val activity = existingActivities.item(index) as? org.w3c.dom.Element
                activity?.getAttribute("android:name") == DOWNLOAD_TOOLS_ACTIVITY
            }

            if (!alreadyDeclared) {
                val activity = manifest.createElement("activity").apply {
                    setAttribute("android:name", DOWNLOAD_TOOLS_ACTIVITY)
                    setAttribute("android:exported", "false")
                    setAttribute("android:label", "Export & storage")
                }
                application.appendChild(activity)
            }
        }
    }
}

/** Myspoti 2.2.0 stable release: these are the R8 names verified from the uploaded APK. */
private val applicationOnCreate = Fingerprint(
    definingClass = "Lapp/myspoti/MyspotiApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/app/Application;",
            name = "onCreate",
            returnType = "V",
        ),
    ),
)

private val applicationCollectionsRead = Fingerprint(
    definingClass = "Lapp/myspoti/MyspotiApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lic5;",
            name = "f",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;"),
        ),
    ),
)

private val offlineStoreLoad = Fingerprint(
    definingClass = "Lud5;",
    name = "k",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Ljava/io/File;"),
)

private val accountClaimLiveRoot = Fingerprint(
    definingClass = "Lcc5;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lx01;"),
    filters = listOf(
        string("offline"),
        methodCall(
            definingClass = "Ljava/io/File;",
            name = "<init>",
            returnType = "V",
            parameters = listOf("Ljava/io/File;", "Ljava/lang/String;"),
        ),
    ),
)

private val accountParkLiveRoot = Fingerprint(
    definingClass = "Lcc5;",
    name = "e",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lx01;"),
    filters = listOf(
        string("offline"),
        methodCall(
            definingClass = "Ljava/io/File;",
            name = "<init>",
            returnType = "V",
            parameters = listOf("Ljava/io/File;", "Ljava/lang/String;"),
        ),
    ),
)


// MySpoti 2.2.0 stable APK Settings navigation, verified from the supplied DEX:
// Lqs2.s is the SettingsPage switch and calls Lqs2.o only for SettingsPage.Downloads.
// This means the action is installed only on Settings > Downloads, not Library > Downloads.
private val settingsDownloadsPage = Fingerprint(
    definingClass = "Lqs2;",
    name = "o",
    returnType = "V",
    parameters = listOf("Lit0;", "I"),
    filters = listOf(
        methodCall(
            definingClass = "Lud5;",
            name = "r",
            returnType = "J",
        ),
        methodCall(
            definingClass = "Landroid/text/format/Formatter;",
            name = "formatShortFileSize",
            returnType = "Ljava/lang/String;",
            parameters = listOf("Landroid/content/Context;", "J"),
        ),
    ),
)

private val settingsPageRouter = Fingerprint(
    definingClass = "Lqs2;",
    name = "s",
    returnType = "V",
    parameters = listOf("Le65;", "Lit0;", "I"),
    filters = listOf(
        methodCall(
            definingClass = "Lqs2;",
            name = "o",
            returnType = "V",
            parameters = listOf("Lit0;", "I"),
        ),
    ),
)

context(_: BytecodePatchContext)
private fun applyMyspotiStorageHooks() {
    // OfflineStore.load(File) is staticized by R8. Its single File parameter is p0.
    // Replace that parameter before the original loader stores the root and scans indexes.
    offlineStoreLoad.method.addInstructions(
        0,
        """
            invoke-static {}, $EXT->storageRootNoArg()Ljava/io/File;
            move-result-object p0
        """.trimIndent(),
    )

    // Both account-switch routines inline File(filesDir, "offline"). In this APK's
    // coroutine state machines the Context and File receiver registers are stable:
    // claim = v12/v5, park = v13/v3. Replace only the just-created active root.
    accountClaimLiveRoot.method.addInstructions(
        accountClaimLiveRoot.instructionMatches.last().index + 1,
        """
            invoke-static {v12}, $EXT->storageRoot(Landroid/content/Context;)Ljava/io/File;
            move-result-object v5
        """.trimIndent(),
    )
    accountParkLiveRoot.method.addInstructions(
        accountParkLiveRoot.instructionMatches.last().index + 1,
        """
            invoke-static {v13}, $EXT->storageRoot(Landroid/content/Context;)Ljava/io/File;
            move-result-object v3
        """.trimIndent(),
    )

    // The application first reads collections.json from filesDir/offline. Repoint the
    // obfuscated OfflineCollections.file field and reload from the selected root after
    // that original read. Keep the app context available for storage helpers.
    applicationCollectionsRead.method.addInstructions(
        applicationCollectionsRead.instructionMatches.last().index + 1,
        """
            invoke-static/range {p0 .. p0}, $EXT->onAppReady(Landroid/content/Context;)V
        """.trimIndent(),
    )
    applicationOnCreate.method.addInstructions(
        applicationOnCreate.instructionMatches.first().index + 1,
        """
            invoke-static/range {p0 .. p0}, $EXT->install(Landroid/content/Context;)V
        """.trimIndent(),
    )


    // The parent SettingsPage router runs whenever the selected Settings subpage changes.
    // Clear the action first; the Downloads subpage below re-adds it only while selected.
    // This does not modify Le65 NavController methods (which caused ART VerifyError in
    // earlier builds); it hooks only MySpoti's own Settings composables.
    settingsPageRouter.method.addInstructions(
        0,
        """
            invoke-static {}, $EXT->hideSettingsAction()V
        """.trimIndent(),
    )

    settingsDownloadsPage.method.addInstructions(
        0,
        """
            invoke-static {}, $EXT->showForCurrentActivity()V
        """.trimIndent(),
    )

}

@Suppress("unused")
val myspotiExportStorageStable = bytecodePatch(
    name = "MySpoti Export & Storage",
    description = "Adds Export & storage to Settings > Downloads in Myspoti 2.2.0, with tagged audio exports, offline lyrics resolution/cache, portable LRC and JSON lyrics, embedded lyrics, playlist/album M3U8 manifests, reinstall restoration into native Downloads and lyrics caches, shared track files and offline storage migration.",
    default = true,
) {
    compatibleWith(MYSPOTI_STABLE)
    dependsOn(downloadToolsActivityManifestPatch)
    extendWith("extensions/extension.mpe")
    execute { applyMyspotiStorageHooks() }
}
