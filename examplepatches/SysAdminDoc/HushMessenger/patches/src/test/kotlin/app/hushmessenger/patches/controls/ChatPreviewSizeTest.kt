package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

internal const val SYNTHETIC_CHAT_PREVIEW_SIZE =
    "$CHAT_PREVIEW_FRAGMENT->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"

private const val PREVIEW_STACK = "LX/9Fc;"
private const val PREVIEW_SIZE_TAG = "const-string v0, \"InboxThreadPreviewDialogFragment.preview_tap\""
private const val PREVIEW_SIZE_STORE = "iput-object v11, v9, $CHAT_PREVIEW_FRAGMENT->A0H:Landroid/view/View;"

/**
 * The preview fragment's onCreateView as 347215341 writes it, cut down: the screen's height picks the chat's height
 * (30% on a short screen, the smaller of 45% and 380dp on a tall one, which jumps back to share the rest), the stack
 * takes the most (88%), the height and the least (160dp or the height), and the tap layer goes over the chat with
 * its tag before the fragment stores it.
 */
private val PREVIEW_SIZE_BODY = """
    move-object/from16 v9, p0
    invoke-virtual {v9}, $CHAT_PREVIEW_FRAGMENT->requireContext()Landroid/content/Context;
    move-result-object v12
    const/16 v3, 0x500
    const/16 v0, 0x280
    if-ge v3, v0, :large
    int-to-float v3, v3
    const v0, 0x3e99999a
    mul-float/2addr v0, v3
    float-to-int v1, v0
    :most
    const v0, 0x3f6147ae
    mul-float/2addr v3, v0
    float-to-int v3, v3
    const/16 v0, 0xa0
    new-instance v4, $PREVIEW_STACK
    invoke-direct {v4, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V
    iput v3, v4, $PREVIEW_STACK->A00:I
    iput v1, v4, $PREVIEW_STACK->A01:I
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I
    move-result v0
    iput v0, v4, $PREVIEW_STACK->A02:I
    new-instance v10, Landroid/widget/FrameLayout;
    invoke-direct {v10, v12}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V
    new-instance v11, Landroid/view/View;
    invoke-direct {v11, v12}, Landroid/view/View;-><init>(Landroid/content/Context;)V
    $PREVIEW_SIZE_TAG
    invoke-virtual {v11, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V
    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    $PREVIEW_SIZE_STORE
    invoke-virtual {v4, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    return-object v4
    :large
    int-to-float v3, v3
    const v0, 0x3ee66666
    mul-float/2addr v0, v3
    float-to-int v1, v0
    const/16 v0, 0x17c
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I
    move-result v1
    goto :most
""".trimIndent()

private fun previewSizeView(body: String = PREVIEW_SIZE_BODY, id: String = SYNTHETIC_CHAT_PREVIEW_SIZE) = fixtureMethod(id, body, 20)

/** The view builder with the first [from] swapped for [to]. */
private fun previewSizeChanged(from: String, to: String) =
    previewSizeView(PREVIEW_SIZE_BODY.replaceFirst(from, to).also { check(it != PREVIEW_SIZE_BODY) })

/** The preview fragment with its view builder. */
internal fun chatPreviewSizeFixture(method: MutableMethod = previewSizeView()): List<MutableClass> =
    listOf(fixtureClass(CHAT_PREVIEW_FRAGMENT, listOf(method)))

private fun Method.sizeCode() = implementation!!.instructions.toList()

private fun Instruction.sizeCall() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Instruction.sizeArgs() = (this as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD).take(it.registerCount) }

class ChatPreviewSizeTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(CHAT_PREVIEW_SIZE).map { it.hookId() }.toSet()

    @Test fun theViewBuilderIsFoundWithBothSites() {
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW_SIZE), found(chatPreviewSizeFixture()))
        validateControls(mirroredControls(chatPreviewSizeFixture()), setOf(CHAT_PREVIEW_SIZE))
        val site = assertNotNull(previewSizeView().chatPreviewSizeSite())
        assertEquals(listOf(14, 3, 1, 0, 28, 11), listOf(site.stack, site.most, site.height, site.least, site.tapLayer, site.layer))
    }

    @Test fun eachMappingHooksTheFragmentsViewBuilder() {
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW_SIZE), SYNTHETIC_PROFILE.hooks.getValue(CHAT_PREVIEW_SIZE))
        assertEquals(setOf(SYNTHETIC_CHAT_PREVIEW_SIZE), BASE_PROFILE.hooks.getValue(CHAT_PREVIEW_SIZE))
    }

    // A builder that sizes something else, or stores some other view, could get the wrong sizes or a drag handler on
    // the wrong view, so it gets no hook at all.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        val elsewhere = "LX/Zzq;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;"
        val cases = mapOf(
            "no tap layer tag" to chatPreviewSizeFixture(previewSizeChanged(PREVIEW_SIZE_TAG, "const-string v0, \"preview\"")),
            "the least taken from the most" to chatPreviewSizeFixture(previewSizeChanged("invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I\nmove-result v0",
                "invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I\nmove-result v0")),
            "a size kept in another class" to chatPreviewSizeFixture(previewSizeChanged("$PREVIEW_STACK->A02:I", "LX/9Fd;->A02:I")),
            "two sizes in one field" to chatPreviewSizeFixture(previewSizeChanged("$PREVIEW_STACK->A01:I", "$PREVIEW_STACK->A00:I")),
            "a layer stored as something other than a view" to chatPreviewSizeFixture(previewSizeChanged(PREVIEW_SIZE_STORE,
                "iput-object v11, v9, $CHAT_PREVIEW_FRAGMENT->A0H:Ljava/lang/Object;")),
            "the layer replaced before it's stored" to chatPreviewSizeFixture(previewSizeChanged(PREVIEW_SIZE_STORE, "const/4 v11, 0x0\n$PREVIEW_SIZE_STORE")),
            "a jump onto the stack" to chatPreviewSizeFixture(previewSizeView(PREVIEW_SIZE_BODY.replaceFirst("new-instance v4", ":stack\nnew-instance v4")
                .replaceFirst("goto :most", "goto :stack"))),
            "a jump just past the store" to chatPreviewSizeFixture(previewSizeView(PREVIEW_SIZE_BODY
                .replaceFirst("$PREVIEW_SIZE_STORE\n", "$PREVIEW_SIZE_STORE\n:past\n").replaceFirst("goto :most", "goto :past"))),
            "the same builder in another class" to listOf(fixtureClass("LX/Zzq;", listOf(previewSizeView(id = elsewhere)))),
            "a builder with another name" to chatPreviewSizeFixture(previewSizeView(id = "$CHAT_PREVIEW_FRAGMENT->A00(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;")),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CHAT_PREVIEW_SIZE)) }
        }
    }

    @Test fun theSizesPassThroughTheSwitchAndTheStoredLayerGetsItsDrag() {
        val method = previewSizeView()
        val before = method.sizeCode()
        injectControl(CHAT_PREVIEW_SIZE, mapOf(CHAT_PREVIEW_SIZE to listOf(method)))
        val code = method.sizeCode()
        // The height goes in with the most and comes back to the register the stack reads, then the least with it.
        assertEquals("$CHAT_PREVIEW_SIZE_HOST->height(II)I", code[14].sizeCall())
        assertEquals(listOf(1, 3), code[14].sizeArgs())
        assertEquals(1, (code[15] as OneRegisterInstruction).registerA)
        assertEquals("$CHAT_PREVIEW_SIZE_HOST->least(II)I", code[16].sizeCall())
        assertEquals(listOf(0, 1), code[16].sizeArgs())
        assertEquals(0, (code[17] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.NEW_INSTANCE, code[18].opcode)
        // The layer goes to the extension right after the fragment stores it, before the chat area joins the stack.
        assertEquals(Opcode.IPUT_OBJECT, code[32].opcode)
        assertEquals("$CHAT_PREVIEW_SIZE_HOST->tapLayer(Landroid/view/View;)V", code[33].sizeCall())
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[33].opcode)
        assertEquals(11, (code[33] as RegisterRangeInstruction).startRegister)
        assertEquals(1, (code[33] as RegisterRangeInstruction).registerCount)
        // The tall screen's height still joins at the most, before the new sizing, and nothing lands on the new calls.
        val back = code.indexOfLast { it.opcode == Opcode.GOTO || it.opcode == Opcode.GOTO_16 }
        assertEquals(10, code.branchTarget(back))
        val inserted = setOf(14, 15, 16, 17, 33)
        assertTrue(inserted.none { it in method.jumpTargets() })
        assertStockKept(before, code.filterIndexed { i, _ -> i !in inserted }, "preview view")
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "no tap layer tag" to previewSizeChanged(PREVIEW_SIZE_TAG, "const-string v0, \"preview\""),
            "a jump onto the stack" to previewSizeView(PREVIEW_SIZE_BODY.replaceFirst("new-instance v4", ":stack\nnew-instance v4").replaceFirst("goto :most", "goto :stack")),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.sizeCode()
            assertFailsWith<PatchException>(case) { injectControl(CHAT_PREVIEW_SIZE, mapOf(CHAT_PREVIEW_SIZE to listOf(bad))) }
            assertEquals(badBefore, bad.sizeCode(), case)
        }
    }

    @Test fun everySupportedBuildSizesTheChatAndHandsOverItsLayer() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findChatPreviewSize(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(CHAT_PREVIEW_SIZE), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(CHAT_PREVIEW_SIZE to hooks), setOf(CHAT_PREVIEW_SIZE))
            val method = MutableMethod(hooks.single())
            val site = assertNotNull(method.chatPreviewSizeSite(), code)
            val before = method.sizeCode()
            method.injectChatPreviewSize()
            val after = method.sizeCode()
            val stack = site.stack
            val handOver = site.tapLayer + 5
            assertEquals(listOf("height(II)I", "least(II)I"), listOf(after[stack], after[stack + 2]).map { it.sizeCall()?.substringAfter("->") }, code)
            assertEquals(listOf(site.height, site.most), after[stack].sizeArgs(), code)
            assertEquals(listOf(site.least, site.height), after[stack + 2].sizeArgs(), code)
            assertEquals(listOf(site.height, site.least), listOf(after[stack + 1], after[stack + 3]).map { (it as OneRegisterInstruction).registerA }, code)
            assertEquals(Opcode.NEW_INSTANCE, after[stack + 4].opcode, code)
            assertEquals("$CHAT_PREVIEW_SIZE_HOST->tapLayer(Landroid/view/View;)V", after[handOver].sizeCall(), code)
            assertEquals(site.layer, (after[handOver] as RegisterRangeInstruction).startRegister, code)
            val inserted = setOf(stack, stack + 1, stack + 2, stack + 3, handOver)
            assertTrue(inserted.none { it in method.jumpTargets() }, code)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                after.filterIndexed { i, _ -> i !in inserted }.map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}
