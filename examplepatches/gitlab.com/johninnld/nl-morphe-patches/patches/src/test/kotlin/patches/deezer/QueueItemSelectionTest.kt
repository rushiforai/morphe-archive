package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

private const val SERVICE_27 = "Lcom/deezer/core/jukebox/JukeboxService;"
private const val CALLBACK_27 = "LIIIlIlIIIIIl;"
private const val MANAGER_27 = "LlIIIIIlllIllllll;"
private const val CONSUME_27 = "lIIIIlllIlllll"
private const val SOURCE_27 = "LIIlIlIlllIIIIIlI;"
private const val HOLDER_27 = "LIlIIIIlIlIIIIII;"
private const val SOURCE_OWNER_27 = "LIlIlIlIlIlIIIlI;"
private const val PUBLISHER_27 = "LIIlIlIlIlIlIIl;"
private const val TRACK_27 = "LIIIlIlIIlllIlIIl;"
private val OWNERS_27 = setOf(SERVICE_27, CALLBACK_27, MANAGER_27, SOURCE_27, HOLDER_27,
    SOURCE_OWNER_27, PUBLISHER_27, "LIlIIIlIIIIIIlIll;", "Lcom/deezer/core/jukebox/provider/AudioQueueProvider;")

private fun load27(environment: String): Map<String, ClassDef> {
    val path = System.getenv(environment)
    assumeNotNull(path)
    val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
    return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
}

private fun serialized(classes: Collection<ClassDef>): Map<String, ClassDef> {
    val store = MemoryDataStore()
    try {
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(26), classes))
        return DexBackedDexFile.fromInputStream(null, store.data.inputStream()).classes.associateBy { it.type }
    } finally { store.close() }
}

/** Derive addresses from DECODED bytes; never trust a mutable label's recorded location. */
internal fun assertBranchBoundaries(method: Method) {
    val implementation = method.implementation ?: return
    val instructions = implementation.instructions.toList()
    val byAddress = linkedMapOf<Int, Instruction>()
    var end = 0
    for (instruction in instructions) { byAddress[end] = instruction; end += instruction.codeUnits }
    val payloads = setOf(Opcode.ARRAY_PAYLOAD, Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD)
    val executable = byAddress.filterValues { it.opcode !in payloads }.keys
    fun target(from: Int, destination: Int, payload: Boolean = false) {
        assertTrue("$method branch 0x${from.toString(16)} -> 0x${destination.toString(16)} is not an instruction start",
            destination in if (payload) byAddress.keys else executable)
    }
    for ((address, instruction) in byAddress) if (instruction is OffsetInstruction) {
        val destination = address + instruction.codeOffset
        when (instruction.opcode) {
            Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> {
                target(address, destination, true)
                val payload = byAddress.getValue(destination) as? SwitchPayload
                assertNotNull("Switch must point at its payload", payload)
                payload!!.switchElements.forEach { target(address, address + it.offset) }
            }
            Opcode.FILL_ARRAY_DATA -> {
                target(address, destination, true)
                assertEquals(Opcode.ARRAY_PAYLOAD, byAddress.getValue(destination).opcode)
            }
            else -> target(address, destination)
        }
    }
    for (block in implementation.tryBlocks) {
        assertTrue("Try start", block.startCodeAddress in executable)
        val limit = block.startCodeAddress + block.codeUnitCount
        assertTrue("Try end", limit == end || limit in byAddress)
        block.exceptionHandlers.forEach { assertTrue("Catch handler", it.handlerCodeAddress in executable) }
    }
}

private fun assertNativeContinuation(method: Method) {
    val code = method.implementation!!.instructions.toList()
    val addresses = code.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
    val invoke = code.indexOfFirst { (it as? ReferenceInstruction)?.reference.toString() ==
        "Lnl/johninnl/deezer/queue/QueueHandles;->consume(Ljava/lang/Object;Ljava/lang/Object;)Z" }
    assertTrue(invoke >= 0)
    assertEquals(Opcode.MOVE_RESULT, code[invoke + 1].opcode)
    val branch = code[invoke + 2] as OffsetInstruction
    assertEquals(Opcode.IF_NEZ, branch.opcode)
    assertEquals(Opcode.RETURN_VOID, code[invoke + 3].opcode)
    val target = addresses[invoke + 2] + branch.codeOffset
    assertEquals("Allow path must join the original row-null guard", addresses[invoke + 4], target)
    assertEquals(Opcode.IF_EQZ, code[invoke + 4].opcode)
    assertEquals(1, (code[invoke + 4] as OneRegisterInstruction).registerA)
    assertBranchBoundaries(method)
}

class QueueItemSelectionTest {
    private fun originals() = load27("DEEZER_QUEUE_27_APK")

