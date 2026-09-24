package app.morphe.patches.bongobdandroidtv.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.bongobdandroidtv.extension.sharedExtensionPatch
import app.morphe.patches.bongobdandroidtv.shared.Constants.COMPATIBILITY_BONGOANDROIDTV
import app.morphe.patches.shared.getRegisterName
import app.morphe.util.matchAllMethodIndicesForEach
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/bongo/patches/FreeContentPatch;"

@Suppress("unused")
val freeContentPatch = bytecodePatch(
    name = "Free content",
    description = "Use alternative api to get content details.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BONGOANDROIDTV)

    dependsOn(sharedExtensionPatch)

    execute {
        Fingerprint(filters = listOf(methodCall(GetVideoDetailsDataFingerprint.matchSingle().originalMethod))).matchAllMethodIndicesForEach {
            if (definingClass == EXTENSION_CLASS) return@matchAllMethodIndicesForEach

            val instruction = getInstruction<FiveRegisterInstruction>(it)
            val registerCName = getRegisterName(instruction.registerC)
            val registerDName = getRegisterName(instruction.registerD)

            replaceInstruction(
                it,
                "invoke-static {$registerCName, $registerDName}, $EXTENSION_CLASS->getVideoDetailsData(Lsaas/ott/smarttv/ui/details/data/DetailsEndPoint;Ljava/lang/String;)Lretrofit2/Call;",
            )
        }
    }
}