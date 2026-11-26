package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

/** Every supported 588 build as a failure names them, in VERSIONS order. */
internal val CODES_588 = MessengerTarget.VERSIONS.getValue("588.1.0.66.98").joinToString(" or ")

/** The supported sites with every load one instruction later, standing in for another build's. */
private val otherSites = expectedDexSites.mapKeys { (site, _) ->
    "${site.substringBeforeLast('@')}@${site.substringAfterLast('@').toInt() + 1}"
}

class DexSiteContractTest {
    private fun assertActionable(failure: PatchException) {
        assertContains(failure.message.orEmpty(), "Use an unmodified Messenger 588.1.0.66.98 APK")
        assertContains(failure.message.orEmpty(), "version code $CODES_588)")
    }

    @Test
    fun acceptsTheSupportedInstructionSites() {
        validateDexSites(expectedDexSites.toList())
    }

    @Test
    fun eachBuildAcceptsOnlyItsOwnInstructionSites() {
        assertEquals(MessengerTarget.VERSION_CODES.toSet(), expectedDexSitesByBuild.keys)
        for (code in listOf("347617499", "347617503", "347617590")) validateDexSites(expectedDexSites347617503.toList(), expectedDexSitesFor(code))
        for (code in listOf("347617497", "347617513", "347617566", "347617583")) validateDexSites(expectedDexSites347617497.toList(), expectedDexSitesFor(code))
        // 588's two sets load the same permissions under other names, so neither set's sites pass for the other.
        val families = mapOf("347617503" to expectedDexSites347617503, "347617497" to expectedDexSites347617497)
        for (code in families.keys) for ((other, sites) in families) if (other != code) {
            assertFailsWith<PatchException>("$other on $code") { validateDexSites(sites.toList(), expectedDexSitesFor(code)) }
        }
        assertEquals(listOf(3, 3), families.values.map { it.size })
        val sites = expectedDexSitesByBuild + (347617501 to otherSites)
        validateDexSites(otherSites.toList(), expectedDexSitesFor("347617501", sites))
        assertFailsWith<PatchException> { validateDexSites(otherSites.toList(), expectedDexSitesFor("347617503", sites)) }
        assertFailsWith<PatchException> { validateDexSites(expectedDexSites.toList(), expectedDexSitesFor("347617501", sites)) }
    }

    @Test
    fun aSecondVersionNameUsesItsOwnBuildsSitesAndIsNamedInFailures() {
        val versions = MessengerTarget.VERSIONS + ("589.0.0.1.91" to listOf(348000001))
        val sites = expectedDexSitesByBuild + (348000001 to otherSites)
        validateVersionCode("348000001", versions)
        assertFailsWith<PatchException> { validateVersionCode("348000001") }
        validateDexSites(otherSites.toList(), expectedDexSitesFor("348000001", sites), versions)
        val failure = assertFailsWith<PatchException> {
            validateDexSites(expectedDexSites.toList(), expectedDexSitesFor("348000001", sites), versions)
        }
        assertContains(failure.message.orEmpty(),
            "Use an unmodified Messenger ${MessengerTarget.supportedApks()} or 589.0.0.1.91 APK (version code 348000001).")
    }

    @Test
    fun rejectsALoadAboveV255BeforeAnySiteIsRenamed() {
        val sites = expectedDexSites.toList()
        validateDexSites(sites, registers = sites.associate { it.first to 255 })
        val wide = sites.last().first
        val failure = assertFailsWith<PatchException> {
            validateDexSites(sites, registers = sites.associate { it.first to 0 } + (wide to 256))
        }
        assertContains(failure.message.orEmpty(), "$wide uses v256 for a permission")
        assertActionable(failure)
    }

    @Test
    fun rejectsAMissingInstructionSite() {
        val failure = assertFailsWith<PatchException> {
            validateDexSites(expectedDexSites.toList().dropLast(1))
        }
        assertContains(failure.message.orEmpty(), "expected 3 permission loads")
        assertActionable(failure)
    }

    @Test
    fun rejectsAChangedLiteralWithTheSameLoadCount() {
        val changed = expectedDexSites.toList().toMutableList()
        changed[0] = changed[0].first to "com.facebook.receiver.permission.ACCESS"

        val failure = assertFailsWith<PatchException> { validateDexSites(changed) }
        assertContains(failure.message.orEmpty(), "instruction sites differ")
        assertActionable(failure)
    }

    @Test
    fun rejectsAChangedMethodWithTheSameLiteral() {
        val changed = expectedDexSites.toList().toMutableList()
        changed[0] = changed[0].first.let { "${it.substringBeforeLast('@')}@${it.substringAfterLast('@').toInt() + 1}" } to changed[0].second

        val failure = assertFailsWith<PatchException> { validateDexSites(changed) }
        assertContains(failure.message.orEmpty(), "instruction sites differ")
        assertActionable(failure)
    }
}
