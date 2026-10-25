package app.template.patches.flashscore.misc.promo

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.iface.ClassDef

// Firebase In-App Messaging's display callback. Its implementation is obfuscated, but it
// implements this kept interface and the interface keeps the method name. Only the display side
// is touched: FIAM's campaign fetching and Firebase Messaging (push) are left alone.
private const val FIAM_DISPLAY = "Lcom/google/firebase/inappmessaging/FirebaseInAppMessagingDisplay;"

/**
 * Makes every FirebaseInAppMessagingDisplay.displayMessage implementation return at once, so
 * server-side In-App Messaging campaigns never render. Skipped when the app does not bundle FIAM;
 * fails when it does but no implementation is found. Mirrors Sofascore's patch.
 */
private fun BytecodePatchContext.blockInAppMessaging() {
    var bundled = false
    val displays = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type == FIAM_DISPLAY) bundled = true
        if (FIAM_DISPLAY in classDef.interfaces) displays += classDef
    }
    if (!bundled) return
    var patched = 0
    for (classDef in displays) {
        mutableClassDefBy(classDef).methods
            .filter { it.name == "displayMessage" && it.returnType == "V" && it.implementation != null }
            .forEach { it.returnEarly(); patched++ }
    }
    if (patched == 0) throw PatchException("No FirebaseInAppMessagingDisplay.displayMessage implementation found")
}

@Suppress("unused")
val blockMarketingPopupsPatch = bytecodePatch(
    name = "Block marketing popups",
    description = "Blocks promo popups.",
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        // 1. The remote dialog reports that it was not shown.
        RemoteDialogShowFingerprint.method.returnEarly(false)

        // 2. Firebase In-App Messaging popups.
        blockInAppMessaging()

        // 3. No promo strips are ever parsed from remote config.
        InAppStripParseFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """.trimIndent()
        )
    }
}
