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
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class HideSuggestedUsersFixtureTest {
    private data class Vendor(val name: String, val classes: List<ClassDef>, val parser: String)

    companion object {
        private fun Method.instructions() = implementation?.instructions?.toList().orEmpty()
        private fun Method.hasString(value: String) = instructions().any {
            it.getReference<StringReference>()?.string == value
        }

        private fun load(build: File): Vendor {
            val anchors = FixtureDex.classesWhere(build, { true }) {
                it.name == "<init>" && it.hasString("XDTSuggestedUsers") ||
                    it.name == "unsafeParseFromJson" && it.hasString(SUGGESTED_USERS) && it.hasString(KICKSTART_USERS)
            }
            val model = anchors.single { it.methods.any { method -> method.hasString("XDTSuggestedUsers") } }
            val parser = anchors.single { it.methods.any { method ->
                method.name == "unsafeParseFromJson" && method.hasString(SUGGESTED_USERS) && method.hasString(KICKSTART_USERS)
            } }
            val cache = FixtureDex.classes(build, setOf(FEED_CACHE)).getValue(FEED_CACHE)
            val merge = cache.methods.single { method -> method.instructions().any {
                it.getReference<MethodReference>()?.definingClass ==
                    "Lcom/instagram/barcelona/feed/data/cache/BarcelonaFeedCache\$addAndSaveItemsFromFeedFetchSuccess\$2\$1;"
            } }
            val media = merge.instructions().mapNotNull { it.getReference<MethodReference>() }.filter {
                it.returnType == MEDIA && it.parameterTypes.isEmpty() && it.definingClass != MEDIA
            }.distinctBy { it.toString() }.single()
            val item = FixtureDex.classes(build, setOf(media.definingClass)).getValue(media.definingClass)
            val kind = item.methods.single { it.hasString("feedItemType") }
            val kinds = FixtureDex.classes(build, setOf(kind.returnType)).getValue(kind.returnType)
            val rawParsers = FixtureDex.classesWhere(build, { true }) { method ->
                method.name == "unsafeParseFromJson" && method.hasString("netego_type") &&
                    method.instructions().any { it.opcode == Opcode.NEW_INSTANCE &&
                        it.getReference<TypeReference>()?.type == model.type }
            }
            val wrapperTypes = parser.methods.flatMap { it.instructions() }.mapNotNull {
                it.getReference<MethodReference>()?.takeIf { call ->
                    call.name == "<init>" && call.parameterTypes.map(CharSequence::toString) == listOf(model.type)
                }?.definingClass
            }.toSet()
            val wrappers = FixtureDex.classes(build, wrapperTypes)
            return Vendor(build.name, anchors + cache + item + kinds + rawParsers + wrappers.values, parser.type)
        }

        private val vendors by lazy { Fixtures.declaredBuilds().map(::load) }
    }

    private fun context(vendor: Vendor): BytecodePatchContext {
        FeedPageMergeFingerprint.clearMatch()
        SuggestedModelFingerprint.clearMatch()
        SuggestedFeedParserFingerprint.clearMatch()
        return PatchContexts.of(ExtensionDex.classes() + vendor.classes).also { feedPageFilterPatch.execute(it) }
    }

    @Test
    fun bothBuildsResolveTypedCardsWithoutSelectingAds() {
        for (vendor in vendors) {
            val context = context(vendor)
            val targets = context.suggestedTargets()
            assertEquals(vendor.name, "A0V", targets.suggestedSlot.name)
            assertEquals(vendor.name, "A0M", targets.kickstartSlot.name)
            assertEquals(vendor.name, "A0L", targets.rawType.name)
            assertEquals(vendor.name, "A0q", targets.content.name)
            hideSuggestedUsersPatch.execute(context)
            val stubs = context.mutableClassDefBy(FEED_ADS).methods
            assertTrue(stubs.single { it.name == "isSuggestedUserItem" }.instructions().size > 2)
            assertEquals(2, stubs.single { it.name == "isAd" }.instructions().size)
            val statuses = context.mutableClassDefBy(SETTINGS_STATUS).methods
            assertEquals(1, (statuses.single { it.name == "hideSuggestedUsers" }.instructions()[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(0, (statuses.single { it.name == "hideAds" }.instructions()[0] as NarrowLiteralInstruction).narrowLiteral)
            val calls = context.mutableClassDefBy(FEED_CACHE).methods.flatMap { it.instructions() }.count {
                it.getReference<MethodReference>()?.toString() == "$FEED_ADS->filter(Ljava/util/List;)Ljava/util/List;"
            }
            assertEquals(vendor.name, 1, calls)
            val capture = context.mutableClassDefBy(targets.wrapper.definingClass).instanceFields.single {
                it.name == targets.capturedRaw.name
            }
            assertEquals(targets.capturedRaw.accessFlags, capture.accessFlags)
            val recording = targets.wrapper.instructions().withIndex().single { (_, instruction) ->
                instruction.opcode == Opcode.IPUT_OBJECT &&
                    instruction.getReference<FieldReference>()?.toString() == capture.toString()
            }.index
            val code = targets.wrapper.instructions()
            assertEquals(Opcode.MOVE_OBJECT_FROM16, code[recording - 2].opcode)
            assertEquals(targets.wrapper.parameterRegisterNumber(0) - 1,
                (code[recording - 2] as TwoRegisterInstruction).registerB)
            assertEquals(Opcode.MOVE_OBJECT_FROM16, code[recording - 1].opcode)
            assertEquals(targets.wrapper.parameterRegisterNumber(0),
                (code[recording - 1] as TwoRegisterInstruction).registerB)
            assertEquals(Opcode.RETURN_VOID, code[recording + 1].opcode)
        }
    }

    @Test
    fun bothFeedPatchesShareOneHookAndEachSelectionWritesOnlyItsOwnRule() {
        // The patcher runs a shared dependency once per run, so both selections must name one instance.
        assertTrue(hideAdsPatch.dependencies.any { it === feedPageFilterPatch })
        assertTrue(hideSuggestedUsersPatch.dependencies.any { it === feedPageFilterPatch })
        fun filterCalls(context: BytecodePatchContext) = context.mutableClassDefBy(FEED_CACHE).methods
            .flatMap { it.instructions() }.count {
                it.getReference<MethodReference>()?.toString() == "$FEED_ADS->filter(Ljava/util/List;)Ljava/util/List;"
            }
        fun status(context: BytecodePatchContext, name: String) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
            .single { it.name == name }.instructions()[0] as NarrowLiteralInstruction).narrowLiteral
        fun stubSize(context: BytecodePatchContext, name: String) =
            context.mutableClassDefBy(FEED_ADS).methods.single { it.name == name }.instructions().size
        for ((build, cards) in Fixtures.declaredBuilds().zip(vendors)) {
            // Hide ads also needs Media and the injected check, which the card fixture leaves out.
            val adClasses = FixtureDex.classesWhere(build, { true }) { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" && method.parameterTypes.size == 1 &&
                    method.instructions().mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }.toSet()
                        .containsAll(listOf(0x8669a9b0.toInt().toLong(), INJECTED_FIELD.toLong()))
            } + FixtureDex.classes(build, setOf(MEDIA)).values
            val vendor = cards.copy(classes = (cards.classes + adClasses).distinctBy { it.type })
            val adsOnly = context(vendor)
            InjectedAdCheckFingerprint.clearMatch()
            hideAdsPatch.execute(adsOnly)
            assertEquals(vendor.name, 1, filterCalls(adsOnly))
            assertEquals(vendor.name, 1, status(adsOnly, "hideAds"))
            assertEquals(vendor.name, 0, status(adsOnly, "hideSuggestedUsers"))
            assertTrue(vendor.name, stubSize(adsOnly, "isAd") > 2)
            assertEquals(vendor.name, 2, stubSize(adsOnly, "isSuggestedUserItem"))

            val suggestionsOnly = context(vendor)
            hideSuggestedUsersPatch.execute(suggestionsOnly)
            assertEquals(vendor.name, 1, filterCalls(suggestionsOnly))
            assertEquals(vendor.name, 0, status(suggestionsOnly, "hideAds"))
            assertEquals(vendor.name, 1, status(suggestionsOnly, "hideSuggestedUsers"))
            assertEquals(vendor.name, 2, stubSize(suggestionsOnly, "isAd"))
            assertTrue(vendor.name, stubSize(suggestionsOnly, "isSuggestedUserItem") > 2)

            val both = context(vendor)
            InjectedAdCheckFingerprint.clearMatch()
            hideAdsPatch.execute(both)
            hideSuggestedUsersPatch.execute(both)
            assertEquals(vendor.name, 1, filterCalls(both))
            assertEquals(vendor.name, 1, status(both, "hideAds"))
            assertEquals(vendor.name, 1, status(both, "hideSuggestedUsers"))
            assertTrue(vendor.name, stubSize(both, "isAd") > 2)
            assertTrue(vendor.name, stubSize(both, "isSuggestedUserItem") > 2)
        }
    }

    private data class Raw(val owner: String, val type: String?)
    private data class Wrapper(val owner: String, val raw: Raw?)
    private data class Card(val owner: String, val kind: Any, val slots: Map<String, Raw> = emptyMap(),
                            val media: Any? = null, val content: Any? = null)

    /** Execute the generated DEX instructions so branch/register mistakes fail independently. */
    private fun evaluate(method: Method, targets: SuggestedTargets, input: Any?): Boolean {
        val code = method.instructions()
        val registers = arrayOfNulls<Any>(method.implementation!!.registerCount)
        registers[registers.lastIndex] = input
        val constants = mapOf(targets.suggestedKind.toString() to Any(), targets.kickstartKind.toString() to Any())
        // Cards use the exact enum instances supplied by the test through this map.
        val card = input as? Card
        val enumValues = constants.toMutableMap()
        if (card != null && card.kind is String) enumValues[card.kind] = card.kind
        val addresses = mutableMapOf<Int, Int>()
        val atAddress = mutableMapOf<Int, Int>()
        var address = 0
        code.forEachIndexed { index, instruction ->
            addresses[index] = address
            atAddress[address] = index
            address += instruction.codeUnits
        }
        var pendingResult: Any? = null
        var at = 0
        repeat(100) {
            val instruction = code[at]
            val a = (instruction as? OneRegisterInstruction)?.registerA ?: -1
            val b = (instruction as? TwoRegisterInstruction)?.registerB ?: -1
            var next = at + 1
            fun jump() = atAddress.getValue(addresses.getValue(at) + (instruction as OffsetInstruction).codeOffset)
            fun zero(value: Any?) = value == null || value == 0
            fun same(left: Any?, right: Any?) = if (left is Int && right is Int) left == right else left === right
            when (instruction.opcode) {
                Opcode.INSTANCE_OF -> {
                    val owner = when (val value = registers[b]) {
                        is Card -> value.owner
                        is Wrapper -> value.owner
                        is Raw -> value.owner
                        else -> null
                    }
                    registers[a] = if (owner == instruction.getReference<TypeReference>()?.type) 1 else 0
                }
                Opcode.CHECK_CAST -> {
                    val owner = when (val value = registers[a]) {
                        is Card -> value.owner
                        is Wrapper -> value.owner
                        is Raw -> value.owner
                        else -> error("Invalid generated cast")
                    }
                    assertEquals(instruction.getReference<TypeReference>()!!.type, owner)
                }
                Opcode.INVOKE_VIRTUAL -> {
                    val call = instruction.getReference<MethodReference>()!!
                    val arguments = instruction.namedRegisters().map { registers[it] }
                    pendingResult = when (call.toString()) {
                        targets.media.toString() -> (arguments[0] as Card).media
                        targets.kind.toString() -> (arguments[0] as Card).kind
                        "Ljava/lang/String;->equals(Ljava/lang/Object;)Z" -> if (arguments[0] == arguments[1]) 1 else 0
                        else -> error("Unexpected generated call: $call")
                    }
                }
                Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT -> registers[a] = pendingResult
                Opcode.SGET_OBJECT -> {
                    val field = instruction.getReference<FieldReference>()!!
                    registers[a] = enumValues.getValue(field.toString())
                }
                Opcode.IGET_OBJECT -> {
                    val field = instruction.getReference<FieldReference>()!!
                    registers[a] = when (val receiver = registers[b]) {
                        is Card -> if (field.toString() == targets.content.toString()) receiver.content
                            else receiver.slots[field.toString()]
                        is Wrapper -> {
                            assertEquals(targets.capturedRaw.toString(), field.toString())
                            assertEquals(field.definingClass, receiver.owner)
                            receiver.raw
                        }
                        is Raw -> {
                            assertEquals(targets.rawType.toString(), field.toString())
                            assertEquals(field.definingClass, receiver.owner)
                            receiver.type
                        }
                        else -> error("Invalid generated field receiver")
                    }
                }
                Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO ->
                    registers[a] = instruction.getReference<StringReference>()!!.string
                Opcode.CONST_4 -> registers[a] = (instruction as NarrowLiteralInstruction).narrowLiteral
                Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> next = jump()
                Opcode.IF_EQZ -> if (zero(registers[a])) next = jump()
                Opcode.IF_NEZ -> if (!zero(registers[a])) next = jump()
                Opcode.IF_EQ -> if (same(registers[a], registers[b])) next = jump()
                Opcode.IF_NE -> if (!same(registers[a], registers[b])) next = jump()
                Opcode.RETURN -> return registers[a] == 1
                else -> error("Unexpected generated opcode: " + instruction.opcode)
            }
            at = next
        }
        error("Generated predicate did not terminate")
    }

    @Test
    fun generatedPredicateRejectsUnknownFallbackKindsMediaAndChainingPlaceholders() {
        for (vendor in vendors) {
            val context = context(vendor)
            val targets = context.suggestedTargets()
            hideSuggestedUsersPatch.execute(context)
            val method = context.mutableClassDefBy(FEED_ADS).methods.single { it.name == "isSuggestedUserItem" }
            fun card(kind: String, slot: FieldReference, raw: String?, media: Any? = null): Card {
                val value = Raw(targets.rawType.definingClass, raw)
                return Card(targets.media.definingClass, kind, mapOf(slot.toString() to value), media,
                    Wrapper(targets.wrapper.definingClass, value))
            }
            for ((kind, slot, type) in listOf(
                Triple(targets.suggestedKind.toString(), targets.suggestedSlot, SUGGESTED_USERS),
                Triple(targets.kickstartKind.toString(), targets.kickstartSlot, KICKSTART_USERS),
            )) {
                assertTrue(vendor.name, evaluate(method, targets, card(kind, slot, type)))
                for (raw in listOf(null, "", "unknown", if (type == SUGGESTED_USERS) KICKSTART_USERS else SUGGESTED_USERS)) {
                    assertFalse(vendor.name, evaluate(method, targets, card(kind, slot, raw)))
                }
                assertFalse(vendor.name, evaluate(method, targets, card(kind, slot, type, Any())))
                assertFalse(vendor.name, evaluate(method, targets, Card(targets.media.definingClass, kind)))
            }
            assertFalse(evaluate(method, targets, null))
            assertFalse(evaluate(method, targets, Raw(targets.rawType.definingClass, SUGGESTED_USERS)))
            assertFalse(evaluate(method, targets, card("ordinary", targets.suggestedSlot, SUGGESTED_USERS)))
        }
    }

    @Test
    fun duplicateKindGetterAndDuplicateEnumWireLiteralAreRefused() {
        for (vendor in vendors) {
            for (duplicateGetter in listOf(true, false)) {
                val context = context(vendor)
                val targets = context.suggestedTargets()
                if (duplicateGetter) {
                    val original = targets.kind
                    context.mutableClassDefBy(original.definingClass).methods.add(ImmutableMethod(
                        original.definingClass, "decoyKind", original.parameters, original.returnType,
                        original.accessFlags, original.annotations, original.hiddenApiRestrictions, original.implementation,
                    ).toMutable())
                } else {
                    context.mutableClassDefBy(targets.kind.returnType).methods.single { it.name == "<clinit>" }
                        .addInstructions(0, "const-string v0, \"$SUGGESTED_USERS\"")
                }
                assertThrows(vendor.name, PatchException::class.java) { hideSuggestedUsersPatch.execute(context) }
            }
        }
    }

    @Test
    fun unknownActiveCardsStayDespiteAnUnusedValidSuggestionSlot() {
        for (vendor in vendors) {
            val context = context(vendor)
            val targets = context.suggestedTargets()
            hideSuggestedUsersPatch.execute(context)
            val method = context.mutableClassDefBy(FEED_ADS).methods.single { it.name == "isSuggestedUserItem" }
            val business = context.mutableClassDefBy(targets.media.definingClass).fields.single {
                it.name == "A0O" && it.type == targets.rawType.definingClass
            }
            val wrapper = vendor.classes.single { type -> type.methods.any {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(targets.rawType.definingClass)
            } }
            val unknown = Raw(targets.rawType.definingClass, "future_business_card")
            val suggested = Raw(targets.rawType.definingClass, SUGGESTED_USERS)
            val slots = mapOf(business.toString() to unknown, targets.suggestedSlot.toString() to suggested)
            assertFalse(vendor.name, evaluate(method, targets, Card(targets.media.definingClass,
                targets.suggestedKind.toString(), slots, content = Wrapper(wrapper.type, unknown))))
            assertFalse(vendor.name, evaluate(method, targets, Card(targets.media.definingClass,
                targets.suggestedKind.toString(), slots, content = Wrapper(wrapper.type,
                    Raw(targets.rawType.definingClass, SUGGESTED_USERS)))))
            assertFalse(vendor.name, evaluate(method, targets, Card(targets.media.definingClass,
                targets.suggestedKind.toString(), slots, content = Wrapper("Lwrong/Wrapper;", suggested))))
            assertFalse(vendor.name, evaluate(method, targets, Card(targets.media.definingClass,
                targets.suggestedKind.toString(), slots)))
            assertFalse(vendor.name, evaluate(method, targets, Card(targets.media.definingClass,
                targets.suggestedKind.toString(), slots, content = Wrapper(wrapper.type, null))))
            val lowerPriority = mapOf(targets.suggestedSlot.toString() to suggested,
                targets.kickstartSlot.toString() to Raw(targets.rawType.definingClass, KICKSTART_USERS))
            assertTrue(vendor.name, evaluate(method, targets, Card(targets.media.definingClass,
                targets.suggestedKind.toString(), lowerPriority, content = Wrapper(wrapper.type, suggested))))
        }
    }

    @Test
    fun captureRejectsOverwrittenWrapperParametersAndFieldCollisions() {
        for (vendor in vendors) {
            for (spoiled in listOf("raw", "this", "field")) {
                val context = context(vendor)
                val targets = context.suggestedTargets()
                if (spoiled == "field") {
                    context.mutableClassDefBy(targets.wrapper.definingClass).instanceFields.add(targets.capturedRaw)
                } else {
                    val raw = targets.wrapper.parameterRegisterNumber(0)
                    val register = if (spoiled == "raw") raw else raw - 1
                    targets.wrapper.addInstructions(2, "const/16 v$register, 0x0")
                }
                assertThrows(vendor.name + " " + spoiled, PatchException::class.java) {
                    hideSuggestedUsersPatch.execute(context)
                }
            }
        }
    }

    @Test
    fun conditionalRawTypeSourceOverwritesAreRefused() {
        for (vendor in vendors) {
            val context = context(vendor)
            val targets = context.suggestedTargets()
            val constructor = context.mutableClassDefBy(targets.rawType.definingClass).methods.single {
                it.name == "<init>" && it.hasString("XDTSuggestedUsers")
            }
            val code = constructor.instructions()
            val store = code.indices.single { code[it].opcode == Opcode.IPUT_OBJECT &&
                code[it].getReference<FieldReference>()?.toString() == targets.rawType.toString() }
            val value = (code[store] as TwoRegisterInstruction).registerA
            constructor.addInstructionsWithLabels(store, """
                if-eqz v8, :original
                const-string v$value, "$SUGGESTED_USERS"
                :original
                nop
            """)
            assertThrows(vendor.name, PatchException::class.java) { hideSuggestedUsersPatch.execute(context) }
        }
    }

    @Test
    fun conditionalParsedTypeSubstitutionIsRefused() {
        for (vendor in vendors) {
            val context = context(vendor)
            val targets = context.suggestedTargets()
            val constructor = context.mutableClassDefBy(targets.rawType.definingClass).methods.single {
                it.name == "<init>" && it.hasString("XDTSuggestedUsers")
            }
            val code = constructor.instructions()
            val store = code.indices.single { code[it].opcode == Opcode.IPUT_OBJECT &&
                code[it].getReference<FieldReference>()?.toString() == targets.rawType.toString() }
            val input = (code[store - 1] as TwoRegisterInstruction).registerB - constructor.parameterRegisterNumber(0)
            val rawParser = vendor.classes.flatMap { it.methods }.single {
                it.name == "unsafeParseFromJson" && it.hasString("netego_type")
            }
            val mutable = context.mutableClassDefBy(rawParser.definingClass).methods.single {
                it.toString() == rawParser.toString()
            }
            val parserCode = mutable.instructions()
            val call = parserCode.indices.single {
                parserCode[it].getReference<MethodReference>()?.toString() == constructor.toString()
            }
            val value = parserCode[call].namedRegisters()[input + 1]
            mutable.addInstructionsWithLabels(call, """
                if-eqz v14, :original
                const-string v$value, "$SUGGESTED_USERS"
                :original
                nop
            """)
            assertThrows(vendor.name, PatchException::class.java) { hideSuggestedUsersPatch.execute(context) }
        }
    }

    @Test
    fun jsonKeyComparisonBypassesAreRefused() {
        for (vendor in vendors) {
            for (key in listOf("netego_type", SUGGESTED_USERS, KICKSTART_USERS)) {
                val context = context(vendor)
                val (parser, literal, read) = jsonReader(context, vendor, key)
                // Model loaders must still run so the alternative route is valid vendor code.
                val target = if (key == "netego_type") read else read - 1
                parser.addInstructionsAtControlFlowLabel(literal,
                    "if-nez v${parser.parameterRegisterNumber(0)}, :typed_read",
                    ExternalLabel("typed_read", parser.getInstruction(target)))
                val flow = ControlFlow.of(parser)
                val reached = mutableSetOf<Int>()
                val pending = ArrayDeque<Int>()
                pending.add(0)
                while (pending.isNotEmpty()) {
                    val at = pending.removeFirst()
                    if (reached.add(at)) (flow.normal[at] + flow.exceptional[at]).forEach(pending::add)
                }
                assertTrue("The regression bypass must be reachable", literal in reached)
                assertThrows(vendor.name + ": " + key, PatchException::class.java) {
                    hideSuggestedUsersPatch.execute(context)
                }
            }
        }
    }

    @Test
    fun conditionalJsonReaderInputSubstitutionsAreRefused() {
        for (vendor in vendors) {
            for (key in listOf("netego_type", SUGGESTED_USERS, KICKSTART_USERS)) {
                val context = context(vendor)
                val (parser, _, read) = jsonReader(context, vendor, key)
                val input = parser.instructions()[read].namedRegisters().last()
                parser.addInstructionsWithLabels(read, """
                    if-eqz v$input, :original
                    const/16 v$input, 0x0
                    :original
                    nop
                """)
                assertThrows(vendor.name + ": " + key, PatchException::class.java) {
                    hideSuggestedUsersPatch.execute(context)
                }
            }
        }
    }

    private fun jsonReader(context: BytecodePatchContext, vendor: Vendor, key: String): Triple<MutableMethod, Int, Int> {
        val owner = if (key == "netego_type") vendor.classes.single { type -> type.methods.any {
            it.name == "unsafeParseFromJson" && it.hasString(key)
        } } else vendor.classes.single { it.type == vendor.parser }
        val parser = context.mutableClassDefBy(owner.type).methods.single { it.name == "unsafeParseFromJson" }
        val code = parser.instructions()
        val literal = code.indices.single { code[it].getReference<StringReference>()?.string == key }
        val read = code.indices.drop(literal + 1).first { at ->
            val call = code[at].getReference<MethodReference>()
            call != null && call.parameterTypes.map(CharSequence::toString) ==
                parser.parameterTypes.map(CharSequence::toString) &&
                if (key == "netego_type") call.returnType == "Ljava/lang/String;"
                else call.name == "parseFromJsonParser" && call.returnType == "Ljava/lang/Object;"
        }
        return Triple(parser, literal, read)
    }

    @Test
    fun conditionalJsonKeySubstitutionsAreRefused() {
        for (vendor in vendors) {
            for (key in listOf("netego_type", SUGGESTED_USERS, KICKSTART_USERS)) {
                val context = context(vendor)
                val parser = if (key == "netego_type") vendor.classes.flatMap { it.methods }.single {
                    it.name == "unsafeParseFromJson" && it.hasString(key)
                } else vendor.classes.single { it.type == vendor.parser }.methods.single {
                    it.name == "unsafeParseFromJson"
                }
                val mutable = context.mutableClassDefBy(parser.definingClass).methods.single {
                    it.toString() == parser.toString()
                }
                val code = mutable.instructions()
                val literal = code.indices.single { code[it].getReference<StringReference>()?.string == key }
                val input = (code[literal] as OneRegisterInstruction).registerA
                mutable.addInstructionsWithLabels(literal + 1, """
                    if-eqz v$input, :original
                    const-string v$input, "tracking_token"
                    :original
                    nop
                """)
                assertThrows(vendor.name + ": " + key, PatchException::class.java) {
                    hideSuggestedUsersPatch.execute(context)
                }
            }
        }
    }

    @Test
    fun conditionalWrapperTypeSubstitutionIsRefused() {
        for (vendor in vendors) {
            for (nullValue in listOf(false, true)) {
                val context = context(vendor)
                val targets = context.suggestedTargets()
                val wrapper = targets.wrapper
                val code = wrapper.instructions()
                val read = code.indices.single { code[it].opcode == Opcode.IGET_OBJECT &&
                    code[it].getReference<FieldReference>()?.toString() == targets.rawType.toString() }
                val output = (code[read] as OneRegisterInstruction).registerA
                val replacement = if (nullValue) "const/4 v$output, 0x0"
                    else "const-string v$output, \"$SUGGESTED_USERS\""
                wrapper.addInstructionsWithLabels(read + 1, """
                    if-eqz v$output, :original
                    $replacement
                    :original
                    nop
                """)
                assertThrows(vendor.name, PatchException::class.java) { hideSuggestedUsersPatch.execute(context) }
            }
        }
    }

    @Test
    fun overwrittenRawTypeFieldsAreRefused() {
        for (vendor in vendors) {
            val context = context(vendor)
            val targets = context.suggestedTargets()
            val constructor = context.mutableClassDefBy(targets.rawType.definingClass).methods.single {
                it.name == "<init>" && it.hasString("XDTSuggestedUsers")
            }
            val code = constructor.instructions()
            val store = code.indices.single { code[it].opcode == Opcode.IPUT_OBJECT &&
                code[it].getReference<FieldReference>()?.toString() == targets.rawType.toString() }
            val registers = code[store] as TwoRegisterInstruction
            constructor.addInstructions(store + 1,
                "const-string v" + registers.registerA + ", \"$SUGGESTED_USERS\"\n" +
                    "iput-object v" + registers.registerA + ", v" + registers.registerB + ", " + targets.rawType)
            assertThrows(vendor.name, PatchException::class.java) { hideSuggestedUsersPatch.execute(context) }
        }
    }

    @Test
    fun duplicateParserSlotAndDiscardedRawMapValueAreRefused() {
        for (vendor in vendors) {
            for (duplicateSlot in listOf(true, false)) {
                val context = context(vendor)
                val targets = context.suggestedTargets()
                if (duplicateSlot) {
                    val parser = context.mutableClassDefBy(vendor.parser).methods.single { it.name == "unsafeParseFromJson" }
                    val code = parser.instructions()
                    val store = code.indices.single { code[it].opcode == Opcode.IPUT_OBJECT &&
                        code[it].getReference<FieldReference>()?.toString() == targets.suggestedSlot.toString() }
                    val source = code[store] as TwoRegisterInstruction
                    val other = context.mutableClassDefBy(targets.media.definingClass).fields.first {
                        it.type == targets.suggestedSlot.type && it.name != targets.suggestedSlot.name && it.name != targets.kickstartSlot.name
                    }
                    parser.addInstructions(store, "iput-object v" + source.registerA + ", v" + source.registerB + ", " + other)
                } else {
                    val wrapper = vendor.classes.flatMap { it.methods }.single { method ->
                        method.name == "<init>" && method.parameterTypes.map(CharSequence::toString) == listOf(targets.rawType.definingClass)
                    }
                    val mutable = context.mutableClassDefBy(wrapper.definingClass).methods.single { it.toString() == wrapper.toString() }
                    val code = mutable.instructions()
                    val read = code.indices.single { code[it].opcode == Opcode.IGET_OBJECT &&
                        code[it].getReference<FieldReference>()?.toString() == targets.rawType.toString() }
                    val output = (code[read] as OneRegisterInstruction).registerA
                    mutable.addInstructions(read + 1, "const/4 v$output, 0x0")
                }
                assertThrows(vendor.name, PatchException::class.java) { hideSuggestedUsersPatch.execute(context) }
            }
        }
    }
}
