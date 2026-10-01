package app.ahmedyarub.patches.x.links

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * A link in a post shows its display URL but opens its t.co redirect. The link model is patched
 * rather than the places that open it: some forty methods read it, across posts, DMs and bios.
 */
@Suppress("unused")
val noShortenedUrlPatch = bytecodePatch(
    name = "No shortened URL",
    description = "Opens links in posts at their real address instead of through t.co.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    execute {
        // toString reads displayUrl, expandedUrl and url, in that order.
        val (_, expandedUrl, url) = UrlEntityToStringFingerprint.method.instructions
            .filter { it.opcode == Opcode.IGET_OBJECT }
            .mapNotNull { it.getReference<FieldReference>() }
            .filter { it.type == "Ljava/lang/String;" }
            .take(3)
            .also { if (it.size < 3) throw PatchException("UrlEntity.toString reads fewer than three strings") }

        val constructors = UrlEntityToStringFingerprint.classDef.methods.filter { it.name == "<init>" }
        var patched = 0

        constructors.forEach { constructor ->
            val mutable = mutableClassDefBy(UrlEntityToStringFingerprint.classDef).methods.first {
                it.name == "<init>" && it.parameterTypes == constructor.parameterTypes
            }

            fun storeOf(field: FieldReference) = mutable.instructions.firstOrNull { instruction ->
                instruction.opcode == Opcode.IPUT_OBJECT && instruction.getReference<FieldReference>() == field
            }

            val urlStore = storeOf(url) ?: return@forEach
            val expandedStore = storeOf(expandedUrl) ?: throw PatchException("A UrlEntity constructor sets url but not expandedUrl")

            val urlRegister = (urlStore as TwoRegisterInstruction).registerA
            val expandedRegister = (expandedStore as TwoRegisterInstruction).registerA
            if (maxOf(urlRegister, expandedRegister) > 15) throw PatchException("A UrlEntity constructor keeps its urls above v15")

            // The url parameter is only stored, so it can carry the replacement.
            mutable.addInstructions(
                urlStore.location.index,
                """
                invoke-static { v$expandedRegister, v$urlRegister }, $LINKS_CLASS->pickEntityUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$urlRegister
                """,
            )
            patched++
        }

        if (patched == 0) throw PatchException("No UrlEntity constructor sets url")
    }
}
