package app.hushmessenger.patches.controls

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
import java.nio.file.Files
import java.nio.file.Path
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.w3c.dom.Element
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

private const val LAUNCH = "LX/7Jp;->DXV($MONTAGE_PARAMS$NAVIGATION_TRIGGER)V"

/** 580's camera listener, with the registers every supported build uses. */
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

/** The chat fragment's result reader, cut down to what discovery checks. */
private val COMPOSER_RESULT_BODY = """
    const/16 v0, $CAMERA_REQUEST
    const/16 v0, $EXTERNAL_MEDIA_REQUEST
    const-string v0, "$EXTERNAL_MEDIA_NULL_DATA"
    const-string v0, "$CAMERA_NULL_DATA"
    return-void
""".trimIndent()

internal fun systemCameraFixture(): List<MutableClass> = listOf(
    fixtureClass("LX/7Jp;", listOf(fixtureMethod(LAUNCH, CAMERA_LAUNCH_BODY, registers = 7))),
    fixtureClass("LX/7Rm;", listOf(fixtureMethod("LX/7Rm;->onActivityResult(IILandroid/content/Intent;)V", COMPOSER_RESULT_BODY))),
)

private fun Method.code() = implementation!!.instructions.toList()

/** The intent and its request code go through the two helpers right before the launch, and nothing stock moves. */
private fun assertCameraHook(before: List<Instruction>, after: List<Instruction>, site: Int, message: String) {
    val launch = before[site] as FiveRegisterInstruction
    val intent = launch.registerD
    val request = launch.registerF
    assertEquals(before.size + 4, after.size, message)
    assertEquals(before, after.filterIndexed { i, _ -> i !in site until site + 4 }, message)
    val swap = after[site] as FiveRegisterInstruction
    assertEquals(Opcode.INVOKE_STATIC, after[site].opcode, message)
    assertEquals("$SETTINGS->systemCamera(Landroid/content/Intent;)Landroid/content/Intent;", (swap as ReferenceInstruction).reference.toString(), message)
    assertEquals(listOf(1, intent), listOf(swap.registerCount, swap.registerC), message)
    assertEquals(Opcode.MOVE_RESULT_OBJECT, after[site + 1].opcode, message)
    assertEquals(intent, (after[site + 1] as OneRegisterInstruction).registerA, message)
    val code = after[site + 2] as FiveRegisterInstruction
    assertEquals("$SETTINGS->cameraRequestCode(Landroid/content/Intent;I)I", (code as ReferenceInstruction).reference.toString(), message)
    assertEquals(listOf(2, intent, request), listOf(code.registerCount, code.registerC, code.registerD), message)
    assertEquals(Opcode.MOVE_RESULT, after[site + 3].opcode, message)
    assertEquals(request, (after[site + 3] as OneRegisterInstruction).registerA, message)
    assertEquals(before[site], after[site + 4], message)
    assertEquals(Opcode.RETURN_VOID, after.last().opcode, message)
}

class SystemCameraTest {
    @AfterTest fun reset() { activeProfile = BASE_PROFILE }

    @Test fun theCameraLaunchSwapsItsIntentAndRequestCodeAndKeepsEveryStockInstruction() {
        val found = findSystemCamera(systemCameraFixture())
        validateControls(mapOf(SYSTEM_CAMERA to found), setOf(SYSTEM_CAMERA))
        val method = found.single() as MutableMethod
        val before = method.code()
        injectControl(SYSTEM_CAMERA, mapOf(SYSTEM_CAMERA to listOf(method)))
        assertCameraHook(before, method.code(), 13, "fixture")
        // Without the chat fragment's reader for a picked photo there's nowhere to send the camera's photo.
        assertTrue(findSystemCamera(systemCameraFixture().take(1)).isEmpty())
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

    @Test fun everySupportedBuildHooksItsOneChatCameraLaunch() {
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
            val method = MutableMethod(launches.single())
            val before = method.code()
            val site = method.cameraLaunchSite()
            method.injectSystemCamera()
            assertCameraHook(before, method.code(), site, code)
        }
    }
}
