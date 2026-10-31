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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val CHAT = "LX/5Vw;"
private const val COROUTINE = "LX/NFg;"
private const val COROUTINE_INTENT = "$COROUTINE->A04:Landroid/content/Intent;"
private const val ITEMS_INTENT_FIELD = "$ACTIVITY_RESULT_EVENT->A02:Landroid/content/Intent;"
private const val DISPATCHER = "LX/AGc;->A04($CHAT$COMPOSER_EVENT)V"
private const val CAMERA_RESULT = "LX/5fb;->A00(Ljava/util/List;$CHAT)V"
private const val UNIT = "LX/0Bs;->A00:LX/0Bs;"

/** The synthetic label for the coroutine the photo handler starts, named after 585's. */
internal const val GALLERY_CHAT_EDITOR = "$COROUTINE->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;"

/** The photo handler with the coroutine it starts for the item. Parameters start at v8, and the body uses v0 to v2. */
private fun chatItemsBody(started: String = "new-instance v1, $COROUTINE\ninvoke-direct {v1, v2}, $COROUTINE-><init>(Landroid/content/Intent;)V") =
    GALLERY_ITEMS_BODY.replace("\n:other\n", "\n$started\n:other\n")

/**
 * The coroutine cut down to the copy and the editor. A pick with no item jumps straight to the builder with no media.
 * Locals v0 to v6, this in v7.
 */
private val EDITOR_BODY = """
    iget-object v1, p0, $COROUTINE_INTENT
    iget-object v2, p0, $COROUTINE->A05:Ljava/lang/Object;
    const/4 v0, 0x0
    if-eqz v1, :build
    invoke-virtual {v1}, Landroid/content/Intent;->getType()Ljava/lang/String;
    move-result-object v3
    check-cast v2, $CHAT
    invoke-static {v3}, LX/5Gx;->A00(Ljava/lang/String;)$AUTO_REPLY_MEDIA
    move-result-object v0
    :build
    new-instance v4, $EDITOR_BUILDER
    invoke-direct {v4}, $EDITOR_BUILDER-><init>()V
    iput-object v0, v4, $EDITOR_BUILDER->A0B:$AUTO_REPLY_MEDIA
    invoke-virtual {v4}, $EDITOR_BUILDER->A00()$EDITOR_PARAMS
    move-result-object v4
    sget-object v6, $NAVIGATION_TRIGGER->A00:$NAVIGATION_TRIGGER
    const/4 v3, 0x1
    invoke-static {v2, v4, v6, v3}, LX/Mpm;->A00(Ljava/lang/Object;$EDITOR_PARAMS${NAVIGATION_TRIGGER}I)V
    sget-object v5, $UNIT
    return-object v5
""".trimIndent()

private val FINAL_PUBLIC = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
private val PUBLIC_STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun coroutineClass(body: String = EDITOR_BODY, type: String = COROUTINE) = fixtureClass(type,
    listOf(fixtureMethod(GALLERY_CHAT_EDITOR.replace(COROUTINE, type), body.replace(COROUTINE, type), registers = 9)), flags = FINAL_PUBLIC)

private fun insertClass(initFlags: Int = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value, flags: Int = FINAL_PUBLIC) =
    fixtureClass(INSERT_PREVIEW, listOf(fixtureMethod(INSERT_PREVIEW_INIT, "return-void", registers = 3, flags = initFlags)), flags = flags)

/** The camera result: a new tray insert of what it took, handed straight to the chat's dispatcher. */
private fun cameraResultClass(dispatcher: String = DISPATCHER, type: String = "LX/5fb;") = fixtureClass(type, listOf(fixtureMethod(
    CAMERA_RESULT.replace("LX/5fb;", type), """
        new-instance v0, $INSERT_PREVIEW
        const/4 v1, 0x0
        invoke-direct {v0, v1, p0}, $INSERT_PREVIEW_INIT
        invoke-static {p1, v0}, $dispatcher
        return-void
    """.trimIndent(), registers = 4, flags = PUBLIC_STATIC)))

private fun dispatcherClass(id: String = DISPATCHER, flags: Int = PUBLIC_STATIC) =
    fixtureClass(id.substringBefore("->"), listOf(fixtureMethod(id, "return-void", registers = 3, flags = flags)))

private const val FACTORY = "LX/AEa;"
private const val TRAY_PLUGIN = "LX/Afy;"

/** The synthetic label for the composer factory's override of its tray gate, named after 585's. */
internal const val GALLERY_TRAY_GATE = "$FACTORY->A1J()Z"

