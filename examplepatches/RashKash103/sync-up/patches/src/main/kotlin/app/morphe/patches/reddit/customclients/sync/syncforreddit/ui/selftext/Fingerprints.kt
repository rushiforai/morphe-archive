package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.selftext

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Reads a body through a SAX parser and hands back what was built from it. Where a preview is
 * wanted it finishes by dropping every span it worked out, which is what leaves an address in a
 * post drawn as ordinary words.
 *
 * Anchored on the parse itself, the one thing in the method that is not obfuscated.
 */
internal val parseBodyFingerprint = Fingerprint(
    parameters = emptyList(),
    returnType = "Loc/c;",
    custom = { method, _ ->
        method.indexOfFirstInstruction {
            val reference = getReference<MethodReference>()
            reference?.definingClass == "Lorg/xml/sax/XMLReader;" && reference.name == "parse"
        } >= 0
    },
)
