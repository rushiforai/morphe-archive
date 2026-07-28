package app.template.patches.rustore.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.all.analytics.childrenNamed
import app.template.patches.all.analytics.disableAnalyticsDependency
import app.template.patches.all.analytics.disableComponentsByPrefix
import app.template.patches.all.analytics.disableComponentsWhere
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableRuStoreAnalytics")

private val disableRuStoreAnalyticsManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement
                .childrenNamed("application")
                .single() as Element

            val altCraftDisabled = application.disableComponentsWhere { name ->
                name.startsWith("ru.vk.store.lib.analytics.")
            }
            logger.info("AltCraft: disabled $altCraftDisabled components")

            val metricsDisabled =
                application.disableComponentsByPrefix("ru.rustore.sdk.metrics.")
            logger.info("RuStore Metrics: disabled $metricsDisabled components")
        }
    }
}

@Suppress("unused")
val disableRuStoreAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Disables analytics and tracking in RuStore.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    dependsOn(disableRuStoreAnalyticsManifestPatch)
    dependsOn(disableAnalyticsDependency)

    execute {
        AltCraftSendFingerprint.method.addInstructions(0, "return-void")
        RadarDoWorkFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Landroidx/work/b;->b:Landroidx/work/b;
                new-instance v1, Landroidx/work/c${'$'}a${'$'}c;
                invoke-direct {v1, v0}, Landroidx/work/c${'$'}a${'$'}c;-><init>(Landroidx/work/b;)V
                return-object v1
            """,
        )
    }
}
