package patches.spotify.ui

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.builder.instruction.BuilderPackedSwitchPayload
import com.android.tools.smali.dexlib2.builder.instruction.BuilderSwitchElement
import patches.spotify.COMPATIBILITY_SPOTIFY

private const val HOME_SECTION_RENDERER = "Lp/dfs;"
private const val HOME_SECTION_RENDERER_METHOD = "k"
private const val HOME_SECTION_RENDERER_RESULT = "Lp/v760;"
private const val CASITA_SECTION = "Lcom/spotify/casita/v1/resolved/Section;"

/**
 * Switch keys for VIDEO_PROMO (18), VIDEO_BRAND_AD (21), VIDEO_CAROUSEL (24) and WATCH_FEED (10).
 *
 * The switch value is the `SectionType` ordinal minus one, not the proto field number. Verified
 * against the 9.1.94 case bodies: key 10 calls `Section.d0()` (WatchFeed), 18 calls `c0()`
 * (VideoPromo), 21 calls `a0()` (VideoBrandAd) and 24 calls `b0()` (VideoCarousel).
 */
private val VIDEO_SWITCH_KEYS = setOf(10, 18, 21, 24)

/** The packed-switch key Spotify already uses for an unsupported section. */
private const val SKIP_SWITCH_KEY = 5

/**
 * Spotify's resolved Home feed switches on the section type. The video section payloads
 * (`WATCH_FEED`, `VIDEO_PROMO`, `VIDEO_BRAND_AD`, `VIDEO_CAROUSEL`) share the same packed switch
 * as every audio section.
 *
 * Point those switch entries at the existing skip target. This changes only switch targets, not
 * the method's code, which keeps the class verifier-safe (injecting new branches into this method
 * was rejected by the ART verifier).
 */
@Suppress("unused")
val hideVideoHomeSectionsPatch = bytecodePatch(
    name = "Hide video shelves (safe)",
    description = "Drops video/watch sections from Spotify's resolved Home feed, so video " +
        "podcast and music-video shelves are not shown.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val owner = mutableClassDefBy(HOME_SECTION_RENDERER)
        val method = owner.methods.singleOrNull { candidate ->
            candidate.name == HOME_SECTION_RENDERER_METHOD &&
                candidate.returnType == HOME_SECTION_RENDERER_RESULT &&
                candidate.parameterTypes.map(CharSequence::toString) == listOf(CASITA_SECTION)
        } ?: throw IllegalStateException("Spotify Home section renderer changed")

        val payload = method.implementation!!.instructions
            .filterIsInstance<BuilderPackedSwitchPayload>()
            .singleOrNull()
            ?: throw IllegalStateException("Spotify Home section switch payload changed")

        val elements = payload.switchElements
        val keys = elements.map { it.key }.toSet()
        check(keys.containsAll(VIDEO_SWITCH_KEYS + SKIP_SWITCH_KEY)) {
            "Spotify Home section switch keys changed: $keys"
        }
        val skip = elements.single { it.key == SKIP_SWITCH_KEY }.target
        VIDEO_SWITCH_KEYS.forEach { key ->
            val index = elements.indexOfFirst { it.key == key }
            elements[index] = BuilderSwitchElement(payload, key, skip)
        }
    }
}
