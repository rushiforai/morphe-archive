package org.ungoogled.patches.maps.ui

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class OwnExtensionClassTest {
    @Test fun sharedAlertRendererAndCarAdapterKeepTheirOwnShapesAndColours() {
        // The pills are drawn by the shared alert library inside Maps; the shape and Black-theme
        // rewrites once turned their round ends square and their dark grey black.
        assertTrue(ownExtensionClass("Lnl/johninnl/navigation/alerts/CarWarningPills;"))
        assertTrue(ownExtensionClass("Lnl/johninnl/navigation/startup/ProviderLifecycle;"))
        assertTrue(ownExtensionClass("Lpatches/maps/gearslip/ProjectionRenderer;"))
        assertTrue(ownExtensionClass("Lorg/ungoogled/ui/CompactSpeedView;"))
        assertFalse(ownExtensionClass("Lcom/google/android/apps/gmm/Foo;"))
        assertFalse(ownExtensionClass("Lbzkz;"))
    }
}
