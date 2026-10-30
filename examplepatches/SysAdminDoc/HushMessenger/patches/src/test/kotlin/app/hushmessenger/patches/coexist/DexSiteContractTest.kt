package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

/** Every supported 585 build as a failure names them, in VERSIONS order. */
internal val CODES_585 = MessengerTarget.VERSIONS.getValue("585.0.0.53.94").joinToString(" or ")

/** The supported sites with every load one instruction later, standing in for another build's. */
private val otherSites = expectedDexSites.mapKeys { (site, _) ->
    "${site.substringBeforeLast('@')}@${site.substringAfterLast('@').toInt() + 1}"
}

class DexSiteContractTest {
    private fun assertActionable(failure: PatchException) {
        assertContains(failure.message.orEmpty(), "Use an unmodified Messenger 585.0.0.53.94 APK")
        assertContains(failure.message.orEmpty(), "version code $CODES_585)")
    }

    @Test
    fun acceptsTheSupportedInstructionSites() {
        validateDexSites(expectedDexSites.toList())
    }

    @Test
    fun eachBuildAcceptsOnlyItsOwnInstructionSites() {
        assertEquals(MessengerTarget.VERSION_CODES.toSet(), expectedDexSitesByBuild.keys)
        validateDexSites(expectedDexSites347015062.toList(), expectedDexSitesFor("347015062"))
        val sites = expectedDexSitesByBuild + (347015063 to otherSites)
        validateDexSites(otherSites.toList(), expectedDexSitesFor("347015063", sites))
        assertFailsWith<PatchException> { validateDexSites(otherSites.toList(), expectedDexSitesFor("347015062", sites)) }
        assertFailsWith<PatchException> { validateDexSites(expectedDexSites.toList(), expectedDexSitesFor("347015063", sites)) }
    }

    @Test
    fun aSecondVersionNameUsesItsOwnBuildsSitesAndIsNamedInFailures() {
        val versions = MessengerTarget.VERSIONS + ("586.0.0.1.91" to listOf(348000001))
        val sites = expectedDexSitesByBuild + (348000001 to otherSites)
        validateVersionCode("348000001", versions)
        assertFailsWith<PatchException> { validateVersionCode("348000001") }
        validateDexSites(otherSites.toList(), expectedDexSitesFor("348000001", sites), versions)
        val failure = assertFailsWith<PatchException> {
            validateDexSites(expectedDexSites.toList(), expectedDexSitesFor("348000001", sites), versions)
        }
        assertContains(failure.message.orEmpty(),
            "Use an unmodified Messenger ${MessengerTarget.supportedApks()} or 586.0.0.1.91 APK (version code 348000001).")
    }

    @Test
    fun rejectsAMissingInstructionSite() {
        val failure = assertFailsWith<PatchException> {
            validateDexSites(expectedDexSites.toList().dropLast(1))
        }
        assertContains(failure.message.orEmpty(), "expected 6 permission loads")
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
