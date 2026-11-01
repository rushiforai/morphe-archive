package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.JAPANESE_GLIDE_HOOKS
import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.gboardJapaneseQwertyGlideBytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardJapaneseQwertyGlidePatchContractTest {
    @Test
    fun patchIsOptInAndOnlyPullsTheGlideBytecodePatch() {
        val patch = gboardJapaneseQwertyGlidePatch
        assertEquals("Japanese QWERTY Glide", patch.name)
        assertFalse(patch.default)
        assertTrue(patch.options.isEmpty())
        assertEquals(1, patch.dependencies.size)
        assertSame(gboardJapaneseQwertyGlideBytecodePatch, patch.dependencies.single())
        assertTrue(
            gboardJapaneseQwertyGlideBytecodePatch.dependencies.any { dependency ->
                dependency === gboardPatchesExtensionCarrierPatch
            },
        )
        assertSame(COMPATIBILITY_GBOARD, checkNotNull(patch.compatibility).single())
    }

    @Test
    fun generatedInventoryPublishesThePatchAsDisabledByDefault() {
        val patches = generatedPublishedPatches()
        assertMatchesPublishedRegistrationCount(patches.size)
        val row = patches.single { row -> row.get("name").asString == "Japanese QWERTY Glide" }
        assertFalse(row.get("use").asBoolean)
        assertEquals(
            listOf(TARGET_VERSION),
            row.getAsJsonObject("compatiblePackages")
                .getAsJsonArray(GBOARD_PACKAGE)
                .map { version -> version.asString },
        )
    }

    @Test
    fun hooksCoverDecodeBridgeAndInputSessionInvalidation() {
        assertEquals(
            RuntimeCallId.entries.filter { call -> call.name.startsWith("JAPANESE_QWERTY_GLIDE_") }.toSet(),
            JAPANESE_GLIDE_HOOKS.map { hook -> hook.call }.toSet(),
        )
        assertEquals(
            listOf(
                "Lpmm;-><init>(Landroid/content/Context;Lpkz;" +
                    "Lcom/google/android/libraries/inputmethod/metadata/KeyboardDef;" +
                    "Lcom/google/android/libraries/inputmethod/metadata/KeyboardViewDef;Lpky;)V",
                "$GESTURE_HANDLER->r()Z",
                "$GESTURE_HANDLER->c(Landroid/view/View;)Landroid/view/ViewGroup;",
                "Lpml;->n(Lohe;)V",
                "Lcom/google/android/libraries/inputmethod/keyboard/impl/Keyboard;->e(Landroid/view/inputmethod/EditorInfo;Ljava/lang/Object;)V",
                "Lcom/google/android/libraries/inputmethod/keyboard/impl/Keyboard;->h()V",
                "Lcom/google/android/apps/inputmethod/libs/mozc/ime/SimpleJapaneseIme;->p(Lohe;)Z",
                "Liia;->b(Lmiz;ZLandroid/view/inputmethod/EditorInfo;)Ljava/lang/String;",
            ),
            JAPANESE_GLIDE_HOOKS.map { hook -> hook.target.reference },
        )
    }

    private companion object {
        const val GBOARD_PACKAGE = "com.google.android.inputmethod.latin"
        const val TARGET_VERSION = "18.5.4.993608717-release-arm64-v8a"
        const val GESTURE_HANDLER =
            "Lcom/google/android/apps/inputmethod/libs/latin5/handler/LatinGestureMotionEventHandler;"
    }
}
