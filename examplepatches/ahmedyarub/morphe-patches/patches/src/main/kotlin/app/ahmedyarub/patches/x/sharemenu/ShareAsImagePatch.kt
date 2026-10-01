package app.ahmedyarub.patches.x.sharemenu

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SHARE_IMAGE_CLASS = "$EXTENSION_PACKAGE/ShareImage;"

private object ShareSheetStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ShareSheetState(suggestions="),
)

private object ExternalAppInfoToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ExternalAppInfo(packageName="),
)

private object ShareCardSnapshotToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ShareCardSnapshot(uri="),
)

/** Sends a rendered share card to Instagram Stories or Snapchat. */
private object ShareCardCallbackFingerprint : Fingerprint(
    strings = listOf("interactive_asset_uri"),
)

private class ShareImageSetting(name: String) : Fingerprint(definingClass = SHARE_IMAGE_CLASS, name = name)

@Suppress("unused")
val shareAsImagePatch = bytecodePatch(
    name = "Share Tweet as Image",
    description = "Adds \"Share as image\" to the share sheet of a post, which shares it as an image card.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    execute {
        val entry = ExternalAppInfoToStringFingerprint.classDef
        val shareMethod = mutableClassDefBy(entry).methods.single { it.name == "<init>" }.parameterTypes.last().toString()
        ShareImageSetting("entryClass").method.returnEarly(entry.type.removePrefix("L").removeSuffix(";").replace('/', '.'))
        ShareImageSetting("shareMethodClass").method.returnEarly(shareMethod.removePrefix("L").removeSuffix(";").replace('/', '.'))

        // The sheet's state is made with its subject seventh and its apps ninth.
        mutableClassDefBy(ShareSheetStateToStringFingerprint.classDef).methods.single { method ->
            method.name == "<init>" && method.parameterTypes.size >= 9 && method.parameterTypes[8] == "Ljava/util/List;"
        }.addInstructions(
            0,
            """
            invoke-static { p7, p9 }, $SHARE_IMAGE_CLASS->apps(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
            move-result-object p9
            """,
        )

        // The card callback reads the context, the app the card is for and the card, then clears
        // the pending card. The entry added above is handled right after that.
        val snapshot = ShareCardSnapshotToStringFingerprint.classDef.type
        ShareCardCallbackFingerprint.method.apply {
            fun castTo(type: String) = instructions.first {
                it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == type
            } as OneRegisterInstruction

            val context = castTo("Landroid/content/Context;").registerA
            val app = castTo(entry.type).registerA
            val card = castTo(snapshot).registerA
            val cleared = instructions.first { instruction ->
                instruction.opcode == Opcode.INVOKE_INTERFACE && instruction.getReference<MethodReference>()?.name == "setValue"
            }.location.index
            if (maxOf(context, app, card) > 15) throw PatchException("The share card callback keeps its values above v15")

            val result = getFreeRegisterProvider(cleared + 1, 1, listOf(context, app, card)).getFreeRegister()
            if (result > 15) throw PatchException("The share card callback has no free register")

            addInstructionsWithLabels(
                cleared + 1,
                """
                invoke-static { v$context, v$app, v$card }, $SHARE_IMAGE_CLASS->share(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v$result
                if-eqz v$result, :original
                const/4 v$result, 0x0
                return-object v$result
                """,
                ExternalLabel("original", getInstruction(cleared + 1)),
            )
        }
    }
}
