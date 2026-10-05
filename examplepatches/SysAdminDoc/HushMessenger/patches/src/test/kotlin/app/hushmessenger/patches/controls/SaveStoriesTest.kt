package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull
import kotlin.test.assertTrue
import org.junit.jupiter.api.io.TempDir
import java.nio.file.Path

private const val FRAGMENT = "LX/HAs;"
private const val MENU = "LX/Idm;"
private const val ICON = "LX/1hJ;"
private const val HANDLER = "LX/Jlk;"
private const val BUILDER = "LX/JgG;->onClick(Landroid/view/View;)V"
private const val LABEL_OF = "LX/CW2;->A0w(Landroidx/fragment/app/Fragment;I)Ljava/lang/String;"
private const val ADD_ITEM = "$FRAGMENT->A0f($ICON$FRAGMENT${MENU}Ljava/lang/String;I)V"
private const val CONTROLLER = "$FRAGMENT->A0D($FRAGMENT)LX/JQP;"
private const val SAVE_ID = 0x7f0b0652L

/** Build 346013440 lists the card controllers Save works for. */
private val CARD_TYPES = """
    instance-of v1, v2, LX/HBq;
    if-nez v1, :save
    instance-of v1, v2, LX/IVH;
    if-nez v1, :save
    instance-of v1, v2, LX/IVG;
    if-eqz v1, :own_rest
""".trimIndent()

/** Builds 346013423 and 346013374 ask the controller instead. */
private val CARD_ANSWER = """
    invoke-virtual {v2}, LX/JQP;->A08()Z
    move-result v1
    if-eqz v1, :own_rest
""".trimIndent()

/** The story viewer's More options menu, cut down to the check, one item for anyone's story and your own story's first two. */
private fun builderBody(cardTest: String = CARD_TYPES) = """
    iget-object v6, p0, LX/JgG;->A00:Ljava/lang/Object;
    check-cast v6, $FRAGMENT
    const-string v3, "$STORY_MENU_TAG"
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v7
    invoke-static {v7}, LX/JXT;->A01(Landroid/content/Context;)$MENU
    move-result-object v5
    invoke-virtual {v6}, $FRAGMENT->A1p()Z
    move-result v3
    const/4 v4, 0x1
    const-string v13, "Required value was null."
    if-nez v3, :own
    iget-boolean v1, v6, $FRAGMENT->A10:Z
    if-nez v1, :own
    iget-object v1, v6, $FRAGMENT->A0R:$MONTAGE_CARD
    const/4 v4, 0x0
    if-eqz v1, :handler
    const v3, 0x7f0b142e
    const v1, 0x7f142dfc
    invoke-static {v6, v1}, $LABEL_OF
    move-result-object v2
    sget-object v1, $ICON->A6q:$ICON
    invoke-static {v1, v6, v5, v2, v3}, $ADD_ITEM
    goto :handler
    :own
    invoke-static {v6}, $FRAGMENT->A0l($FRAGMENT)V
    if-eqz v3, :own_rest
    invoke-static {v6}, $CONTROLLER
    move-result-object v2
""".trimIndent() + "\n" + cardTest + "\n" + """
    :save
    const v3, 0x7f0b0652
    const v1, 0x7f142dff
    invoke-static {v6, v1}, $LABEL_OF
    move-result-object v2
    sget-object v1, $ICON->A2f:$ICON
    invoke-static {v1, v6, v5, v2, v3}, $ADD_ITEM
    :own_rest
    const v3, 0x7f0b05d2
    const v1, 0x7f142dfe
    invoke-static {v6, v1}, $LABEL_OF
    move-result-object v2
    sget-object v1, $ICON->A78:$ICON
    invoke-static {v1, v6, v5, v2, v3}, $ADD_ITEM
    :handler
    new-instance v1, $HANDLER
    invoke-direct {v1, v6}, $HANDLER-><init>($FRAGMENT)V
    invoke-virtual {v5, v1}, LX/Ntp;->A0P(LX/Q2E;)V
    return-void
""".trimIndent()

class SaveStoriesTest {
    private fun builder(body: String = builderBody()) = fixtureMethod(BUILDER, body, registers = 16)