/** The tray's composer plugin, whose event set takes the tray insert. */
private fun trayPluginClass(event: String = INSERT_PREVIEW) = fixtureClass(TRAY_PLUGIN, listOf(fixtureMethod("$TRAY_PLUGIN->BWh()Ljava/util/Set;", """
    const-class v0, $event
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;
    move-result-object v0
    return-object v0
""".trimIndent(), registers = 2)))

/** The factory cut down to its tray: the gate, a null plugin when it says no, and the plugin built past it. Locals v0 to v2, this in v3. */
private val FACTORY_BODY = """
    invoke-virtual {p0}, $COMPOSER_FACTORY->A1J()Z
    move-result v0
    if-eqz v0, :none
    const/4 v1, 0x1
    goto :check
    :none
    const/4 v2, 0x0
    goto :built
    :check
    new-instance v2, $TRAY_PLUGIN
    invoke-direct {v2}, $TRAY_PLUGIN-><init>()V
    :built
    invoke-virtual {p0, v2}, $FACTORY->A00(Ljava/lang/Object;)V
    return-void
""".trimIndent()

/** The factory's override of the gate: a server flag. Locals v0 and v1, this in v2. */
private val GATE_BODY = """
    const-wide v0, 0x101019e00161b84L
    invoke-static {v0, v1}, LX/2on;->A00(J)Z
    move-result v0
    return v0
""".trimIndent()

private fun factoryClass(body: String = FACTORY_BODY, gate: String? = GATE_BODY, type: String = FACTORY,
    superclass: String = COMPOSER_FACTORY) = fixtureClass(type, listOf(fixtureMethod("$type->A8B()V", body.replace(FACTORY, type), registers = 4)) +
    listOfNotNull(gate?.let { fixtureMethod(GALLERY_TRAY_GATE.replace(FACTORY, type), it, registers = 3) }), superclass = superclass)

/**
 * Open your gallery app's classes with the photo handler starting its coroutine and the event's intent field writable,
 * plus the coroutine, the tray insert, the camera result that names the chat's dispatcher, and the composer factory
 * with its tray gate and the tray's plugin.
 */
internal fun galleryToChatFixture(vararg replace: MutableClass): List<MutableClass> {
    val classes = externalGalleryFixture().filter { it.type != ACTIVITY_RESULT_EVENT && it.type != "LX/B5V;" } +
        listOf(itemsClass(chatItemsBody()), resultEventClass(intentFlags = AccessFlags.PUBLIC.value), coroutineClass(), insertClass(),
            cameraResultClass(), dispatcherClass(), factoryClass(), trayPluginClass())
    return classes.filter { cls -> replace.none { it.type == cls.type } } + replace
}

private fun chatClasses(vararg replace: MutableClass): List<ClassDef> = systemCameraFixture() + galleryToChatFixture(*replace)

private fun Method.code() = implementation!!.instructions.toList()

private fun Instruction.reference() = (this as ReferenceInstruction).reference.toString()

class GalleryToChatTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        galleryRoute = null
        galleryChatRoute = null
    }

    private fun found(classes: List<ClassDef>) = mirroredControls(classes).getValue(GALLERY_TO_CHAT)

    @Test fun thePhotoHandlerAndItsCoroutineAreFoundWithTheChatsDispatcherAndTrayGate() {
        val found = found(chatClasses())
        assertEquals(listOf(GALLERY_ITEMS, GALLERY_CHAT_EDITOR, GALLERY_TRAY_GATE), found.map { it.hookId() })
        assertEquals(GalleryChatRoute(GALLERY_ITEMS, ITEMS_INTENT_FIELD, GALLERY_CHAT_EDITOR, DISPATCHER, CHAT, GALLERY_TRAY_GATE), galleryChatRoute)
        validateControls(mapOf(GALLERY_TO_CHAT to found), setOf(GALLERY_TO_CHAT))
        val site = found[1].galleryChatSite(setOf(CHAT))!!
        assertEquals(listOf(9, 1, 0, 2, 4, CHAT, UNIT), listOf(site.at, site.intent, site.media, site.chat, site.params, site.chatType, site.unit))
        assertEquals(3, found.last().traySite())
    }

    @Test fun anotherComposerBehindAGateItDoesntOverrideIsLeftAlone() {
        // 585 builds the same plugin in another surface's composer, behind a base gate that composer doesn't override.
        val found = found(chatClasses() + factoryClass(type = "LX/AFD;", gate = null))
        assertEquals(GALLERY_TRAY_GATE, found.last().hookId())
        assertEquals(GALLERY_TRAY_GATE, galleryChatRoute!!.tray)
    }

    @Test fun theTrayGateAsksTheSwitchWithTheServersAnswer() {
        findGalleryToChat(chatClasses())
        val gate = MutableMethod(factoryClass().methods.single { it.name == "A1J" })
        val before = gate.code()
        injectControl(GALLERY_TO_CHAT, mapOf(GALLERY_TO_CHAT to listOf(gate)))
        val after = gate.code()
        assertEquals(before.take(3), after.take(3))
        assertEquals(GALLERY_TRAY_CALL, after[3].reference())
        assertEquals(0, (after[3] as FiveRegisterInstruction).registerC)
        assertEquals(1, (after[3] as FiveRegisterInstruction).registerCount)
        assertEquals(Opcode.MOVE_RESULT, after[4].opcode)
        assertEquals(0, (after[4] as OneRegisterInstruction).registerA)
        assertEquals(before.last(), after.last())
        assertEquals(before.size + 2, after.size)
    }

    @Test fun theHandlerRunsOncePerItemWithTheEventsIntentSwappedAndPutBack() {
        findGalleryToChat(chatClasses())
        val items = MutableMethod(itemsClass(chatItemsBody()).methods.single())
        val before = items.code()
        injectControl(GALLERY_TO_CHAT, mapOf(GALLERY_TO_CHAT to listOf(items)))
        val after = items.code()
        val hook = after.size - before.size
        assertEquals(before, after.drop(hook))
        val event = items.parameterRegister(3)
        val read = after[0] as TwoRegisterInstruction
        assertEquals(Opcode.IGET_OBJECT, after[0].opcode)
        assertEquals(listOf(0, event), listOf(read.registerA, read.registerB))
        assertEquals(ITEMS_INTENT_FIELD, after[0].reference())
        assertEquals(GALLERY_TO_CHAT_CALL, after[1].reference())
        // No items means Messenger's own handling, which starts right after the hook.
        assertEquals(Opcode.IF_EQZ, after[3].opcode)
        assertEquals(hook, after.branchTarget(3))
        // Each item goes into the event and the handler runs again with all of its parameters as they came in.
        val again = after.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC_RANGE }
        assertEquals(GALLERY_ITEMS, after[again].reference())
        assertEquals(listOf(items.parameterRegister(0), 5), (after[again] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        val puts = after.take(hook).withIndex().filter { it.value.opcode == Opcode.IPUT_OBJECT }
        assertEquals(2, puts.size)
        assertTrue(puts.first().index < again && puts.last().index > again)
        for (put in puts) {
            assertEquals(event, (put.value as TwoRegisterInstruction).registerB)
            assertEquals(ITEMS_INTENT_FIELD, put.value.reference())
        }
        // The original intent goes back before the handler returns.
        assertEquals(0, (puts.last().value as TwoRegisterInstruction).registerA)
        assertEquals(Opcode.RETURN_VOID, after[puts.last().index + 1].opcode)
        // The hook's own registers are the four locals below the parameters.
        assertTrue(after.take(hook).all { it !is OneRegisterInstruction || it.registerA < 4 })
    }

    @Test fun theCoroutinePutsTheCopiedItemInTheTrayInsteadOfOpeningTheEditor() {
        findGalleryToChat(chatClasses())
        val editor = MutableMethod(coroutineClass().methods.single())
        val before = editor.code()
        val site = editor.galleryChatSite(setOf(CHAT))!!
        injectControl(GALLERY_TO_CHAT, mapOf(GALLERY_TO_CHAT to listOf(editor)))
        val after = editor.code()
        val hook = after.size - before.size
        assertEquals(before.take(site.at), after.take(site.at))
        assertEquals(before.drop(site.at), after.drop(site.at + hook))
        val ask = after[site.at] as FiveRegisterInstruction
        assertEquals(GALLERY_CHAT_ITEM_CALL, after[site.at].reference())
        assertEquals(listOf(site.intent, site.media), listOf(ask.registerC, ask.registerD))
        // Not one of ours: the editor, as before.
        assertEquals(Opcode.IF_EQZ, after[site.at + 2].opcode)
        assertEquals(site.at + hook, after.branchTarget(site.at + 2))
        val insert = after.subList(site.at, site.at + hook)
        assertEquals(INSERT_PREVIEW, insert.single { it.opcode == Opcode.NEW_INSTANCE }.reference())
        assertEquals(INSERT_PREVIEW_INIT, insert.single { it.opcode == Opcode.INVOKE_DIRECT }.reference())
        val dispatch = insert.single { it.opcode == Opcode.INVOKE_STATIC && it.reference() == DISPATCHER } as FiveRegisterInstruction
        assertEquals(site.chat, dispatch.registerC)
        assertEquals(listOf(Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT), insert.takeLast(2).map { it.opcode })
        assertEquals(UNIT, insert[insert.size - 2].reference())
        // A pick with no item still jumps past the hook, straight to the builder.
        val skip = after.indices.single { after[it].opcode == Opcode.IF_EQZ && it < site.at }
        assertEquals(site.at + hook, after.branchTarget(skip))
    }

    @Test fun eitherGallerySwitchCanHookThePhotoHandlerFirst() {
        for (galleryFirst in listOf(true, false)) {
            val classes = chatClasses()
            findExternalGallery(classes)
            findGalleryToChat(classes)
            val items = MutableMethod(itemsClass(chatItemsBody()).methods.single())
            val before = items.code()
            if (galleryFirst) {
                injectControl(EXTERNAL_GALLERY, mapOf(EXTERNAL_GALLERY to listOf(items)))
                injectControl(GALLERY_TO_CHAT, mapOf(GALLERY_TO_CHAT to listOf(items)))
            } else {
                injectControl(GALLERY_TO_CHAT, mapOf(GALLERY_TO_CHAT to listOf(items)))
                injectControl(EXTERNAL_GALLERY, mapOf(EXTERNAL_GALLERY to listOf(items)))
            }
            val after = items.code()
            assertEquals(before, after.takeLast(before.size), "gallery first $galleryFirst")
            assertEquals(1, after.count { it.opcode == Opcode.INVOKE_STATIC && it.reference() == GALLERY_TO_CHAT_CALL }, "gallery first $galleryFirst")
            assertEquals(1, after.count { it.opcode == Opcode.INVOKE_STATIC && it.reference() == "$SETTINGS->galleryItems(Ljava/lang/Object;Landroid/content/Intent;)Z" },
                "gallery first $galleryFirst")
        }
    }

    @Test fun aRouteTheHooksCantTakeIsNeverFound() {
        val editor = { body: String -> coroutineClass(body) }
        val cases = mapOf(
            // Another class's code can't write a final field, and the handler only reaches a public one.
            "intent final" to chatClasses(resultEventClass()),
            "intent not public" to chatClasses(resultEventClass(intentFlags = 0)),
            // Three locals leave no room for the loop, and an event past v15 is out of a plain iput's reach.
            "three locals" to chatClasses(itemsClass(chatItemsBody(), registers = 8)),
            "event past v15" to chatClasses(itemsClass(chatItemsBody(), registers = 20)),
            "no coroutine" to chatClasses(itemsClass()),
            "two coroutines" to chatClasses(itemsClass(chatItemsBody("new-instance v1, $COROUTINE\nnew-instance v1, LX/NFh;"))) + coroutineClass(type = "LX/NFh;"),
            "no tray insert" to chatClasses().filter { it.type != INSERT_PREVIEW },
            "private insert" to chatClasses(insertClass(initFlags = AccessFlags.CONSTRUCTOR.value)),
            "hidden insert" to chatClasses(insertClass(flags = AccessFlags.FINAL.value)),
            "no dispatcher call" to chatClasses().filter { it.type != "LX/5fb;" },
            "dispatcher not static" to chatClasses(dispatcherClass(flags = AccessFlags.PUBLIC.value)),
            "dispatcher not public" to chatClasses(dispatcherClass(flags = AccessFlags.STATIC.value)),
            "two dispatchers" to chatClasses() + cameraResultClass(DISPATCHER.replace("LX/AGc;", "LX/AGd;"), "LX/5fc;") +
                dispatcherClass(DISPATCHER.replace("LX/AGc;", "LX/AGd;")),
            "another chat type" to chatClasses(editor(EDITOR_BODY.replace("check-cast v2, $CHAT", "check-cast v2, LX/5Vx;"))),
            "no type read" to chatClasses(editor(EDITOR_BODY.replace("invoke-virtual {v1}, Landroid/content/Intent;->getType()Ljava/lang/String;", "invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;"))),
            "intent rewritten" to chatClasses(editor(EDITOR_BODY.replace("check-cast v2, $CHAT", "check-cast v2, $CHAT\nconst/4 v1, 0x0"))),
            "a jump into the run" to chatClasses(editor(EDITOR_BODY.replace("if-eqz v1, :build", "if-eqz v1, :inside")
                .replace("check-cast v2, $CHAT", ":inside\ncheck-cast v2, $CHAT"))),
            "media not stored" to chatClasses(editor(EDITOR_BODY.replace("iput-object v0, v4", "iput-object v3, v4"))),
            "no unit" to chatClasses(editor(EDITOR_BODY.replace("sget-object v5, $UNIT", "sget-object v5, LX/0Bs;->A00:Ljava/lang/Object;"))),
            "two builders" to chatClasses(editor(EDITOR_BODY.replace("sget-object v6,", "new-instance v6, $EDITOR_BUILDER\nsget-object v6,"))),
            "media in this" to chatClasses(editor(EDITOR_BODY.replace("v0", "v7"))),
            // The tray gate: the plugin the gate guards takes the tray insert, the gate is the factory's own, and its answer
            // comes back from one return.
            "no tray plugin" to chatClasses().filter { it.type != TRAY_PLUGIN },
            "the plugin takes another event" to chatClasses(trayPluginClass("LX/5Rm;")),
            "not a composer factory" to chatClasses(factoryClass(superclass = "Ljava/lang/Object;")),
            "the tray isn't gated" to chatClasses(factoryClass(FACTORY_BODY.replace("if-eqz v0, :none", "if-eqz v0, :check"))),
            "gated by another call" to chatClasses(factoryClass(FACTORY_BODY.replace("$COMPOSER_FACTORY->A1J()Z", "$FACTORY->A1J()Z"))),
            "gate with an argument" to chatClasses(factoryClass(FACTORY_BODY.replace("invoke-virtual {p0}, $COMPOSER_FACTORY->A1J()Z",
                "invoke-virtual {p0, v1}, $COMPOSER_FACTORY->A1J(I)Z"))),
            "no plugin is null past the tray" to chatClasses(factoryClass(FACTORY_BODY.replace("goto :built", "goto :check"))),
            "no override" to chatClasses(factoryClass(gate = null)),
            "two returns" to chatClasses(factoryClass(gate = GATE_BODY.replace("move-result v0", "move-result v0\nif-eqz v0, :no\nreturn v0\n:no"))),
            "a jump to the return" to chatClasses(factoryClass(gate = GATE_BODY.replace("move-result v0", "move-result v0\nif-eqz v0, :answer\n:answer"))),
            "two gated factories" to chatClasses() + factoryClass(type = "LX/AEb;"),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertEquals(null, galleryChatRoute, case)
        }
        // The same handler is still Open your gallery app's.
        assertTrue(mirroredControls(chatClasses(resultEventClass())).getValue(EXTERNAL_GALLERY).isNotEmpty())
    }

    @Test fun aMovedEditorRefusesBeforeAnyEdit() {
        findGalleryToChat(chatClasses())
        for ((case, body) in mapOf(
            "no builder" to EDITOR_BODY.replace("new-instance v4, $EDITOR_BUILDER", "new-instance v4, LX/5Gy;"),
            "another chat" to EDITOR_BODY.replace("check-cast v2, $CHAT", "check-cast v2, LX/5Vx;"),
        )) {
            val editor = MutableMethod(coroutineClass(body).methods.single())
            val before = editor.code()
            assertFailsWith<PatchException>(case) { injectControl(GALLERY_TO_CHAT, mapOf(GALLERY_TO_CHAT to listOf(editor))) }
            assertEquals(before, editor.code(), case)
        }
        val crowded = MutableMethod(itemsClass(chatItemsBody(), registers = 8).methods.single())
        val before = crowded.code()
        assertFailsWith<PatchException> { injectControl(GALLERY_TO_CHAT, mapOf(GALLERY_TO_CHAT to listOf(crowded))) }
        assertEquals(before, crowded.code())
    }

    @Test fun everySupportedBuildPutsGalleryPicksInTheChat() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val found = findGalleryToChat(classes)
            assertEquals(activeProfile.hooks.getValue(GALLERY_TO_CHAT), found.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(GALLERY_TO_CHAT to found), setOf(GALLERY_TO_CHAT))
            // The same photo handler Open your gallery app hooks.
            assertEquals(activeProfile.hooks.getValue(EXTERNAL_GALLERY).single { it == found.first().hookId() }, galleryChatRoute!!.items, code)
            val methods = found.map { MutableMethod(it) }
            val befores = methods.map { it.code() }
            injectControl(GALLERY_TO_CHAT, mapOf(GALLERY_TO_CHAT to methods))
            for ((method, before) in methods.zip(befores)) {
                val after = method.code()
                assertTrue(after.size > before.size, "$code ${method.hookId()}")
                assertEquals(1, after.count { it is ReferenceInstruction &&
                    it.reference.toString() in setOf(GALLERY_TO_CHAT_CALL, GALLERY_CHAT_ITEM_CALL, GALLERY_TRAY_CALL) }, "$code ${method.hookId()}")
            }
        }
    }
}
