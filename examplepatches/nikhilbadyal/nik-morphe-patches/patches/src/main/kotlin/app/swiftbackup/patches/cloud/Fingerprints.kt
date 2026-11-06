package app.swiftbackup.patches.cloud

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

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