    @Test fun helperSurvivesAnAlreadyMaterializedDirectMethodSet(@TempDir temporary: Path) {
        val classes = listOf(fixtureClass("LX/JgG;", listOf(builder())), handlerClass()) + screenHostClasses()
        val config = PatcherConfig(lifecycleApk(temporary.resolve("input"), classes), temporary.resolve("work").toFile())
        val resources = ResourcePatchContext::class.java.getDeclaredConstructor(PatcherConfig::class.java).newInstance(config)
        val previousProfile = activeProfile
        val previousControls = discoveredControls
        try {
            activeProfile = BASE_PROFILE
            resources.use {
                ResourcePatchContext::class.java.getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
                    .invoke(resources, ResourceMode.RAW_ONLY)
                val context = BytecodePatchContext::class.java.declaredConstructors.single()
                    .newInstance(config, resources.packageMetadata) as BytecodePatchContext
                val patchClasses = Class.forName("app.morphe.patcher.util.PatchClasses")
                BytecodePatchContext::class.java.getMethod("setPatchClasses\$morphe_patcher", patchClasses)
                    .invoke(context, patchClasses.getConstructor(Set::class.java).newInstance(classes.toSet()))
                context.use {
                    val owner = context.mutableClassDefBy("LX/JgG;")
                    assertTrue(owner.directMethods.isEmpty())
                    discoveredControls = findControls(classes)
                    saveStoriesPatch.execute(context)
                    assertEquals(1, owner.methods.count { it.name == STORY_SAVE_HELPER })
                    assertEquals(1, owner.directMethods.count { it.name == STORY_SAVE_HELPER })
                    val emitted = DexBackedDexFile(Opcodes.forApi(28), java.nio.ByteBuffer.wrap(lifecycleDex(listOf(owner)))).classes.single()
                    assertEquals(1, emitted.methods.count { it.name == STORY_SAVE_HELPER })
                    assertEquals(1, emitted.directMethods.count { it.name == STORY_SAVE_HELPER })
                }
            }
        } finally {
            activeProfile = previousProfile
            discoveredControls = previousControls
            bundledControls.clear()
        }
    }

    private fun handlerClass(id: String = "0x7f0b0652", tag: String = STORY_SAVE_TAG, extra: List<Method> = emptyList()) =
        fixtureClass(HANDLER, listOf(fixtureMethod("$HANDLER->CX9(Landroid/view/MenuItem;)V", """
            invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I
            move-result v4
            const v3, $id
            const/4 v9, 0x0
            if-ne v4, v3, :other
            const-string v3, "$tag"
            return-void
            :other
            return-void
        """.trimIndent(), registers = 12)) + extra)

    private fun reference(instruction: Instruction) = (instruction as ReferenceInstruction).reference.toString()

