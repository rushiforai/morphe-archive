/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/seekbar/Fingerprints.kt
 */
package app.czyeru.patches.tiktok.interaction.seekbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.czyeru.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val AWEME_CLASS = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
internal const val VIDEO_CONTROL_CLASS = "Lcom/ss/android/ugc/aweme/feed/model/VideoControl;"
internal const val SHOW_PROGRESS_BAR_FIELD = "showProgressBar"

private fun isTargetClass(classDef: ClassDef): Boolean =
    classDef.methods.any { sibling ->
        sibling.implementation?.instructions?.any { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.let { reference ->
                reference is StringReference &&
                    (reference.string == "homepage_hot" || reference.string == "FeedRecommendFragment")
            } ?: false
        } == true
    }

internal object VanillaLongFilterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(AWEME_CLASS),
    custom = { method, classDef ->
        isTargetClass(classDef) && (method.implementation?.instructions?.count() ?: 0) > 20
    },
)

internal object ShouldShowProgressBarFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(AWEME_CLASS),
    filters = listOf(fieldAccess(definingClass = VIDEO_CONTROL_CLASS, name = SHOW_PROGRESS_BAR_FIELD, opcode = Opcode.IGET)),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.IGET &&
                instruction.getReference<FieldReference>()?.let { field ->
                    field.definingClass == VIDEO_CONTROL_CLASS && field.name == SHOW_PROGRESS_BAR_FIELD
                } == true
        } == true
    },
)

internal object SetSeekBarShowTypeFingerprint : Fingerprint(
    strings = listOf("seekbar show type change, change to:"),
    custom = { method, _ -> method.parameterTypes.lastOrNull()?.toString() == "I" },
)
