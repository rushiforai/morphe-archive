package app.tikkamasalla.stremio.progress

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.tikkamasalla.stremio.introskip.hookEveryReturn
import app.morphe.patcher.patch.bytecodePatch
import app.tikkamasalla.stremio.introskip.Constants
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference

private const val EXTENSION = "Lapp/tikkamasalla/stremio/progress/ExternalProgress;"
private const val RESULT = "Lcom/stremio/common/players/ExternalPlayerContract\$ExternalPlayerResult;"

/** Keeps watch progress when an external player (Vimu, MX Player, VLC, mpv) is used. */
val externalPlayerProgressPatch = bytecodePatch(
    name = "External player progress",
    description = "Saves watch progress in Stremio when playing in an external player, and starts the player at the saved position.",
    default = true,
) {
    dependsOn(keepAliveManifestPatch)
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Snapshot media identity and the selected subtitle when the user picks the player.
        try {
            OpenInExternalPlayerFingerprint.method.apply {
                addInstructions(0, "invoke-static {p0}, $EXTENSION->captureExternal(Ljava/lang/Object;)V")
            }
        } catch (_: Exception) {
            java.util.logging.Logger.getLogger("ExternalProgressPatch").warning("optional hook OpenInExternalPlayer not found on this Stremio build: media identity and subtitle hand-off are skipped; progress and binge still apply")
        }

        // Launcher: Launch Intent builder
        if (CreateIntentFingerprint.originalMethodOrNull != null) {
            CreateIntentFingerprint.method.apply {
                addInstructions(0, "invoke-static {p1}, $EXTENSION->remember(Landroid/content/Context;)V")
                hookEveryReturn(this, Opcode.RETURN_OBJECT) { register ->
                    "invoke-static {v$register}, $EXTENSION->decorate(Landroid/content/Intent;)V"
                }
            }
        } else if (ExtCreateIntentFingerprint.originalMethodOrNull != null) {
            ExtCreateIntentFingerprint.method.apply {
                addInstructions(0, "invoke-static {p1}, $EXTENSION->rememberFrom(Ljava/lang/Object;)V")
                var seenStartFrom = false
                var decorateAt = -1
                for ((index, instr) in implementation!!.instructions.withIndex()) {
                    if (instr is ReferenceInstruction) {
                        val ref = instr.reference
                        if (ref is StringReference && ref.string == "startfrom") {
                            seenStartFrom = true
                        }
                    }
                    if (seenStartFrom && instr.opcode == Opcode.RETURN_OBJECT) {
                        decorateAt = index
                        break
                    }
                }
                check(decorateAt >= 0) { "no return-object after the startfrom extra in the launcher" }
                // Replaces the return (decorate, then return-object): the YouTube branch jumps to this same return.
                hookEveryReturn(this, Opcode.RETURN_OBJECT, only = decorateAt) { register ->
                    "invoke-static {v$register}, $EXTENSION->decorate(Landroid/content/Intent;)V"
                }
            }
        } else {
            error("No valid CreateIntent fingerprint resolved")
        }

        // Result Parser: Result object translation
        val parseReturnType: String
        if (ParseResultFingerprint.originalMethodOrNull != null) {
            parseReturnType = ParseResultFingerprint.method.returnType
            ParseResultFingerprint.method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p1, p2}, $EXTENSION->parse(ILandroid/content/Intent;)Ljava/lang/Object;
                    move-result-object v0
                    if-eqz v0, :extprogress_original
                    check-cast v0, $RESULT
                    return-object v0
                    :extprogress_original
                    nop
                """.trimIndent(),
            )
        } else if (ExtParseTypedFingerprint.originalMethodOrNull != null) {
            val method = ExtParseTypedFingerprint.method
            parseReturnType = method.returnType
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val startReg = if (isStatic) 0 else 1
            val params = method.parameterTypes.map { it.toString() }
            val intReg = startReg + params.indexOf("I")
            val intentReg = startReg + params.indexOf("Landroid/content/Intent;")

            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p$intReg, p$intentReg}, $EXTENSION->parse(ILandroid/content/Intent;)Ljava/lang/Object;
                    move-result-object v0
                    if-eqz v0, :extprogress_original
                    check-cast v0, $parseReturnType
                    return-object v0
                    :extprogress_original
                    nop
                """.trimIndent()
            )
        } else {
            error("No valid ParseResult fingerprint resolved")
        }

        // Result object stub: Reflectively bypassed object allocation
        try {
            val cDef = classDefByOrNull(parseReturnType)
            requireNotNull(cDef) { "Result class $parseReturnType not found" }
            val hasValidInit = cDef.methods.any { m ->
                m.name == "<init>" && AccessFlags.PUBLIC.isSet(m.accessFlags) &&
                m.parameterTypes.map { it.toString() } == listOf("J", "J", "Z") &&
                m.returnType == "V"
            }
            require(hasValidInit) { "Result class missing public (JJZ)V constructor" }

            val stubMethod = ExternalProgressNewResultStub.method
            val impl = stubMethod.implementation!!
            val locals = impl.registerCount - 5 // J(2) + J(2) + Z(1) = 5 parameters
            require(locals >= 1) { "Stub method lacks sufficient local registers" }
            val reg = locals - 1 // last local register: vReg, p0..p4 are contiguous

            stubMethod.apply {
                addInstruction(0, BuilderInstruction21c(Opcode.NEW_INSTANCE, reg, ImmutableTypeReference(parseReturnType)))
                addInstruction(1, BuilderInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, reg, 6, ImmutableMethodReference(parseReturnType, "<init>", listOf("J", "J", "Z"), "V")))
                addInstruction(2, BuilderInstruction11x(Opcode.RETURN_OBJECT, reg))
            }
        } catch (e: Exception) {
            java.util.logging.Logger.getLogger("ExternalProgressPatch").warning("Failed to generate static newResult stub, falling back to reflective builder: ${e.message}")
        }

        // Completed result: save the full position and mark watched before the next episode opens.
        try {
            if (ExternalPlayerResultFingerprint.originalMethodOrNull != null) {
                ExternalPlayerResultFingerprint.method.addInstructions(
                    0,
                    "invoke-static {p0, p1}, $EXTENSION->onExternalResult(Ljava/lang/Object;Ljava/lang/Object;)V",
                )
            } else {
                java.util.logging.Logger.getLogger("ExternalProgressPatch").warning("optional hook onExternalPlayerResult not found: completed episodes will not be force-marked watched")
                ExternalProgressStockHookStub.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            }
        } catch (e: Exception) {
            java.util.logging.Logger.getLogger("ExternalProgressPatch").warning("optional hook onExternalPlayerResult not found: completed episodes will not be force-marked watched")
            try {
                ExternalProgressStockHookStub.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            } catch (ignored: Exception) {}
        }

        // Fail soft: this one only logs what reaches the core.
        try {
            PlayerTimeChangedFingerprint.method.addInstructions(
                0,
                "invoke-static {p1, p2, p3, p4}, $EXTENSION->logTime(JJ)V",
            )
        } catch (_: Exception) {
            java.util.logging.Logger.getLogger("ExternalProgressPatch").warning("optional hook playerTimeChanged not found: progress log disabled")
        }
    }
}
