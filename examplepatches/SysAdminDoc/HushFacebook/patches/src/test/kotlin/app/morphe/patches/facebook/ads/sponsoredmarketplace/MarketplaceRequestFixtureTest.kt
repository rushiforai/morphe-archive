/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredmarketplace

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream

/**
 * Hide sponsored Marketplace listings on every Facebook build the bundle declares: one sendRequest
 * of Facebook's Networking module reads the POST body from the request data it reads the tracking
 * name from; Facebook's own list of the Marketplace feed's ads-only queries is in the build under
 * the names the extension holds back; the feed query's config in the APK declares both variables
 * the extension sets; and the patch, run on the module, asks the extension right after the body is
 * read. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class MarketplaceRequestFixtureTest {
    /** The feed's ads-only queries as MarketplaceAdFilter.ADS_ONLY_QUERIES holds them, which its own test pins too. */
    private val adsOnlyQueries = listOf(
        "MarketplaceHomeFeedAdsQueryRendererQuery",
        "MarketplaceHomeFeedAdsPaginationQuery",
        "MarketplaceHomeFeedBoostedListingAdsQuery",
        "MarketplaceHomeFeedBoostedListingAdsPaginationQuery",
    )

    /** The variables MarketplaceAdFilter.SKIP_VARIABLES sets. */
    private val skipVariables = listOf("shouldSkipAdRequest", "shouldSkipBoostedListingAdRequest")

    private val feedConfig = "assets/MarketplaceHomeFeedQueryRendererQueryConfigs.json"

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.parameters() = parameterTypes.map { it.toString() }

    private fun Instruction.callRegisters(): List<Int> {
        val call = this as FiveRegisterInstruction
        return listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
    }

    /** The text of [name] in the bundle's base APK, or null. */
    private fun asset(bundle: File, name: String): String? = ZipFile(bundle).use { zip ->
        val base = zip.getEntry("base.apk") ?: return@use null
        ZipInputStream(zip.getInputStream(base).buffered()).use { apk ->
            while (true) {
                val entry = apk.nextEntry ?: break
                if (entry.name == name) return@use apk.readBytes().toString(Charsets.UTF_8)
            }
            null
        }
    }

    /** Whether one method of the bundle loads the tracking name of each of [adsOnlyQueries], Facebook's own list. */
    private fun listsTheAdsOnlyQueries(bundle: File): Boolean {
        val wanted = adsOnlyQueries.map { "RelayFBNetwork_$it" }
        var found = false
        FixtureDex.forEach(bundle) { dex ->
            if (found || dex.stringSection.none { it == wanted.first() }) return@forEach
            found = dex.classes.any { classDef -> classDef.methods.any { method -> wanted.all { holdsString(method, it) } } }
        }
        return found
    }

    @Test
    fun `each declared build sends Marketplace's queries the way the patch reads them, and the patch goes in`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val owners = FixtureDex.classesHolding(bundle, NETWORKING_TAG)
                val sends = owners.flatMap { owner -> owner.methods.filter(::isSendRequest) }
                assertEquals("$name: sendRequest methods holding the tag", 1, sends.size)
                val send = sends.single()
                val read = bodyRead(send)
                assertNotNull("$name: ${send.definingClass}->$SEND_REQUEST reads no POST body the patch can hook", read)
                read!!
                assertTrue("$name: a register past v15: $read", read.body <= 15 && read.data <= 15)

                assertTrue("$name: no method of Facebook's lists all four ads-only queries", listsTheAdsOnlyQueries(bundle))
                val config = asset(bundle, feedConfig) ?: throw AssertionError("$name: no $feedConfig")
                assertTrue("$name: $feedConfig names another query", config.contains("\"MarketplaceHomeFeedQueryRendererQuery\""))
                for (variable in skipVariables) {
                    assertTrue("$name: the feed query doesn't declare $variable", config.contains("\"$variable\""))
                }

                // The patch follows the answers too, so it gets the Tigon callbacks and what they use.
                val callbacks = FixtureDex.classes(bundle, setOf(CALLBACKS)).values
                val around = FixtureDex.classes(bundle, callbacks.flatMap { it.referencedClasses() }.toSet()).values
                val context = PatchContexts.of(
                    (owners + ExtensionDex.classDef(SETTINGS_STATUS) + callbacks + around).associateBy { it.type }.values,
                )
                hideSponsoredMarketplaceListingsPatch.execute(context)
                val patched = context.mutableClassDefBy(send.definingClass).methods.single {
                    it.name == SEND_REQUEST && it.parameters() == send.parameters()
                }.body()
                val asks = patched[read.index + 1]
                assertEquals("$name: the call", REQUEST_BODY, (asks as ReferenceInstruction).reference.toString())
                assertEquals("$name: what the call reads", listOf(read.body, read.data), asks.callRegisters())
                assertEquals(Opcode.MOVE_RESULT_OBJECT, patched[read.index + 2].opcode)
                assertEquals("$name: where the answer goes", read.body, (patched[read.index + 2] as OneRegisterInstruction).registerA)
                assertEquals("$name: the rest of sendRequest", send.body().map { it.opcode },
                    patched.filterIndexed { index, _ -> index != read.index + 1 && index != read.index + 2 }.map { it.opcode })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
