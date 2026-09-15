package app.morphe.patches.pixiv.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

val pixivAnalyticsBlockerPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Analytics Blocker",
    description = "Neutralizes Firebase Analytics, Google Measurement telemetry, and internal Pixiv event logging dispatchers for enhanced privacy.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Pixiv",
            packageName = "jp.pxv.android",
            targets = listOf(AppTarget("6.196.0"))
        )
    )

    execute {
        // 1. Hook FirebaseAnalytics.setCurrentScreen -> return early
        val firebaseClass = mutableClassDefByOrNull("Lcom/google/firebase/analytics/FirebaseAnalytics;")
        firebaseClass?.let { cls ->
            val setScreenMethod = cls.methods.firstOrNull { it.name == "setCurrentScreen" }
            setScreenMethod?.addInstructions(
                1,
                "return-void"
            )
        }

        // 2. Hook internal Pixiv telemetry dispatcher vt7.a(Lwi3;)V -> return early
        val vt7Class = mutableClassDefByOrNull("Lvt7;")
        vt7Class?.let { cls ->
            val aMethod = cls.methods.firstOrNull { it.name == "a" && it.parameterTypes.contains("Lwi3;") }
            aMethod?.addInstructions(
                1,
                "return-void"
            )
        }
    }
}
