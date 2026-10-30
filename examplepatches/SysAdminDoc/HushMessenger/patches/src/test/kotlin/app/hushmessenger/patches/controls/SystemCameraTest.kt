package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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

private const val LAUNCH = "LX/7Jp;->DXV($MONTAGE_PARAMS$NAVIGATION_TRIGGER)V"

/** The camera listener, with the registers every supported build uses. */
private val CAMERA_LAUNCH_BODY = """
    iget-object v0, p0, LX/7Jp;->A03:LX/9em;
    invoke-interface {v0}, LX/9em;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0, p1, p2}, $MONTAGE_ACTIVITY->A1E(Landroid/content/Context;$MONTAGE_PARAMS$NAVIGATION_TRIGGER)Landroid/content/Intent;
    move-result-object v3
    iget-object v0, p0, LX/7Jp;->A00:LX/17Z;
    invoke-static {v0}, LX/6dD;->A0X(LX/17Z;)LX/08g;
    move-result-object v2
    iget-object v0, p0, LX/7Jp;->A01:LX/0cP;
    invoke-interface {v0}, LX/0cP;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, $ANDROIDX_FRAGMENT
    const/16 v0, $CAMERA_REQUEST
    invoke-virtual {v2, v3, v1, v0}, LX/0sC;->A0C(Landroid/content/Intent;${ANDROIDX_FRAGMENT}I)Z
    return-void
""".trimIndent()

internal const val CHAT_CAMERA_FACTORY = "LX/5qL;->A00(Landroid/content/Context;Landroid/os/Bundle;${ANDROIDX_FRAGMENT}" +
    "Lcom/facebook/auth/usersession/FbUserSession;Lcom/facebook/messaging/model/threadkey/ThreadKey;LX/HJ6;)LX/6iH;"
internal const val CHAT_CAMERA_START = "LX/5xZ;->BxF(Landroid/os/Bundle;LX/6NI;)Z"
internal const val CHAT_CAPTURE = "LX/99A;->BkO(Lcom/facebook/xapp/messaging/capability/vector/Capabilities;LX/AZV;LX/6NI;" +
    "Lcom/facebook/xapp/messaging/composer/event/ComposerEvent;)V"
/** Messenger 584's inlined capture handler, after the dispatcher's own branch on the event type. Parameters start at v4. */
private val CHAT_CAPTURE_BODY = """
    instance-of v0, p4, $ACTIVATE_CAMERA
    if-eqz v0, :other
    iget-object v3, p0, LX/99A;->A08:LX/6iH;
    check-cast p4, $ACTIVATE_CAMERA
    invoke-static {}, LX/001;->A06()Landroid/os/Bundle;
    move-result-object v1
    iget-boolean v0, p4, $ACTIVATE_CAMERA->A00:Z
    if-eqz v0, :launch
    const-string v0, "camera_force_back_facing"
    const/4 v2, 0x1
    invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V
    :launch
    invoke-interface {v3, v1, p3}, LX/6iH;->C0w(Landroid/os/Bundle;LX/6NI;)Z
    return-void
    :other
    return-void
""".trimIndent()
internal const val THIRD_PARTY_URI_CHECK = "LX/0gQ;->A00(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/Boolean;"

/** The check on where a picked photo comes from, cut down to its strings and its answer. Parameters start at v6. */
private val THIRD_PARTY_URI_BODY = """
    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;
    move-result-object v3
    const-string v1, "content"
    const-string v0, "Unable to get providerInfo for authority "
    const/4 v0, 0x0
    xor-int/lit8 v0, v0, 0x1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v0
    return-object v0
""".trimIndent()

internal const val INTERNAL_FILE_OPEN = "LX/0FQ;->A01(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/res/AssetFileDescriptor;"

/** The open that refuses a file Messenger owns, the way every supported build writes it. Parameters start at v3. */
private val INTERNAL_FILE_OPEN_BODY = """
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v1
    const-string v0, "r"
    invoke-virtual {v1, p1, v0}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    move-result-object v1
    if-eqz v1, :missing
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;
    move-result-object v0
    invoke-static {v0}, LX/0bW;->A03(Landroid/os/ParcelFileDescriptor;)Z
    move-result v0
    if-nez v0, :refuse
    return-object v1
    :refuse
    const-string v0, "Attempted to retrieve internal file."
    new-instance v1, Ljava/lang/SecurityException;
    invoke-direct {v1, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V
    throw v1
    :missing
    const-string v0, "Failed to open descriptor for: "
    new-instance v1, Ljava/io/IOException;
    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    throw v1
""".trimIndent()

