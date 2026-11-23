package patches.eclipse

import app.morphe.patcher.patch.Compatibility
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class TemplatedMediaPatchTest {
    @Test fun compatibilityPinsPackageBuildAndSigner() {
        assertEquals("Eclipse Music", eclipse.name)
        assertEquals("com.eclipse.android", eclipse.packageName)
        assertEquals(setOf("18f904b5a1904154ebad737952edb8b951cd51b2e7b34920d63f82dba4a0142d"), eclipse.signatures)
        val target = eclipse.targets.single()
        assertEquals("0.6.75", target.version)
        assertEquals(26, target.minSdk)
        assertEquals(setOf(155), target.versionCodes!!.values.toSet())
    }

    @Test fun patchIsDefaultOnAndHasNoRootNavigationOption() {
        assertEquals("Android Auto templated media app", eclipseTemplatedMedia.name)
        assertTrue(eclipseTemplatedMedia.default)
        // The root is one page (chips on API 9, a Browse list below); there is nothing to choose.
        assertTrue(eclipseTemplatedMedia.options.isEmpty())
        assertEquals(listOf<Compatibility>(eclipse), eclipseTemplatedMedia.compatibility)
        assertTrue(eclipseBase in eclipseTemplatedMedia.dependencies)
        // The extension, its link check and the queue signals are shared with the browse upgrade.
        assertTrue(eclipseAutoExtension in eclipseTemplatedMedia.dependencies)
    }
}
