package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderPackedSwitchPayload
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.StandardCopyOption
import java.security.MessageDigest
import org.junit.jupiter.api.AfterEach
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.*

class CommunityInboxTest {
    @AfterEach fun reset() { activeProfile = BASE_PROFILE }
    private fun body(m: Method) = m.implementation!!.instructions.toList()
    private fun reference(i: Instruction) = (i as? ReferenceInstruction)?.reference
    private fun structural(i: Instruction) = listOf(i.opcode, reference(i), (i as? OneRegisterInstruction)?.registerA,
        (i as? TwoRegisterInstruction)?.registerB, (i as? NarrowLiteralInstruction)?.narrowLiteral)

    @Test fun fixtureUsesRecordedStockIdentitiesEvenWhenTheCompiledProfileDrifts() {
        val profile = activeProfile
        val original = profile.nativeCommunityInbox
        val field = ControlProfile::class.java.getDeclaredField("nativeCommunityInbox").apply { isAccessible = true }
        try {
            field.set(profile, original.replaceFirst("->", "->changed_"))
            val contract = assertNotNull(findCommunityInbox(communityInboxFixture()))
            assertEquals(original, contract.identity, "The fixture must not repeat the changed compiled contract")
            assertFailsWith<PatchException> {
                injectCommunityInbox(contract, contract.render as MutableMethod,
                    communityStub(JOINED_COMMUNITY_ROW), communityStub(MAIN_INBOX_SCOPE))
            }
        } finally { field.set(profile, original) }
    }

    @Test fun backwardPathsMustReplaceScratchRegistersBeforeReadingThem() {
        for (register in listOf(1, 3)) for (overwritten in listOf(false, true)) for (branch in listOf("goto", "if", "switch")) {
            val classes = communityInboxFixture()
            val contract = assertNotNull(findCommunityInbox(classes))
            val render = contract.render as MutableMethod
            val at = render.communityReadSite(contract.capturedScope)
            render.replaceInstruction(49, "invoke-static {v$register}, LX/Consumer;->accept(Ljava/lang/Object;)V")
            if (overwritten) render.replaceInstruction(48, "const/4 v$register, 0x0")
            val implementation = render.implementation!!
            val target = implementation.newLabelForIndex(48)
            when (branch) {
                "goto" -> implementation.replaceInstruction(at + 14, BuilderInstruction10t(Opcode.GOTO, target))
                "if" -> implementation.replaceInstruction(at + 13, BuilderInstruction21t(Opcode.IF_EQZ, 2, target))
                "switch" -> {
                    val payloadAt = (at + 15..at + 16).first { body(render).take(it).sumOf { i -> i.codeUnits } % 2 == 0 }
                    val payload = implementation.newLabelForIndex(payloadAt)
                    implementation.replaceInstruction(payloadAt, BuilderPackedSwitchPayload(0, listOf(target)))
                    implementation.replaceInstruction(at + 13, BuilderInstruction31t(Opcode.PACKED_SWITCH, 2, payload))
                }
            }
            val before = body(render).map(::structural)
            if (overwritten) assertNotNull(findCommunityInbox(classes))
            else assertNull(findCommunityInbox(classes), "v$register is live through a backward $branch")
            assertEquals(before, body(render).map(::structural))
        }
    }

    @Test fun bothProjectionPathsRestoreTheNativeListType() {
        val contract = assertNotNull(findCommunityInbox(communityInboxFixture()))
        val render = contract.render as MutableMethod
        val at = render.communityReadSite(contract.capturedScope)
        injectCommunityInbox(contract, render, communityStub(JOINED_COMMUNITY_ROW), communityStub(MAIN_INBOX_SCOPE))
        val code = body(render)
        assertEquals(at + 9, code.branchTarget(at + 6))
        assertEquals(Opcode.CHECK_CAST, code[at + 9].opcode)
        assertEquals(0, (code[at + 9] as OneRegisterInstruction).registerA)
        assertEquals(IMMUTABLE_LIST, reference(code[at + 9]).toString())
    }