/** The chat fragment's result reader, cut down to what discovery checks. */
internal fun composerResultBody(chatCamera: Boolean = true) = listOfNotNull(
    "const/16 v0, $CAMERA_REQUEST",
    "const/16 v0, $CHAT_CAMERA_REQUEST".takeIf { chatCamera },
    "const/16 v0, $EXTERNAL_MEDIA_REQUEST",
    "const-string v0, \"$EXTERNAL_MEDIA_NULL_DATA\"",
    "const-string v0, \"$CAMERA_NULL_DATA\"",
    "return-void",
).joinToString("\n")

/** The chat camera's launcher factory, with its inline camera branch left out. Parameters start at v2. */
private fun chatCameraFactoryBody(trigger: String = "trigger2") = """
    const-string v0, "$trigger"
    const-string v0, "fragment_params"
    new-instance v1, LX/4xQ;
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V
    new-instance v0, Landroid/os/Bundle;
    invoke-direct {v0, v3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V
    iput-object v0, v1, LX/4xQ;->A02:Landroid/os/Bundle;
    invoke-virtual {v1, v4}, LX/4xQ;->A01($ANDROIDX_FRAGMENT)V
    const/16 v0, $CHAT_CAMERA_REQUEST
    iput v0, v1, LX/4xQ;->A00:I
    const-class v0, $MONTAGE_ACTIVITY
    iput-object v0, v1, LX/4xQ;->A04:Ljava/lang/Class;
    invoke-virtual {v1, v5}, LX/4xQ;->A00(Lcom/facebook/auth/usersession/FbUserSession;)LX/5xZ;
    move-result-object v0
    return-object v0
""".trimIndent()

/** The launcher's start for a result, the way every supported build writes it. */
private val CHAT_CAMERA_START_BODY = """
    iget-object v0, p0, LX/5xZ;->A03:Ljava/lang/ref/WeakReference;
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, $ANDROIDX_FRAGMENT
    const/4 v3, 0x0
    if-eqz v2, :invalid
    invoke-virtual {v2}, $ANDROIDX_FRAGMENT->getContext()Landroid/content/Context;
    move-result-object v1
    iget-object v0, p0, LX/5xZ;->A02:Ljava/lang/Class;
    if-nez v1, :start
    :invalid
    const-string v1, "ActivityLauncher"
    const-string v0, "Unable to launch %s: invalid context"
    return v3
    :start
    invoke-static {v1, v0}, LX/17Q;->A0D(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;
    move-result-object v1
    iget-object v0, p0, LX/5xZ;->A01:Landroid/os/Bundle;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;
    invoke-virtual {v1, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;
    iget v0, p0, LX/5xZ;->A00:I
    invoke-static {v1, v2, v0}, LX/0tF;->A0C(Landroid/content/Intent;${ANDROIDX_FRAGMENT}I)Z
    move-result v3
    return v3
""".trimIndent()

private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

internal fun systemCameraFixture(chatCamera: Boolean = true): List<MutableClass> = listOf(
    fixtureClass("LX/7Jp;", listOf(fixtureMethod(LAUNCH, CAMERA_LAUNCH_BODY, registers = 7))),
    fixtureClass("LX/7Rm;", listOf(fixtureMethod("LX/7Rm;->onActivityResult(IILandroid/content/Intent;)V", composerResultBody(chatCamera)))),
    fixtureClass("LX/5qL;", listOf(fixtureMethod(CHAT_CAMERA_FACTORY, chatCameraFactoryBody(), flags = STATIC))),
    fixtureClass("LX/5xZ;", listOf(fixtureMethod(CHAT_CAMERA_START, CHAT_CAMERA_START_BODY, registers = 7)), interfaces = listOf("LX/6iH;")),
    fixtureClass("LX/99A;", listOf(fixtureMethod(CHAT_CAPTURE, CHAT_CAPTURE_BODY, registers = 9))),
    fixtureClass("LX/0gQ;", listOf(fixtureMethod(THIRD_PARTY_URI_CHECK, THIRD_PARTY_URI_BODY, registers = 9))),
    fixtureClass("LX/0FQ;", listOf(fixtureMethod(INTERNAL_FILE_OPEN, INTERNAL_FILE_OPEN_BODY, registers = 5, flags = STATIC))),
    // A story reply's launcher factory: same camera screen and request code, but not built from the chat's extras.
    fixtureClass("LX/ENq;", listOf(fixtureMethod("LX/ENq;->A00(Landroid/content/Context;Landroid/os/Bundle;)LX/6iH;",
        chatCameraFactoryBody("montage_camera_reply").replace("const-string v0, \"fragment_params\"\n", ""), flags = STATIC))),
)

