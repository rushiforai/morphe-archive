package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

private const val GETTER = "LX/1L4;->A00()Landroid/graphics/Typeface;"
private const val HOLDER = "LX/2pq;"
private const val HOLDER_INIT = "$HOLDER-><init>(Landroid/graphics/Typeface;Ljava/io/File;)V"

/** 346213494's getter cut down: the cached test font, Messenger's downloaded font, or nothing. */
private val GETTER_BODY = """
    iget-object v0, p0, LX/1L4;->A01:LX/1L6;
    if-nez v0, :cached
    iget-object v0, p0, LX/1L4;->A00:LX/35y;
    invoke-virtual {v0}, LX/35y;->A00()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, $HOLDER
    if-eqz v0, :missing
    iget-object v0, v0, $HOLDER->A00:Landroid/graphics/Typeface;
    :done
    return-object v0
    :missing
    const/4 v0, 0x0
    return-object v0
    :cached
    iget-object v0, v0, LX/1L6;->A00:Landroid/graphics/Typeface;
    if-nez v0, :done
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

private val HOLDER_INIT_BODY = """
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p2, p0, $HOLDER->A01:Ljava/io/File;
    iput-object p1, p0, $HOLDER->A00:Landroid/graphics/Typeface;
    return-void
""".trimIndent()

class EmojiFontTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
    }

    private fun String.lf() = replace("\r\n", "\n")

    private fun getter(body: String = GETTER_BODY.lf()) = fixtureMethod(GETTER, body, 1)

    private fun holderInit() = fixtureMethod(HOLDER_INIT, HOLDER_INIT_BODY.lf(), 3, AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)

    private fun holder(
        inits: List<com.android.tools.smali.dexlib2.iface.Method> = listOf(holderInit()),
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    ) = fixtureClass(HOLDER, inits, flags = flags, extraFields = listOf(
        ImmutableField(HOLDER, "A00", "Landroid/graphics/Typeface;", AccessFlags.FINAL.value, null, null, null),
        ImmutableField(HOLDER, "A01", "Ljava/io/File;", AccessFlags.FINAL.value, null, null, null),
    ))

    private fun reference(instruction: Any) = (instruction as ReferenceInstruction).reference.toString()

    @Test fun theHolderIsTheClassTheGetterReturnsMessengersFontFrom() {
        val classes = mapOf(HOLDER to holder())
        assertEquals(HOLDER_INIT, getter().emojiFontHolder(classes::get))
    }

    @Test fun everyReturnGoesThroughTheExtensionIncludingTheOneTheCacheBranchesTo() {
        val method = getter()
        val original = method.implementation!!.instructions.toList()
        val returns = original.indices.filter { original[it].opcode == Opcode.RETURN_OBJECT }
        val cacheBranch = original.indexOfLast { it.opcode == Opcode.IF_NEZ }
        method.injectEmojiTypeface()
        val code = method.implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        assertEquals(original.size + 2 * returns.size, code.size)
        // Each return, shifted by the two instructions every earlier one gained, is now the call.
        val calls = returns.mapIndexed { n, index -> index + 2 * n }
        for ((n, at) in calls.withIndex()) {
            val register = (original[returns[n]] as OneRegisterInstruction).registerA
            assertEquals(EMOJI_TYPEFACE_CALL, reference(code[at]))
            assertEquals(register, (code[at] as RegisterRangeInstruction).startRegister)
            assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), code.slice(at + 1..at + 2).map { it.opcode })
            assertEquals(listOf(register, register), code.slice(at + 1..at + 2).map { (it as OneRegisterInstruction).registerA })
        }
        // The cache's branch to the shared return lands on the call, not past it.
        val branch = cacheBranch + 2 * returns.count { it < cacheBranch }
        assertEquals(addresses[calls.first()], addresses[branch] + (code[branch] as OffsetInstruction).codeOffset)
    }

    @Test fun theHolderPassesItsFontFileOnAfterTheObjectConstructor() {
        val init = holderInit()
        val original = init.implementation!!.instructions.toList()
        init.injectEmojiFontHolder()
        val code = init.implementation!!.instructions.toList()
        assertEquals(EMOJI_FONT_CALL, reference(code[1]))
        assertEquals(2, (code[1] as FiveRegisterInstruction).registerC)
        assertEquals(original.map { it.opcode }, (code.take(1) + code.drop(2)).map { it.opcode })
    }

    @Test fun aChangedFontHolderStopsThePatch() {
        val second = fixtureMethod("$HOLDER-><init>(Landroid/graphics/Typeface;)V", "return-void", 2,
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)
        for (classes in listOf(
            mapOf(HOLDER to holder(listOf(holderInit(), second))),
            mapOf(HOLDER to holder(flags = AccessFlags.PUBLIC.value)),
            emptyMap(),
        )) assertFailsWith<PatchException> { getter().emojiFontHolder(classes::get) }
        val noHolderRead = getter("const/4 v0, 0x0\nreturn-object v0")
        assertFailsWith<PatchException> { noHolderRead.emojiFontHolder(mapOf(HOLDER to holder())::get) }
    }

    @Test fun everyStockBuildLoadsMessengersFontThroughOneHolder() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val byType = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
            val id = activeProfile.hooks.getValue("emoji_typeface").single()
            val native = byType.getValue(id.substringBefore("->")).methods.single { it.hookId() == id }
            val init = native.emojiFontHolder { byType[it] }
            val holder = MutableMethod(byType.getValue(init.substringBefore("->")).methods.single { it.hookId() == init })
            holder.injectEmojiFontHolder()
            assertEquals(EMOJI_FONT_CALL, reference(holder.implementation!!.instructions.elementAt(1)), code)
            val getter = MutableMethod(native)
            val before = getter.implementation!!.instructions.toList()
            val returns = before.indices.filter { before[it].opcode == Opcode.RETURN_OBJECT }
            val handlers = getter.implementation!!.tryBlocks.flatMap { block -> block.exceptionHandlers.map { it.handlerCodeAddress } }.size
            getter.injectEmojiTypeface()
            val after = getter.implementation!!.instructions.toList()
            assertEquals(before.size + 2 * returns.size, after.size, code)
            assertEquals(returns.mapIndexed { n, index -> index + 2 * n },
                after.indices.filter { after[it] is ReferenceInstruction && reference(after[it]) == EMOJI_TYPEFACE_CALL }, code)
            assertEquals(handlers, getter.implementation!!.tryBlocks.flatMap { block -> block.exceptionHandlers.map { it.handlerCodeAddress } }.size, code)
        }
    }
}
