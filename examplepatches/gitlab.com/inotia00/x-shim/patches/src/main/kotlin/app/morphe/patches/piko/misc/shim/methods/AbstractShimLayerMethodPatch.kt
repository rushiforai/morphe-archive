package app.morphe.patches.piko.misc.shim.methods

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.extension.sharedExtensionPatch
import app.morphe.patches.piko.misc.shim.methods.async.asyncTaskPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.account.accountsChangedPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.ads.googleAdsPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.appcompat.appCompatDelegatePatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.braze.dispatch.brazeDispatchPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.braze.push.brazePushPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.bug.bugReporterPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.component.componentFactoryPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.exoplayer.audio.exoPlayerAudioPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.exoplayer.handler.exoPlayerHandlerPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.locale.localePatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.media3.mediaUtilPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.proxy.constraintProxyPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.stuffing.stuffingPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.telephony.telephonyPatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.timeline.timelinePatch
import app.morphe.patches.piko.misc.shim.methods.broadcast.tracker.trackerPatch
import app.morphe.patches.piko.misc.shim.methods.worker.workerPatch
import app.morphe.patches.piko.misc.version.is_12_05_or_greater
import app.morphe.patches.piko.shared.Constants.COMPATIBILITY_PIKO
import app.morphe.patches.piko.util.cleanup
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.trimIndentMultiline
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.nio.file.Files
import kotlin.reflect.full.functions
import kotlin.reflect.full.memberProperties
import kotlin.reflect.jvm.isAccessible

@Suppress("unused")
val abstractShimLayerMethodPatch = bytecodePatch(
    name = "Abstract shim layer for method",
    description = "Adds an abstracted shim layer for methods, which improves compatibility to allow legacy patches to work."
) {
    compatibleWith(COMPATIBILITY_PIKO)

    val advancedMode by booleanOption(
        key = "advancedMode",
        default = false,
        title = "Advanced Mode",
        description = """
            If true, a shim layer for the synthetic method is added.
            
            Enable if testing is required.
        """.trimIndentMultiline(),
        required = true
    )

    dependsOn(
        patchModeCheckPatch,
        sharedExtensionPatch,

        // For advanced mode.
        accountsChangedPatch,
        appCompatDelegatePatch,
        asyncTaskPatch,
        brazeDispatchPatch,
        brazePushPatch,
        bugReporterPatch,
        componentFactoryPatch,
        constraintProxyPatch,
        exoPlayerAudioPatch,
        exoPlayerHandlerPatch,
        googleAdsPatch,
        localePatch,
        mediaUtilPatch,
        stuffingPatch,
        telephonyPatch,
        timelinePatch,
        trackerPatch,
        workerPatch,
    )

    execute {
        if (is_12_05_or_greater) {
            return@execute
        }

        if (!advancedModeEnabled()) {
            bytecodeLoaderSyntheticMethodFingerprint(BytecodeLoaderFingerprint.method).let {
                it.clearMatch()
                it.matchAll().forEach { match ->
                    match.method.apply {
                        val index = match.instructionMatches.last().index
                        val register = getInstruction<OneRegisterInstruction>(index).registerA

                        val checkCastIndex = indexOfFirstInstruction(index, Opcode.CHECK_CAST)
                        var objectClass = "Ljava/lang/Object;"

                        if (checkCastIndex > -1) {
                            val reference =
                                getInstruction<ReferenceInstruction>(checkCastIndex).reference.toString()

                            if (reference != objectClass) {
                                objectClass = reference
                            }
                        }

                        replaceInstruction(
                            index,
                            "invoke-direct { v$register }, $objectClass-><init>()V"
                        )
                        replaceInstruction(
                            index - 1,
                            "new-instance v$register, $objectClass"
                        )
                    }
                }
            }
        }

        val match = DexLoaderFingerprint.matchOrNull() ?: return@execute
        val localField = match.instructionMatches.last().instruction.getReference<FieldReference>()!!
        val filter: Field.() -> Boolean = { name == localField.name && type == localField.type }
        val dexField = match.classDef.fields.find(filter)!!
        val dexFileName = (dexField.initialValue as StringEncodedValue).value
        val dexFile = resourceContext["assets/$dexFileName"]

        if (!dexFile.exists()) return@execute

        val rawBytes = Files.readAllBytes(dexFile.toPath())
        val rawBytesSize = rawBytes.size

        val magicBytes = "dex\n".toByteArray()
        val startIndex = rawBytes.indices
            .take(rawBytesSize - magicBytes.size + 1)
            .firstOrNull { start ->
                magicBytes.indices.all { offset ->
                    rawBytes[start + offset] == magicBytes[offset]
                }
            } ?: throw PatchException("Start index not found in $dexFileName")

        val offset = startIndex + 0x20
        if (offset + 4 > rawBytesSize) {
            throw PatchException("Invalid hash: $dexFileName")
        }
        fun declaredOffset(i: Int) = rawBytes[i].toInt() and 0xFF
        val declaredFileSize = declaredOffset(offset) or (declaredOffset(offset + 1) shl 8) or (declaredOffset(offset + 2) shl 16) or (declaredOffset(offset + 3) shl 24)
        if (declaredFileSize <= 0) {
            throw PatchException("Invalid declared file size: $dexFileName")
        }

        val endIndex = startIndex + declaredFileSize
        if (endIndex > rawBytesSize) {
            throw PatchException("Invalid bounds: $declaredFileSize")
        }

        val dexBytes = rawBytes.copyOfRange(startIndex, endIndex)

        val patchClassesProperty = BytecodePatchContext::class.memberProperties.find { it.name == "patchClasses" }
            ?: throw PatchException("Failed to get patchClasses")

        patchClassesProperty.isAccessible = true
        val internalInstance = patchClassesProperty.get(this)
            ?: throw PatchException("Failed to get internalInstance")
        val internalClass = internalInstance::class
        val addClassFunction = internalClass.functions.find { it.name == "addClass" }
            ?: throw PatchException("Failed to invoke addClass")
        addClassFunction.isAccessible = true

        DexBackedDexFile.fromInputStream(null, dexBytes.inputStream()).classes.forEach { classDef ->
            addClassFunction.call(internalInstance, classDef)

            classDef.methods.forEach { method ->
                val parameterSize = method.parameterTypes.size
                var parameters = "p0"

                if (parameterSize > 1) {
                    for (i in 1..<parameterSize) {
                        parameters += ", p$i"
                    }
                }

                val originalClass = classDef.type.substringBefore("$") + ";"
                val originalMethod = method.name

                originalMethodFingerprint(originalClass, originalMethod).methodOrNull?.apply {
                    cleanup()
                    val smaliInstructions = if (returnType == "V")
                        """
                            invoke-static { $parameters }, $method
                            return-void                            
                        """
                    else
                        """
                            invoke-static { $parameters }, $method
                            move-result-object v0
                            return-object v0              
                        """
                    addInstructions(0, smaliInstructions)
                } ?: throw PatchException("Failed to match the fingerprint: $originalClass")
            }
        }
    }
}
