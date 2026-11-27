package dev.srwi.gintype.patches.gboard.registry

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.ResourcePatchBuilder

internal class GboardContributionWiringUnit(
    val contributionIds: Set<String>,
    private val dependencySupplier: () -> Array<Patch<*>>,
) {
    fun dependencies(): Array<Patch<*>> = dependencySupplier()
}

internal object GboardContributionWiring {
    private val unitsByFeature = emptyMap<String, List<GboardContributionWiringUnit>>()

    val registeredContributionIdsByFeature: Map<String, Set<String>> = emptyMap()

    fun activeContributionIds(
        featureId: String,
        admitted: Set<String>,
    ): Set<String> {
        val units = unitsByFeature[featureId] ?: return admitted
        return units
            .filter { it.contributionIds.all(admitted::contains) }
            .flatMapTo(linkedSetOf()) { it.contributionIds }
    }

    fun wireContributions(
        featureId: String,
        admitted: Set<String>,
        builder: ResourcePatchBuilder,
    ) {
    }
}
