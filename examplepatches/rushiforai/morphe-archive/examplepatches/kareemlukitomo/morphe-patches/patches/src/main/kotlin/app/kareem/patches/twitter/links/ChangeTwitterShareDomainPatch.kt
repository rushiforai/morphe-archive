package app.kareem.patches.twitter.links

import app.kareem.patches.shared.Constants.COMPATIBILITY_TWITTER
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val DOMAIN_CLASS = "Lcom/twitter/model/core/e;"
private const val ORIGINAL_DOMAIN_FORMAT = "https://x.com/%1\$s/status/%2\$d"
private const val CUSTOM_DOMAIN_FORMAT = "https://nitter.kareem.one/%1\$s/status/%2\$d"

@Suppress("unused")
val changeTwitterShareDomainPatch =
    bytecodePatch(
        name = "Change Twitter share domain",
        description = "Rewrites generated Twitter/X share links to nitter.kareem.one.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_TWITTER)

        execute {
            var foundTargetClass = false
            var sawOriginalFormat = false
            var sawCustomFormat = false

            classDefForEach { classDef ->
                if (classDef.type != DOMAIN_CLASS) {
                    return@classDefForEach
                }

                foundTargetClass = true
                val mutableClass = mutableClassDefBy(classDef)
                mutableClass.methods.forEach { method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach

                    instructions.forEachIndexed { index, instruction ->
                        if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
                            return@forEachIndexed
                        }

                        val stringReference =
                            (instruction as? ReferenceInstruction)?.reference as? StringReference
                                ?: return@forEachIndexed
                        when (stringReference.string) {
                            ORIGINAL_DOMAIN_FORMAT -> {
                                val register =
                                    (instruction as? OneRegisterInstruction)?.registerA
                                        ?: throw PatchException("Share-domain instruction does not expose its target register")

                                method.replaceInstruction(
                                    index,
                                    "const-string/jumbo v$register, \"$CUSTOM_DOMAIN_FORMAT\"",
                                )
                                sawOriginalFormat = true
                            }

                            CUSTOM_DOMAIN_FORMAT -> sawCustomFormat = true
                        }
                    }
                }
            }

            if (!foundTargetClass) {
                throw PatchException("Could not find target class $DOMAIN_CLASS")
            }
            if (!sawOriginalFormat && !sawCustomFormat) {
                throw PatchException("Could not rewrite the Twitter/X share-domain format string")
            }
        }
    }
