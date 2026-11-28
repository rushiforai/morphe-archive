/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.feed.reels

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.feed.FeedItemStandIns
import app.morphe.patches.instagram.feed.FeedItemStandIns.assertFilteredBeforeReturn
import app.morphe.patches.instagram.feed.FeedItemStandIns.instructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class FeedReelsHookTest {
    /** The hook the patch writes is in the FeedReels the bundle ships, public and static. */
    @Test
    fun theHookIsInTheExtension() {
        val type = FILTER.substringBefore("->")
        val declared = ExtensionDex.classDef(type).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$FILTER is not in the extension: $declared", FILTER.substringAfter("->") in declared)
    }

    /** The parse helper's answer goes through the filter and is cast back; the other helper stays. */
    @Test
    fun theParseHelperAnswersThroughTheFilter() {
        val context = PatchContexts.of(classes())

        context.filterParsedFeedItems()

        val patched = context.mutableClassDefBy(FeedItemStandIns.ITEM)
        assertFilteredBeforeReturn("helper", patched.methods.single { it.name == "A02" }, FILTER)
        assertEquals("the other static helper was touched", 2, patched.methods.single { it.name == "A01" }.instructions().size)
    }

    @Test
    fun aKindEnumMissingAReelsUnitFailsThePatch() {
        val context = PatchContexts.of(classes(kindNames = listOf("MEDIA", "CLIPS_NETEGO")))
        assertThrows(PatchException::class.java) { context.filterParsedFeedItems() }
    }

    @Test
    fun anotherEnumNamingAReelsUnitFailsThePatch() {
        val context = PatchContexts.of(classes(fetchNames = listOf("COLD_START", "VIBES_IN_FEED_UNIT")))
        assertThrows(PatchException::class.java) { context.filterParsedFeedItems() }
    }

    @Test
    fun twoParseHelpersFailThePatch() {
        val context = PatchContexts.of(classes(helpers = 2))
        assertThrows(PatchException::class.java) { context.filterParsedFeedItems() }
    }

    /**
     * In each declared build the parser makes one class with a ClipsNetego field, its one static
     * helper parsing from JSON answers through the filter, and one of its enums names every unit.
     */
    @Test
    fun eachDeclaredBuildFiltersTheParsedFeedItem() {
        for (fixture in FeedItemStandIns.fixtures()) {
            val context = PatchContexts.of(fixture.classes)

            context.filterParsedFeedItems()

            val before = fixture.helper
            val after = context.mutableClassDefBy(fixture.itemType).methods.single {
                it.name == before.name && it.parameterTypes.map(Any::toString) == before.parameterTypes.map(Any::toString)
            }
            val returns = before.instructions().count { it.opcode == Opcode.RETURN_OBJECT }
            assertEquals("${fixture.bundle.name}: helper size", before.instructions().size + 3 * returns, after.instructions().size)
            assertFilteredBeforeReturn(fixture.bundle.name, after, FILTER)
        }
    }

    private fun classes(
        kindNames: List<String> = listOf("MEDIA", "AD") + REEL_UNITS,
        fetchNames: List<String> = listOf("COLD_START", "PULL_TO_REFRESH"),
        helpers: Int = 1,
    ) = FeedItemStandIns.classes(kindNames, fetchNames, helpers)
}
