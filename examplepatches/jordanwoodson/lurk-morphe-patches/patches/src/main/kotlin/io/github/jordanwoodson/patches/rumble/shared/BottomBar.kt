package io.github.jordanwoodson.patches.rumble.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import io.github.jordanwoodson.patches.shared.compose.skipLoopItems

// The bottom bar's content lambda, which loops over the tab list and draws one item per tab.
internal object BottomNavigationBarFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("\$this\$RumbleBottomNavigation"),
        string("com.rumble.battles.navigation.BottomNavigationBar.<anonymous> (", StringComparisonType.STARTS_WITH),
    ),
)

/**
 * Stops the bottom bar drawing the tab whose route is the Kotlin object [routeObjectName] while the switch
 * [key] is on. Other code refers to tabs by their position in the bar's fixed list, so the entry stays in the
 * list; the loop skips drawing it but still counts it.
 */
internal fun BytecodePatchContext.hideBottomTab(routeObjectName: String, key: String) {
    val route = kotlinObject(routeObjectName).substringBefore("->")
    val routeType = classDefBy(route).superclass ?: throw RUMBLE.error("$routeObjectName route has no superclass")
    skipLoopItems(RUMBLE, BottomNavigationBarFingerprint.single("bottom navigation bar").method, route, routeType, key)
}