private fun Method.code() = implementation!!.instructions.toList()

/** The intent and its request code go through the two helpers right before the launch, and nothing stock moves. */
private fun assertCameraHook(before: List<Instruction>, after: List<Instruction>, site: Int, message: String, chat: Boolean = false) {
    val launch = before[site] as FiveRegisterInstruction
    val intent = if (chat) launch.registerC else launch.registerD
    val request = if (chat) launch.registerE else launch.registerF
    assertEquals(before.size + 4, after.size, message)
    assertEquals(before, after.filterIndexed { i, _ -> i !in site until site + 4 }, message)
    val swap = after[site] as FiveRegisterInstruction
    assertEquals(Opcode.INVOKE_STATIC, after[site].opcode, message)
    val helper = if (chat) "chatCamera" else "systemCamera"
    assertEquals("$SETTINGS->$helper(Landroid/content/Intent;)Landroid/content/Intent;", (swap as ReferenceInstruction).reference.toString(), message)
    assertEquals(listOf(1, intent), listOf(swap.registerCount, swap.registerC), message)
    assertEquals(Opcode.MOVE_RESULT_OBJECT, after[site + 1].opcode, message)
    assertEquals(intent, (after[site + 1] as OneRegisterInstruction).registerA, message)
    val code = after[site + 2] as FiveRegisterInstruction
    assertEquals("$SETTINGS->cameraRequestCode(Landroid/content/Intent;I)I", (code as ReferenceInstruction).reference.toString(), message)
    assertEquals(listOf(2, intent, request), listOf(code.registerCount, code.registerC, code.registerD), message)
    assertEquals(Opcode.MOVE_RESULT, after[site + 3].opcode, message)
    assertEquals(request, (after[site + 3] as OneRegisterInstruction).registerA, message)
    assertEquals(before[site], after[site + 4], message)
    assertEquals(if (chat) Opcode.RETURN else Opcode.RETURN_VOID, after.last().opcode, message)
}

/** The factory marks its copy of the camera screen's extras before storing it, and changes nothing else. */
private fun assertMarkHook(before: List<Instruction>, after: List<Instruction>, site: Int, message: String) {
    val extras = (before[site - 1] as FiveRegisterInstruction).registerC
    assertEquals(before.size + 1, after.size, message)
    assertEquals(before, after.filterIndexed { i, _ -> i != site }, message)
    val mark = after[site] as FiveRegisterInstruction
    assertEquals(Opcode.INVOKE_STATIC, after[site].opcode, message)
    assertEquals("$SETTINGS->markChatCamera(Landroid/os/Bundle;)V", (mark as ReferenceInstruction).reference.toString(), message)
    assertEquals(listOf(1, extras), listOf(mark.registerCount, mark.registerC), message)
    assertEquals(Opcode.IPUT_OBJECT, after[site + 1].opcode, message)
}

/** The capture screen's photo is answered with TRUE up front, and every other URI falls through to the stock check. */
private fun assertTrustHook(method: MutableMethod, before: List<Instruction>, message: String) {
    val after = method.code()
    assertEquals(before.size + 5, after.size, message)
    assertEquals(before, after.drop(5), message)
    val ask = after[0] as FiveRegisterInstruction
    assertEquals("$SETTINGS->trustCapturedPhoto(Landroid/net/Uri;)Z", (ask as ReferenceInstruction).reference.toString(), message)
    // The URI is the last parameter register.
    assertEquals(listOf(1, method.implementation!!.registerCount - 1), listOf(ask.registerCount, ask.registerC), message)
    assertEquals(Opcode.MOVE_RESULT, after[1].opcode, message)
    assertEquals(Opcode.IF_EQZ, after[2].opcode, message)
    assertTrue(5 in method.jumpTargets(), "$message: a URI that isn't the photo goes on to the stock check")
    assertEquals("Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;", (after[3] as ReferenceInstruction).reference.toString(), message)
    assertEquals(Opcode.RETURN_OBJECT, after[4].opcode, message)
}

