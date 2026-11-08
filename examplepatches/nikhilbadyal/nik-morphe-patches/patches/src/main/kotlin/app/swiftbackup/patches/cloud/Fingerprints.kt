package app.swiftbackup.patches.cloud

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/** The 5.1.0 repository loads the blacklist on demand during onboarding. */
object BlacklistFetchFingerprint : Fingerprint(
    definingClass = "Lgs0;",
    name = "b",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(string("Fetching on demand"))
)

/** Signed-in edits otherwise replace the entire blacklist through the stock Firebase writer. */
object BlacklistSaveFingerprint : Fingerprint(
    definingClass = "Lgs0;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lorg/swiftapps/swiftbackup/blacklist/data/BlacklistData;", "Z"),
    filters = listOf(string("blacklistApps"))
)

/** The single-app removal listener still has the actual removed app before constructing the list. */
object BlacklistRemoveFingerprint : Fingerprint(
    definingClass = "Lns0;",
    name = "j",
    returnType = "V",
    parameters = listOf("Lorg/swiftapps/swiftbackup/blacklist/data/BlacklistApp;", "Ljava/util/ArrayList;")
)

/** Both manual settings import and cloud settings restore invoke the same native importer. */
object BlacklistImportFingerprint : Fingerprint(
    definingClass = "Lorg/swiftapps/swiftbackup/settings/SwiftBackupSettingsHelper\$SettingsData;",
    name = "restore",
    returnType = "V",
    parameters = listOf()
)

/**
 * wz5.e(action, path, data, hash, callback): PersistentConnection.putInternal — the single outgoing
 * write (setValue "p", updateChildren "m", transaction compare-and-put all funnel through it).
 * Firebase SDK is R8-obfuscated; names are pinned to 5.1.0.
 */
object PersistentConnectionPutFingerprint : Fingerprint(
    definingClass = "Lwz5;",
    name = "e",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/ArrayList;",
        "Ljava/lang/Object;",
        "Ljava/lang/String;",
        "Lcl6;"
    )
)

/**
 * w8.run(): shared R8 runnable whose Repo branch is Repo.deferredInitialization (creates the
 * connection + both sync trees, restores persisted writes, resets .info/connected).
 * Pinned by a string unique to that branch.
 */
object RepoDeferredInitFingerprint : Fingerprint(
    name = "run",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("Write ids were not in order.")
    )
)

/**
 * Pins ua1.q(eb2) -> ji: the snapshot-to-app mapper used exclusively by CloudAppsRepo.
 * We identify the method by its signature and calls to AppCloudBackups.fromSnapshot
 * and ji.fromCloudBackups, avoiding brittle reliance on the obfuscated class name (ua1)
 * while targeting the single method where cloud backups are filtered against blacklist
 * and system-app display rules.
 */
object CloudAppsFilterFingerprint : Fingerprint(
    returnType = "Lji;",
    parameters = listOf("Leb2;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        methodCall(
            definingClass = "Lorg/swiftapps/swiftbackup/model/app/AppCloudBackups\$a;",
            name = "fromSnapshot"
        ),
        methodCall(
            definingClass = "Lji\$a;",
            name = "fromCloudBackups"
        )
    )
)

/**
 * Pinned by return type WifiCloudDetails and string filters "wifi" and "WifiHelper".
 * Targets us8.c(): the static Firebase lookup for cloud WiFi backup details.
 */
object WifiCloudDetailsLookupFingerprint : Fingerprint(
    returnType = "Lorg/swiftapps/swiftbackup/model/firebase/WifiCloudDetails;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    filters = listOf(
        string("wifi"),
        string("WifiHelper")
    )
)


