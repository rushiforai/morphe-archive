package app.morphe.patches.piko.misc.shim.methods.broadcast.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.misc.version.is_11_90_or_greater
import app.morphe.patches.piko.misc.version.versionCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.findField
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val googleAdsPatch = bytecodePatch(
    description = "GoogleAds",
) {
    dependsOn(
        patchModeCheckPatch,
        versionCheckPatch
    )

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val googleAdViewCallbackClass = GoogleAdViewCallbackFingerprint
            .getReference<TypeReference>(1)!!
            .type

        val googleAdViewCallbackLocalField = googleAdViewCallbackClass
            .findField {
                type.startsWith(GMS_INTERNAL_ADS_CLASS_PREFIX)
            }

        val smaliInstructions = with(GoogleAdViewCallbackDestroyFingerprint) {
            val constIndex = instructionMatches.first().index
            val methodIndex = instructionMatches[1].index

            val constValue =
                method.getInstruction<WideLiteralInstruction>(constIndex).wideLiteral.toInt()
            val methodReference =
                method.getInstruction<ReferenceInstruction>(methodIndex).reference

            """
                const/4 p1, $constValue
                iget-object p2, p0, $googleAdViewCallbackLocalField
                invoke-virtual { p2, p1 }, $methodReference
                return-void
            """
        }

        onReceiveFingerprint(googleAdViewCallbackClass).method.apply {
            cleanup()
            addInstructions(0, smaliInstructions)
        }

        val googleAdViewNoCallbackClass = GoogleAdViewNoCallbackFingerprint
            .getReference<TypeReference>(1)!!
            .type

        val googleAdViewNoCallbackLocalField = googleAdViewNoCallbackClass
            .findField {
                type.startsWith(GMS_INTERNAL_ADS_CLASS_PREFIX)
            }

        val googleAdViewNoCallbackSyntheticFingerprint = Fingerprint(
            definingClass = googleAdViewNoCallbackClass,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
            returnType = "V",
            filters = listOf(
                methodCall(
                    definingClass = GMS_INTERNAL_ADS_CLASS_PREFIX,
                    parameters = listOf(),
                    returnType = "V"
                )
            )
        )

        val googleAdViewNoCallbackHelperMethod = googleAdViewNoCallbackSyntheticFingerprint
            .getReference<MethodReference>()!!

        onReceiveFingerprint(googleAdViewNoCallbackClass).method.apply {
            cleanup()
            addInstructions(
                0,
                """
                    iget-object p1, p0, $googleAdViewNoCallbackLocalField
                    invoke-interface { p1 }, $googleAdViewNoCallbackHelperMethod
                    return-void
                """
            )
        }

        if (is_11_90_or_greater) {
            val mainThreadClass = MainThreadFingerprint
                .getReference<MethodReference>(1)!!
                .definingClass

            val mainThreadLocalField = mainThreadClass
                .findField {
                    type == "Landroid/os/Handler;"
                }

            onReceiveFingerprint(mainThreadClass).method.apply {
                cleanup()
                addInstructions(
                    0,
                    """
                        const-string p1, "android.media.AUDIO_BECOMING_NOISY"
                        invoke-virtual { p2 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
                        move-result-object p2
                        invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result p1
                        if-eqz p1, :ignore
                        iget-object p1, p0, $mainThreadLocalField
                        invoke-virtual { p1, p0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
                        :ignore
                        return-void
                    """
                )
            }
        }

        val interactiveAdViewClass = InteractiveAdViewFingerprint
            .getReference<TypeReference>(1)!!
            .type

        val interactiveAdViewLocalField = interactiveAdViewClass
            .findField {
                type.startsWith(INTERACTIVE_MEDIA_ADS_CLASS_PREFIX)
            }

        val interactiveAdViewSyntheticFingerprint = Fingerprint(
            definingClass = interactiveAdViewClass,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
            returnType = "V",
            filters = listOf(
                methodCall(
                    definingClass = INTERACTIVE_MEDIA_ADS_CLASS_PREFIX,
                    parameters = listOf(),
                    returnType = "V"
                )
            )
        )

        val interactiveAdViewHelperMethod = interactiveAdViewSyntheticFingerprint
            .getReference<MethodReference>()!!

        onReceiveFingerprint(interactiveAdViewClass).method.apply {
            cleanup()
            addInstructions(
                0,
                """
                    iget-object p1, p0, $interactiveAdViewLocalField
                    invoke-interface { p1 }, $interactiveAdViewHelperMethod
                    return-void
                """
            )
        }
    }
}
