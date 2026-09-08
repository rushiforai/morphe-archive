package dev.bucek.affine.patches.nogms

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.bucek.affine.patches.shared.Constants.COMPATIBILITY_AFFINE

private val removeGoogleManifestEntriesPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_AFFINE)

    execute {
        val metadata = packageMetadata
        if (metadata.versionCode != "439") {
            throw PatchException("Expected AFFiNE version code 439, found ${metadata.versionCode}")
        }

        document("AndroidManifest.xml").use { ManifestTransformer.transform(it) }
    }
}

@Suppress("unused")
val removeGoogleRequirementsPatch = bytecodePatch(
    name = "Remove Google requirements",
    description = "Removes Google Play PairIP licensing, Firebase/Google startup components, " +
        "analytics permissions, and AFFiNE's explicit Crashlytics startup call.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AFFINE)
    dependsOn(removeGoogleManifestEntriesPatch)

    execute {
        CrashlyticsTreeConstructorFingerprint.method.apply {
            val superConstructorIndex = instructions.indexOfFirst { instruction ->
                instruction.methodReference()?.let {
                    it.definingClass == "Lhg/b;" && it.name == "<init>"
                } == true
            }
            if (superConstructorIndex < 0) {
                throw PatchException("Could not find the Crashlytics tree super constructor")
            }
            addInstructions(
                superConstructorIndex + 1,
                """
                    const/4 v0, 0x0
                    iput-object v0, p0, Lx5/a;->b:Lqa/c;
                    return-void
                """.trimIndent(),
            )
        }

        // The object is still planted beside AFFiNE's local FileTree, but it is inert.
        CrashlyticsTreeLogFingerprint.method.addInstruction(0, "return-void")

        // This suspend function is used only to upload old local logs to Firebase Storage.
        OldLogUploadFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ltc/y;->a:Ltc/y;
                return-object v0
            """.trimIndent(),
        )

        SaveCookiesCoroutineFingerprint.method.apply {
            val crashlyticsIndex = uniqueMethodCallIndex("Lda/b;", "q")
            val continueIndex = instructions.withIndex()
                .drop(crashlyticsIndex + 1)
                .firstOrNull { (_, instruction) ->
                    instruction.methodReference()?.let {
                        it.definingClass == "Ljava/lang/Iterable;" && it.name == "iterator"
                    } == true
                }
                ?.index
                ?: -1
            if (continueIndex < 0) {
                throw PatchException("Could not find cookie persistence after the Crashlytics user-ID block")
            }
            replaceInstruction(
                crashlyticsIndex,
                BuilderInstruction30t(
                    Opcode.GOTO_32,
                    implementation!!.newLabelForIndex(continueIndex),
                ),
            )
            // A move-result instruction is only valid immediately after an invoke.
            replaceInstruction(crashlyticsIndex + 1, "nop")
        }

        ClearAuthCookiesCoroutineFingerprint.method.apply {
            val crashlyticsIndex = uniqueMethodCallIndex("Lda/b;", "q")
            val returnUnitIndex = instructions.withIndex()
                .drop(crashlyticsIndex + 1)
                .firstOrNull { (_, instruction) ->
                    instruction.fieldReference()?.let {
                        it.definingClass == "Ltc/y;" && it.name == "a"
                    } == true
                }
                ?.index
                ?: -1
            if (returnUnitIndex < 0) {
                throw PatchException("Could not find logout completion after the Crashlytics user-ID block")
            }
            replaceInstruction(
                crashlyticsIndex,
                BuilderInstruction30t(
                    Opcode.GOTO_32,
                    implementation!!.newLabelForIndex(returnUnitIndex),
                ),
            )
            replaceInstruction(crashlyticsIndex + 1, "nop")
        }

        val appOnCreate = CrashlyticsCustomKeysFingerprint.method
        val crashlyticsIndex = appOnCreate.uniqueMethodCallIndex("Lda/b;", "q")
        // The custom-key setup is the final source-level statement in AFFiNEApp.onCreate().
        // Return before it resolves the Crashlytics singleton; all preceding app
        // initialization, including Capacitor configuration, remains intact.
        appOnCreate.addInstruction(crashlyticsIndex, "return-void")
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodReference() =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.fieldReference() =
    (this as? ReferenceInstruction)?.reference as? FieldReference

private fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.uniqueMethodCallIndex(
    definingClass: String,
    name: String,
): Int {
    val matches = instructions.mapIndexedNotNull { index, instruction ->
        index.takeIf {
            instruction.methodReference()?.let { reference ->
                reference.definingClass == definingClass && reference.name == name
            } == true
        }
    }
    if (matches.size != 1) {
        throw PatchException("Expected one call to $definingClass->$name, found ${matches.size}")
    }
    return matches.single()
}