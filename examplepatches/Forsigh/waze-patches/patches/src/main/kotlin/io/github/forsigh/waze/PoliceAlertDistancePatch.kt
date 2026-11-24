package io.github.forsigh.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Alert distances — one row, one gear: a level for the whole family of alert distances, or set
 * the row below sets each distance yourself. All nine keys are Long (com/waze/config/c), values in
 * meters. Standard writes nothing at all; Moderate and Heavier use the enlarged tables.
 *
 * The numbers are written twice on purpose: into the Java config getter, and into Waze's native
 * config store on every config sync (`setConfigValueLong`). The alert engine takes its policy from
 * the native store, so the getter alone applied cleanly and changed nothing on device - the bug
 * behind issue #24. The row is off by default because a level has to be chosen for it to do
 * anything. Waze's time-based trigger window is switched off for Moderate and Heavier instead of
 * being scaled: with it on, an alert only appears as far ahead as the car drives in 22 s (30 s for
 * police), so a wide distance is never reached. bearinmindcat/morphe-patches reached the same
 * conclusion in its issue #157.
 *
 * PROVENANCE: the finer key set and the Custom table ported from bearinmindcat/morphe-patches
 * (GPLv3, release v2.5.5) - see `CREDITS.md`.
 */
@Suppress("unused")
val policeAlertDistancePatch = bytecodePatch(
    name = "Alert distances",
    description = "How early alerts sound, plus a speed-bump switch and per-alert distances. Pick a level; Standard changes nothing.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Map & Alerts")

    // The emitter patch is what actually writes the keys recorded below. Depending on it means this
    // patch can be ticked alone and still produce a build where the override exists — without the
    // dependency the key is collected and never written, which looks exactly like a working patch.
    dependsOn(configOverridesPatch)

    val level by stringOption(
        "level", "Moderate",
        mapOf(
            "Standard (1x)" to "Standard",
            "Moderate (about 1.5x)" to "Moderate",
            "Heavier (about 2.5x)" to "Heavier",
        ),
        title = "Alert distance level",
        description = "Moderate warns about 1.5x earlier, Heavier about 2.5x. Standard writes Waze's own numbers back, i.e. changes nothing.",
    )

    val bumps by booleanOption(
        "bumps", false,
        title = "Speed bump (ramp) warnings",
        description = "Waze nags about speed bumps ahead. Off silences them; stock is on.",
    )

    val police by intOption(key = "police", default = 0, title = "Police", description = "0 = keep the preset, Standard 600 m.")
    val hazard by intOption(key = "hazard", default = 0, title = "Hazards", description = "0 = keep the preset, Standard 600 m.")
    val accident by intOption(key = "accident", default = 0, title = "Crashes", description = "0 = keep the preset, Standard 600 m.")
    val traffic by intOption(key = "traffic", default = 0, title = "Traffic jams", description = "0 = keep the preset, Standard 600 m.")
    val streets by intOption(key = "streets", default = 0, title = "Speed cams - streets", description = "0 = keep the preset, Standard 500 m.")
    val highways by intOption(key = "highways", default = 0, title = "Speed cams - highways", description = "0 = keep the preset, Standard 1000 m.")
    val freeways by intOption(key = "freeways", default = 0, title = "Speed cams - freeways", description = "0 = keep the preset, Standard 2000 m.")
    val blocked by intOption(key = "blocked", default = 0, title = "Blocked lanes", description = "0 = keep the preset, Standard 400 m.")
    val between by intOption(key = "between", default = 0, title = "Gap between alerts", description = "0 = keep the preset, Standard 300 m.")
    val cameras by intOption(key = "cameras", default = 0, title = "Speed cameras - all types", description = "0 = keep the preset. In most countries Waze uses this one distance for every camera type; set it if camera alerts do not move.")

    execute {
        val keys = listOf(
            "CONFIG_VALUE_ALERTS_POLICE_ALERT_DISTANCE_METERS",
            "CONFIG_VALUE_ALERTS_HAZARD_ALERT_DISTANCE_METERS",
            "CONFIG_VALUE_ALERTS_ACCIDENT_ALERT_DISTANCE_METERS",
            "CONFIG_VALUE_ALERTS_HEAVY_TRAFFIC_ALERT_DISTANCE_METERS",
            "CONFIG_VALUE_ALERTS_ENFORCEMENT_ALERTS_DISTANCE_STREETS",
            "CONFIG_VALUE_ALERTS_ENFORCEMENT_ALERTS_DISTANCE_HIGHWAY",
            "CONFIG_VALUE_ALERTS_ENFORCEMENT_ALERTS_DISTANCE_FREEWAY",
            "CONFIG_VALUE_ALERTS_BLOCKED_LANE_ALERT_DISTANCE",
            "CONFIG_VALUE_ALERTS_DISTANCE_BETWEEN_ALERTS",
        )
        val tables = mapOf(
            "Standard" to listOf(600L, 600L, 600L, 600L, 500L, 1000L, 2000L, 400L, 300L),
            // Every value is at or above Standard: a level may never shrink a warning distance.
            // (The ported tables shrank highways/freeways; corrected here.)
            "Moderate" to listOf(900L, 900L, 1200L, 1200L, 750L, 1500L, 3000L, 700L, 300L),
            "Heavier" to listOf(1200L, 1200L, 2000L, 3000L, 1000L, 2000L, 4000L, 1000L, 300L),
        )
        val chosen = level ?: "Standard"
        val values = tables[chosen]
            ?: throw PatchException(
                "policeAlertDistancePatch: unknown level '$chosen' - pick Standard, Moderate or Heavier",
            )
        // All Long (com/waze/config/c) keys, so must hook the Long getter. Values are meters.
        val wanted = listOf(police, hazard, accident, traffic, streets, highways, freeways, blocked, between)
            .map { (it ?: 0).coerceAtLeast(0) }
        // Standard means "leave Waze alone": it writes nothing at all, because Waze ships no
        // numeric defaults in the APK (they arrive from the server) and writing a guessed number
        // would be a change dressed up as a no-op.
        val effective: List<Pair<String, Long>> = if (chosen == "Standard") {
            keys.zip(wanted).filter { (_, m) -> m > 0 }.map { (k, m) -> k to m.toLong() }
        } else {
            keys.zip(values).mapIndexed { i, (key, value) ->
                key to (wanted[i].takeIf { it > 0 }?.toLong() ?: value)
            }
        }
        if (effective.isNotEmpty()) {
            recordLong("dst", *effective.toTypedArray())
            // The Java getter is only half the story: Waze's alert engine reads policy from the
            // native config store, so the same numbers go there on every sync. Without this the
            // row applied cleanly and changed nothing on device.
            recordNativeLong("dst", *effective.toTypedArray())
        }
        // Waze's server turns this on, and then an alert is only announced as far ahead as the car
        // drives in 22 s (30 s for police, 200 m minimum) - so any distance beyond that never showed.
        // Forcing it off is what makes the table above reachable. Approach taken from
        // bearinmindcat/morphe-patches (issue #157 there), which hit the same wall.
        if (chosen != "Standard") {
            recordNativeBoolean("dst", false, "CONFIG_VALUE_ALERTS_MAX_TRIGGER_TIME_ENABLED")
        }
        if ((cameras ?: 0) > 0) {
            recordLong("dst", "CONFIG_VALUE_ALERTS_ALERTER_ALERT_DISTANCE" to cameras!!.toLong())
            recordNativeLong("dst", "CONFIG_VALUE_ALERTS_ALERTER_ALERT_DISTANCE" to cameras!!.toLong())
        }
        recordBoolean("dst", bumps ?: false, "CONFIG_VALUE_MAP_SHOW_SPEED_BUMPS_PERMANENT_HAZARD")
        println("policeAlertDistancePatch: alert distances = $chosen, speed bumps = ${if (bumps == true) "on" else "off"}")
    }
}
