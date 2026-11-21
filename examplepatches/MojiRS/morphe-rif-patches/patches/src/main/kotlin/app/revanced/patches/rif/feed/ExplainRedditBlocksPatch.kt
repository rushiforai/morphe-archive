package app.revanced.patches.rif.feed

import app.revanced.patches.rif.shared.PatchedditFeatures
import app.revanced.patches.rif.shared.skipForPatcheddit
import app.revanced.patches.rif.shared.skipResourcesForPatcheddit
import app.revanced.patches.rif.shared.switchOffForPatcheddit
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import app.revanced.patches.rif.shared.requireScratchRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION = "Lapp/revanced/extension/rif/RedditBlocks;"

private fun Method.hasString(value: String) = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == value
} == true

// The listing loader's 403 body parser `P(InputStream)V` (free b5.y0, Platinum c5.y0; same name in
// both): parses the body as RedditErrorJson, keeps `reason`, throws for "gated". rif's request base
// calls it on every 403 (through h3.a / i3.a); an HTML body makes the parse throw.
internal val listingErrorBodyFingerprint = fingerprint {
    returns("V")
    parameters("Ljava/io/InputStream;")
    custom { method, classDef ->
        method.name == "P" && method.hasString("gated") &&
            classDef.methods.any { it.name == "X" && it.returnType == "Ljava/lang/String;" }
    }
}

// The request base's non-success handler `Y(Response, ResponseBody, signedIn, token)Object` (free
// h3.c, Platinum i3.c): the 403 body goes to the loader's parser from here, and it invalidates the
// token and retries. Four subclasses override it and call super; only the base has "com.reddit".
internal val requestErrorFingerprint = fingerprint {
    returns("Ljava/lang/Object;")
    parameters("Lokhttp3/e0;", "Lokhttp3/f0;", "Z", "Ljava/lang/String;")
    custom { method, _ -> method.name == "Y" && method.hasString("com.reddit") }
}

// The front-page/subreddit/multi fragment's load-error method (free e5.n.d7, Platinum f5.n.S6):
// toasts by the loader's 403 `reason` ("private", "quarantined", else the "forbidden" text).
internal val listingErrorToastFingerprint = fingerprint {
    returns("V")
    parameters("Lo0/c;")
    custom { method, _ ->
        method.hasString("private") && method.hasString("quarantined") && method.hasString("banned")
    }
}

@Suppress("unused")
val explainRedditBlocksPatch = bytecodePatch(
    name = "Explain Reddit blocks",
    description = "Shows \"Reddit is temporarily blocking requests\" instead of \"Error: forbidden\" when Reddit blocks a feed.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    finalize {
        switchOffForPatcheddit(PatchedditFeatures.EXPLAIN_REDDIT_BLOCKS)
    }

    execute {
        if (skipForPatcheddit(PatchedditFeatures.EXPLAIN_REDDIT_BLOCKS)) return@execute

        // 0. Remember, per worker thread and on every error response, whether the request was
        // signed in (p3). A logged-out rif gets the block page for every listing; it keeps rif's text.
        requestErrorFingerprint.method.addInstructions(
            0,
            "invoke-static { p3 }, $EXTENSION->noteRequest(Z)V",
        )

        // 1. Flag the loader when the 403 body is Reddit's block page. The returned stream has the
        // same bytes, so rif's own parse (and its failure on HTML) is unchanged.
        val parser = listingErrorBodyFingerprint.method
        parser.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->inspect(Ljava/lang/Object;Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p1
            """,
        )

        // 2. At the top of the fragment's error method, show our toast instead when flagged. The
        // fragment's own Context getter is the first `this.getContext()` call in the method.
        val toast = listingErrorToastFingerprint.method
        val contextGetter = toast.instructions.mapNotNull { insn ->
            (insn as? ReferenceInstruction)?.reference as? MethodReference
        }.first { it.parameterTypes.isEmpty() && it.returnType == "Landroid/content/Context;" }
        requireScratchRegister(toast)
        toast.addInstructionsWithLabels(
            0,
            """
                invoke-virtual { p0 }, ${contextGetter.definingClass}->${contextGetter.name}()Landroid/content/Context;
                move-result-object v0
                invoke-static { p1, v0 }, $EXTENSION->handle(Ljava/lang/Object;Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :original
                return-void
            """,
            ExternalLabel("original", toast.getInstruction(0)),
        )
    }
}