    @Test fun everyProfileConnectsTheNativeMembershipAndMainOnlyRendererBeforeEditing() {
        for (profile in controlProfiles.values.toSet()) {
            activeProfile = profile
            val classes = communityInboxFixture()
            val contract = assertNotNull(findCommunityInbox(classes))
            assertEquals(profile.nativeCommunityInbox, contract.identity)
            validateControls(findControls(classes), setOf(COMMUNITY_INBOX))
            val render = contract.render as MutableMethod
            val before = body(render).map(::structural)
            val firstRead = body(render)[5]
            val at = render.communityReadSite(contract.capturedScope)
            val untouched = classes.flatMap { it.methods }.filter { it !== render }.associate { it.hookId() to body(it).map(::structural) }
            val helpers = injectCommunityInbox(contract, render, communityStub(JOINED_COMMUNITY_ROW), communityStub(MAIN_INBOX_SCOPE))
            val after = body(render)
            assertEquals(before, after.filterIndexed { index, _ -> index !in at + 1..at + 9 }.map(::structural))
            assertSame(firstRead, after[5])
            assertEquals(contract.capturedPrefix, reference(after[at + 1]).toString())
            assertEquals(contract.capturedScope, reference(after[at + 2]).toString())
            assertEquals("$SETTINGS->filterJoinedCommunityInboxRows(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;", reference(after[at + 3]).toString())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 4].opcode)
            assertEquals(0, (after[at + 4] as OneRegisterInstruction).registerA)
            assertEquals("${render.definingClass}->\$inboxUnitItems:$IMMUTABLE_LIST", reference(after[at + 5]).toString())
            assertEquals(at + 9, after.branchTarget(at + 6))
            assertEquals(COMMUNITY_LIST_COPY, reference(after[at + 7]).toString())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 8].opcode)
            assertEquals(untouched, classes.flatMap { it.methods }.filter { it !== render }.associate { it.hookId() to body(it).map(::structural) })
            assertEquals(setOf(JOINED_COMMUNITY_ROW, MAIN_INBOX_SCOPE), helpers.map { it.hookId() }.toSet())
            exerciseTypedHelpers(classes.flatMap { it.methods } + helpers, contract)
            exerciseNativeListProjection(render, at)
        }
    }

    @Test fun theSessionFirstCaptureOrderAndGatedSecondReadKeepTheSameContract() {
        for (profile in controlProfiles.values.toSet()) {
            activeProfile = profile
            val classes = communityInboxFixture(sessionFirst = true)
            val contract = assertNotNull(findCommunityInbox(classes))
            assertEquals(profile.nativeCommunityInbox, contract.identity)
            validateControls(findControls(classes), setOf(COMMUNITY_INBOX))
            val render = contract.render as MutableMethod
            val at = render.communityReadSite(contract.capturedScope)
            assertEquals(66, at)
            val before = body(render).map(::structural)
            injectCommunityInbox(contract, render, communityStub(JOINED_COMMUNITY_ROW), communityStub(MAIN_INBOX_SCOPE))
            assertEquals(before, body(render).filterIndexed { index, _ -> index !in at + 1..at + 9 }.map(::structural))
            assertEquals(at + 9, body(render).branchTarget(at + 6))
            exerciseNativeListProjection(render, at)
        }
        // The shifted order needs the session store in slot 2; without it slot 4 holds no scope capture.
        val classes = communityInboxFixture(sessionFirst = true)
        val ctorId = activeProfile.nativeCommunityInbox.split('|')[1]
        classes.flatMap { it.methods }.single { it.hookId() == ctorId }.replaceInstruction(2, "nop")
        assertNull(findCommunityInbox(classes))
    }

    @Test fun changedSnapshotScopePredicateAndForeignSearchCallerFailBeforeMutation() {
        for (change in listOf("enum_init", "channel_field", "snapshot", "scope", "first_read", "second_alias", "predicate", "null_key", "foreign_search", "captured_write", "branch", "folder_path", "folder_getter", "scratch3", "scratch_one", "scratch_wide", "session_slot")) {
            val classes = communityInboxFixture().toMutableList()
            val valid = assertNotNull(findCommunityInbox(classes))
            val ids = valid.identity.split('|')
            val update = classes.flatMap { it.methods }.single { it.hookId() == ids[0] }
            val renderer = valid.render as MutableMethod
            val at = renderer.communityReadSite(valid.capturedScope)
            when (change) {
                "enum_init" -> classes.single { it.type == valid.requests.substringBefore("->") }.methods.removeIf { it.name == "<clinit>" }
                "channel_field" -> classes.flatMap { it.methods }.single { it.hookId() == ids[8] }.replaceInstruction(0, "const-string v0, \"changed\"")
                "snapshot" -> update.replaceInstruction(58, "move-object/from16 v26, v2")
                "scope" -> update.replaceInstruction(111, "const/16 v23, 0x0")
                "first_read" -> renderer.replaceInstruction(6, "invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z")
                "second_alias" -> renderer.replaceInstruction(at + 10, "move-object/from16 v17, v1")
                "predicate" -> classes.flatMap { it.methods }.single { it.hookId() == ids[5] }.replaceInstruction(7, "const/4 v1, 0x0")
                "null_key" -> classes.flatMap { it.methods }.single { it.hookId() == ids[6] }.replaceInstruction(6, "const/4 v0, 0x1")
                "folder_path" -> classes.flatMap { it.methods }.single { it.hookId() == ids[2] }.replaceInstruction(8,
                    "iget-object v0, v0, ${valid.folderPath.last().substringBefore("->")}->missing:${valid.folderPath.last().substringAfter(':')}")
                "folder_getter" -> classes.flatMap { it.methods }.single { it.hookId() == valid.folderGetter }.replaceInstruction(13, "nop")
                "scratch3" -> renderer.replaceInstruction(at + 1, "invoke-static {v3}, LX/ScratchConsumer;->accept(Ljava/lang/Object;)V")
                "scratch_one" -> renderer.replaceInstruction(at + 1, "check-cast v3, Ljava/lang/Object;")
                "scratch_wide" -> renderer.replaceInstruction(at + 1, "long-to-int v5, v2")
                // A session store in slot 2 without the later captures moving down is neither known order.
                "session_slot" -> classes.flatMap { it.methods }.single { it.hookId() == ids[1] }.replaceInstruction(2,
                    "iput-object v2, v1, ${renderer.definingClass}->\$fbUserSession:$FB_USER_SESSION")
                "foreign_search" -> classes.add(fixtureClass("LX/ForeignSearch;", listOf(fixtureMethod("LX/ForeignSearch;->query()V",
                    "invoke-direct/range {v0 .. v14}, ${ids[1]}\nreturn-void", 15)), "MessagingTabbedSearchFragment"))
                "captured_write" -> classes.add(fixtureClass("LX/CacheMutation;", listOf(fixtureMethod("LX/CacheMutation;->put()V",
                    "iput-object v0, v1, ${renderer.definingClass}->\$inboxUnitItems:$IMMUTABLE_LIST\nreturn-void"))))
                "branch" -> {
                    // A branch to the sink bypasses the second read and the runtime switch.
                    renderer.implementation!!.replaceInstruction(35, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10t(Opcode.GOTO,
                        renderer.implementation!!.newLabelForIndex(at + 11)))
                }
            }
            val before = classes.flatMap { it.methods }.associate { it.hookId() to body(it).map(::structural) }
            assertNull(findCommunityInbox(classes), change)
            assertFailsWith<PatchException>(change) { validateControls(findControls(classes), setOf(COMMUNITY_INBOX)) }
            assertEquals(before, classes.flatMap { it.methods }.associate { it.hookId() to body(it).map(::structural) }, change)
        }
    }

    @Test fun aChangedExtensionOrLateRendererFailureLeavesAllTargetsStock() {
        for (change in listOf("helper", "helper_return", "private_helper", "renderer", "profile")) {
            val classes = communityInboxFixture()
            val contract = assertNotNull(findCommunityInbox(classes))
            val render = contract.render as MutableMethod
            val joined = communityStub(JOINED_COMMUNITY_ROW)
            val scope = communityStub(MAIN_INBOX_SCOPE)
            when (change) {
                "helper" -> scope.replaceInstruction(0, "const/4 v0, 0x1")
                "helper_return" -> scope.replaceInstruction(1, "return v1")
                "private_helper" -> scope.accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value
                "renderer" -> render.replaceInstruction(render.communityReadSite(contract.capturedScope) + 10, "move-object/from16 v17, v1")
                "profile" -> activeProfile = PROFILE_346013370
            }
            val before = listOf(render, joined, scope).map { body(it).map(::structural) }
            assertFailsWith<PatchException> { injectCommunityInbox(contract, render, joined, scope) }
            assertEquals(before, listOf(render, joined, scope).map { body(it).map(::structural) })
        }
    }

    @Test fun actualBuiltExtensionStubsRetainTheirNativeCallsAndCanBeRewritten() {
        val extension = Files.createTempFile("hush-community-extension-", ".mpe")
        try {
            javaClass.classLoader.getResourceAsStream("extensions/messenger.mpe").use { input ->
                assertNotNull(input, "The embedded release extension must be built before patch tests")
                Files.copy(input, extension, StandardCopyOption.REPLACE_EXISTING)
            }
            val dex = DexFileFactory.loadDexContainer(extension.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val nativeCalls = classes.flatMap { it.methods }.filter { it.implementation != null }.flatMap { body(it).mapNotNull { i -> reference(i) as? MethodReference } }.map { it.toString() }.toSet()
            assertTrue(JOINED_COMMUNITY_ROW in nativeCalls)
            assertTrue(MAIN_INBOX_SCOPE in nativeCalls)
            val host = classes.single { it.type == HOST_SCREENS }
            val joined = host.methods.single { it.hookId() == JOINED_COMMUNITY_ROW }
            val scope = host.methods.single { it.hookId() == MAIN_INBOX_SCOPE }
            for (profile in controlProfiles.values.toSet()) {
                activeProfile = profile
                val contract = assertNotNull(findCommunityInbox(communityInboxFixture()))
                val helpers = injectCommunityInbox(contract, contract.render as MutableMethod, MutableMethod(joined), MutableMethod(scope))
                assertTrue(helpers.all { AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.PRIVATE.isSet(it.accessFlags) })
            }
        } finally { Files.deleteIfExists(extension) }
    }

    @Test fun inaccessibleNativeClassesOrFieldsFailBeforeMutation() {
        for (change in listOf("row_class", "predicate_class", "config_class", "inbox_class", "requests_class", "inbox_field", "requests_field", "path_field", "static_getter", "copy_class", "copy_method")) {
            val classes = communityInboxFixture().toMutableList()
            val valid = assertNotNull(findCommunityInbox(classes))
            val field = when (change) {
                "requests_field" -> valid.requests
                "path_field" -> valid.folderPath.last()
                else -> valid.inbox
            }
            val type = when (change) {
                "row_class" -> valid.rowSummary.substringBefore("->")
                "predicate_class" -> valid.joined.substringBefore("->")
                "config_class", "static_getter" -> valid.folderGetter.substringBefore("->")
                "requests_class" -> valid.requests.substringBefore("->")
                "copy_class", "copy_method" -> IMMUTABLE_LIST
                else -> field.substringBefore("->")
            }
            val index = classes.indexOfFirst { it.type == type }
            val native = classes[index]
            if (change == "static_getter") native.methods.single { it.hookId() == valid.folderGetter }.accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
            if (change == "copy_method") native.methods.single { it.hookId() == COMMUNITY_LIST_COPY }.accessFlags = AccessFlags.PUBLIC.value
            val fields = native.fields.map {
                if (change.endsWith("_field") && it.toString() == field)
                    com.android.tools.smali.dexlib2.immutable.ImmutableField(it.definingClass, it.name, it.type,
                        it.accessFlags and AccessFlags.PUBLIC.value.inv(), it.initialValue, it.annotations, it.hiddenApiRestrictions)
                else it
            }
            classes[index] = fixtureClass(type, native.methods.toList(), interfaces = native.interfaces.toList(),
                superclass = native.superclass!!, extraFields = fields, flags = if (change.endsWith("_class")) 0 else native.accessFlags)
            val before = classes.flatMap { it.methods }.associate { it.hookId() to body(it).map(::structural) }
            assertNull(findCommunityInbox(classes), change)
            assertFailsWith<PatchException>(change) { validateControls(findControls(classes), setOf(COMMUNITY_INBOX)) }
            assertEquals(before, classes.flatMap { it.methods }.associate { it.hookId() to body(it).map(::structural) }, change)
        }
    }

    private data class NativeValue(val type: String, val fields: Map<String, Any?> = emptyMap())
    private class NativeImmutableList(items: Collection<Any>) : java.util.AbstractList<Any>() {
        private val rows = ArrayList(items)
        override val size get() = rows.size
        override fun get(index: Int): Any = rows[index]
    }

    /** The emitted identity branch keeps stock objects; changed projections retain the native list type. */
    private fun exerciseNativeListProjection(render: Method, at: Int) {
        val code = body(render)
        val stock = NativeImmutableList(listOf(Any(), Any(), Any()))
        for (projection in listOf<List<Any>>(stock, arrayListOf(stock[0], stock[2]), emptyList())) {
            val registers = mutableMapOf<Int, Any?>(0 to stock)
            var result: Any? = null
            var copies = 0
            var cursor = at + 1
            while (cursor < at + 10) {
                val i = code[cursor]
                val one = i as? OneRegisterInstruction
                val two = i as? TwoRegisterInstruction
                var next = cursor + 1
                when (i.opcode) {
                    Opcode.IGET_OBJECT -> {
                        assertEquals(4, two!!.registerB)
                        registers[two.registerA] = if ((reference(i) as FieldReference).name == "\$inboxUnitItems") stock else Any()
                    }
                    Opcode.INVOKE_STATIC -> {
                        if (reference(i).toString() == COMMUNITY_LIST_COPY) {
                            assertEquals(0, (i as FiveRegisterInstruction).registerC)
                            result = NativeImmutableList((registers[0] as Collection<*>).map { assertNotNull(it) })
                            copies++
                        } else {
                            assertEquals("$SETTINGS->filterJoinedCommunityInboxRows(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;", reference(i).toString())
                            assertSame(stock, registers[(i as FiveRegisterInstruction).registerC])
                            result = projection
                        }
                    }
                    Opcode.MOVE_RESULT_OBJECT -> registers[one!!.registerA] = result
                    Opcode.CHECK_CAST -> {
                        assertEquals(IMMUTABLE_LIST, reference(i).toString())
                        assertTrue(registers[one!!.registerA] is NativeImmutableList)
                    }
                    Opcode.IF_EQ -> if (registers[two!!.registerA] === registers[two.registerB]) next = code.branchTarget(cursor)
                    else -> error("Unexpected projection instruction ${i.opcode}")
                }
                cursor = next
            }
            // A native same-signature consumer may cast its List back to the original immutable type.
            val nativeList = registers[0] as NativeImmutableList
            assertEquals(projection, nativeList)
            assertEquals(if (projection === stock) 0 else 1, copies)
            if (projection === stock) assertSame(stock, nativeList)
            else {
                assertNotSame(stock, nativeList)
                projection.forEachIndexed { index, row -> assertSame(row, nativeList[index]) }
            }
            assertEquals(3, stock.size)
        }
    }

    /** Executes the exact small native/helper bodies, so enum/null/branch regressions affect the result. */
    private fun run(methods: Map<String, Method>, id: String, value: Any?, statics: MutableMap<String, Any?>): Boolean =
        runValue(methods, id, listOf(value), statics) == true

    private fun runValue(methods: Map<String, Method>, id: String, values: List<Any?>, statics: MutableMap<String, Any?>): Any? {
        val method = methods.getValue(id)
        val c = body(method)
        val registers = arrayOfNulls<Any?>(method.implementation!!.registerCount)
        values.forEachIndexed { index, value -> registers[registers.size - values.size + index] = value }
        var result: Any? = null
        var at = 0
        repeat(40) {
            val i = c[at]
            val one = i as? OneRegisterInstruction
            val two = i as? TwoRegisterInstruction
            val ref = reference(i)
            fun bool(v: Any?) = v == true || v == 1
            var next = at + 1
            when (i.opcode) {
                Opcode.INSTANCE_OF -> registers[two!!.registerA] = (registers[two.registerB] as? NativeValue)?.type == (ref as TypeReference).type
                Opcode.CHECK_CAST -> assertEquals((ref as TypeReference).type, (registers[one!!.registerA] as NativeValue).type)
                Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN -> registers[two!!.registerA] = (registers[two.registerB] as NativeValue).fields[(ref as FieldReference).name]
                Opcode.SGET_OBJECT -> registers[one!!.registerA] = statics[ref.toString()]
                Opcode.SPUT_OBJECT -> statics[ref.toString()] = registers[one!!.registerA]
                Opcode.CONST_4 -> registers[one!!.registerA] = (i as NarrowLiteralInstruction).narrowLiteral
                Opcode.CONST_STRING -> registers[one!!.registerA] = (ref as StringReference).string
                Opcode.MONITOR_ENTER, Opcode.MONITOR_EXIT -> Unit
                Opcode.GOTO -> next = c.branchTarget(at)
                Opcode.IF_EQZ -> if (registers[one!!.registerA] == null || registers[one.registerA] == false || registers[one.registerA] == 0) next = c.branchTarget(at)
                Opcode.IF_NEZ -> if (registers[one!!.registerA] != null && registers[one.registerA] != false && registers[one.registerA] != 0) next = c.branchTarget(at)
                Opcode.IF_EQ -> if (registers[two!!.registerA] == registers[two.registerB]) next = c.branchTarget(at)
                Opcode.IF_NE -> if (registers[two!!.registerA] != registers[two.registerB]) next = c.branchTarget(at)
                Opcode.INVOKE_STATIC, Opcode.INVOKE_VIRTUAL -> result = runValue(methods, ref.toString(), listOf(registers[(i as FiveRegisterInstruction).registerC]), statics)
                Opcode.INVOKE_INTERFACE -> {
                    assertEquals("Ljava/util/Set;->contains(Ljava/lang/Object;)Z", ref.toString())
                    val args = i as FiveRegisterInstruction
                    result = (registers[args.registerC] as Set<*>).contains(registers[args.registerD])
                }
                Opcode.MOVE_RESULT_OBJECT -> registers[one!!.registerA] = result
                Opcode.MOVE_RESULT -> registers[one!!.registerA] = result
                Opcode.RETURN -> return bool(registers[one!!.registerA])
                Opcode.RETURN_OBJECT -> return registers[one!!.registerA]
                else -> error("Unexpected native predicate operation ${i.opcode}")
            }
            at = next
        }
        error("Native predicate did not return")
    }

    private fun exerciseTypedHelpers(all: List<Method>, contract: CommunityInboxContract) {
        val methods = all.associateBy { it.hookId() }
        val ids = contract.identity.split('|')
        val channel = body(methods.getValue(ids[8]))
        val any = body(methods.getValue(ids[7]))
        val kindField = reference(channel[0]) as FieldReference
        val channelField = reference(channel[1]).toString()
        val announcementField = reference(any[4]).toString()
        val scopeType = contract.requests.substringBefore("->")
        val request = NativeValue(scopeType, mapOf("kind" to "requests"))
        val ordinaryScope = NativeValue(scopeType, mapOf("kind" to "all"))
        val channelValue = NativeValue(kindField.type, mapOf("kind" to "channel"))
        val announcementValue = NativeValue(kindField.type, mapOf("kind" to "announcement"))
        val statics = mutableMapOf<String, Any?>(contract.requests to request, channelField to channelValue, announcementField to announcementValue)
        val pred = body(methods.getValue(contract.joined))
        val keyField = reference(pred[0]) as FieldReference
        val subscribedField = reference(pred[5]) as FieldReference
        fun row(kind: Any?, subscribed: Boolean, key: Boolean = true) = NativeValue(contract.rowSummary.substringBefore("->"),
            mapOf(contract.rowSummary.substringAfter("->").substringBefore(':') to NativeValue(keyField.definingClass,
                mapOf(keyField.name to if (key) NativeValue(kindField.definingClass, mapOf(kindField.name to kind)) else null,
                    subscribedField.name to subscribed))))
        for (kind in listOf(channelValue, announcementValue)) {
            assertTrue(run(methods, JOINED_COMMUNITY_ROW, row(kind, true), statics))
            assertFalse(run(methods, JOINED_COMMUNITY_ROW, row(kind, false), statics))
        }
        for (kind in listOf(null, NativeValue(kindField.type, mapOf("kind" to "group")), NativeValue(kindField.type, mapOf("kind" to "social"))))
            assertFalse(run(methods, JOINED_COMMUNITY_ROW, row(kind, true), statics))
        assertFalse(run(methods, JOINED_COMMUNITY_ROW, row(channelValue, true, key = false), statics))
        assertFalse(run(methods, JOINED_COMMUNITY_ROW, NativeValue(contract.rowSummary.substringBefore("->")), statics))
        assertFalse(run(methods, JOINED_COMMUNITY_ROW, NativeValue("LX/OrdinaryRow;"), statics))
        assertFalse(run(methods, JOINED_COMMUNITY_ROW, null, statics))
        val folderType = contract.inbox.substringBefore("->")
        val inbox = NativeValue(folderType, mapOf("kind" to "inbox"))
        statics[contract.inbox] = inbox
        val folderCode = body(methods.getValue(contract.folderGetter))
        val keys = reference(folderCode[0]) as FieldReference
        val folder = reference(folderCode[5]) as FieldReference
        fun callback(kind: Any?, explicit: Boolean = true): NativeValue {
            var value = NativeValue(keys.definingClass, mapOf(keys.name to if (explicit) setOf("folderName") else emptySet<String>(), folder.name to kind))
            for (field in contract.folderPath.asReversed()) value = NativeValue(field.substringBefore("->"),
                mapOf(field.substringAfter("->").substringBefore(':') to value))
            return value
        }
        fun main(cb: Any?, filter: Any?) = runValue(methods, MAIN_INBOX_SCOPE, listOf(cb, filter), statics) == true
        assertTrue(main(callback(inbox), ordinaryScope))
        assertTrue(main(callback(null, explicit = false), ordinaryScope))
        for (kind in listOf(null, NativeValue(folderType, mapOf("kind" to "pending")), NativeValue(folderType, mapOf("kind" to "community"))))
            assertFalse(main(callback(kind), ordinaryScope))
        for (scope in listOf(null, request, NativeValue("LX/SearchScope;"), NativeValue("LX/FolderScope;")))
            assertFalse(main(callback(inbox), scope))
        for (cb in listOf(null, NativeValue("LX/SearchCallback;"), NativeValue(contract.folderPath.first().substringBefore("->"))))
            assertFalse(main(cb, ordinaryScope))
    }

    @Test fun allExactStockInputsKeepTheSnapshotHeaderCallbacksAndNativeRoutes() {
        val folder = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(folder != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(folder!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        assertEquals(controlProfiles.keys.map { it.toString() }.toSet(), apks.map { it.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-') }.toSet())
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val expectedHash = Files.readAllLines(Path.of("../scripts/profiles/$code.txt")).single { it.startsWith("sha256 ") }.substringAfter(' ')
            val digest = MessageDigest.getInstance("SHA-256")
            Files.newInputStream(apk).use { input -> val buffer = ByteArray(1024 * 1024); while (true) { val n = input.read(buffer); if (n < 0) break; digest.update(buffer, 0, n) } }
            assertEquals(expectedHash, digest.digest().joinToString("") { "%02x".format(it) })
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val contract = assertNotNull(findCommunityInbox(classes), apk.fileName.toString())
            assertEquals(activeProfile.nativeCommunityInbox, contract.identity)
            val render = MutableMethod(contract.render)
            val at = render.communityReadSite(contract.capturedScope)
            val before = body(render).map(::structural)
            val helpers = injectCommunityInbox(contract, render, communityStub(JOINED_COMMUNITY_ROW), communityStub(MAIN_INBOX_SCOPE))
            assertEquals(before, body(render).filterIndexed { index, _ -> index !in at + 1..at + 9 }.map(::structural))
            exerciseTypedHelpers(classes.flatMap { it.methods } + helpers, contract)
            exerciseNativeListProjection(render, at)
        }
    }
}
