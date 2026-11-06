package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardEnglishQwertyPatchSourceTest {
    @Test
    fun softKeyPatchUses1803ActionModelAndOnlyTheTargetEnglishKeyIds() {
        val source = readSoftKeySource()

        assertTrue(source.contains("SoftKeyDef;->d:I"))
        assertTrue(source.contains("SoftKeyDef;->g:[Ljava/lang/CharSequence;"))
        assertTrue(source.contains("SoftKeyDef;->h(Lpmy;)Lcom/google/android/libraries/inputmethod/metadata/ActionDef;"))
        assertTrue(source.contains("ActionDef;->d:[Lpnu;"))
        assertTrue(source.contains("Lpnu;->e:Ljava/lang/Object;"))
        assertTrue(source.contains("Lpmz;->a:Lpmy;"))
        assertTrue(source.contains("Lpmz;->c:[Ljava/lang/String;"))
        assertTrue(source.contains("Lpmz;->q(ILpnt;Ljava/lang/Object;)V"))
        assertTrue(source.contains("Lpmz;->c()Lcom/google/android/libraries/inputmethod/metadata/ActionDef;"))
        assertTrue(source.contains("Lppo;->j(Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;)V"))
        assertTrue(source.contains("Lppo;->t(Lcom/google/android/libraries/inputmethod/metadata/ActionDef;)V"))
        assertTrue(source.contains("Lppo;->d()Ljava/lang/Object;"))

        val admittedIds = Regex("""(?m)^\s*(0x[0-9a-f]+) -> :sswitch_0$""")
            .findAll(source)
            .map { match -> match.groupValues[1] }
            .toSet()
        assertEquals(TARGET_ENGLISH_QWERTY_KEY_IDS, admittedIds)
        assertFalse(admittedIds.contains("0x7f0b19aa"))
        assertFalse(admittedIds.contains("0x7f0b1899"))

        listOf("Loaa;", "Lnzv;", "Lnxi;", "Lnxj;", "Lnxl;", "Lnye;")
            .forEach { legacyDescriptor -> assertFalse(source.contains(legacyDescriptor)) }
        assertFalse(source.contains("0x7f0b0607"))
    }

    @Test
    fun softKeyPatchPreservesDisabledAndExistingNativeSlideUpMetadata() {
        val source = readSoftKeySource()

        assertTrue(source.contains("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED"))
        assertTrue(source.contains("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_PATCHED_METADATA"))
        assertTrue(source.contains("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_GET_CACHED_PATCHED_METADATA"))
        assertTrue(source.contains("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_CACHE_PATCHED_METADATA"))
        assertFalse(source.contains("->markPatchedMetadata(Ljava/lang/Object;)V"))
        assertTrue(source.contains("sget-object v0, Lpmy;->c:Lpmy;"))
        assertTrue(source.contains(
            "invoke-virtual {p1, v0}, Lcom/google/android/libraries/inputmethod/metadata/" +
                "SoftKeyDef;->h(Lpmy;)Lcom/google/android/libraries/inputmethod/metadata/ActionDef;"
        ))
        assertFalse(source.contains("jasondevStripSlideUpAction"))
        assertFalse(source.contains("Ljava/util/EnumMap;->remove"))
    }

    @Test
    fun softKeyCacheRunsAfterEnabledAndNativeGuardsAndBeforeCloning() {
        val source = readSoftKeySource()
        val patchBody = tripleQuotedValue(source, "PATCH_INCOMING_METADATA_BODY")
        val enabledIndex = patchBody.indexOf("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED")
        val nativeLookupIndex = patchBody.indexOf(
            "invoke-virtual {p1, v0}, Lcom/google/android/libraries/inputmethod/metadata/" +
                "SoftKeyDef;->h(Lpmy;)Lcom/google/android/libraries/inputmethod/metadata/ActionDef;"
        )
        val cacheGetIndex = patchBody.indexOf("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_GET_CACHED_PATCHED_METADATA")
        val builderIndex = patchBody.indexOf("new-instance v4, Lppo;")
        val cachePutIndex = patchBody.indexOf("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_CACHE_PATCHED_METADATA")

        assertTrue(enabledIndex >= 0)
        assertTrue(enabledIndex < nativeLookupIndex)
        assertTrue(nativeLookupIndex < cacheGetIndex)
        assertTrue(cacheGetIndex < builderIndex)
        assertTrue(builderIndex < cachePutIndex)
        assertTrue(patchBody.contains(
            "check-cast v0, Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;"
        ))
        assertTrue(patchBody.contains(":catch_0\n    return-object p1"))
    }

    @Test
    fun softKeyPatchOnlyBuildsAsciiCaseToggleWithoutEnglishHintOrSlideDown() {
        val source = readSoftKeySource()

        assertTrue(source.contains("jasondevToggleAsciiCase"))
        assertTrue(source.contains("sget-object v6, Lpmy;->c:Lpmy;"))
        assertFalse(source.contains("jasondevResolveEnglishSlideDown"))
        assertFalse(source.contains("jasondevSyncSyntheticEnglishHint"))
        assertFalse(source.contains("jasondevSyncEnglishHintView"))
        assertFalse(source.contains("Lpmy;->d:Lpmy;"))
        assertFalse(source.contains("slidedown_data"))
    }

    @Test
    fun softKeyPatchFailsClosedAndReturnsOriginalMetadataOnRuntimeError() {
        val source = readSoftKeySource()

        assertTrue(source.contains(".catch Ljava/lang/Throwable;"))
        assertTrue(source.contains(":catch_0"))
        assertTrue(source.contains(":cond_return_original"))
        assertTrue(source.contains("return-object p1"))
    }

    @Test
    fun softKeyContributionDelegatesOrderingToTheFamilyComposer() {
        val source = readSoftKeySource()

        assertTrue(source.contains("GboardSoftKeyFamilyFeature.ENGLISH_QWERTY"))
        assertTrue(source.contains("gboardSoftKeyFamilyFeaturePatch"))
        assertFalse(source.contains("topRowDelegateCallIndex"))
        assertFalse(source.contains("mutableMethod.addInstructions"))
    }

    private fun readSoftKeySource(): String =
        readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/englishqwerty/" +
                "GboardEnglishQwertySoftKeyPatch.kt"
        )

    private fun readSource(relativePath: String): String =
        String(Files.readAllBytes(Path.of(relativePath)), StandardCharsets.UTF_8)

    private fun tripleQuotedValue(source: String, name: String): String =
        Regex(
            "(?:private|internal) val $name = " + "\"\"\"" + "(.*?)" + "\"\"\"",
            setOf(RegexOption.DOT_MATCHES_ALL)
        ).find(source)?.groupValues?.get(1) ?: error("$name body not found")

    private companion object {
        val TARGET_ENGLISH_QWERTY_KEY_IDS = setOf(
            "0x7f0b1a4a", "0x7f0b1933", "0x7f0b1aba", "0x7f0b1961",
            "0x7f0b19c1", "0x7f0b18cf", "0x7f0b1a4e", "0x7f0b1934",
            "0x7f0b1a81", "0x7f0b1942", "0x7f0b1ac2", "0x7f0b1965",
            "0x7f0b1aa2", "0x7f0b194c", "0x7f0b19f0", "0x7f0b18f4",
            "0x7f0b1a2d", "0x7f0b191c", "0x7f0b1a43", "0x7f0b1931",
            "0x7f0b1990", "0x7f0b18b2", "0x7f0b1a59", "0x7f0b1939",
            "0x7f0b19b3", "0x7f0b18ca", "0x7f0b19d7", "0x7f0b18e2",
            "0x7f0b19db", "0x7f0b18e4", "0x7f0b19ea", "0x7f0b18ef",
            "0x7f0b1a01", "0x7f0b1905", "0x7f0b1a05", "0x7f0b1907",
            "0x7f0b1a0d", "0x7f0b190b", "0x7f0b1ac9", "0x7f0b1969",
            "0x7f0b1abf", "0x7f0b1964", "0x7f0b19a5", "0x7f0b18c3",
            "0x7f0b1ab7", "0x7f0b195f", "0x7f0b19a0", "0x7f0b18c1",
            "0x7f0b1a21", "0x7f0b1913", "0x7f0b1a1a", "0x7f0b190f"
        )
    }
}
