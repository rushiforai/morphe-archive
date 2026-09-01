package app.morphe.patches.oraimohealth.manifest

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.oraimohealth.shared.COMPATIBILITY_ORAIMO_HEALTH
import org.w3c.dom.Element

/**
 * Resource patch that strips unused telemetry services, keepalive daemons,
 * and cloud integration activities from AndroidManifest.xml.
 */
@Suppress("unused")
val manifestDebloatPatch = resourcePatch(
    name = "Manifest Debloat",
    description = "Prunes background telemetry upload services, aggressive keepalive daemons, and cloud activities from AndroidManifest.xml.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ORAIMO_HEALTH)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val componentsToRemove = setOf(
                "com.transsion.oraimohealth.service.DataUploadService",
                "com.transsion.oraimohealth.keeplive.OraimoJobService",
                "com.transsion.oraimohealth.keeplive.LocalService",
                "androidx.work.impl.background.systemalarm.ConstraintProxy\$NetworkStateProxy",
                "com.transsion.oraimohealth.module.mine.activity.StravaActivity",
                "com.transsion.oraimohealth.module.mall.MallAreaSettingActivity",
                "com.transsion.oraimohealth.module.payment.activity.PaymentActivity"
            )

            val app = doc.getElementsByTagName("application").item(0) as? Element ?: return@use

            val tagNames = listOf("service", "receiver", "activity")
            val nodesToRemove = mutableListOf<Element>()

            for (tagName in tagNames) {
                val nodes = doc.getElementsByTagName(tagName)
                for (i in 0 until nodes.length) {
                    val element = nodes.item(i) as? Element ?: continue
                    val name = element.getAttribute("android:name")
                    if (name in componentsToRemove) {
                        nodesToRemove.add(element)
                    }
                }
            }

            for (node in nodesToRemove) {
                app.removeChild(node)
            }
        }
    }
}
