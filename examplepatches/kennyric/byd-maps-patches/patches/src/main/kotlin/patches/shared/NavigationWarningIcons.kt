package patches.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

/** One owner-supplied visual vocabulary for either navigation-data provider. */
internal val navigationWarningIcons = resourcePatch {
    execute {
        val names = listOf(
            "speed_trap", "poor_road", "speed_camera", "average_speed", "traffic_jam",
            "speed_trap_hotspot", "incident", "wrong_way", "bridge", "roadworks",
            "emergency", "maximum_speed_unknown", "animals", "border_nl", "speed_limit_130",
            "traffic_camera", "matrix", "level_crossing", "traffic_light",
        )
        for (name in names) {
            val destination = get("assets/morphe/navigation-warning-icons/$name.png")
            destination.parentFile.mkdirs()
            val input = object {}.javaClass.getResourceAsStream("/navigation-warning-icons/$name.png")
                ?: throw PatchException("Missing navigation warning icon: $name")
            input.use { source -> destination.outputStream().use(source::copyTo) }
        }
    }
}
