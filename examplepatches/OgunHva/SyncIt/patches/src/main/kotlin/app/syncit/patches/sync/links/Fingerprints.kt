package app.syncit.patches.sync.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Sync's HTML to Spanned parser, the method that turns a post body into styled text.
 *
 * Anchored on the SAX parse it performs, which is the one thing in the method that is not
 * obfuscated.
 */
internal val parseBodyFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "Loc/c;",
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            val reference = instruction.getReference<MethodReference>()
            reference?.definingClass == "Lorg/xml/sax/XMLReader;" && reference.name == "parse"
        } == true
    },
)
