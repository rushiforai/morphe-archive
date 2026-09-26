/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.datastore

import app.morphe.patcher.patch.bytecodePatch

private const val RIDE_LOG = "Lapp/morphe/ather/RideLog;"
private const val SCOOTERS = "Lcom/ather/common/datastore/models/ScooterShadow\$Scooters;"
private const val MARKER_FIELD = "$SCOOTERS->users:Ljava/util/Map;"

/**
 * Surfaces the notifications the server pushes on the scooter shadow.
 *
 * The app writes the shadow field by field and stores `users` last, right before each
 * constructor returns. The vehicle log receives the finished object there and turns
 * the pushed track alerts into local notifications, which keeps them working without
 * the app in the foreground.
 *
 * The class is obfuscated, so the marker field identifies the class and the write
 * sites instead of a method signature. Three constructors end on that field: the
 * synthetic one the serialiser uses and the two the app calls directly.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * iput-object p15, p0, Lcom/ather/common/datastore/models/ScooterShadow$Scooters;->users:Ljava/util/Map;
 *
 * invoke-static {p0}, Lapp/morphe/ather/RideLog;->onScooters(Ljava/lang/Object;)V
 *
 * return-void
 * ```
 */
@Suppress("unused")
val localNotificationsPatch = bytecodePatch(
    name = "Local notifications",
    description = "Turns the track alerts the app receives into local notifications.",
) {
    compatibleWith("com.athermobileapp")

    extendWith("extensions/ather.mpe")

    execute {
        val smali = "invoke-static {p0}, $RIDE_LOG->onScooters(Ljava/lang/Object;)V"

        val patched = mutableClassDefBy(SCOOTERS).methods.sumOf { method ->
            method.injectBeforeMarkerReturns(MARKER_FIELD, smali)
        }

        if (patched == 0) {
            throw IllegalStateException("Scooter shadow constructors do not write $MARKER_FIELD.")
        }
    }
}
