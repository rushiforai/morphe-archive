/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Assert.assertThrows
import org.junit.Test
import java.io.File

/**
 * Hide ads on each declared build: the two things it finds are there once in the whole build, and
 * the patch, run over the build's own classes, puts the filter in front of the merge and writes the
 * extension's three stubs against the build's names. The item's unit type enum goes in each
 * context, since the patch reads the item's field of it.
 */
class HideAdsFixtureTest {
    private val feedAds = "$EXTENSION_PACKAGE/ads/FeedAds;"

    private fun clearMatches() {
        FeedPageMergeFingerprint.clearMatch()
        SpoolFeedPageMergeFingerprint.clearMatch()
        InjectedAdCheckFingerprint.clearMatch()
    }

    private fun applyAds(context: BytecodePatchContext) {
        feedPageFilterPatch.execute(context)
        hideAdsPatch.execute(context)
    }

    @Test
    fun `each declared build has one feed merge and one injected check, and the patch hooks both`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val where = build.name
            val checks = FixtureDex.methodsWhere(build, { true }) { it.isInjectedCheck() }
            assertEquals("$where: static boolean methods reading the injected hash", 1, checks.size)
            val injected = checks.single()

            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, SPOOL_FEED_CACHE, FEED_CACHE_HANDLER, FOR_YOU_LOCAL_SOURCE, MEDIA, injected.definingClass))
            assertEquals("$where: both feed caches, the feed cache's handler, For You's data source, Media and the injected check's class", 6, classes.size)
            val merges = classes.getValue(FEED_CACHE).methods.filter { it.isFeedMerge() }
            assertEquals("$where: the feed cache's page merges", 1, merges.size)
            val merge = merges.single()
            val spoolMerges = classes.getValue(SPOOL_FEED_CACHE).methods.filter { it.isSpoolMerge() }
            assertEquals("$where: the spool cache's page merges", 1, spoolMerges.size)
            val spoolMerge = spoolMerges.single()

            val getters = merge.instructions().mapNotNull { it.mediaGetter() }.distinct()
            assertEquals("$where: the merge has one distinct item getter: $getters", 1, getters.size)
            val getter = getters.single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass))[getter.definingClass]
            assertNotNull("$where: the item class ${getter.definingClass} is in the build", item)
            assertTrue(
                "$where: ${getter.definingClass} defines ${getter.name}()",
                item!!.methods.any { it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == MEDIA },
            )
            val askers = classes.getValue(MEDIA).methods.filter { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.instructions().any { it.calls(injected.definingClass, injected.name) }
            }
            assertEquals("$where: Media's own methods that ask the injected check", 1, askers.size)

            val context = PatchContexts.of(ExtensionDex.classes() + classes.values + item + enumsOf(build, item) + doneHolders(build, classes))
            applyAds(context)

            val patched = context.mutableClassDefBy(FEED_CACHE).methods.single { it.sameSignatureAs(merge) }
            val head = patched.instructions()
            // `this` and one register per parameter, none of them wide; the page is p5.
            val page = patched.implementation!!.registerCount - (merge.parameterTypes.size + 1) + 5
            val filter = head[0]
            assertEquals("$where: the merge starts with the filter", Opcode.INVOKE_STATIC_RANGE, filter.opcode)
            assertEquals("$feedAds->filter(Ljava/util/List;)Ljava/util/List;", filter.referenceText())
            assertEquals("$where: the filter reads the page, p5", page, (filter as RegisterRangeInstruction).startRegister)
            assertEquals(1, filter.registerCount)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, head[1].opcode)
            assertEquals("$where: the filtered page goes back in p5", page, (head[1] as OneRegisterInstruction).registerA)
            assertEquals("$where: nothing else changed in the merge", merge.instructions().size + 2, head.size)

            // The spool's merge takes the same items as its sixth parameter, p6.
            val spoolPatched = context.mutableClassDefBy(SPOOL_FEED_CACHE).methods.single { it.sameSignatureAs(spoolMerge) }
            val spoolHead = spoolPatched.instructions()
            val spoolPage = spoolPatched.implementation!!.registerCount - (spoolMerge.parameterTypes.size + 1) + 6
            val spoolFilter = spoolHead[0]
            assertEquals("$where: the spool merge starts with the filter", Opcode.INVOKE_STATIC_RANGE, spoolFilter.opcode)
            assertEquals("$feedAds->spoolPage(Ljava/util/List;)Ljava/util/List;", spoolFilter.referenceText())
            assertEquals("$where: the filter reads the spool page, p6", spoolPage, (spoolFilter as RegisterRangeInstruction).startRegister)
            assertEquals(1, spoolFilter.registerCount)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, spoolHead[1].opcode)
            assertEquals("$where: the filtered page goes back in p6", spoolPage, (spoolHead[1] as OneRegisterInstruction).registerA)
            assertEquals("$where: nothing else changed in the spool merge", spoolMerge.instructions().size + 2, spoolHead.size)
            assertEquals("$where: the spool page is the List parameter", "Ljava/util/List;", spoolMerge.parameterTypes[5].toString())

            // Both For You handlers' insert of one item at a position asks first, and an ad gets the
            // feed cache handler's answer for having no page: the one Integer an if-eqz there jumps
            // to that isn't the spool insert's only answer, its success.
            val declaredInserts = classes.getValue(FOR_YOU_LOCAL_SOURCE).methods.filter { it.isInsert() }
            assertEquals("$where: For You's data source declares one insert", 1, declaredInserts.size)
            assertEquals("$where: the insert takes the merge's feed item", getter.definingClass,
                declaredInserts.single().parameterTypes[0].toString())
            val inserts = listOf(FEED_CACHE_HANDLER, SPOOL_FEED_CACHE).associateWith { handler ->
                classes.getValue(handler).methods.single { it.sameSignatureAs(declaredInserts.single()) }
            }
            val success = inserts.getValue(SPOOL_FEED_CACHE).integerReads()
            assertEquals("$where: the spool insert has one answer", 1, success.size)
            val noPage = inserts.getValue(FEED_CACHE_HANDLER).integerReadsJumpedToByIfEqz() - success
            assertEquals("$where: the feed cache handler's no-page answers: $noPage", 1, noPage.size)
            for ((handler, insert) in inserts) {
                val hooked = context.mutableClassDefBy(handler).methods.single { it.sameSignatureAs(insert) }.instructions()
                val ask = hooked[0]
                assertEquals("$where: $handler's insert starts with the ask", Opcode.INVOKE_STATIC_RANGE, ask.opcode)
                assertEquals("$feedAds->insertedAd(Ljava/lang/Object;)Z", ask.referenceText())
                // `this` and the item, then the int position, past the locals: the item is p1.
                val itemRegister = (insert.implementation!!.registerCount - 3) + 1
                assertEquals("$where: $handler's ask reads the item, p1", itemRegister, (ask as RegisterRangeInstruction).startRegister)
                assertEquals(1, ask.registerCount)
                assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT),
                    hooked.subList(1, 5).map { it.opcode })
                assertTrue("$where: $handler borrows v0, a local", insert.implementation!!.registerCount > 3)
                assertEquals(listOf(0, 0, 0, 0), hooked.subList(1, 5).map { (it as OneRegisterInstruction).registerA })
                assertEquals("$where: $handler answers the no-page code for an ad", noPage.single(), hooked[3].referenceText())
                // A no goes on to the insert's own first instruction, which comes right after. The
                // offset counts 16-bit code units: if-eqz and sget-object take two, return-object one.
                assertEquals("$where: $handler's ask jumps past the answer", 5, (hooked[2] as OffsetInstruction).codeOffset)
                assertEquals(insert.instructions()[0].opcode, hooked[5].opcode)
                assertEquals("$where: nothing else changed in $handler's insert", insert.instructions().size + 5, hooked.size)
            }

            // For You's other writes, the data source's abstract methods taking one list besides the
            // merge, take their items through the filter first thing on both handlers.
            val writes = classes.getValue(FOR_YOU_LOCAL_SOURCE).methods.filter { method ->
                AccessFlags.ABSTRACT.isSet(method.accessFlags) && !method.sameSignatureAs(spoolMerge) &&
                    method.parameterTypes.count { it.toString() == "Ljava/util/List;" } == 1
            }
            assertEquals("$where: For You's list writes besides the merge: ${writes.map { it.name }}", 4, writes.size)
            for (handler in listOf(FEED_CACHE_HANDLER, SPOOL_FEED_CACHE)) {
                val entry = if (handler == SPOOL_FEED_CACHE) "spoolWrite" else "forYouWrite"
                for (write in writes) {
                    val original = classes.getValue(handler).methods.single { it.sameSignatureAs(write) }
                    val hooked = context.mutableClassDefBy(handler).methods.single { it.sameSignatureAs(write) }.instructions()
                    assertTrue("$where: ${write.name} has no wide parameter", write.parameterTypes.none { it.toString() == "J" || it.toString() == "D" })
                    val items = original.implementation!!.registerCount - (write.parameterTypes.size + 1) + 1 +
                        write.parameterTypes.indexOfFirst { it.toString() == "Ljava/util/List;" }
                    val take = hooked[0]
                    assertEquals("$where: $handler's ${write.name} starts with the filter", Opcode.INVOKE_STATIC_RANGE, take.opcode)
                    assertEquals("$feedAds->$entry(Ljava/util/List;)Ljava/util/List;", take.referenceText())
                    assertEquals("$where: $handler's ${write.name} filters its list", items, (take as RegisterRangeInstruction).startRegister)
                    assertEquals(1, take.registerCount)
                    assertEquals(Opcode.MOVE_RESULT_OBJECT, hooked[1].opcode)
                    assertEquals("$where: the filtered list goes back where it was", items, (hooked[1] as OneRegisterInstruction).registerA)
                    assertEquals("$where: nothing else changed in $handler's ${write.name}", original.instructions().size + 2, hooked.size)
                }
            }
            val feedHandlerMerge = context.mutableClassDefBy(FEED_CACHE_HANDLER).methods.single { it.sameSignatureAs(spoolMerge) }
            assertTrue("$where: the feed cache handler's merge isn't hooked, its merge in the feed cache is",
                feedHandlerMerge.instructions().none { (it as? ReferenceInstruction)?.reference.toString().startsWith(feedAds) })

            // For You's writes of one item, the abstract methods taking the feed item first and
            // answering an Object, ask first on both handlers and answer Unit for a dropped item.
            val itemWrites = classes.getValue(FOR_YOU_LOCAL_SOURCE).methods.filter { method ->
                AccessFlags.ABSTRACT.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Object;" &&
                    method.parameterTypes.firstOrNull()?.toString() == getter.definingClass
            }
            assertEquals("$where: For You's one-item writes: ${itemWrites.map { it.name }}", 4, itemWrites.size)
            // A write that's done without suspending answers Kotlin's Unit, which some builds rename
            // (the x86 build's is LX/BZ8;->A00). The feed cache handler's writes hand on to the feed
            // cache and end on it: answer what came back if it's the suspended marker, else Unit.
            val unit = classes.getValue(FEED_CACHE_HANDLER).methods.single { it.sameSignatureAs(itemWrites.first()) }
                .instructions().takeLast(2).also { (load, ret) ->
                    assertEquals("$where: the feed cache handler's ${itemWrites.first().name} ends on Unit",
                        listOf(Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT), listOf(load.opcode, ret.opcode))
                }.first().referenceText()
            // Unit's class is a bare singleton: an Object holding one static field of its own type,
            // with nothing but its constructors and toString.
            val unitClass = unit.substringBefore("->")
            assertEquals("$where: $unit is of its own class", unitClass, unit.substringAfterLast(':'))
            val unitDef = FixtureDex.classes(build, setOf(unitClass)).getValue(unitClass)
            assertEquals("$where: $unitClass extends Object", "Ljava/lang/Object;", unitDef.superclass)
            assertEquals("$where: $unitClass's fields", listOf(unit.substringAfter("->")), unitDef.fields.map { "${it.name}:${it.type}" })
            assertTrue("$where: $unit is static", AccessFlags.STATIC.isSet(unitDef.fields.single().accessFlags))
            assertTrue("$where: $unitClass's methods: ${unitDef.methods.map { it.name }}",
                setOf("<clinit>", "<init>", "toString").containsAll(unitDef.methods.map { it.name }))
            for (handler in listOf(FEED_CACHE_HANDLER, SPOOL_FEED_CACHE)) {
                val entry = if (handler == SPOOL_FEED_CACHE) "spoolItem" else "forYouItem"
                for (write in itemWrites) {
                    val original = classes.getValue(handler).methods.single { it.sameSignatureAs(write) }
                    val hooked = context.mutableClassDefBy(handler).methods.single { it.sameSignatureAs(write) }.instructions()
                    assertTrue("$where: ${write.name} has no wide parameter", write.parameterTypes.none { it.toString() == "J" || it.toString() == "D" })
                    // `this` and one register per parameter past the locals: the item is p1.
                    val itemRegister = original.implementation!!.registerCount - (write.parameterTypes.size + 1) + 1
                    val ask = hooked[0]
                    assertEquals("$where: $handler's ${write.name} starts with the ask", Opcode.INVOKE_STATIC_RANGE, ask.opcode)
                    assertEquals("$feedAds->$entry(Ljava/lang/Object;)Z", ask.referenceText())
                    assertEquals("$where: $handler's ${write.name} asks about its item, p1", itemRegister, (ask as RegisterRangeInstruction).startRegister)
                    assertEquals(1, ask.registerCount)
                    assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT),
                        hooked.subList(1, 5).map { it.opcode })
                    assertTrue("$where: $handler's ${write.name} borrows v0, a local", itemRegister > 1)
                    assertEquals(listOf(0, 0, 0, 0), hooked.subList(1, 5).map { (it as OneRegisterInstruction).registerA })
                    assertEquals("$where: $handler's ${write.name} answers the build's Unit", unit, hooked[3].referenceText())
                    assertTrue("$where: $handler's ${write.name} returns that Unit itself when it's done",
                        original.instructions().zipWithNext().any { (load, ret) ->
                            load.opcode == Opcode.SGET_OBJECT && load.referenceText() == unit && ret.opcode == Opcode.RETURN_OBJECT &&
                                (load as OneRegisterInstruction).registerA == (ret as OneRegisterInstruction).registerA
                        })
                    assertEquals("$where: $handler's ${write.name} ask jumps past the answer", 5, (hooked[2] as OffsetInstruction).codeOffset)
                    assertEquals(original.instructions()[0].opcode, hooked[5].opcode)
                    // The ask is nine code units, an odd count, so a payload's alignment nop can come or go.
                    assertEquals("$where: nothing else changed in $handler's ${write.name}",
                        original.instructions().code().size + 5, hooked.code().size)
                }
            }

            val stubs = context.mutableClassDefBy(feedAds).methods
            val itemMedia = stubs.single { it.name == "itemMedia" }.instructions()
            assertEquals(getter.definingClass, itemMedia.first { it.opcode == Opcode.INSTANCE_OF }.typeText())
            assertEquals(
                "${getter.definingClass}->${getter.name}()$MEDIA",
                itemMedia.single { it.opcode == Opcode.INVOKE_VIRTUAL }.referenceText(),
            )
            val isAd = stubs.single { it.name == "isAd" }.instructions()
            assertEquals(
                "$MEDIA->${askers.single().name}()Z",
                isAd.single { it.opcode == Opcode.INVOKE_VIRTUAL }.referenceText(),
            )

            // Read apart: the item's one "feedItemType" getter reads one field, whose enum names
            // every ad kind the extension drops and the ordinary kinds it keeps.
            val typeGetters = item.methods.filter { method -> method.instructions().any { it.stringText() == FEED_ITEM_TYPE } }
            assertEquals("$where: ${item.type}'s feedItemType getters", 1, typeGetters.size)
            val typeField = typeGetters.single().instructions()
                .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }.single()
            val unitEnum = enumsOf(build, item).single { it.type == typeField.type }
            val names = unitEnum.methods.single { it.name == "<clinit>" }.instructions().mapNotNull { it.stringText() }.toSet()
            for (name in UNIT_TYPE_NAMES + listOf("ADS_FEEDBACK_INTERFACE_INTERESTS_PICKER", "ADS_FEEDBACK_INTERFACE_REPETITION",
                "MEDIA", "STORIES_NETEGO", "CLIPS_NETEGO")) {
                assertTrue("$where: ${unitEnum.type} names $name", name in names)
            }
            val unitType = stubs.single { it.name == "itemUnitType" }.instructions()
            assertEquals(item.type, unitType.first { it.opcode == Opcode.INSTANCE_OF }.typeText())
            assertEquals(item.type, unitType.first { it.opcode == Opcode.CHECK_CAST }.typeText())
            assertEquals("$where: the stub reads the field the item's own getter reads",
                typeField.toString(), unitType.single { it.opcode == Opcode.IGET_OBJECT }.referenceText())
            assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT,
                Opcode.CONST_4, Opcode.RETURN_OBJECT), unitType.map { it.opcode })

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideAds" }.instructions()
            assertEquals("$where: SettingsStatus.hideAds() answers true", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }

    @Test
    fun `two distinct Media getters are rejected rather than choosing the first`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val injected = FixtureDex.methodsWhere(build, { true }) { it.isInjectedCheck() }.single()
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, SPOOL_FEED_CACHE, FEED_CACHE_HANDLER, FOR_YOU_LOCAL_SOURCE, MEDIA, injected.definingClass))
            val merge = classes.getValue(FEED_CACHE).methods.single { it.isFeedMerge() }
            val getter = merge.instructions().mapNotNull { it.mediaGetter() }.distinct().single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass)).getValue(getter.definingClass)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values + item + enumsOf(build, item) + doneHolders(build, classes))
            val mutable = context.mutableClassDefBy(FEED_CACHE).methods.single { it.sameSignatureAs(merge) }
            mutable.addInstructions(
                0,
                """
                    check-cast v0, ${getter.definingClass}
                    invoke-virtual { v0 }, ${getter.definingClass}->decoyPost()$MEDIA
                """,
            )
            val error = assertThrows(PatchException::class.java) { applyAds(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("decoyPost"))
        }
    }

    @Test
    fun `repeated getters and unrelated prototypes do not create another target`() {
        for (build in Fixtures.declaredBuilds()) {
            val injected = FixtureDex.methodsWhere(build, { true }) { it.isInjectedCheck() }.single()
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, SPOOL_FEED_CACHE, FEED_CACHE_HANDLER, FOR_YOU_LOCAL_SOURCE, MEDIA, injected.definingClass))
            val merge = classes.getValue(FEED_CACHE).methods.single { it.isFeedMerge() }
            val getter = merge.instructions().mapNotNull { it.mediaGetter() }.distinct().single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass)).getValue(getter.definingClass)
            for (code in listOf(
                "invoke-virtual { v0 }, $getter",
                "invoke-virtual/range { v0 .. v0 }, $getter",
                "invoke-virtual { v0, v1 }, ${getter.definingClass}->decoyPost(Ljava/lang/String;)$MEDIA",
            )) {
                clearMatches()
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + item + enumsOf(build, item) + doneHolders(build, classes))
                val mutable = context.mutableClassDefBy(FEED_CACHE).methods.single { it.sameSignatureAs(merge) }
                mutable.addInstructions(0, "check-cast v0, ${getter.definingClass}\n$code")
                applyAds(context)
                val stub = context.mutableClassDefBy(feedAds).methods.single { it.name == "itemMedia" }.instructions()
                assertEquals("the actual no-argument getter is used", getter.toString(), stub.single { it.opcode == Opcode.INVOKE_VIRTUAL }.referenceText())
            }
        }
    }

    @Test
    fun `discarding the injected result or bypassing it rejects the Media predicate`() {
        for (build in Fixtures.declaredBuilds()) {
            val injected = FixtureDex.methodsWhere(build, { true }) { it.isInjectedCheck() }.single()
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, SPOOL_FEED_CACHE, FEED_CACHE_HANDLER, FOR_YOU_LOCAL_SOURCE, MEDIA, injected.definingClass))
            val merge = classes.getValue(FEED_CACHE).methods.single { it.isFeedMerge() }
            val getter = merge.instructions().mapNotNull { it.mediaGetter() }.distinct().single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass)).getValue(getter.definingClass)
            val predicate = classes.getValue(MEDIA).methods.single { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.instructions().any { it.calls(injected.definingClass, injected.name) }
            }
            for (bypass in listOf(false, true)) {
                clearMatches()
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + item + enumsOf(build, item) + doneHolders(build, classes))
                val mutable = context.mutableClassDefBy(MEDIA).methods.single { it.sameSignatureAs(predicate) }
                val result = (predicate.instructions().last() as OneRegisterInstruction).registerA
                if (bypass) mutable.addInstructions(0, "const/4 v$result, 0x0\nreturn v$result")
                else mutable.addInstructions(predicate.instructions().lastIndex, "const/4 v$result, 0x0")
                val error = assertThrows(PatchException::class.java) { applyAds(context) }
                assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("directly returns"))
            }
        }
    }

    @Test
    fun `a one-item write that stops answering the build's Unit is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val injected = FixtureDex.methodsWhere(build, { true }) { it.isInjectedCheck() }.single()
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, SPOOL_FEED_CACHE, FEED_CACHE_HANDLER, FOR_YOU_LOCAL_SOURCE, MEDIA, injected.definingClass))
            val merge = classes.getValue(FEED_CACHE).methods.single { it.isFeedMerge() }
            val getter = merge.instructions().mapNotNull { it.mediaGetter() }.distinct().single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass)).getValue(getter.definingClass)
            val declared = classes.getValue(FOR_YOU_LOCAL_SOURCE).methods.first { method ->
                AccessFlags.ABSTRACT.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Object;" &&
                    method.parameterTypes.firstOrNull()?.toString() == getter.definingClass
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values + item + enumsOf(build, item) + doneHolders(build, classes))
            // The feed cache handler's write ends on its Unit; it answers another singleton instead.
            val write = context.mutableClassDefBy(FEED_CACHE_HANDLER).methods.single { it.sameSignatureAs(declared) }
            val at = write.instructions().lastIndex - 1
            val register = (write.instructions()[at] as OneRegisterInstruction).registerA
            write.replaceInstruction(at, "sget-object v$register, LX/Decoy;->A00:LX/Decoy;")
            val error = assertThrows(PatchException::class.java) { applyAds(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("don't share one done answer"))
        }
    }

    @Test
    fun `a done answer whose class isn't a bare singleton is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val injected = FixtureDex.methodsWhere(build, { true }) { it.isInjectedCheck() }.single()
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, SPOOL_FEED_CACHE, FEED_CACHE_HANDLER, FOR_YOU_LOCAL_SOURCE, MEDIA, injected.definingClass))
            val merge = classes.getValue(FEED_CACHE).methods.single { it.isFeedMerge() }
            val getter = merge.instructions().mapNotNull { it.mediaGetter() }.distinct().single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass)).getValue(getter.definingClass)
            val declared = classes.getValue(FOR_YOU_LOCAL_SOURCE).methods.first { method ->
                AccessFlags.ABSTRACT.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Object;" &&
                    method.parameterTypes.firstOrNull()?.toString() == getter.definingClass
            }
            val unitClass = classes.getValue(FEED_CACHE_HANDLER).methods.single { it.sameSignatureAs(declared) }
                .instructions().takeLast(2).first().referenceText().substringBefore("->")
            assertTrue("$unitClass is among the done holders", doneHolders(build, classes).any { it.type == unitClass })
            // Every write still hands back the same field, but its class is changed one way at a
            // time, each enough to make it something other than Unit. The class goes in changed: the
            // patch reads it as loaded, never a mutable copy made after.
            fun ClassDef.changed(
                superclass: String? = this.superclass,
                interfaces: List<String> = this.interfaces,
                staticFields: List<Field> = this.staticFields.toList(),
                instanceFields: List<Field> = this.instanceFields.toList(),
            ): ClassDef = ImmutableClassDef(type, accessFlags, superclass, interfaces, sourceFile, annotations,
                staticFields, instanceFields, directMethods, virtualMethods)
            fun field(name: String, type: String, flags: Int) = ImmutableField(unitClass, name, type, flags, null, null, null)
            val decoys = linkedMapOf<String, (ClassDef) -> ClassDef?>(
                "an instance field" to { it.changed(instanceFields = it.instanceFields + field("decoy", "I", AccessFlags.PRIVATE.value)) },
                "an enum's superclass, like the suspended marker's" to { it.changed(superclass = "Ljava/lang/Enum;") },
                "an interface it stands in for" to { it.changed(interfaces = it.interfaces + "Ljava/io/Serializable;") },
                "a second instance of itself" to {
                    it.changed(staticFields = it.staticFields + field("second", unitClass,
                        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value))
                },
                "no class in the app" to { null },
            )
            for ((change, decoy) in decoys) {
                clearMatches()
                val holders = doneHolders(build, classes).mapNotNull { if (it.type != unitClass) it else decoy(it) }
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + item + enumsOf(build, item) + holders)
                val error = assertThrows("$change passed for Unit on ${build.name}", PatchException::class.java) { applyAds(context) }
                val expected = if (change == "no class in the app") "isn't in the app" else "isn't a bare singleton"
                assertTrue("$change: ${error.message}", error.message.orEmpty().contains(expected))
            }
        }
    }

    /** The fingerprint's shape, read by hand: static, boolean, one object, both hashes. */
    private fun Method.isInjectedCheck(): Boolean {
        if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || parameterTypes.size != 1) return false
        if (!parameterTypes.single().startsWith("L")) return false
        val literals = instructions().mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }.toSet()
        return 0x8669a9b0.toInt().toLong() in literals && INJECTED_FIELD.toLong() in literals
    }

    private fun Method.isFeedMerge(): Boolean =
        returnType == "Ljava/lang/Object;" && parameterTypes.size == 9 &&
            parameterTypes[4] == "Ljava/util/List;" && parameterTypes[7] == "Lkotlin/jvm/functions/Function3;" &&
            instructions().any {
                it.calls(FEED_CACHE.removeSuffix(";") + "\$addAndSaveItemsFromFeedFetchSuccess\$2\$1;", "<init>")
            }

    private fun Method.isSpoolMerge(): Boolean =
        returnType == "Ljava/lang/Object;" && parameterTypes.size == 9 &&
            parameterTypes[5] == "Ljava/util/List;" && parameterTypes[7] == "Lkotlin/jvm/functions/Function0;" &&
            parameterTypes[8] == "Lkotlin/jvm/functions/Function3;" &&
            instructions().any { (it as? ReferenceInstruction)?.reference.let { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Lcom/instagram/barcelona/spool/core/modelpool/BcnSpoolModelPoolImpl;"
            } }

    private fun Method.isInsert(): Boolean = returnType == "Ljava/lang/Integer;" && parameterTypes.size == 2 &&
        parameterTypes[0].startsWith("L") && parameterTypes[1] == "I"

    /** The Integer fields the method reads with sget-object, as smali names them. */
    private fun Method.integerReads(): Set<String> = instructions().mapNotNull { it.integerRead() }.toSet()

    /** The Integer fields read by the instructions an `if-eqz` of the method jumps to. */
    private fun Method.integerReadsJumpedToByIfEqz(): Set<String> {
        val body = instructions()
        val address = body.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val indexAt = body.indices.associateBy { address[it] }
        return body.indices.filter { body[it].opcode == Opcode.IF_EQZ }.mapNotNull { index ->
            indexAt[address[index] + (body[index] as OffsetInstruction).codeOffset]?.let { body[it].integerRead() }
        }.toSet()
    }

    private fun Instruction.integerRead(): String? =
        ((this as? ReferenceInstruction)?.reference as? FieldReference)
            ?.takeIf { opcode == Opcode.SGET_OBJECT && it.type == "Ljava/lang/Integer;" }?.toString()

    private fun Instruction.mediaGetter(): MethodReference? {
        if (opcode != Opcode.INVOKE_VIRTUAL) return null
        val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
        return reference.takeIf { it.returnType == MEDIA && it.parameterTypes.isEmpty() && it.definingClass != MEDIA }
    }

    private fun Instruction.calls(definingClass: String, name: String): Boolean =
        ((this as? ReferenceInstruction)?.reference as? MethodReference)
            ?.let { it.definingClass == definingClass && it.name == name } == true

    private fun Instruction.referenceText(): String = (this as ReferenceInstruction).reference.toString()

    private fun Instruction.stringText(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    /** The enum classes the item's fields hold, read from the build. Its unit type is one of them. */
    private fun enumsOf(build: File, item: ClassDef): Collection<ClassDef> =
        FixtureDex.classes(build, item.fields.map { it.type }.toSet()).values.filter { it.superclass == "Ljava/lang/Enum;" }

    /**
     * The classes the For You handlers hand straight back from a static field of their own type,
     * read from the build. The build's Unit is one of them, and the patch reads its shape.
     */
    private fun doneHolders(build: File, classes: Map<String, ClassDef>): Collection<ClassDef> =
        FixtureDex.classes(build, listOf(FEED_CACHE_HANDLER, SPOOL_FEED_CACHE).flatMap { classes.getValue(it).methods }
            .flatMap { it.instructions().zipWithNext() }
            .filter { (load, ret) -> load.opcode == Opcode.SGET_OBJECT && ret.opcode == Opcode.RETURN_OBJECT }
            .map { (load, _) -> (load as ReferenceInstruction).reference as FieldReference }
            .filter { it.type == it.definingClass }.map { it.definingClass }.toSet() - classes.keys).values

    private fun Instruction.typeText(): String = ((this as ReferenceInstruction).reference as TypeReference).type

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }

    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}
