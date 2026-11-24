package app.fluffy.patches.galaxymaxhz

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall

/**
 * Hash feeder (t0/c1.e1 on 9.2.0x and 9.2.1x): the static (Context, long) ->
 * long wrapper that stores the caller-supplied expected hash into a GmhApp
 * long field and then hashes the installed APK through yf/a. Pinned by the
 * yf/a.a call and signature; the stored-hash field is read from the original
 * body at patch time (it moved between x and y across the two versions).
 */
object ApkHashFeederFingerprint : Fingerprint(
    isStatic = true,
    returnType = "J",
    parameters = listOf("Landroid/content/Context;", "J"),
    filters = listOf(
        methodCall(definingClass = "Lyf/a;", name = "a"),
    ),
)

/**
 * Licence-info builder (t0/c1.f1): wraps the native f export and returns the
 * SeslUtil licence object. Same signature on both supported versions; the
 * only caller of t0/c1.f.
 */
object LicenseInfoBuilderFingerprint : Fingerprint(
    returnType = "Landroidx/appcompat/util/SeslUtil;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/Long;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "I",
    ),
    filters = listOf(
        methodCall(definingClass = "Lt0/c1;", name = "f"),
    ),
)

/** Verdict wrapper (t0/c1.g1): the only caller of the native g export. */
object VerdictGFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/Long;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        methodCall(definingClass = "Lt0/c1;", name = "g"),
    ),
)

/** Verdict wrapper (t0/c1.h1): the only caller of the native h export. */
object VerdictHFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/Integer;"),
    filters = listOf(
        methodCall(definingClass = "Lt0/c1;", name = "h"),
    ),
)

/**
 * Signed-request launcher (ka/e.b): the single choke point every licence,
 * config and update request goes through. Constructs the jf/o coroutine and
 * dispatches it with c0.F. The request-data parameter is R8-renamed between
 * versions (Lia/l9 -> Lia/m9), so the fingerprint pins the call structure
 * instead of the parameter types.
 */
object SignedRequestLauncherFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(definingClass = "Ljf/o;", name = "<init>"),
        methodCall(definingClass = "Lef/c0;", name = "F"),
    ),
)

/**
 * Profile-table call site (fc/b.s): the only call of the native z export,
 * which receives the bundled profile table's raw resource id. Located so the
 * read can happen in Java against that same resource.
 */
object RemoteProfilesCallFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(definingClass = "Lt0/c1;", name = "z"),
    ),
)

/**
 * Profile-config fetcher (pa/e.q): reads the profilesLoader's executor field
 * pa/h.e, awaits the pending-request flow, then calls the signed-request
 * launcher with request type 6. Same shape on both supported versions.
 */
object ProfileConfigFetcherFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(definingClass = "Lpa/h;", name = "e"),
        methodCall(definingClass = "Lhf/m;", name = "j"),
        methodCall(definingClass = "Lka/e;", name = "b"),
    ),
)

/**
 * Licence refresh (yf/b.q): the only caller of the yf/c executor accessor,
 * then awaits its own pending-request field and calls the signed-request
 * launcher with request type 2.
 */
object LicenseRefreshFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(definingClass = "Lyf/c;", name = "c"),
        methodCall(definingClass = "Lka/e;", name = "b"),
    ),
)

/**
 * Loading gate (x5/e.R): clears the loading state only when the stored
 * native hash matches the runtime Adler-32 of the installed dex. The two
 * GmhApp hash fields swap names between versions, but the runtime-hash
 * field y is read by this gate on both.
 */
object LoadingGateFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        fieldAccess(definingClass = "Lcom/tribalfs/gmh/application/GmhApp;", name = "y"),
    ),
)
