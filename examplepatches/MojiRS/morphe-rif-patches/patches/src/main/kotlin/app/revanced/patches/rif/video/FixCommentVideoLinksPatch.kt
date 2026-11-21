package app.revanced.patches.rif.video

import app.revanced.patches.rif.shared.PatchedditFeatures
import app.revanced.patches.rif.shared.skipForPatcheddit
import app.revanced.patches.rif.shared.skipResourcesForPatcheddit
import app.revanced.patches.rif.shared.switchOffForPatcheddit
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.ads.platinumAdSlotFixPatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.revanced.patches.rif.shared.proxy

private const val EXTENSION = "Lapp/revanced/extension/rif/VideoLinks;"
private const val VIDEO_MODEL = "Lcom/andrewshu/android/reddit/things/objects/ThreadMediaRedditVideo;"

// rif's Reddit video player-link metadata request builder (free j2.a$b.e0 /
// Platinum k2.a$b.e0): static (Uri playerLink) -> Uri, turning
// reddit.com/link/{id}/video/{mediaId}/player into /api/info.json?id=t3_{id}.
// Used only to locate the loader class; matched by shape + its strings (both builds).
internal val videoInfoRequestFingerprint = fingerprint {
    custom { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == "Landroid/net/Uri;" &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes[0].toString() == "Landroid/net/Uri;" &&
            method.implementation?.instructions?.let { insns ->
                val strings = insns.filter { it.opcode == Opcode.CONST_STRING }
                    .map { (it as ReferenceInstruction).reference.toString() }
                "info.json" in strings && "video" in strings
            } == true
    }
}

@Suppress("unused")
val fixCommentVideoLinksPatch = bytecodePatch(
    name = "Fix comment video links",
    description = "Makes videos posted in comments play in rif's video player instead of failing to load.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(platinumAdSlotFixPatch)
    extendWith("extensions/extension.mpe")

    finalize {
        switchOffForPatcheddit(PatchedditFeatures.FIX_COMMENT_VIDEO_LINKS)
    }

    execute {
        if (skipForPatcheddit(PatchedditFeatures.FIX_COMMENT_VIDEO_LINKS)) return@execute

        // The loader's result handler: (ThreadMediaRedditVideo) -> void, in the same class as
        // the request builder. It shows "error retrieving…" when the result is null; before
        // that, substitute a video built from the link's streams. p0 = loader, p1 = result.
        val loaderClass = videoInfoRequestFingerprint.classDef
        val onResult = proxy(loaderClass).mutableClass.methods.firstOrNull {
            it.returnType == "V" && it.parameterTypes.size == 1 &&
                it.parameterTypes[0].toString() == VIDEO_MODEL
        } ?: throw PatchException("video loader result handler not found in ${loaderClass.type}")
        onResult.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->orStreamFallback(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
                check-cast p1, $VIDEO_MODEL
            """,
        )
    }
}
