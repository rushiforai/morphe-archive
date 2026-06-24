/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/messenger/inputfield/Fingerprints.kt
 */
package app.morphe.patches.messenger.inputfield

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.dexbacked.value.DexBackedStringEncodedValue

internal object SendTypingIndicatorFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { method, classDef ->
        method.name == "run" &&
            classDef.fields.any {
                it.name == "__redex_internal_original_name" &&
                    (it.initialValue as? DexBackedStringEncodedValue)?.value == "ConversationTypingContext\$sendActiveStateRunnable\$1"
            }
    },
)
