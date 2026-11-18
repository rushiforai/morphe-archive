package app.tomtom.patches.mypois

import app.morphe.patcher.Fingerprint

/**
 * The classes below are obfuscated by R8 and are only valid for TomTom GO 3.6.326.
 * Their roles (found by decompiling that version):
 *  - gc.b1:   the screen shown after tapping a point on the map or a search result (LocationPreviewScreen)
 *  - gc.P0:   the home screen, which shows the popup (Add to My Places / Use as Starting Point / ...) after a map tap
 *  - hc.G:    the "LaunchExternal" menu action (starts an Android intent from a menu item)
 *  - gc.B1$c: callback that receives the list of places when the My Places screen loads
 */

/** Builds the action buttons of the location preview screen: f1(DirectiveBar). */
object PreviewScreenDirectivesFingerprint : Fingerprint(
    definingClass = "Lgc/b1;",
    name = "f1",
    returnType = "V",
    parameters = listOf("Lx6/b;")
)

/** Builds the action buttons of the home screen, including the map popup's: f1(DirectiveBar). */
object HomeScreenDirectivesFingerprint : Fingerprint(
    definingClass = "Lgc/P0;",
    name = "f1",
    returnType = "V",
    parameters = listOf("Lx6/b;")
)

/** Receives the loaded My Places list: onLocationsRetrieved(List). */
object MyPlacesLoadedFingerprint : Fingerprint(
    definingClass = "Lgc/B1\$c;",
    name = "onLocationsRetrieved",
    returnType = "V",
    parameters = listOf("Ljava/util/List;")
)

/** Runs the "LaunchExternal" menu action: u(). It crashes on any link that is not an intent URI. */
object LaunchExternalFingerprint : Fingerprint(
    definingClass = "Lhc/G;",
    name = "u",
    returnType = "Z",
    parameters = listOf()
)
