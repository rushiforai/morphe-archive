package app.hushmessenger.patches.controls

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals

/**
 * Every control's contracts and edits, run on the real builds the way its patch runs them. Discovery finding a method
 * doesn't mean its patch-time check takes it: 583's sticker keyboard tab list was found and then refused.
 */
class HookInjectionReplayTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun everySupportedBuildTakesEveryControlsInjection() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        // Declaring the control patches fills the registry. An empty one would pass without checking anything.
        assertEquals(ExpectedTotals.REPLAYED_CONTROLS, controlHooks.size)
        val refused = mutableListOf<String>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val discovered = findControls(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            // Two controls sharing a method edit the same copy, as they do in the patcher.
            val mutable = HashMap<String, MutableMethod>()
            // The community inbox goes in through its own contract, which CommunityInboxTest replays on these builds.
            for ((key, hooks) in controlHooks) if (key != COMMUNITY_INBOX) {
                try {
                    validateControls(discovered, hooks)
                    val methods = hooks.associateWith { hook ->
                        discovered.getValue(hook).map { mutable.getOrPut(it.hookId()) { MutableMethod(it) } }
                    }
                    // Chat bubbles also flips the extension's capability method, which isn't in a stock APK.
                    if (key == "bubbles") {
                        injectNativeBubbles(methods.getValue("bubbles").single(), methods.getValue("bubble_mode").single(),
                            nativeBubbleRoutesMethod(), true)
                    } else {
                        injectControl(key, methods)
                    }
                    // The Mark as read button also builds the extension's two builders from this build's recipe.
                    if (key == MARK_READ_BUTTON) {
                        markReadSocketBuilder(markReadStub(), markReadRecipe!!)
                        markReadBuilder(markReadButtonStub(), markReadRecipe!!)
                    }
                    // The voice message Save row also builds the extension's stubs from this build's recipe.
                    if (key == SAVE_VOICE_MENU) for (id in SAVE_VOICE_MENU_STUBS) saveVoiceMenuBuilder(saveVoiceMenuStub(id), saveVoiceMenuRecipe!!)
                    // Auto reply also builds the extension's picture send from this build's media factory.
                    if (key == AUTO_REPLY) {
                        val recipe = autoReplyPictureRecipe ?: error("no picture recipe")
                        autoReplyMessagesBuilder(autoReplyMessagesStub(), recipe)
                        autoReplySendBuilder(autoReplySendStub(), recipe)
                        autoReplyPicturesFlag(autoReplyPicturesStub())
                    }
                } catch (error: Exception) {
                    refused += "$code $key: ${error.javaClass.simpleName} ${error.message}"
                }
            }
        }
        assertEquals(emptyList(), refused)
    }
}
