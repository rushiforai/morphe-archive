/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.extension

import app.morphe.Fixtures
import app.morphe.patches.facebook.ads.audiencenetwork.AUDIENCE_NETWORK_COMPONENTS
import app.morphe.patches.facebook.ads.prefetch.AD_PREFETCH_SCHEDULERS
import app.morphe.patches.facebook.ads.telemetry.AD_TELEMETRY
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.suggested.SUGGESTED_FEED_UNITS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.apksig.apk.ApkUtils
import com.android.apksig.internal.apk.AndroidBinXmlParser
import com.android.apksig.util.DataSources
import java.io.File
import java.io.RandomAccessFile
import java.util.zip.ZipFile
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * What each declared Facebook build lacks of the four target lists, which is exactly what the patch
 * log names when it's patched: 580 dropped six suggested feed units that 577 still carries, and
 * both builds have every ad prefetch scheduler, ad telemetry class and Audience Network component.
 * A new fixture that changes any of it fails here, naming the target, before a release says
 * something about it that isn't so.
 */
class PartialTargetsFixtureTest {
    private val droppedIn580 = setOf(
        "Lcom/facebook/graphql/model/GraphQLPagesYouMayFollowFeedUnit;",
        "Lcom/facebook/graphql/model/GraphQLPagesYouMayAdvertiseFeedUnit;",
        "Lcom/facebook/graphql/model/GraphQLEndOfFeedUpsellCustomNTFeedUnit;",
        "Lcom/facebook/graphql/model/GraphQLGreetingCardPromotionFeedUnit;",
        "Lcom/facebook/graphql/model/GraphQLBusinessPageReviewFeedUnit;",
        "Lcom/facebook/graphql/model/GraphQLHoldoutAdFeedUnit;",
    )

    private val expectedMissing = mapOf(
        AppCompatibilities.FACEBOOK_TARGET_VERSION to droppedIn580,
        AppCompatibilities.FACEBOOK_PREVIOUS_VERSION to emptySet(),
    )

    @Test
    fun `each declared build lacks only the targets its patch log names`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertEquals("the declared builds", expectedMissing.keys, versions)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val classes = FixtureDex.classes(bundle, (AD_PREFETCH_SCHEDULERS + AD_TELEMETRY + SUGGESTED_FEED_UNITS).toSet())
                val missing = mutableSetOf<String>()
                // A neutered class counts only when it still has a void method to stop.
                (AD_PREFETCH_SCHEDULERS + AD_TELEMETRY).filterTo(missing) { type ->
                    classes[type]?.methods?.none { method ->
                        method.returnType == "V" && method.name != "<init>" && method.name != "<clinit>" &&
                            method.implementation != null
                    } ?: true
                }
                SUGGESTED_FEED_UNITS.filterTo(missing) { it !in classes }
                val components = manifestComponents(bundle)
                AUDIENCE_NETWORK_COMPONENTS.filterTo(missing) { it !in components }

                assertEquals("${bundle.name}: targets the patch log names", expectedMissing.getValue(version), missing)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private val componentTags = setOf("activity", "activity-alias", "service", "receiver", "provider")

    /** The android:name of every component the bundle's base manifest declares. */
    private fun manifestComponents(bundle: File): Set<String> {
        val copy = File.createTempFile("fixture-base", ".apk")
        try {
            ZipFile(bundle).use { zip ->
                val base = checkNotNull(zip.getEntry("base.apk")) { "${bundle.name} holds no base.apk" }
                zip.getInputStream(base).use { input -> copy.outputStream().use { input.copyTo(it) } }
            }
            val manifest = RandomAccessFile(copy, "r").use { file ->
                ApkUtils.getAndroidManifest(DataSources.asDataSource(file))
            }
            val parser = AndroidBinXmlParser(manifest)
            val names = mutableSetOf<String>()
            var event = parser.eventType
            while (event != AndroidBinXmlParser.EVENT_END_DOCUMENT) {
                if (event == AndroidBinXmlParser.EVENT_START_ELEMENT && parser.name in componentTags) {
                    (0 until parser.attributeCount)
                        .firstOrNull { parser.getAttributeName(it) == "name" && parser.getAttributeNamespace(it).endsWith("/android") }
                        ?.let { names += parser.getAttributeStringValue(it) }
                }
                event = parser.next()
            }
            return names
        } finally {
            copy.delete()
        }
    }
}
