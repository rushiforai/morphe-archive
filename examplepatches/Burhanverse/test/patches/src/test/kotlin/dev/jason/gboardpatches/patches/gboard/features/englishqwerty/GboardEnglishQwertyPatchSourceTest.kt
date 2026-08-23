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
    fun softKeyPatchUses1777ActionModelAndOnlyTheTargetEnglishKeyIds() {
        val source = readSoftKeySource()

        assertTrue(source.contains("Lowd;->d:I"))
        assertTrue(source.contains("Lowd;->g:[Ljava/lang/CharSequence;"))
        assertTrue(source.contains("Lowd;->h(Loth;)Lotk;"))
        assertTrue(source.contains("Lotk;->d:[Loud;"))
        assertTrue(source.contains("Loud;->e:Ljava/lang/Object;"))
        assertTrue(source.contains("Loti;->a:Loth;"))
        assertTrue(source.contains("Loti;->c:[Ljava/lang/String;"))
        assertTrue(source.contains("Loti;->q(ILouc;Ljava/lang/Object;)V"))
        assertTrue(source.contains("Loti;->c()Lotk;"))
        assertTrue(source.contains("Lovv;->j(Lowd;)V"))
        assertTrue(source.contains("Lovv;->q(Lotk;)V"))
        assertTrue(source.contains("Lovv;->d()Ljava/lang/Object;"))

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
        assertTrue(source.contains("sget-object v0, Loth;->c:Loth;"))
        assertTrue(source.contains("invoke-virtual {p1, v0}, Lowd;->h(Loth;)Lotk;"))
        assertFalse(source.contains("jasondevStripSlideUpAction"))
        assertFalse(source.contains("Ljava/util/EnumMap;->remove"))
    }

    @Test
    fun softKeyCacheRunsAfterEnabledAndNativeGuardsAndBeforeCloning() {
        val source = readSoftKeySource()
        val patchBody = tripleQuotedValue(source, "PATCH_INCOMING_METADATA_BODY")
        val enabledIndex = patchBody.indexOf("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_IS_ENABLED")
        val nativeLookupIndex = patchBody.indexOf(
            "invoke-virtual {p1, v0}, Lowd;->h(Loth;)Lotk;"
        )
        val cacheGetIndex = patchBody.indexOf("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_GET_CACHED_PATCHED_METADATA")
        val builderIndex = patchBody.indexOf("new-instance v4, Lovv;")
        val cachePutIndex = patchBody.indexOf("ENGLISH_UPPERCASE_TOGGLE_RUNTIME_CACHE_PATCHED_METADATA")

        assertTrue(enabledIndex >= 0)
        assertTrue(enabledIndex < nativeLookupIndex)
        assertTrue(nativeLookupIndex < cacheGetIndex)
        assertTrue(cacheGetIndex < builderIndex)
        assertTrue(builderIndex < cachePutIndex)
        assertTrue(patchBody.contains("check-cast v0, Lowd;"))
        assertTrue(patchBody.contains(":catch_0\n    return-object p1"))
    }

    @Test
    fun softKeyPatchOnlyBuildsAsciiCaseToggleWithoutEnglishHintOrSlideDown() {
        val source = readSoftKeySource()

        assertTrue(source.contains("jasondevToggleAsciiCase"))
        assertTrue(source.contains("sget-object v6, Loth;->c:Loth;"))
        assertFalse(source.contains("jasondevResolveEnglishSlideDown"))
        assertFalse(source.contains("jasondevSyncSyntheticEnglishHint"))
        assertFalse(source.contains("jasondevSyncEnglishHintView"))
        assertFalse(source.contains("Loth;->d:Loth;"))
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
    fun softKeyInjectionAlwaysRunsAfterAnExistingTopRowRewrite() {
        val source = readSoftKeySource()

        assertTrue(source.contains("TOP_ROW_SWIPE_RUNTIME_CLASS"))
        assertTrue(source.contains("name = \"patchIncomingSoftKeyMetadata\""))
        assertTrue(source.contains("topRowDelegateCallIndex + 3"))
        assertTrue(source.contains("mutableMethod.addInstructions(insertIndex, PATCH_INCOMING_METADATA_DELEGATE)"))
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
            "0x7f0b19f6", "0x7f0b18df", "0x7f0b1a66", "0x7f0b190d",
            "0x7f0b196d", "0x7f0b187b", "0x7f0b19fa", "0x7f0b18e0",
            "0x7f0b1a2d", "0x7f0b18ee", "0x7f0b1a6e", "0x7f0b1911",
            "0x7f0b1a4e", "0x7f0b18f8", "0x7f0b199c", "0x7f0b18a0",
            "0x7f0b19d9", "0x7f0b18c8", "0x7f0b19ef", "0x7f0b18dd",
            "0x7f0b193c", "0x7f0b185e", "0x7f0b1a05", "0x7f0b18e5",
            "0x7f0b195f", "0x7f0b1876", "0x7f0b1983", "0x7f0b188e",
            "0x7f0b1987", "0x7f0b1890", "0x7f0b1996", "0x7f0b189b",
            "0x7f0b19ad", "0x7f0b18b1", "0x7f0b19b1", "0x7f0b18b3",
            "0x7f0b19b9", "0x7f0b18b7", "0x7f0b1a75", "0x7f0b1915",
            "0x7f0b1a6b", "0x7f0b1910", "0x7f0b1951", "0x7f0b186f",
            "0x7f0b1a63", "0x7f0b190b", "0x7f0b194c", "0x7f0b186d",
            "0x7f0b19cd", "0x7f0b18bf", "0x7f0b19c6", "0x7f0b18bb"
        )
    }
}
