package app.template.patches.amberit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * AmberIT (com.amberit.dialer) 1.3.2, versionCode 103021.
 *
 * AmberIT is a white-label REVE ITEL Mobile Dialer. It refuses to start
 * unless it can read the device location, because the location is sent to
 * the backend so the server can decide which country the user is in:
 *
 *   BaseComponentActivity.onResume
 *     -> handleGpsDetection()
 *        -> hb4.f()                     "should show GPS restriction dialog"
 *        -> registerForGPSService()     -> hb4.b(ctx).c() -> LocationManager
 *        -> BaseComponentActivity.l()   -> permission check + GPS dialog
 *
 * If the country comes back as anything other than the licensed one the
 * app shows "Dear user, this app will work only in Bangladesh." and blocks
 * the UI. If the location permission is missing it shows a blocking
 * permission dialog instead. Both dialogs have no "continue" button.
 *
 * The two gates below are the client-side half of that check. Neither
 * fingerprint depends on the backend: they only decide whether the app
 * *asks* for location, not whether the server accepts the account.
 *
 * NOTE on obfuscation: the app is R8-obfuscated, so hb4, f(), k, x are
 * single-letter names that will almost certainly change between releases.
 * Both fingerprints are therefore pinned to their full defining class,
 * method name, return type and parameter list, and also match on the
 * distinctive string constants inside each body. If a future AmberIT
 * release renames or reshapes these methods the patch fails to match and
 * refuses to apply instead of corrupting the app.
 */

/**
 * Lhb4;.f()Z -- "should show GPS restriction dialog".
 *
 * Original:
 *   sget-boolean v0, Lhb4;->k:Z
 *   invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
 *   ...
 *   const-string v1, "gpsCountryDetected %s"
 *   invoke-static {v1, v0}, Lcom/revesoft/logger/Timber;->d(...)V
 *   sget-boolean v0, Lup3;->x:Z
 *   if-eqz v0, :cond_0
 *   sget-boolean v0, Lhb4;->k:Z
 *   if-nez v0, :cond_0
 *   const/4 v0, 0x1
 *   return v0
 *   :cond_0
 *   const/4 v0, 0x0
 *   return v0
 *
 * It is the single chokepoint for the whole app: every GPS gate in the
 * codebase (base activities, the dashboard, the push handler, the chat
 * window) reads hb4.f() instead of hb4.k directly. Forcing it to return
 * false disables the restriction dialog everywhere at once.
 *
 * The "gpsCountryDetected %s" log string is unique to this method and is
 * what identifies it, since the class/method names are obfuscated.
 */
object AmberItGpsRestrictionFingerprint : Fingerprint(
    definingClass = "Lhb4;",
    name = "f",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_BOOLEAN,
            definingClass = "Lhb4;",
            name = "k",
            type = "Z",
        ),
        string("gpsCountryDetected %s"),
    )
)

/**
 * LhasLocationPermissionKt;.hasLocationPermission(Landroid/content/Context;)Z
 *
 * This one is NOT obfuscated -- it is a Kotlin file facade, so the name is
 * stable. It is used by the in-chat "share location" feature (the chat map
 * fragment), which is separate from the startup gate above.
 *
 * Original:
 *   invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
 *   const-string v0, "android.permission.ACCESS_COARSE_LOCATION"
 *   invoke-static {p0, v0}, Lc62;->checkSelfPermission(...)I
 *   move-result v0
 *   if-nez v0, :cond_0
 *   const-string v0, "android.permission.ACCESS_FINE_LOCATION"
 *   invoke-static {p0, v0}, Lc62;->checkSelfPermission(...)I
 *   move-result p0
 *   if-nez p0, :cond_0
 *   const/4 p0, 0x1
 *   return p0
 *   :cond_0
 *   const/4 p0, 0x0
 *   return p0
 *
 * Note it requires BOTH coarse AND fine -- returning only "Approximate"
 * location (coarse) counts as denied here. Forcing it to true means the
 * chat location feature never pops a permission prompt of its own.
 */
object AmberItLocationPermissionFingerprint : Fingerprint(
    definingClass = "Lcom/reve/base/im/chat_window/bottom_fragments/map/HasLocationPermissionKt;",
    name = "hasLocationPermission",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("android.permission.ACCESS_COARSE_LOCATION"),
        string("android.permission.ACCESS_FINE_LOCATION"),
        methodCall(
            name = "checkSelfPermission",
            parameters = listOf("L", "L"),
            returnType = "I",
        ),
    )
)