    private fun args(instruction: Instruction) = (instruction as FiveRegisterInstruction).let {
        listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount)
    }

    @Test fun yourOwnStorysSaveItemAndTheOtherPathAreFound() {
        val save = builder().validateStorySave()
        assertEquals(14, save.others)
        assertEquals(6, save.fragment)
        assertEquals(5, save.menu)
        assertEquals(FRAGMENT, save.fragmentType)
        assertEquals(MENU, save.menuType)
        assertEquals(CONTROLLER, save.controller)
        assertEquals(listOf("LX/HBq;", "LX/IVH;", "LX/IVG;"), save.saveable)
        assertNull(save.canSave)
        assertEquals(SAVE_ID, save.id)
        assertEquals(0x7f142dffL, save.label)
        assertEquals(LABEL_OF, save.labelOf)
        assertEquals("$ICON->A2f:$ICON", save.icon)
        assertEquals(ADD_ITEM, save.addItem)
        assertEquals(HANDLER, save.handler)
    }

    @Test fun buildsThatAskTheControllerAreFoundToo() {
        val save = builder(builderBody(CARD_ANSWER)).validateStorySave()
        assertEquals(emptyList(), save.saveable)
        assertEquals("LX/JQP;->A08()Z", save.canSave)
        assertEquals(SAVE_ID, save.id)
        assertEquals(14, save.others)
    }

    @Test fun helperAddsTheSameItemOnlyWhileTheSwitchIsOn() {
        val helper = storySaveHelper("LX/JgG;", builder().validateStorySave())
        assertEquals(STORY_SAVE_HELPER, helper.name)
        assertEquals(listOf(FRAGMENT, MENU), helper.parameterTypes.map { it.toString() })
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags))
        val code = helper.implementation!!.instructions.toList()
        val done = code.lastIndex
        assertEquals(Opcode.RETURN_VOID, code[done].opcode)
        assertEquals("$SETTINGS->saveAnyStory()Z", reference(code[0]))
        assertEquals(done, code.branchTarget(2))
        // Six registers with two parameters: p0, the fragment, is v4 and p1, the menu, is v5.
        assertEquals(CONTROLLER, reference(code[3]))
        assertEquals(listOf(4), args(code[3]))
        assertEquals(done, code.branchTarget(5))
        assertEquals(listOf("LX/HBq;", "LX/IVH;", "LX/IVG;"), listOf(6, 8, 10).map { reference(code[it]) })
        val add = code.indexOfFirst { it is WideLiteralInstruction && it.wideLiteral == SAVE_ID }
        assertEquals(listOf(add, add, done), listOf(7, 9, 11).map { code.branchTarget(it) })
        assertEquals(LABEL_OF, reference(code[add + 2]))
        assertEquals(listOf(4, 1), args(code[add + 2]))
        assertEquals(ADD_ITEM, reference(code[done - 1]))
        assertEquals(listOf(1, 4, 5, 2, 3), args(code[done - 1]))
    }

    @Test fun helperAsksTheControllerWhereTheBuildDoes() {
        val code = storySaveHelper("LX/JgG;", builder(builderBody(CARD_ANSWER)).validateStorySave()).implementation!!.instructions.toList()
        assertEquals("LX/JQP;->A08()Z", reference(code[6]))
        assertEquals(Opcode.IF_EQZ, code[8].opcode)
        assertEquals(code.lastIndex, code.branchTarget(8))
        assertTrue(code.none { it.opcode == Opcode.INSTANCE_OF })
    }

    @Test fun otherPeoplesStoriesCallTheHelperBeforeTheirOwnItems() {
        val method = builder()
        val save = method.validateStorySave()
        val before = method.implementation!!.instructions.toList()
        method.injectStorySave(save)
        val code = method.implementation!!.instructions.toList()
        assertEquals("LX/JgG;->$STORY_SAVE_HELPER($FRAGMENT$MENU)V", reference(code[14]))
        assertEquals(listOf(6, 5), args(code[14]))
        assertEquals(before.take(14), code.take(14))
        assertEquals(before.drop(14), code.drop(15))
        // Both branches to your own story's items still go past the helper.
        val own = code.indexOfFirst { it is ReferenceInstruction && reference(it) == "$FRAGMENT->A0l($FRAGMENT)V" }
        assertEquals(listOf(own, own), listOf(11, 13).map { code.branchTarget(it) })
    }

    @Test fun aMenuThatChangedShapeIsRejected() {
        fun rejects(body: String) = assertFailsWith<PatchException> { builder(body).validateStorySave() }
        val body = builderBody()
        rejects(body.replace("return-void", "invoke-virtual {v6}, $FRAGMENT->A1p()Z\nmove-result v3\nif-nez v3, :own\n" +
            "iget-boolean v1, v6, $FRAGMENT->A10:Z\nif-nez v1, :own\nreturn-void"))
        rejects(body.replace("const/4 v4, 0x1\n", "const/4 v5, 0x1\n"))
        rejects(body.replace("iget-object v1, v6, $FRAGMENT->A0R", ":others\niget-object v1, v6, $FRAGMENT->A0R")
            .replace("goto :handler\n", "goto :others\n"))
        rejects(body.replace("if-eqz v3, :own_rest", "if-eqz v4, :own_rest"))
        rejects(body.replace("instance-of v1, v2, LX/IVH;", "instance-of v1, v7, LX/IVH;"))
        rejects(body.replace("if-nez v1, :save\ninstance-of v1, v2, LX/IVG;", "if-nez v1, :own_rest\ninstance-of v1, v2, LX/IVG;"))
        rejects(body.replace("const v1, 0x7f142dff\ninvoke-static {v6, v1}", "const v1, 0x7f142dff\ninvoke-static {v7, v1}"))
        rejects(body.replace("sget-object v1, $ICON->A2f:$ICON\ninvoke-static {v1, v6, v5, v2, v3}",
            "sget-object v1, $ICON->A2f:$ICON\ninvoke-static {v1, v6, v7, v2, v3}"))
        rejects(body.replace("invoke-virtual {v5, v1}, LX/Ntp;->A0P(LX/Q2E;)V\n", ""))
        rejects(body.replace("return-void", "new-instance v1, $HANDLER\ninvoke-direct {v1, v6}, $HANDLER-><init>($FRAGMENT)V\n" +
            "invoke-virtual {v5, v1}, LX/Ntp;->A0P(LX/Q2E;)V\nreturn-void"))
        rejects(builderBody(CARD_ANSWER).replace("invoke-virtual {v2}, LX/JQP;->A08()Z", "invoke-virtual {v7}, LX/JQP;->A08()Z"))
        assertFailsWith<PatchException> { fixtureMethod("LX/JgG;->A01(Landroid/view/View;)V", body, registers = 16).validateStorySave() }
    }

    @Test fun theHandlerMustSaveTheItemTheMenuAdds() {
        val save = builder().validateStorySave()
        handlerClass().validateStoryMenuHandler(save)
        assertFailsWith<PatchException> { handlerClass(id = "0x7f0b05d2").validateStoryMenuHandler(save) }
        assertFailsWith<PatchException> { handlerClass(tag = "menu_item_delete").validateStoryMenuHandler(save) }
        val second = fixtureMethod("$HANDLER->A00()V", "const-string v0, \"$STORY_SAVE_TAG\"\nreturn-void", registers = 2)
        assertFailsWith<PatchException> { handlerClass(extra = listOf(second)).validateStoryMenuHandler(save) }
    }
}
