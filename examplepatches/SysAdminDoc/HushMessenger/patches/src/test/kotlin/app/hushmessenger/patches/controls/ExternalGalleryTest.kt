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
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.w3c.dom.Element
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

internal const val GALLERY_HANDLER = "LX/6CC;->BpW(LX/5IZ;Ljava/lang/String;)V"
private const val GALLERY_EDITOR = "LX/5JN;->A0C(${EDIT_GALLERY_ITEM}LX/0c8;)V"
private const val GALLERY_PROVIDER = "LX/6CC;->A0L:LX/0c8;"
internal const val GALLERY_PLUGIN = "LX/5SC;->BkE(Lcom/facebook/xapp/messaging/capability/vector/Capabilities;LX/5uL;LX/5WP;${COMPOSER_EVENT})V"
private const val PLUGIN_PROVIDER = "LX/5SC;->A0M:LX/0c8;"
private const val COMPOSER_RESULT = "LX/7Rm;->onActivityResult(IILandroid/content/Intent;)V"
internal const val GALLERY_ITEMS = "LX/B5V;->A00($ANDROIDX_FRAGMENT$FB_USER_SESSION$THREAD_KEY_TYPE${ACTIVITY_RESULT_EVENT}LX/6NI;)V"
private const val ITEMS_INTENT = "$ACTIVITY_RESULT_EVENT->A02:Landroid/content/Intent;"

/** The chat's handler for a photo from another app, cut down to its request check and the intent it reads. Parameters start at v8. */
internal val GALLERY_ITEMS_BODY = """
    iget v0, p3, $ACTIVITY_RESULT_EVENT->A00:I
    const/16 v1, $EXTERNAL_MEDIA_REQUEST
    if-ne v0, v1, :other
    iget v0, p3, $ACTIVITY_RESULT_EVENT->A01:I
    iget-object v2, p3, $ITEMS_INTENT
    invoke-static {p0, p2, v2}, LX/B5V;->A01(${ANDROIDX_FRAGMENT}${THREAD_KEY_TYPE}Landroid/content/Intent;)V
    :other
    return-void
""".trimIndent()

/** The chat composer's event handler, cut down to its Edit and gallery branches. Parameters start at v9. */
private val GALLERY_HANDLER_BODY = """
    move-object/from16 v0, p0
    const-string v1, "com.facebook.xapp.messaging.composer.gallery.event.EditGalleryItemEvent"
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :gallery
    check-cast p1, $EDIT_GALLERY_ITEM
    iget-object v1, v0, $GALLERY_PROVIDER
    invoke-static {p1, v1}, $GALLERY_EDITOR
    return-void
    :gallery
    const-string v1, "com.facebook.xapp.messaging.composer.gallery.event.ActivateGalleryEvent"
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :other
    check-cast p1, $ACTIVATE_GALLERY
    iget-object v4, v0, LX/6CC;->A07:LX/5WP;
    const-class v1, LX/5gW;
    invoke-static {v4, p1, v1}, LX/5JN;->A01(LX/5WP;${ACTIVATE_GALLERY}Ljava/lang/Class;)V
    return-void
    :other
    return-void
""".trimIndent()

/**
 * 583's composer plugin, cut down to its gallery and Edit branches. Parameters start at v20. The gallery branch checks a
 * cached value and throws without it, and that way reads v2, so the hook skips it. Edit loads its provider before a
 * branch that rejoins at the editor call.
 */
private val GALLERY_PLUGIN_BODY = """
    move-object/from16 v9, p4
    move-object/from16 v0, p0
    instance-of v1, v9, $ACTIVATE_GALLERY
    const-string v2, "mediaPickerLoadQPLLogger"
    if-eqz v1, :edit
    check-cast v9, $ACTIVATE_GALLERY
    iget-object v1, v0, LX/5SC;->A03:LX/0LY;
    if-nez v1, :open
    invoke-static {v2}, LX/WK0;->A0v(Ljava/lang/String;)V
    invoke-static {}, LX/0Qz;->createAndThrow()LX/0Qz;
    move-result-object v0
    throw v0
    :open
    invoke-interface {v1}, LX/0LY;->get()Ljava/lang/Object;
    move-result-object v10
    iget-object v5, v0, LX/5SC;->A0K:Ljava/lang/Boolean;
    move-object/from16 v16, v5
    invoke-static/range {v9 .. v16}, LX/5JN;->A01(${ACTIVATE_GALLERY}Ljava/lang/Object;LX/5Op;LX/5Op;LX/5Op;LX/5Op;LX/5Op;Ljava/lang/Boolean;)V
    return-void
    :edit
    instance-of v1, v9, $EDIT_GALLERY_ITEM
    if-eqz v1, :other
    check-cast v9, $EDIT_GALLERY_ITEM
    iget-object v2, v0, $PLUGIN_PROVIDER
    iget-object v1, v0, LX/5SC;->A0C:LX/5Op;
    iget-object v3, v1, LX/5Op;->A00:Ljava/lang/Object;
    if-nez v3, :cached
    invoke-virtual {v1}, LX/5Op;->A04()Ljava/lang/Object;
    move-result-object v3
    :cached
    invoke-static {v9, v2}, $GALLERY_EDITOR
    return-void
    :other
    return-void
""".trimIndent()

