package app.braydog2010.patches.venaboxhub

import app.braydog2010.patches.shared.Constants.COMPATIBILITY_VENABOX_HUB
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val blockTrackersPatch = bytecodePatch(
    name = "Block trackers",
    description = "Blocks analytics and tracking. The app routes every event through the " +
        "util.n1 dispatcher, which forwards each one to both Firebase Analytics and " +
        "Facebook (AppEventsLogger). This neutralizes that dispatcher so no tracking " +
        "event is ever sent.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_VENABOX_HUB)

    execute {
        // util.n1 is the app's central analytics hub. Every one of its methods builds and
        // sends a Firebase + Facebook event, so making each method return immediately stops
        // all tracking at the source without touching the rest of the app.
        val analytics = mutableClassDefBy("Lcom/dubani/dub/util/n1;")

        analytics.methods.forEach { method ->
            // Leave constructors intact so the class still initializes normally.
            if (method.name == "<init>" || method.name == "<clinit>") return@forEach

            when (method.returnType) {
                "V" -> method.addInstructions(0, "return-void")
                // n1's only non-void method is c(J)Z; return a benign false.
                "Z", "B", "S", "C", "I" -> method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )
                "J" -> method.addInstructions(
                    0,
                    """
                        const-wide/16 v0, 0x0
                        return-wide v0
                    """,
                )
                else -> method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return-object v0
                    """,
                )
            }
        }
    }
}
