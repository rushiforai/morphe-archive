package app.syncit.patches.sync.profile

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.syncit.patches.sync.Constants.SYNC_FOR_REDDIT
import com.android.tools.smali.dexlib2.formatter.DexFormatter
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val useUserEndpointPatch = patch(
    name = "Use /user/ for profiles",
    description = "Replaces the deprecated /u profile endpoint with /user, which Reddit still " +
            "serves. User profile requests (about, friend and unfriend) use this path, so " +
            "profiles fail to load without it."
) {
    compatibleWith(SYNC_FOR_REDDIT)

    execute {
        profileEndpointFingerprints.forEach { fingerprint ->
            // Null when another bundle already replaced the path, which is fine: there is
            // nothing left to do. matchAll() would throw in that case.
            fingerprint.matchAllOrNull().orEmpty().forEach { match ->
                val stringIndex = match.stringMatches.first().index

                val instruction =
                    match.method.getInstruction<OneRegisterInstruction>(stringIndex)

                val fixedPath = instruction.getReference<StringReference>()!!
                    .string
                    .replace("u/", "user/")

                match.method.replaceInstruction(
                    stringIndex,
                    "const-string v${instruction.registerA}, " +
                            DexFormatter.INSTANCE.getQuotedString(fixedPath)
                )
            }
        }
    }
}
