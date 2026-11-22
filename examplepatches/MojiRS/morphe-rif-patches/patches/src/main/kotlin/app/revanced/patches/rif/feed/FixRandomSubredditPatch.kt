package app.revanced.patches.rif.feed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.revanced.patches.rif.shared.proxy

private const val EXTENSION = "Lapp/revanced/extension/rif/RandomSubreddit;"
private const val URI = "Landroid/net/Uri;"

// The request base's background step `doInBackground(Void...)Object` (free h3.c.H, Platinum
// i3.c.H): runs on a worker thread for every Reddit request (also for the listing loader
// h3.a$a, whose override calls super) and reads the request URI from the base's `Uri` field
// at every use. The class is the one the `Y(Response, ...)` error handler lives in, found by
// its shape and "com.reddit" const-string (as Explain Reddit blocks finds it). Not by name: other
// bundles that hook the handler rename it (Patcheddit 2.5.0: `morpheOriginal_Y_0`).
internal val requestBackgroundFingerprint = fingerprint {
    returns("Ljava/lang/Object;")
    parameters("[Ljava/lang/Void;")
    custom { method, classDef ->
        !AccessFlags.SYNTHETIC.isSet(method.accessFlags) && !AccessFlags.BRIDGE.isSet(method.accessFlags) &&
            classDef.methods.any { it.parameterTypes.size == 4 && it.hasConst("com.reddit") }
    }
}

private fun Method.hasConst(value: String) = implementation?.instructions?.any {
    it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == value
} == true

@Suppress("unused")
val fixRandomSubredditPatch = bytecodePatch(
    name = "Fix random subreddit",
    description = "Makes Random and r/randnsfw open random subreddits again, sourced from redditrand.com.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val method = requestBackgroundFingerprint.method
        val base = requestBackgroundFingerprint.classDef

        // The request URI: the base's only (protected final) Uri instance field. Not final, so
        // the hook can replace it.
        val uriField = base.fields.singleOrNull {
            it.type == URI && !AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw PatchException("request URI field not found in ${base.type}")
        val mutableBase = proxy(base).mutableClass
        mutableBase.fields.first { it.name == uriField.name && it.type == URI }.let {
            it.accessFlags = it.accessFlags and AccessFlags.FINAL.value.inv()
        }

        // At the top of doInBackground (registers: this = p0, the Void[] = p1, which the method
        // never reads, so p1 is scratch): `this.uri = RandomSubreddit.resolve(this.uri)`. The
        // extension returns the same Uri unless it is a random listing and redditrand answered.
        method.addInstructions(
            0,
            """
                iget-object p1, p0, ${base.type}->${uriField.name}:$URI
                invoke-static { p1 }, $EXTENSION->resolve($URI)$URI
                move-result-object p1
                iput-object p1, p0, ${base.type}->${uriField.name}:$URI
            """,
        )
    }
}