private fun pluginClass(type: String = "LX/5SC;", body: String = GALLERY_PLUGIN_BODY) = fixtureClass(type,
    listOf(fixtureMethod(GALLERY_PLUGIN.replace("LX/5SC;", type), body.replace("LX/5SC;", type), registers = 25)),
    extraFields = listOf("A03" to "LX/0LY;", "A0K" to "Ljava/lang/Boolean;", "A0M" to "LX/0c8;", "A0C" to "LX/5Op;").map { (name, fieldType) ->
        ImmutableField(type, name, fieldType, AccessFlags.FINAL.value, null, null, null)
    }, flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

/** Edit's static helper: it takes the chat camera's launcher from the provider and starts Messenger's editor with it. */
private fun galleryEditorBody(start: String = "LX/6iH;->BxF(Landroid/os/Bundle;LX/6NI;)Z") = """
    invoke-interface {p1}, LX/0c8;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, LX/6iH;
    invoke-static {}, LX/17v;->A0E()Landroid/os/Bundle;
    move-result-object v1
    const/4 v2, 0x0
    invoke-interface {v0, v1, v2}, $start
    return-void
""".trimIndent()

private val STUB_START = "const/4 v0, 0x0\nreturn v0"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val INTERFACE = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value

private fun handlerClass(body: String = GALLERY_HANDLER_BODY, registers: Int = 12) = fixtureClass("LX/6CC;",
    listOf(fixtureMethod(GALLERY_HANDLER, body, registers = registers)),
    extraFields = listOf("A0L" to "LX/0c8;", "A07" to "LX/5WP;").map { (name, type) ->
        ImmutableField("LX/6CC;", name, type, AccessFlags.FINAL.value, null, null, null)
    }, flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

internal fun itemsClass(body: String = GALLERY_ITEMS_BODY, id: String = GALLERY_ITEMS, registers: Int = 13, flags: Int = STATIC) =
    fixtureClass(id.substringBefore("->"), listOf(fixtureMethod(id, body, registers = registers, flags = flags)))

internal fun resultEventClass(intentFlags: Int = AccessFlags.FINAL.value, intentName: String = "A02", secondIntent: String? = null) =
    fixtureClass(ACTIVITY_RESULT_EVENT, extraFields = (listOf("A00" to "I", "A01" to "I", intentName to "Landroid/content/Intent;") +
        listOfNotNull(secondIntent?.let { it to "Landroid/content/Intent;" })).map { (name, type) ->
        ImmutableField(ACTIVITY_RESULT_EVENT, name, type, if (type == "I") AccessFlags.FINAL.value else intentFlags, null, null, null)
    }, flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

/**
 * Both handlers, Edit's helper, the provider interface, and the photo result handler with its event. The chat camera's
 * launcher comes from [systemCameraFixture].
 */
internal fun externalGalleryFixture(): List<MutableClass> = listOf(
    handlerClass(),
    pluginClass(),
    fixtureClass("LX/5JN;", listOf(fixtureMethod(GALLERY_EDITOR, galleryEditorBody(), registers = 5, flags = STATIC))),
    fixtureClass("LX/0c8;", flags = INTERFACE),
    itemsClass(),
    resultEventClass(),
)

private fun Method.code() = implementation!!.instructions.toList()

/** Switch payloads sit at even addresses, so the nop padding one comes or goes as code is added above it. */
private fun List<Instruction>.unpadded() = filter { it.opcode != Opcode.NOP }

private val FINAL_CLASS = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value

/** Messenger 583's shape: the launcher abstract, one final subclass that runs its start and one that brings its own. */
private fun abstractLauncher(): Array<MutableClass> {
    val launcher = systemCameraFixture().single { it.type == "LX/5xZ;" }
    return arrayOf(
        MutableClass(ImmutableClassDef(launcher.type, AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, launcher.superclass,
            launcher.interfaces, null, emptySet(), launcher.fields, launcher.methods)),
        fixtureClass("LX/5xY;", superclass = "LX/5xZ;", flags = FINAL_CLASS),
        fixtureClass("LX/5xX;", listOf(fixtureMethod(CHAT_CAMERA_START.replace("LX/5xZ;", "LX/5xX;"), STUB_START, registers = 3)),
            superclass = "LX/5xZ;", flags = FINAL_CLASS),
    )
}

private fun galleryClasses(vararg replace: MutableClass): List<ClassDef> =
    (systemCameraFixture() + externalGalleryFixture()).filter { cls -> replace.none { it.type == cls.type } } + replace

/** The gallery branch asks the extension first, and every way out of the hook but the start's yes lands on the stock code. */
private fun assertGalleryHook(before: List<Instruction>, after: List<Instruction>, site: Int, handler: String, message: String) {
    assertEquals(before.unpadded().size + 16, after.unpadded().size, message)
    assertEquals(before.unpadded(), after.filterIndexed { i, _ -> i !in site until site + 16 }.unpadded(), message)
    val ask = after[site] as FiveRegisterInstruction
    assertEquals("$SETTINGS->chatGallery()Landroid/os/Bundle;", (ask as ReferenceInstruction).reference.toString(), message)
    assertEquals(0, ask.registerCount, message)
    val extras = (after[site + 1] as OneRegisterInstruction).registerA
    val start = after[site + 12] as FiveRegisterInstruction
    assertEquals(Opcode.INVOKE_VIRTUAL, after[site + 12].opcode, message)
    assertEquals(extras, start.registerD, message)
    assertEquals(galleryRoute!!.start, (start as ReferenceInstruction).reference.toString(), message)
    assertEquals(galleryRoute!!.handlers.single { it.id == handler }.provider, (after[site + 4] as ReferenceInstruction).reference.toString(), message)
    assertEquals(Opcode.RETURN_VOID, after[site + 15].opcode, message)
    val exits = (site until site + 15).filter { after[it].opcode == Opcode.IF_EQZ }
    assertEquals(4, exits.size, message)
    for (exit in exits) assertEquals(site + 16, after.branchTarget(exit), message)
    assertEquals(before[site], after[site + 16], message)
}

/** The result reader hands its request code, result code and intent to the extension before it reads any of them. */
private fun assertReaderHook(reader: MutableMethod, message: String) {
    val before = reader.code()
    reader.injectExternalGallery()
    val after = reader.code()
    assertEquals(before.unpadded().size + 1, after.unpadded().size, message)
    assertEquals(before.unpadded(), after.drop(1).unpadded(), message)
    assertEquals(Opcode.INVOKE_STATIC_RANGE, after[0].opcode, message)
    val ask = after[0] as RegisterRangeInstruction
    assertEquals(reader.implementation!!.registerCount - 3, ask.startRegister, message)
    assertEquals(3, ask.registerCount, message)
    assertEquals("$SETTINGS->externalMediaResult(IILandroid/content/Intent;)V", (ask as ReferenceInstruction).reference.toString(), message)
}

/**
 * The photo result handler hands the chat's thread and the event's intent to the extension before anything in it runs,
 * and only its yes skips the stock code.
 */
private fun assertItemsHook(items: MutableMethod, message: String) {
    val types = items.parameterTypes.map { it.toString() }
    assertTrue(types.none { it == "J" || it == "D" }, message)
    val first = items.implementation!!.registerCount - types.size
    val before = items.code()
    items.injectExternalGallery()
    val after = items.code()
    assertEquals(before.unpadded(), after.drop(5).unpadded(), message)
    assertEquals(Opcode.IGET_OBJECT, after[0].opcode, message)
    val read = after[0] as TwoRegisterInstruction
    assertEquals(listOf(0, first + types.indexOf(ACTIVITY_RESULT_EVENT)), listOf(read.registerA, read.registerB), message)
    assertEquals(galleryRoute!!.itemsIntent, (after[0] as ReferenceInstruction).reference.toString(), message)
    assertEquals(Opcode.INVOKE_STATIC, after[1].opcode, message)
    val ask = after[1] as FiveRegisterInstruction
    assertEquals("$SETTINGS->galleryItems(Ljava/lang/Object;Landroid/content/Intent;)Z", (ask as ReferenceInstruction).reference.toString(), message)
    assertEquals(listOf(first + types.indexOf(THREAD_KEY_TYPE), 0), listOf(ask.registerC, ask.registerD).take(ask.registerCount), message)
    assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), after.slice(2..4).map { it.opcode }, message)
    assertEquals(0, (after[3] as OneRegisterInstruction).registerA, message)
    assertEquals(5, after.branchTarget(3), message)
    assertEquals(before[0], after[5], message)
}

/** The camera and gallery switches both hook the launcher's start. Either order leaves one swap in it. */
private fun assertSharedStart(classes: List<ClassDef>, message: String) {
    for (cameraFirst in listOf(true, false)) {
        val camera = findSystemCamera(classes).associateBy { it.hookId() }
        val gallery = findExternalGallery(classes)
        val route = galleryRoute!!
        val start = MutableMethod(gallery.single { it.hookId() == route.start })
        val before = start.code()
        val site = start.chatCameraLaunchSite()
        val cameraStart = mapOf(SYSTEM_CAMERA to listOf(start))
        val galleryStart = mapOf(EXTERNAL_GALLERY to listOf(start))
        assertTrue(route.start in camera, message)
        if (cameraFirst) {
            injectControl(SYSTEM_CAMERA, cameraStart)
            injectControl(EXTERNAL_GALLERY, galleryStart)
        } else {
            injectControl(EXTERNAL_GALLERY, galleryStart)
            injectControl(SYSTEM_CAMERA, cameraStart)
        }
        val after = start.code()
        assertEquals(before.size + 4, after.size, "$message camera first $cameraFirst")
        assertEquals(1, after.count { (it as? ReferenceInstruction)?.reference?.toString() == "$SETTINGS->chatCamera(Landroid/content/Intent;)Landroid/content/Intent;" },
            "$message camera first $cameraFirst")
        assertEquals(before[site], after[site + 4], "$message camera first $cameraFirst")
    }
}

class ExternalGalleryTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        galleryRoute = null
    }

    @Test fun theGalleryButtonHandsTheChatCameraLauncherAMarkedBundle() {
        val found = findExternalGallery(galleryClasses())
        assertEquals(setOf(GALLERY_HANDLER, GALLERY_PLUGIN, CHAT_CAMERA_START, COMPOSER_RESULT, GALLERY_ITEMS), found.map { it.hookId() }.toSet())
        assertEquals(GalleryRoute(listOf(GalleryHandler(GALLERY_PLUGIN, PLUGIN_PROVIDER, "LX/0c8;"), GalleryHandler(GALLERY_HANDLER, GALLERY_PROVIDER, "LX/0c8;")),
            "LX/5xZ;", CHAT_CAMERA_START, COMPOSER_RESULT, GALLERY_ITEMS, ITEMS_INTENT), galleryRoute)
        validateControls(mapOf(EXTERNAL_GALLERY to found), setOf(EXTERNAL_GALLERY))
        // Right after the gallery event's cast, with the first three locals every way on from there writes before it
        // reads. The plugin's throw reads v2.
        for ((id, expected) in listOf(GALLERY_HANDLER to listOf(14, 1, 2, 3), GALLERY_PLUGIN to listOf(6, 1, 3, 4))) {
            val handler = found.single { it.hookId() == id } as MutableMethod
            val before = handler.code()
            val site = handler.gallerySite()
            assertEquals(expected, listOf(site.at, site.extras, site.launcher, site.started), id)
            injectControl(EXTERNAL_GALLERY, mapOf(EXTERNAL_GALLERY to listOf(handler)))
            assertGalleryHook(before, handler.code(), site.at, id, id)
        }
        assertReaderHook(MutableMethod(found.single { it.hookId() == COMPOSER_RESULT }), COMPOSER_RESULT)
        assertItemsHook(MutableMethod(found.single { it.hookId() == GALLERY_ITEMS }), GALLERY_ITEMS)
    }

    @Test fun aProviderMovedIntoTheEditorsRangeStillOpensTheRoute() {
        // 585 reads the provider into one register and moves it, with the event, into a range call to the editor.
        val ranged = GALLERY_HANDLER_BODY.replace("invoke-static {p1, v1}, $GALLERY_EDITOR",
            "move-object/from16 v3, p1\nmove-object v4, v1\ninvoke-static/range {v3 .. v4}, $GALLERY_EDITOR")
        val found = mirroredControls(galleryClasses(handlerClass(ranged))).getValue(EXTERNAL_GALLERY)
        assertEquals(setOf(GALLERY_HANDLER, GALLERY_PLUGIN, CHAT_CAMERA_START, COMPOSER_RESULT, GALLERY_ITEMS), found.map { it.hookId() }.toSet())
        assertEquals(GalleryHandler(GALLERY_HANDLER, GALLERY_PROVIDER, "LX/0c8;"), galleryRoute!!.handlers.single { it.id == GALLERY_HANDLER })
        val handler = MutableMethod(found.single { it.hookId() == GALLERY_HANDLER })
        val before = handler.code()
        val site = handler.gallerySite()
        injectControl(EXTERNAL_GALLERY, mapOf(EXTERNAL_GALLERY to listOf(handler)))
        assertGalleryHook(before, handler.code(), site.at, GALLERY_HANDLER, "ranged")
        // A move from anything but the handler's own field read still proves nothing about what the provider holds.
        for ((case, body) in listOf("moved from a parameter" to ranged.replace("move-object v4, v1", "move-object/from16 v4, p2"),
            "moved from another field" to ranged.replace("iget-object v1, v0, $GALLERY_PROVIDER", "iget-object v1, v0, LX/6CD;->A0L:LX/0c8;"))) {
            assertTrue(mirroredControls(galleryClasses(handlerClass(body))).getValue(EXTERNAL_GALLERY).isEmpty(), case)
            assertEquals(null, galleryRoute, case)
        }
    }

    @Test fun aPhotoHandlerTheHookCantReachRefusesBeforeMutation() {
        // No local for the intent, or the thread past v15 where the hook's plain invoke can't reach it. CompatReport has to
        // refuse both as well, or it would pass a build the patch then stops on.
        val threadLast = "LX/B5V;->A00($ACTIVITY_RESULT_EVENT${ANDROIDX_FRAGMENT}${FB_USER_SESSION}LX/6NI;$THREAD_KEY_TYPE)V"
        val eventFirst = GALLERY_ITEMS_BODY.replace("p3", "p0").lines().filterNot { it.startsWith("invoke-static") }.joinToString("\n")
        for ((id, cls) in listOf(GALLERY_ITEMS to itemsClass(registers = 5), threadLast to itemsClass(eventFirst, threadLast, registers = 20))) {
            val found = mirroredControls(galleryClasses(cls)).getValue(EXTERNAL_GALLERY)
            assertEquals(id, galleryRoute!!.items, id)
            val items = MutableMethod(found.single { it.hookId() == id })
            assertFailsWith<PatchException> { items.validateHook(EXTERNAL_GALLERY) }
            val before = items.code()
            val refused = assertFailsWith<PatchException> { items.injectExternalGallery() }
            assertTrue("photo result handler's registers" in refused.message.orEmpty(), "$id ${refused.message}")
            assertEquals(before, items.code(), id)
        }
    }

    @Test fun anAbstractLauncherHandsTheBundleOnlyToTheSubclassThatRunsItsStart() {
        val found = findExternalGallery(galleryClasses(*abstractLauncher()))
        assertEquals(setOf(GALLERY_HANDLER, GALLERY_PLUGIN, CHAT_CAMERA_START, COMPOSER_RESULT, GALLERY_ITEMS), found.map { it.hookId() }.toSet())
        assertEquals("LX/5xY;", galleryRoute!!.launcher)
        val handler = found.single { it.hookId() == GALLERY_HANDLER } as MutableMethod
        val before = handler.code()
        val site = handler.gallerySite()
        handler.injectExternalGallery()
        val after = handler.code()
        assertGalleryHook(before, after, site.at, GALLERY_HANDLER, "abstract launcher")
        // A launcher of the subclass with its own start isn't one of these, so it gets Messenger's gallery.
        assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.CHECK_CAST), listOf(after[site.at + 8].opcode, after[site.at + 10].opcode))
        for (at in listOf(site.at + 8, site.at + 10)) assertEquals("LX/5xY;", (after[at] as ReferenceInstruction).reference.toString())
        // 584's two plain subclasses both inherit the start, so every object runs it and the abstract launcher is the target.
        val twoPlain = abstractLauncher().dropLast(1) + fixtureClass("LX/5xW;", superclass = "LX/5xZ;", flags = FINAL_CLASS)
        assertEquals(setOf(GALLERY_HANDLER, GALLERY_PLUGIN, CHAT_CAMERA_START, COMPOSER_RESULT, GALLERY_ITEMS),
            findExternalGallery(galleryClasses(*twoPlain.toTypedArray())).map { it.hookId() }.toSet())
        assertEquals("LX/5xZ;", galleryRoute!!.launcher)
        // Only subclasses that bring their own start leave no one class to check for.
        val onlyOwn = abstractLauncher().filter { it.type != "LX/5xY;" }
        assertTrue(findExternalGallery(galleryClasses(*onlyOwn.toTypedArray())).isEmpty(), "only its own start")
        assertEquals(null, galleryRoute, "only its own start")
    }

    @Test fun theCameraAndGallerySwitchesShareTheLauncherStartInEitherOrder() {
        assertSharedStart(galleryClasses(), "synthetic")
    }

    @Test fun aGalleryBranchTheHookCantEnterSafelyRefusesBeforeMutation() {
        findExternalGallery(galleryClasses())
        val jumped = GALLERY_HANDLER_BODY.replace("if-eqz v1, :gallery", "if-eqz v1, :entry")
            .replace("check-cast p1, $ACTIVATE_GALLERY\n", "check-cast p1, $ACTIVATE_GALLERY\n:entry\n")
        val selfWritten = GALLERY_HANDLER_BODY.replace(":other\nreturn-void", ":other\nconst/4 p0, 0x0\nreturn-void")
        // A switch's cases aren't followed.
        val switched = GALLERY_HANDLER_BODY.replace("const-class v1, LX/5gW;", "packed-switch v4, :cases\nconst-class v1, LX/5gW;") +
            "\n:cases\n.packed-switch 0x0\n    :other\n.end packed-switch"
        val looped = GALLERY_HANDLER_BODY.replace("const-class v1, LX/5gW;", ":again\nif-eqz v4, :again\nconst-class v1, LX/5gW;")
            .replace("invoke-static {v4, p1, v1}, LX/5JN;->A01(LX/5WP;${ACTIVATE_GALLERY}Ljava/lang/Class;)V\nreturn-void",
                "invoke-static {v4, p1, v1}, LX/5JN;->A01(LX/5WP;${ACTIVATE_GALLERY}Ljava/lang/Class;)V\ngoto :again")
        for ((body, registers) in listOf(jumped to 12, selfWritten to 12, switched to 12, GALLERY_HANDLER_BODY to 5)) {
            assertTrue(body != GALLERY_HANDLER_BODY || registers != 12)
            val handler = fixtureMethod(GALLERY_HANDLER, body, registers = registers)
            assertTrue(handler.isGalleryHandler())
            val before = handler.code()
            assertFailsWith<PatchException> { handler.injectExternalGallery() }
            assertEquals(before, handler.code())
        }
        // A branch inside the gallery branch is fine, a loop too, as long as no way on reads what the hook writes first.
        val branched = GALLERY_HANDLER_BODY.replace("const-class v1, LX/5gW;", "if-eqz v4, :late\nconst-class v1, LX/5gW;")
            .replace(":other\nreturn-void", ":other\nreturn-void\n:late\ninvoke-static {v1, v2}, LX/5JN;->A0D(Ljava/lang/Object;Ljava/lang/Object;)V\nreturn-void")
        for ((body, expected) in listOf(branched to listOf(14, 3, 4, 5), looped to listOf(14, 1, 2, 3))) {
            val handler = fixtureMethod(GALLERY_HANDLER, body, registers = 12)
            val site = handler.gallerySite()
            assertEquals(expected, listOf(site.at, site.extras, site.launcher, site.started))
        }
    }

    @Test fun onlyTheOneWayEditReachesTheLauncherOpensTheRoute() {
        assertTrue(findExternalGallery(galleryClasses()).isNotEmpty())
        // The provider read from some other object's field could hand over anything.
        val otherField = handlerClass(GALLERY_HANDLER_BODY.replace("iget-object v1, v0, $GALLERY_PROVIDER", "iget-object v1, v0, LX/6CD;->A0L:LX/0c8;"))
        // An Edit helper that never starts the launcher it takes doesn't prove what the provider holds.
        val otherStart = fixtureClass("LX/5JN;", listOf(fixtureMethod(GALLERY_EDITOR,
            galleryEditorBody("LX/6iH;->C0d(Landroid/os/Bundle;LX/6NI;)Z"), registers = 5, flags = STATIC)))
        // A second handler of either kind leaves the chat's one unknown.
        val twin = fixtureClass("LX/6CD;", listOf(fixtureMethod(GALLERY_HANDLER.replace("LX/6CC;", "LX/6CD;"),
            GALLERY_HANDLER_BODY.replace("LX/6CC;", "LX/6CD;"), registers = 12)))
        val pluginTwin = pluginClass("LX/5SD;")
        // One handler that can't route would leave its gallery button on Messenger's gallery with the switch on.
        val pluginOtherField = pluginClass(body = GALLERY_PLUGIN_BODY.replace("iget-object v2, v0, $PLUGIN_PROVIDER", "iget-object v2, v0, LX/6CD;->A0M:LX/0c8;"))
        // A way into the stretch between the provider's read and Edit's call could bring anything.
        val pluginJumpedIn = pluginClass(body = GALLERY_PLUGIN_BODY.replace("if-eqz v1, :other", "if-eqz v1, :cached"))
        // A subclass, or one further down, that overrides the start would run instead of the hooked one.
        val overriding = fixtureClass("LX/5xY;", listOf(fixtureMethod(CHAT_CAMERA_START.replace("LX/5xZ;", "LX/5xY;"), STUB_START, registers = 3)),
            superclass = "LX/5xZ;")
        val middle = fixtureClass("LX/5xY;", superclass = "LX/5xZ;")
        val below = fixtureClass("LX/5xX;", listOf(fixtureMethod(CHAT_CAMERA_START.replace("LX/5xZ;", "LX/5xX;"), STUB_START, registers = 3)),
            superclass = "LX/5xY;")
        // A provider that isn't an interface can't take the hook's invoke-interface.
        val notInterface = fixtureClass("LX/0c8;")
        // A static result reader has no p1 to p3 the hook can hand over as they are.
        val staticReader = fixtureClass("LX/7Rm;", listOf(fixtureMethod(COMPOSER_RESULT, composerResultBody(), flags = STATIC)))
        // The photo handler has to be the one static method handed a thread and a result event that checks for the
        // request and reads one intent field the event class has, from an event register it never overwrites.
        val itemsTwin = itemsClass(GALLERY_ITEMS_BODY.replace("LX/B5V;", "LX/B5W;"), GALLERY_ITEMS.replace("LX/B5V;", "LX/B5W;"))
        val itemsOverwritten = itemsClass(GALLERY_ITEMS_BODY.replace(":other\nreturn-void", ":other\nconst/4 p3, 0x0\nreturn-void"))
        // Two intent fields the event class really has, read ahead of the usual one, so only the one-field rule refuses.
        val itemsTwoIntents = itemsClass(GALLERY_ITEMS_BODY.replace("iget-object v2, p3, $ITEMS_INTENT",
            "iget-object v3, p3, $ACTIVITY_RESULT_EVENT->A03:Landroid/content/Intent;\niget-object v2, p3, $ITEMS_INTENT"))
        val itemsNoRequest = itemsClass(GALLERY_ITEMS_BODY.replace("const/16 v1, $EXTERNAL_MEDIA_REQUEST", "const/16 v1, 0x457"))
        // The same handler as an instance method, its parameters one register later, so only the static rule refuses.
        val itemsNotStatic = itemsClass(GALLERY_ITEMS_BODY.replace("p3", "p4").replace("p2", "p3").replace("p0", "p1"),
            flags = AccessFlags.PUBLIC.value, registers = 14)
        val noThread = GALLERY_ITEMS.replace(THREAD_KEY_TYPE, "Ljava/lang/Object;")
        val itemsNoThread = itemsClass(GALLERY_ITEMS_BODY.replace("LX/B5V;->A01(${ANDROIDX_FRAGMENT}$THREAD_KEY_TYPE", "LX/B5V;->A01(${ANDROIDX_FRAGMENT}Ljava/lang/Object;"), noThread)
        for ((case, classes) in listOf("other field" to galleryClasses(otherField), "other start" to galleryClasses(otherStart),
            "twin" to galleryClasses() + twin, "plugin twin" to galleryClasses() + pluginTwin,
            "plugin other field" to galleryClasses(pluginOtherField), "plugin jumped in" to galleryClasses(pluginJumpedIn),
            "override" to galleryClasses() + overriding,
            "override below" to galleryClasses() + middle + below, "not an interface" to galleryClasses(notInterface),
            "static reader" to galleryClasses(staticReader), "items twin" to galleryClasses() + itemsTwin,
            "items event overwritten" to galleryClasses(itemsOverwritten), "items two intents" to galleryClasses(itemsTwoIntents, resultEventClass(secondIntent = "A03")),
            "items no request" to galleryClasses(itemsNoRequest), "items not static" to galleryClasses(itemsNotStatic),
            "items no thread" to galleryClasses(itemsNoThread), "items no handler" to galleryClasses().filterNot { it.type == "LX/B5V;" },
            "items field missing" to galleryClasses(resultEventClass(intentName = "A03")),
            "items field static" to galleryClasses(resultEventClass(intentFlags = STATIC)),
            "items no event class" to galleryClasses().filterNot { it.type == ACTIVITY_RESULT_EVENT })) {
            assertTrue(mirroredControls(classes).getValue(EXTERNAL_GALLERY).isEmpty(), case)
            assertEquals(null, galleryRoute, case)
        }
        // And without the chat camera's launcher there's nothing to hand the gallery button to.
        assertTrue(findExternalGallery(galleryClasses().filterNot { it.type == "LX/5qL;" }).isEmpty())
    }

    @Test fun theManifestDeclaresThePickScreenAndAsksToSeeGalleryAppsOnce() {
        val builder = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        for (manifest in listOf("<manifest package=\"com.facebook.orca\"><application/></manifest>",
            "<manifest package=\"com.facebook.orca\"><queries><package android:name=\"com.whatsapp\"/></queries><application/></manifest>")) {
            val document = builder.parse(manifest.byteInputStream())
            document.addExternalGallery()
            // Messenger's launcher refuses a screen outside its own package, so the pick screen has to be one of its own.
            val screens = (document.getElementsByTagName("application").item(0) as Element).getElementsByTagName("activity")
            assertEquals(1, screens.length, manifest)
            val screen = screens.item(0) as Element
            assertEquals(GALLERY_ACTIVITY, screen.getAttribute("android:name"), manifest)
            assertEquals("false", screen.getAttribute("android:exported"), manifest)
            assertEquals("@android:style/Theme.Translucent.NoTitleBar", screen.getAttribute("android:theme"), manifest)
            assertEquals(1, document.getElementsByTagName("queries").length, manifest)
            val intents = (document.getElementsByTagName("queries").item(0) as Element).getElementsByTagName("intent")
            assertEquals(2, intents.length, manifest)
            val types = (0 until intents.length).map { i ->
                val intent = intents.item(i) as Element
                assertEquals("android.intent.action.PICK", (intent.getElementsByTagName("action").item(0) as Element).getAttribute("android:name"))
                (intent.getElementsByTagName("data").item(0) as Element).getAttribute("android:mimeType")
            }
            assertEquals(listOf("image/*", "video/*"), types, manifest)
        }
    }

    @Test fun everySupportedBuildHooksItsChatGalleryButton() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val found = findExternalGallery(classes)
            assertEquals(activeProfile.hooks.getValue(EXTERNAL_GALLERY), found.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(EXTERNAL_GALLERY to found), setOf(EXTERNAL_GALLERY))
            // The composer plugin a chat's gallery button goes through, the older by-name handler, the launcher's start,
            // the result reader and the photo result handler.
            assertEquals(5, found.size, code)
            assertEquals(listOf(1, 1), galleryRoute!!.handlers.partition { COMPOSER_EVENT in it.id }.toList().map { it.size }, code)
            for (routed in galleryRoute!!.handlers) {
                val handler = MutableMethod(found.single { it.hookId() == routed.id })
                val before = handler.code()
                val site = handler.gallerySite()
                handler.injectExternalGallery()
                assertGalleryHook(before, handler.code(), site.at, routed.id, "$code ${routed.id}")
            }
            // 585's launcher is abstract, as 583's was: one subclass inherits the hooked start and the other brings its own,
            // so the hook checks for the subclass that runs it.
            val start = galleryRoute!!.start
            val base = start.substringBefore("->")
            fun ClassDef.declaresStart() = methods.any { method -> method.hookId().substringAfter("->") == start.substringAfter("->") }
            val subclasses = classes.filter { it.superclass == base }
            assertEquals(2, subclasses.size, code)
            assertEquals(listOf(galleryRoute!!.launcher), subclasses.filterNot { it.declaresStart() }.map { it.type }, code)
            assertTrue(classes.none { it.superclass == galleryRoute!!.launcher }, code)
            assertReaderHook(MutableMethod(found.single { it.hookId() == galleryRoute!!.reader }), code)
            assertEquals(ITEMS_INTENT, galleryRoute!!.itemsIntent, code)
            assertItemsHook(MutableMethod(found.single { it.hookId() == galleryRoute!!.items }), code)
            assertSharedStart(classes, code)
        }
    }
}
