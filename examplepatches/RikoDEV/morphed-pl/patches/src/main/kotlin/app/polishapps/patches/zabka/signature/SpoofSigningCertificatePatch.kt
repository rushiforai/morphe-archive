package app.polishapps.patches.zabka.signature

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_ZABKA
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val ORIGINAL_CERT_SHA1 = "fab089d9e5b41002f29848fc8034a391ee177077"

@Suppress("unused")
val spoofSigningCertificatePatch = bytecodePatch(
    name = "Spoof signing certificate",
    description = "Reports Żabka's original signing certificate to Firebase, so login works after the app is " +
        "re-signed by patching.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZABKA)

    execute {
        val certificateHash = singleMethod("certificate hash helper") { _, method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "[B" &&
                method.parameterTypeNames() == listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
                "SHA1" in method.strings() &&
                method.implementation?.instructions?.let { instructions ->
                    instructions.any { it is NarrowLiteralInstruction && it.opcode == Opcode.CONST_16 && it.narrowLiteral == 0x40 } &&
                        instructions.any {
                            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                                field.definingClass == "Landroid/content/pm/PackageInfo;" && field.name == "signatures"
                            } == true
                        }
                } == true
        }

        val bytes = ORIGINAL_CERT_SHA1.chunked(2).map { it.toInt(16).toByte() }
        val fill = bytes.mapIndexed { index, value ->
            "const/16 v1, $value\nconst/16 v2, $index\naput-byte v1, v0, v2"
        }.joinToString("\n")

        certificateHash.addInstructionsWithLabels(
            0,
            """
                invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object v0
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                const/16 v0, ${bytes.size}
                new-array v0, v0, [B
                $fill
                return-object v0
            """,
            ExternalLabel("original", certificateHash.getInstruction(0)),
        )
    }
}
