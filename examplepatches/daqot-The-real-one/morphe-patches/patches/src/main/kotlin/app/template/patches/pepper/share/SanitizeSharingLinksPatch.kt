package app.template.patches.pepper.share

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_PEPPER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val EXTENSION_CLASS = "Lapp/template/extension/pepper/SanitizeSharingLinksPatch;"

private const val SANITIZED_SHAREABLE_LINK_METHOD = "getSanitizedShareableLink"

@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Shares the direct link to deals and discussions, " +
        "instead of a link that redirects through a tracking service.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PEPPER)

    extendWith("extensions/extension.mpe")

    execute {
        threadApiRepresentationClasses.forEach { threadApiRepresentationClass ->
            GetShareableLinkFingerprint(threadApiRepresentationClass).let {
                val shareableLinkField = it.method.instructions
                    .first { instruction -> instruction.opcode == Opcode.IGET_OBJECT }
                    .let { instruction -> (instruction as ReferenceInstruction).reference as FieldReference }

                // The getter only has the register holding "this", so add a method with
                // registers to spare, that passes the canonical address of the thread on the
                // website, such as https://www.pepper.nl/promocje/ocieplacz-na-twarz-1371572,
                // and the redirecting link to the extension.
                it.classDef.methods.add(
                    ImmutableMethod(
                        threadApiRepresentationClass,
                        SANITIZED_SHAREABLE_LINK_METHOD,
                        emptyList<MethodParameter>(),
                        "Ljava/lang/String;",
                        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                        null,
                        null,
                        MutableMethodImplementation(3),
                    ).toMutable().apply {
                        addInstructions(
                            0,
                            """
                                invoke-virtual { p0 }, $threadApiRepresentationClass->getDealUri()Ljava/lang/String;
                                move-result-object v0
                                iget-object v1, p0, $shareableLinkField
                                invoke-static { v0, v1 }, $EXTENSION_CLASS->getThreadShareUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                                move-result-object v0
                                return-object v0
                            """
                        )
                    }
                )

                it.method.addInstructions(
                    0,
                    """
                        invoke-direct { p0 }, $threadApiRepresentationClass->$SANITIZED_SHAREABLE_LINK_METHOD()Ljava/lang/String;
                        move-result-object p0
                        return-object p0
                    """
                )
            }
        }
    }
}