    @Test fun original27RefreshWritesMediaIdentityBackWithoutMovingQueueOccurrencesOrReloadingCursors() {
        val old = originals()
        fun refs(method: Method) = method.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference?.toString()
        }
        val writer = old.getValue("LIIIlIlIlIlIIllll;").methods.single { it.name == "llIlIlIlIIlIlll" }
        val writerRefs = refs(writer)
        assertTrue(writerRefs.contains("MEDIA_ID"))
        assertTrue(writerRefs.contains("MEDIA_TYPE"))
        assertTrue(writerRefs.contains("%s=? AND %s=?"))
        assertTrue(writerRefs.contains("LIlIIlllIIlIIllll;->getId()Ljava/lang/String;") || writerRefs.contains("$TRACK_27->getId()Ljava/lang/String;"))
        assertTrue(writerRefs.contains("LIIllIIIlIIIllII;->IIllllIIIIIlIIl:Landroid/net/Uri;"))
        assertEquals(1, writerRefs.count { it == "Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I" })
        val serializer = old.getValue("LlllIIlllIIIlll;").methods.single { it.name == "IIlIlIlIlIllllll" && it.parameterTypes.size == 3 }
        val serializerRefs = refs(serializer)
        assertTrue(serializerRefs.containsAll(listOf("MEDIA_ID", "MEDIA_TYPE", "MEDIA_VERSION", "ORIGIN_ID", "FALLBACK_ID", "BOOKMARK", "HEARD_STATUS")))
        assertFalse(serializerRefs.any { it in setOf("POSITION", "ORIGINAL_POSITION", "AUDIO_CONTEXT_ID", "rowid") })
        val update = old.getValue("Lcom/deezer/core/jukebox/provider/AudioQueueProvider;").methods.single { it.name == "update" }
        assertFalse("Native metadata update does not reload source/playback cursors", refs(update).any {
            it.contains("LllIllIllllIll;->") || it.contains("notifyChange")
        })
    }

    @Test fun standaloneChoiceUsesTheDeezerBasePolicy() {
        assertTrue(deezerQueueItemSelection.default)
        assertEquals(setOf(deezerBase), deezerQueueItemSelection.dependencies.toSet())
    }

    @Test fun original27HashProtocolIsSharedByPublisherResolverAndActiveState() {
        val old = originals()
        val hash = old.getValue("LIIIllIlllllIlll;").methods.single {
            it.name == "lllIllIlllllIIl" && it.parameterTypes.map(CharSequence::toString) == listOf(TRACK_27)
        }
        val code = hash.implementation!!.instructions.toList()
        val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.map { it.toString() }
        assertTrue(refs.contains("$TRACK_27->lIIlIlllIlIllI()J"))
        assertTrue(refs.contains("LIlIIlllIIlIIllll;->getId()Ljava/lang/String;"))
        assertTrue(refs.contains("$TRACK_27->lllllIIllIlllI()I"))
        assertTrue(refs.indexOf("$TRACK_27->lIIlIlllIlIllI()J") < refs.indexOf("LIlIIlllIIlIIllll;->getId()Ljava/lang/String;"))
        assertTrue(refs.indexOf("LIlIIlllIIlIIllll;->getId()Ljava/lang/String;") < refs.indexOf("$TRACK_27->lllllIIllIlllI()I"))
        assertTrue(refs.contains("Ljava/util/Objects;->hash([Ljava/lang/Object;)I"))
        assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.INT_TO_LONG, Opcode.RETURN_WIDE), code.takeLast(3).map { it.opcode })
        assertFalse("Preserve Objects.hash null-element semantics", code.any { it.opcode.name.startsWith("IF_") })
        val array = code.single { it.opcode == Opcode.FILLED_NEW_ARRAY } as FiveRegisterInstruction
        assertEquals(listOf(0, 1, 2), listOf(array.registerC, array.registerD, array.registerE))
        val boxed = old.getValue("LllIlllIllllllII;").methods.single { it.name == "IllIlIlIIlIllIll" && it.returnType == "Ljava/lang/Long;" }
        assertTrue(boxed.implementation!!.instructions.any { (it as? ReferenceInstruction)?.reference.toString() == hash.toString() })
        val mapper = old.getValue("LlIlIlIlIIlIlIl;").methods.single { it.name == "invoke" }
        val state = old.getValue(PUBLISHER_27).methods.single { it.name == "IllIlIlIIlIllIll" && it.returnType.endsWith("PlaybackStateCompat;") }
        for (method in listOf(mapper, state)) assertTrue(method.implementation!!.instructions.any {
            (it as? ReferenceInstruction)?.reference.toString() == boxed.toString()
        })
        val resolver = old.getValue("LIIllIllIllI;").methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("J") }
        assertTrue(resolver.implementation!!.instructions.any { (it as? ReferenceInstruction)?.reference.toString() == hash.toString() })
        val item = old.getValue("Landroid/support/v4/media/session/MediaSessionCompat${'$'}QueueItem;")
        val constructor = item.methods.single { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/support/v4/media/MediaDescriptionCompat;", "J") }
        val delegate = constructor.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.single { it.definingClass == item.type && it.name == "<init>" }
        val shared = item.methods.single { it.name == "<init>" &&
            it.parameterTypes.map(CharSequence::toString) == delegate.parameterTypes.map(CharSequence::toString) }
        val checks = shared.implementation!!.instructions.toList()
        assertTrue(checks.any { (it as? WideLiteralInstruction)?.wideLiteral == -1L })
        val compare = checks.indexOfFirst { it.opcode == Opcode.CMP_LONG }
        assertTrue(compare >= 0)
        assertEquals(Opcode.IF_EQZ, checks[compare + 1].opcode)
        assertTrue(checks.any { (it as? ReferenceInstruction)?.reference.toString() == "Id cannot be QueueItem.UNKNOWN_ID" })
    }

    @Test fun serialized27QueueChangesHaveValidBranchesAndExactNativeContinuation() {
        val old = originals(); val changed = mutableMapOf<String, MutableClass>()
        fun type(name: String) = changed.getOrPut(name) { MutableClass(old.getValue(name)) }
        val select = type(CALLBACK_27).methods.single { it.name == "onSkipToQueueItem" }
        val callbackBefore = select.instructions.toList()
        val native = type(SERVICE_27).methods.single { it.name == "lIIIIlllIlllll" && it.parameterTypes.size == 1 }
        val before = native.instructions.toList()
        wireDeezerQueueSelection(::type)
        assertEquals(before, native.instructions.toList())
        assertEquals("morpheQueueNativeCommand", native.name)
        callbackBefore.indices.filter { it != 31 }.forEach { assertSame(callbackBefore[it], select.instructions[it]) }
        val emitted = serialized(changed.values)
        for (owner in emitted.values) owner.methods.forEach(::assertBranchBoundaries)
        val consume = emitted.getValue(MANAGER_27).methods.single { it.name == CONSUME_27 && it.parameterTypes.size == 5 }
        assertNativeContinuation(consume)
        // DEX lookup includes the exact field type, not merely an obfuscated field name.
        for (owner in emitted.values) for (method in owner.methods) for (instruction in (method.implementation?.instructions ?: emptyList())) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            val definition = emitted[ref.definingClass] ?: old[ref.definingClass] ?: continue
            assertTrue("Exact field descriptor $ref", definition.fields.any { it.name == ref.name && it.type == ref.type })
        }
    }

    @Test fun unsafeNonzeroInsertionReproducesReportedOffsetOnOriginal27() {
        val owner = MutableClass(originals().getValue(MANAGER_27))
        val method = owner.methods.single { it.name == CONSUME_27 && it.parameterTypes.size == 5 }
        method.addInstructions(12, """
            invoke-static {v3, v1}, Lnl/johninnl/deezer/queue/QueueHandles;->consume(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v4
            if-nez v4, :fragment_continuation
            return-void
            :fragment_continuation
            nop
        """)
        val decoded = serialized(listOf(owner)).getValue(MANAGER_27).methods.single { it.name == CONSUME_27 && it.parameterTypes.size == 5 }
        val code = decoded.implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { a, i -> a + i.codeUnits }
        val branch = code[addresses.indexOf(0x1e)] as OffsetInstruction
        assertEquals(7, 0x1e + branch.codeOffset)
        assertThrows(AssertionError::class.java) { assertBranchBoundaries(decoded) }
    }

    @Test fun native27ProviderAndOrdinaryControlBodiesRemainUnchanged() {
        val old = originals(); val changed = mutableMapOf<String, MutableClass>()
        fun type(name: String) = changed.getOrPut(name) { MutableClass(old.getValue(name)) }
        val provider = type("Lcom/deezer/core/jukebox/provider/AudioQueueProvider;")
        val names = setOf("insert", "bulkInsert", "delete", "update", "call", "query")
        val before = provider.methods.filter { it.name in names }.map { it to it.instructions.toList() }
        wireDeezerQueueSelection(::type)
        assertEquals(6, before.size)
        before.forEach { (method, instructions) -> assertEquals(instructions, method.instructions.toList()) }
        assertThrows(IllegalStateException::class.java) { wireDeezerQueueSelection(::type) }
    }
}

/** Post-application gate on the actual emitted 9002703 APK, separate from mutable-source checks. */
class QueueItemSelectionEmittedTest {
    @Test fun final27EmittedDexTargetsInstructionStartsAndNativeNullGuard() {
        val classes = load27("DEEZER_QUEUE_27_EMITTED_APK")
        assertTrue(classes.containsKey(MANAGER_27))
        for (owner in classes.values.filter { it.type in OWNERS_27 || it.type.startsWith("Lnl/johninnl/deezer/queue/") }) {
            owner.methods.forEach(::assertBranchBoundaries)
        }
        val consume = classes.getValue(MANAGER_27).methods.single { it.name == CONSUME_27 && it.parameterTypes.size == 5 }
        assertNativeContinuation(consume)
    }
}
