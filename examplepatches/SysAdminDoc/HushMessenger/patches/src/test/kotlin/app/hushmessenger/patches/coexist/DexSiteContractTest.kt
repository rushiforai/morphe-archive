package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

/** Every supported 587 build as a failure names them, in VERSIONS order. */
internal val CODES_587 = MessengerTarget.VERSIONS.getValue("587.0.0.54.96").joinToString(" or ")

/** The supported sites with every load one instruction later, standing in for another build's. */
private val otherSites = expectedDexSites.mapKeys { (site, _) ->
    "${site.substringBeforeLast('@')}@${site.substringAfterLast('@').toInt() + 1}"
}

class DexSiteContractTest {
    private fun assertActionable(failure: PatchException) {
        assertContains(failure.message.orEmpty(), "Use an unmodified Messenger 587.0.0.54.96 APK")
        assertContains(failure.message.orEmpty(), "version code $CODES_587)")
    }

    @Test
    fun acceptsTheSupportedInstructionSites() {
        validateDexSites(expectedDexSites.toList())
    }

    @Test
    fun eachBuildAcceptsOnlyItsOwnInstructionSites() {
        assertEquals(MessengerTarget.VERSION_CODES.toSet(), expectedDexSitesByBuild.keys)
        // 347415302 and 347415355 rename the main build's classes, but not the ones these loads sit in.
        for (code in listOf("347415267", "347415302", "347415354", "347415355")) validateDexSites(expectedDexSites347415354.toList(), expectedDexSitesFor(code))
        for (code in listOf("347415262", "347415295", "347415348")) validateDexSites(expectedDexSites347415262.toList(), expectedDexSitesFor(code))
        for (code in listOf("347415280", "347415281", "347415284", "347415285")) validateDexSites(expectedDexSites347415280.toList(), expectedDexSitesFor(code))
        // 587's three sets load the same permissions under other names, so no set's sites pass for another.
        val families = mapOf("347415354" to expectedDexSites347415354, "347415262" to expectedDexSites347415262, "347415280" to expectedDexSites347415280)
        for (code in families.keys) for ((other, sites) in families) if (other != code) {
            assertFailsWith<PatchException>("$other on $code") { validateDexSites(sites.toList(), expectedDexSitesFor(code)) }
        }
        assertEquals(listOf(3, 3, 3), families.values.map { it.size })
        val sites = expectedDexSitesByBuild + (347415349 to otherSites)
        validateDexSites(otherSites.toList(), expectedDexSitesFor("347415349", sites))
        assertFailsWith<PatchException> { validateDexSites(otherSites.toList(), expectedDexSitesFor("347415354", sites)) }
        assertFailsWith<PatchException> { validateDexSites(expectedDexSites.toList(), expectedDexSitesFor("347415349", sites)) }
    }

    @Test
    fun aSecondVersionNameUsesItsOwnBuildsSitesAndIsNamedInFailures() {
        val versions = MessengerTarget.VERSIONS + ("588.0.0.1.91" to listOf(348000001))
        val sites = expectedDexSitesByBuild + (348000001 to otherSites)
        validateVersionCode("348000001", versions)
        assertFailsWith<PatchException> { validateVersionCode("348000001") }
        validateDexSites(otherSites.toList(), expectedDexSitesFor("348000001", sites), versions)
        val failure = assertFailsWith<PatchException> {
            validateDexSites(expectedDexSites.toList(), expectedDexSitesFor("348000001", sites), versions)
        }
        assertContains(failure.message.orEmpty(),
            "Use an unmodified Messenger ${MessengerTarget.supportedApks()} or 588.0.0.1.91 APK (version code 348000001).")
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
