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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
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

            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, MEDIA, injected.definingClass))
            assertEquals("$where: the feed cache, Media and the injected check's class", 3, classes.size)
            val cache = classes.getValue(FEED_CACHE)
            val merges = cache.methods.filter { it.isFeedMerge() }
            assertEquals("$where: the feed cache's page merges", 1, merges.size)
            val merge = merges.single()

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

            val insertClasses = insertClasses(build)
            assertEquals("$where: classes holding For You's data source with an insert at a position: ${insertClasses.map { it.type }}",
                1, insertClasses.size)
            val insertClass = insertClasses.single()
            val insert = insertClass.methods.single { it.isInsertAt() }

            val context = PatchContexts.of(ExtensionDex.classes() + classes.values + insertClass + item + enumsOf(build, item) + doneHolders(build, classes))
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

            // For You's insert of one item at a position asks right before it checks for a page to
            // put the item in, and an ad goes where having no page goes: the one Integer an if-eqz
            // there jumps to that isn't the answer it reads once the item is in.
            val body = insert.instructions()
            val added = body.indexOfFirst { it.addsAtPosition() }
            val success = body.drop(added).firstNotNullOf { it.integerRead() }
            val noPage = insert.integerReadsJumpedToByIfEqz() - success
            assertEquals("$where: the insert's no-page answers: $noPage", 1, noPage.size)
            val itemReads = body.indices.filter { index ->
                body[index].opcode == Opcode.IGET_OBJECT &&
                    ((body[index] as ReferenceInstruction).reference as FieldReference).type == getter.definingClass
            }
            assertEquals("$where: the insert reads its feed item once", 1, itemReads.size)
            val held = (body[itemReads.single()] as TwoRegisterInstruction).registerA
            val asked = context.mutableClassDefBy(insertClass.type).methods.single { it.sameSignatureAs(insert) }.instructions()
            val asks = asked.indices.filter { asked[it].calls(feedAds, "insertedAd") }
            assertEquals("$where: the insert asks once", 1, asks.size)
            val at = asks.single()
            val insertAsk = asked[at]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, insertAsk.opcode)
            assertEquals("$feedAds->insertedAd(Ljava/lang/Object;)Z", insertAsk.referenceText())
            assertEquals("$where: the ask reads the item", held, (insertAsk as RegisterRangeInstruction).startRegister)
            assertEquals(1, insertAsk.registerCount)
            assertTrue("$where: nothing writes the item's register between its read and the ask",
                body.subList(itemReads.single() + 1, at).none { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == held })
            assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_NEZ), asked.subList(at + 1, at + 3).map { it.opcode })
            val answer = (asked[at + 1] as OneRegisterInstruction).registerA
            assertEquals("$where: the ask's answer is what it branches on", answer, (asked[at + 2] as OneRegisterInstruction).registerA)
            assertTrue("$where: the answer v$answer isn't the item and fits a short register", answer != held && answer < 16)
            assertEquals("$where: the ask goes right before the page's check and its no-page jump",
                listOf(Opcode.CHECK_CAST, Opcode.IF_EQZ), asked.subList(at + 3, at + 5).map { it.opcode })
            assertEquals("$where: an ad goes where having no page goes", asked.branchTarget(at + 4), asked.branchTarget(at + 2))
            assertEquals("$where: that's the no-page answer", noPage.single(), asked[asked.branchTarget(at + 2)].integerRead())
            assertEquals("$where: nothing else changed in the insert",
                body.code().map { it.opcode.kind() }, (asked.subList(0, at) + asked.subList(at + 3, asked.size)).code().map { it.opcode.kind() })

            // For You's other writes, each of the cache's writes taking one list and none of the
            // keys, offsets or counts its reads take, take their items through the filter first thing.
            val writes = cache.methods.filter { it.isListWrite() }
            assertEquals("$where: For You's list writes besides the merge: ${writes.map { it.name }}", 4, writes.size)
            for (write in writes) {
                val hooked = context.mutableClassDefBy(FEED_CACHE).methods.single { it.sameSignatureAs(write) }.instructions()
                assertTrue("$where: ${write.name} has no wide parameter", write.parameterTypes.none { it.toString() == "J" || it.toString() == "D" })
                val items = write.implementation!!.registerCount - (write.parameterTypes.size + 1) + 1 +
                    write.parameterTypes.indexOfFirst { it.toString() == "Ljava/util/List;" }
                val take = hooked[0]
                assertEquals("$where: ${write.name} starts with the filter", Opcode.INVOKE_STATIC_RANGE, take.opcode)
                assertEquals("$feedAds->forYouWrite(Ljava/util/List;)Ljava/util/List;", take.referenceText())
                assertEquals("$where: ${write.name} filters its list", items, (take as RegisterRangeInstruction).startRegister)
                assertEquals(1, take.registerCount)
                assertEquals(Opcode.MOVE_RESULT_OBJECT, hooked[1].opcode)
                assertEquals("$where: the filtered list goes back where it was", items, (hooked[1] as OneRegisterInstruction).registerA)
                assertEquals("$where: nothing else changed in ${write.name}", write.instructions().size + 2, hooked.size)
            }

            // For You's writes of one item, the cache's writes taking the feed item first, ask
            // first and answer Unit for a dropped item.
            val itemWrites = cache.methods.filter { it.isItemWrite(item.type) }
            assertEquals("$where: For You's one-item writes: ${itemWrites.map { it.name }}", 4, itemWrites.size)
            val unit = unitOf(build, itemWrites)
            for (write in itemWrites) {
                val hooked = context.mutableClassDefBy(FEED_CACHE).methods.single { it.sameSignatureAs(write) }.instructions()
                assertTrue("$where: ${write.name} has no wide parameter", write.parameterTypes.none { it.toString() == "J" || it.toString() == "D" })
                // `this` and one register per parameter past the locals: the item is p1.
                val itemRegister = write.implementation!!.registerCount - (write.parameterTypes.size + 1) + 1
                val ask = hooked[0]
                assertEquals("$where: ${write.name} starts with the ask", Opcode.INVOKE_STATIC_RANGE, ask.opcode)
                assertEquals("$feedAds->forYouItem(Ljava/lang/Object;)Z", ask.referenceText())
                assertEquals("$where: ${write.name} asks about its item, p1", itemRegister, (ask as RegisterRangeInstruction).startRegister)
                assertEquals(1, ask.registerCount)
                assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT),
                    hooked.subList(1, 5).map { it.opcode })
                assertTrue("$where: ${write.name} borrows v0, a local", itemRegister > 1)
                assertEquals(listOf(0, 0, 0, 0), hooked.subList(1, 5).map { (it as OneRegisterInstruction).registerA })
                assertEquals("$where: ${write.name} answers the build's Unit", unit, hooked[3].referenceText())
                val stock = write.instructions()
                assertTrue("$where: ${write.name} returns that Unit itself when it's done",
                    stock.indices.any { index ->
                        val load = stock[index]
                        load.opcode == Opcode.SGET_OBJECT && load.referenceText() == unit &&
                            stock.drop(index + 1).firstOrNull { it.opcode == Opcode.RETURN_OBJECT }
                                ?.let { (it as OneRegisterInstruction).registerA == (load as OneRegisterInstruction).registerA } == true
                    })
                assertEquals("$where: ${write.name} ask jumps past the answer", 5, (hooked[2] as OffsetInstruction).codeOffset)
                assertEquals(write.instructions()[0].opcode, hooked[5].opcode)
                // The ask is nine code units, an odd count, so a payload's alignment nop can come or go.
                assertEquals("$where: nothing else changed in ${write.name}",
                    write.instructions().code().size + 5, hooked.code().size)
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
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, MEDIA, injected.definingClass))
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
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, MEDIA, injected.definingClass))
            val inserts = insertClasses(build)
            val merge = classes.getValue(FEED_CACHE).methods.single { it.isFeedMerge() }
            val getter = merge.instructions().mapNotNull { it.mediaGetter() }.distinct().single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass)).getValue(getter.definingClass)
            for (code in listOf(
                "invoke-virtual { v0 }, $getter",
                "invoke-virtual/range { v0 .. v0 }, $getter",
                "invoke-virtual { v0, v1 }, ${getter.definingClass}->decoyPost(Ljava/lang/String;)$MEDIA",
            )) {
                clearMatches()
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + inserts + item + enumsOf(build, item) + doneHolders(build, classes))
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
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, MEDIA, injected.definingClass))
            val inserts = insertClasses(build)
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
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + inserts + item + enumsOf(build, item) + doneHolders(build, classes))
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
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, MEDIA, injected.definingClass))
            val merge = classes.getValue(FEED_CACHE).methods.single { it.isFeedMerge() }
            val getter = merge.instructions().mapNotNull { it.mediaGetter() }.distinct().single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass)).getValue(getter.definingClass)
            val itemWrites = classes.getValue(FEED_CACHE).methods.filter { it.isItemWrite(item.type) }
            val unit = unitOf(build, itemWrites)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values + item + enumsOf(build, item) + doneHolders(build, classes))
            // One write answers another singleton wherever it answered Unit.
            val write = context.mutableClassDefBy(FEED_CACHE).methods.single { it.sameSignatureAs(itemWrites.first()) }
            val loads = write.instructions().withIndex().filter { (_, it) -> it.opcode == Opcode.SGET_OBJECT && it.referenceText() == unit }
            assertTrue("${build.name}: ${write.name} reads $unit", loads.isNotEmpty())
            for ((at, load) in loads) {
                write.replaceInstruction(at, "sget-object v${(load as OneRegisterInstruction).registerA}, LX/Decoy;->A00:LX/Decoy;")
            }
            val error = assertThrows(PatchException::class.java) { applyAds(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("don't share one done answer"))
        }
    }

    @Test
    fun `a done answer whose class isn't a bare singleton is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            clearMatches()
            val injected = FixtureDex.methodsWhere(build, { true }) { it.isInjectedCheck() }.single()
            val classes = FixtureDex.classes(build, setOf(FEED_CACHE, MEDIA, injected.definingClass))
            val merge = classes.getValue(FEED_CACHE).methods.single { it.isFeedMerge() }
            val getter = merge.instructions().mapNotNull { it.mediaGetter() }.distinct().single()
            val item = FixtureDex.classes(build, setOf(getter.definingClass)).getValue(getter.definingClass)
            val unitClass = unitOf(build, classes.getValue(FEED_CACHE).methods.filter { it.isItemWrite(item.type) }).substringBefore("->")
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
        returnType == "Ljava/lang/Object;" && parameterTypes.size == 10 &&
            parameterTypes[4].toString() == "Ljava/util/List;" && parameterTypes[5].toString() == "Ljava/util/Set;" &&
            parameterTypes[8].toString() == "Lkotlin/jvm/functions/Function3;" &&
            instructions().any {
                it.calls(FEED_CACHE.removeSuffix(";") + "\$addAndSaveItemsFromFeedFetchSuccess\$2\$2;", "<init>")
            }

    /** A cache write of a list, read by hand: one list, none of the counts, offsets, keys or sets the cache's reads and merge take. */
    private fun Method.isListWrite(): Boolean {
        if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Ljava/lang/Object;" || implementation == null) return false
        val types = parameterTypes.map { it.toString() }
        return types.count { it == "Ljava/util/List;" } == 1 &&
            types.none { it in setOf("I", "J", "Ljava/lang/String;", "Ljava/util/Set;") }
    }

    private fun Method.isItemWrite(item: String): Boolean = !AccessFlags.STATIC.isSet(accessFlags) &&
        returnType == "Ljava/lang/Object;" && implementation != null && parameterTypes.firstOrNull()?.toString() == item

    /** An insert of one item at a position, read by hand: an Integer answer, the position last, a list add at it. */
    private fun Method.isInsertAt(): Boolean = returnType == "Ljava/lang/Integer;" &&
        parameterTypes.lastOrNull()?.toString() == "I" && instructions().any { it.addsAtPosition() }

    private fun Instruction.addsAtPosition(): Boolean = ((this as? ReferenceInstruction)?.reference as? MethodReference)
        ?.let { it.name == "add" && it.parameterTypes.map { type -> type.toString() } == listOf("I", "Ljava/lang/Object;") } == true

    /** The classes holding For You's local data source with an insert at a position, read from the build. */
    private fun insertClasses(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { true }) { it.isInsertAt() }
        .filter { holder -> holder.fields.any { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == FOR_YOU_LOCAL_SOURCE } }

    /**
     * Kotlin's Unit, read by hand: of the static fields of their own type that every one-item write
     * reads, the one whose class is a bare singleton (an Object holding that one static field, with
     * nothing but its constructors and toString). Some builds rename it.
     */
    private fun unitOf(build: File, writes: List<Method>): String {
        val shared = writes.map { write ->
            write.instructions().filter { it.opcode == Opcode.SGET_OBJECT }
                .map { (it as ReferenceInstruction).reference as FieldReference }
                .filter { it.type == it.definingClass }.map { it.toString() }.toSet()
        }.reduce { all, next -> all intersect next }
        val holders = FixtureDex.classes(build, shared.map { it.substringBefore("->") }.toSet())
        val bare = shared.filter { field ->
            holders[field.substringBefore("->")]?.let { holder ->
                holder.superclass == "Ljava/lang/Object;" && holder.interfaces.isEmpty() &&
                    holder.fields.map { "${it.name}:${it.type}" } == listOf(field.substringAfter("->")) &&
                    AccessFlags.STATIC.isSet(holder.fields.single().accessFlags) &&
                    setOf("<clinit>", "<init>", "toString").containsAll(holder.methods.map { it.name })
            } == true
        }
        assertEquals("${build.name}: the one-item writes' shared bare singletons, of $shared", 1, bare.size)
        return bare.single()
    }

    /** The Integer fields read by the instructions an `if-eqz` of the method jumps to. */
    private fun Method.integerReadsJumpedToByIfEqz(): Set<String> {
        val body = instructions()
        return body.indices.filter { body[it].opcode == Opcode.IF_EQZ }.mapNotNull { body[body.branchTarget(it)].integerRead() }.toSet()
    }

    /** The index the branch at [index] lands on, counted in 16-bit code units. */
    private fun List<Instruction>.branchTarget(index: Int): Int {
        val address = runningFold(0) { at, instruction -> at + instruction.codeUnits }
        return address.indexOf(address[index] + (this[index] as OffsetInstruction).codeOffset)
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
     * The classes the feed cache reads a static field of their own type from, read from the build.
     * The build's Unit is one of them, and the patch reads its shape.
     */
    private fun doneHolders(build: File, classes: Map<String, ClassDef>): Collection<ClassDef> =
        FixtureDex.classes(build, classes.getValue(FEED_CACHE).methods.flatMap { it.instructions() }
            .filter { it.opcode == Opcode.SGET_OBJECT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.type == it.definingClass }.map { it.definingClass }.toSet() - classes.keys).values

    private fun Instruction.typeText(): String = ((this as ReferenceInstruction).reference as TypeReference).type

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }

    private fun Opcode.kind(): Opcode = when (this) {
        Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
        else -> this
    }

    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}