/** The open's answer on whether Messenger owns the file goes past the extension right before its refusal. */
private fun assertOwnFileHook(method: MutableMethod, before: List<Instruction>, site: Int, message: String) {
    val after = method.code()
    val internal = (before[site] as OneRegisterInstruction).registerA
    assertEquals(before.size + 2, after.size, message)
    assertEquals(before, after.filterIndexed { i, _ -> i !in site until site + 2 }, message)
    val ask = after[site] as FiveRegisterInstruction
    assertEquals("$SETTINGS->internalFile(ZLandroid/net/Uri;)Z", (ask as ReferenceInstruction).reference.toString(), message)
    // The answer and the URI, which is the last parameter register.
    assertEquals(listOf(2, internal, method.implementation!!.registerCount - 1), listOf(ask.registerCount, ask.registerC, ask.registerD), message)
    assertEquals(Opcode.MOVE_RESULT, after[site + 1].opcode, message)
    assertEquals(internal, (after[site + 1] as OneRegisterInstruction).registerA, message)
    assertEquals(Opcode.IF_NEZ, after[site + 2].opcode, message)
}

/** Injects one found method and checks it the way its kind is hooked. */
private fun injectAndCheck(method: MutableMethod, message: String) {
    val before = method.code()
    val site = method.validateSystemCamera()
    val factory = method.isChatCameraFactory()
    val chat = method.isLauncherStart()
    val trust = method.isThirdPartyUriCheck()
    val ownFile = method.isInternalFileOpen()
    injectControl(SYSTEM_CAMERA, mapOf(SYSTEM_CAMERA to listOf(method)))
    when {
        method.isChatCapture() -> {
            val after = method.code()
            assertEquals(before, after.filterIndexed { i, _ -> i != site }, message)
            val mark = after[site] as FiveRegisterInstruction
            assertEquals("$SETTINGS->markChatCapture(Landroid/os/Bundle;)V", (mark as ReferenceInstruction).reference.toString(), message)
            assertEquals((before[site - 1] as OneRegisterInstruction).registerA, mark.registerC, message)
        }
        factory -> assertMarkHook(before, method.code(), site, message)
        trust -> assertTrustHook(method, before, message)
        ownFile -> assertOwnFileHook(method, before, site, message)
        else -> assertCameraHook(before, method.code(), site, message, chat)
    }
}

class SystemCameraTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun missingAmbiguousOrReusedCaptureExtrasRefuseBeforeMutation() {
        for (body in listOf(
            CHAT_CAPTURE_BODY.replace("move-result-object v1", "move-result-object v0"),
            CHAT_CAPTURE_BODY.replace("iget-boolean v0", "const/4 v1, 0x0\niget-boolean v0"),
            // A branch from before the extras that lands between them and the launch skips the mark.
            "if-eqz p0, :launch\n$CHAT_CAPTURE_BODY",
            // Two launches leave nothing to say which one is the capture.
            CHAT_CAPTURE_BODY.replace("return-void\n:other", "invoke-interface {v3, v1, p3}, LX/6iH;->C0w(Landroid/os/Bundle;LX/6NI;)Z\nreturn-void\n:other"),
        )) {
            val method = fixtureMethod(CHAT_CAPTURE, body, registers = 9)
            val before = method.code()
            assertFailsWith<PatchException> { method.injectSystemCamera() }
            assertEquals(before, method.code())
        }
        val missing = systemCameraFixture().filterNot { it.type == "LX/99A;" }
        assertFailsWith<PatchException> { validateControls(mapOf(SYSTEM_CAMERA to findSystemCamera(missing)), setOf(SYSTEM_CAMERA)) }
        val duplicate = systemCameraFixture() + fixtureClass("LX/99B;", listOf(fixtureMethod(
            CHAT_CAPTURE.replace("LX/99A;", "LX/99B;"), CHAT_CAPTURE_BODY, registers = 9)))
        assertFailsWith<PatchException> { validateControls(mapOf(SYSTEM_CAMERA to findSystemCamera(duplicate)), setOf(SYSTEM_CAMERA)) }
    }

    @Test fun theCameraLaunchSwapsItsIntentAndRequestCodeAndKeepsEveryStockInstruction() {
        val found = findSystemCamera(systemCameraFixture())
        validateControls(mapOf(SYSTEM_CAMERA to found), setOf(SYSTEM_CAMERA))
        assertEquals(setOf(LAUNCH, CHAT_CAMERA_FACTORY, CHAT_CAMERA_START, CHAT_CAPTURE, THIRD_PARTY_URI_CHECK, INTERNAL_FILE_OPEN), found.map { it.hookId() }.toSet())
        for (method in found) injectAndCheck(method as MutableMethod, method.hookId())
        assertEquals(13, (found.single { it.hookId() == LAUNCH } as MutableMethod).code()
            .indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString()?.contains("systemCamera") == true })
        // Without the chat fragment's reader for a picked photo there's nowhere to send the camera's photo.
        assertTrue(findSystemCamera(systemCameraFixture().filterNot { it.type == "LX/7Rm;" }).isEmpty())
    }

    @Test fun onlyAReaderOfTheChatCameraCodeBringsInTheChatCameraLauncher() {
        // A chat fragment that never reads 7376 can't take the photo back from that launcher, so only the listener counts.
        assertEquals(listOf(LAUNCH), findSystemCamera(systemCameraFixture(chatCamera = false)).map { it.hookId() })
        // A second chat camera factory leaves the launcher unresolved, so the hook set no longer matches the tested build.
        val twice = systemCameraFixture() + fixtureClass("LX/5qM;", listOf(fixtureMethod(CHAT_CAMERA_FACTORY.replace("LX/5qL;", "LX/5qM;"),
            chatCameraFactoryBody(), flags = STATIC)))
        val found = findSystemCamera(twice).map { it.hookId() }
        assertTrue(CHAT_CAMERA_START !in found)
        assertFailsWith<PatchException> { validateControls(mapOf(SYSTEM_CAMERA to findSystemCamera(twice)), setOf(SYSTEM_CAMERA)) }
    }

    // 585's dispatchers cast the event and hand it to one static helper, which builds the extras and makes the launch.
    @Test fun theStaticCaptureHelperIsMarkedAndTheDispatchersThatCallItAreNot() {
        val helperId = "LX/5fb;->A01(${ACTIVATE_CAMERA}LX/6NI;LX/6iH;)V"
        val helperBody = """
            invoke-static {}, LX/001;->A06()Landroid/os/Bundle;
            move-result-object v1
            iget-boolean v0, p0, $ACTIVATE_CAMERA->A00:Z
            if-eqz v0, :launch
            const-string v0, "camera_force_back_facing"
            const/4 v2, 0x1
            invoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V
            :launch
            invoke-interface {p2, v1, p1}, LX/6iH;->C0w(Landroid/os/Bundle;LX/6NI;)Z
            return-void
        """.trimIndent()
        val helper = fixtureMethod(helperId, helperBody, registers = 7, flags = STATIC)
        assertEquals("LX/6iH;", helper.captureLauncherType())
        assertEquals(2, helper.validateSystemCamera())
        injectAndCheck(helper, helperId)
        // The dispatcher casts the event but never launches, so it isn't a capture.
        val dispatcher = fixtureMethod(CHAT_CAPTURE, CHAT_CAPTURE_BODY.replace(
            "invoke-static {}, LX/001;->A06()Landroid/os/Bundle;\nmove-result-object v1\niget-boolean v0, p4, $ACTIVATE_CAMERA->A00:Z\nif-eqz v0, :launch\n" +
                "const-string v0, \"camera_force_back_facing\"\nconst/4 v2, 0x1\ninvoke-virtual {v1, v0, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V\n" +
                ":launch\ninvoke-interface {v3, v1, p3}, LX/6iH;->C0w(Landroid/os/Bundle;LX/6NI;)Z",
            "invoke-static {p4, p3, v3}, $helperId"), registers = 9)
        assertTrue(dispatcher.code().none { (it as? ReferenceInstruction)?.reference?.toString()?.contains("C0w") == true })
        assertEquals(null, dispatcher.captureLauncherType())
        // A static method that takes the event anywhere but first is no capture helper.
        val moved = fixtureMethod("LX/5fb;->A02(LX/6NI;${ACTIVATE_CAMERA}LX/6iH;)V", helperBody.replace("p0, $ACTIVATE_CAMERA", "p1, $ACTIVATE_CAMERA")
            .replace("{p2, v1, p1}", "{p2, v1, p0}"), registers = 7, flags = STATIC)
        assertEquals(null, moved.captureLauncherType())
    }

    @Test fun aBranchOntoTheLauncherStartStopsThePatch() {
        val looped = CHAT_CAMERA_START_BODY
            .replace("iget v0, p0, LX/5xZ;->A00:I\n", "iget v0, p0, LX/5xZ;->A00:I\n:again\n")
            .replace("move-result v3\nreturn v3", "move-result v3\nif-eqz v3, :again\nreturn v3")
        assertTrue(":again" in looped && "if-eqz v3, :again" in looped)
        val start = fixtureMethod(CHAT_CAMERA_START, looped, registers = 7)
        assertTrue(start.isLauncherStart())
        assertFailsWith<PatchException> { start.validateSystemCamera() }
    }

    @Test fun aUriCheckWithItsUriPastV15StopsThePatch() {
        val wide = fixtureMethod(THIRD_PARTY_URI_CHECK, THIRD_PARTY_URI_BODY, registers = 20)
        assertTrue(wide.isThirdPartyUriCheck())
        assertFailsWith<PatchException> { wide.validateSystemCamera() }
    }

    @Test fun theOwnFileHookNeedsTheRefusalRightAfterItsAnswer() {
        fun open(body: String) = fixtureMethod(INTERNAL_FILE_OPEN, body, registers = 5, flags = STATIC).also { assertTrue(it.isInternalFileOpen()) }
        assertEquals(10, open(INTERNAL_FILE_OPEN_BODY).validateSystemCamera())
        // A refusal that reads the answer the other way round would let every file through.
        val flipped = INTERNAL_FILE_OPEN_BODY.replace("if-nez v0, :refuse", "if-eqz v0, :refuse")
        // A branch onto the refusal would skip the hook.
        val jumped = INTERNAL_FILE_OPEN_BODY.replace("if-eqz v1, :missing", "if-eqz v1, :decide")
            .replace("move-result v0\nif-nez", "move-result v0\n:decide\nif-nez")
        // A URI register written before the refusal no longer holds the photo's URI.
        val reused = INTERNAL_FILE_OPEN_BODY.replace("invoke-static {v0}, LX/0bW", "move-object v4, v0\ninvoke-static {v0}, LX/0bW")
        for (body in listOf(flipped, jumped, reused)) {
            assertTrue(body != INTERNAL_FILE_OPEN_BODY)
            assertFailsWith<PatchException> { open(body).validateSystemCamera() }
        }
    }

    @Test fun theCaptureScreenAndProviderFollowTheManifestPackage() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            "<manifest package=\"com.facebook.orca.copy\"><application/></manifest>".byteInputStream())
        document.addSystemCamera()
        val application = document.getElementsByTagName("application").item(0) as Element
        val provider = application.getElementsByTagName("provider").item(0) as Element
        assertEquals(CAMERA_PROVIDER, provider.getAttribute("android:name"))
        assertEquals("com.facebook.orca.copy$CAMERA_AUTHORITY_SUFFIX", provider.getAttribute("android:authorities"))
        assertEquals("false", provider.getAttribute("android:exported"))
        assertEquals("true", provider.getAttribute("android:grantUriPermissions"))
        val activity = application.getElementsByTagName("activity").item(0) as Element
        assertEquals(CAMERA_ACTIVITY, activity.getAttribute("android:name"))
        assertEquals("false", activity.getAttribute("android:exported"))
    }

    @Test fun everySupportedBuildHooksBothWaysItsChatCameraStarts() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val launches = findSystemCamera(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            validateControls(mapOf(SYSTEM_CAMERA to launches), setOf(SYSTEM_CAMERA))
            // The older listener, the chat screen's camera factory, its launcher's start, the static capture helper both
            // composer dispatchers hand the event to, and the photo's two checks.
            assertEquals(6, launches.size, code)
            for (method in launches) injectAndCheck(MutableMethod(method), "$code ${method.hookId()}")
        }
    }
}
