package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val CHAT = "LX/1hl;"
private const val BASE = "LX/4nt;"
private const val VIEW_ARGS = "(Landroid/view/View;Landroid/os/Bundle;)V"
internal const val SYNTHETIC_CHAT_JUMP = "$CHAT->onViewCreated$VIEW_ARGS"

/** The chat fragment's onViewCreated as 585 starts it, cut down. Five registers, so p0 is v2 and the view v3. */
private fun chatView(id: String = SYNTHETIC_CHAT_JUMP, flags: Int = AccessFlags.PUBLIC.value): MutableMethod =
    fixtureMethod(id, "invoke-super {v2, v3, v4}, $BASE->onViewCreated$VIEW_ARGS\nreturn-void", registers = 5, flags = flags)

private fun chatClass(original: String? = CHAT_FRAGMENT_NAME, methods: List<MutableMethod> = listOf(chatView())): MutableClass =
    fixtureClass(CHAT, listOf(fixtureMethod("$CHAT-><init>()V", "return-void")) + methods, original, superclass = BASE)

private fun Method.code() = implementation!!.instructions.toList()

private fun ClassDef.originalName() =
    (fields.firstOrNull { it.name == "__redex_internal_original_name" }?.initialValue as? StringEncodedValue)?.value

class ChatJumpTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(CHAT_JUMP).map { it.hookId() }

    @Test fun theHookIsTheChatFragmentsOwnViewCreated() {
        assertEquals(listOf(SYNTHETIC_CHAT_JUMP), found(listOf(chatClass())))
        validateControls(mirroredControls(listOf(chatClass())), setOf(CHAT_JUMP))
        assertEquals(setOf(SYNTHETIC_CHAT_JUMP), SYNTHETIC_PROFILE.hooks.getValue(CHAT_JUMP))
        val arm64 = setOf("LX/1k9;->onViewCreated$VIEW_ARGS")
        assertEquals(arm64, BASE_PROFILE.hooks.getValue(CHAT_JUMP))
        assertEquals(arm64, PROFILE_347014996.hooks.getValue(CHAT_JUMP))
        assertEquals(setOf("LX/1lQ;->onViewCreated$VIEW_ARGS"), PROFILE_347014974.hooks.getValue(CHAT_JUMP))
        assertEquals(setOf("LX/1kZ;->onViewCreated$VIEW_ARGS"), PROFILE_347014990.hooks.getValue(CHAT_JUMP))
        // The chat fragment's class is the one the slide-in switch already names.
        for (profile in listOf(BASE_PROFILE, PROFILE_347014996, PROFILE_347014974, PROFILE_347014990)) {
            assertEquals(profile.hooks.getValue("chat_fragment").single().substringBefore("->"),
                profile.hooks.getValue(CHAT_JUMP).single().substringBefore("->"))
        }
    }

    @Test fun anotherFragmentOrAnotherShapeIsNotTheChat() {
        val cases = mapOf(
            "the older chat route" to listOf(chatClass("ThreadViewFragment")),
            "no original name" to listOf(chatClass(null)),
            "static" to listOf(chatClass(methods = listOf(chatView(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))),
            "no saved state" to listOf(chatClass(methods = listOf(fixtureMethod("$CHAT->onViewCreated(Landroid/view/View;)V", "return-void", registers = 3)))),
            "the view is made, not ready" to listOf(chatClass(methods = listOf(fixtureMethod(
                "$CHAT->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;",
                "const/4 v0, 0x0\nreturn-object v0", registers = 5)))),
            "no chat at all" to listOf(fixtureClass("LX/Unrelated;")),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CHAT_JUMP)) }
        }
    }

    @Test fun theExtensionGetsTheFragmentAndItsViewFirst() {
        val method = chatView()
        val before = method.code()
        injectControl(CHAT_JUMP, mapOf(CHAT_JUMP to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 1, code.size)
        val call = code.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(CHAT_JUMP_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(2, 2), (call as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        assertEquals(before.map { it.opcode }, code.drop(1).map { it.opcode })
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "the constructor" to fixtureMethod("$CHAT-><init>()V", "return-void", registers = 1),
            "static" to chatView(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "no saved state" to fixtureMethod("$CHAT->onViewCreated(Landroid/view/View;)V", "return-void", registers = 3),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(CHAT_JUMP, mapOf(CHAT_JUMP to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHandsOverTheChatFromOneMethod() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val views = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
                .filter { it.originalName() == CHAT_FRAGMENT_NAME }
                .flatMap { it.methods }.filter { it.isChatJumpView() }
            assertEquals(activeProfile.hooks.getValue(CHAT_JUMP), views.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(CHAT_JUMP to views), setOf(CHAT_JUMP))
            val method = MutableMethod(views.single())
            val self = method.parameterRegister(0)
            method.injectChatJump()
            val call = method.code().first()
            assertEquals(CHAT_JUMP_CALL, (call as ReferenceInstruction).reference.toString(), code)
            assertEquals(listOf(self, 2), (call as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) }, code)
        }
    }
}
