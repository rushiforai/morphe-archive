package app.xperia.patches.sony.stream

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.xperia.patches.sony.SONY_CAMERA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "Lapp/xperia/extension/sony/camera/RawConnectMode;"
private const val MODE = "Ljp/co/sony/mc/camera/configuration/parameters/StreamingConnectMode;"
private const val MODE_ARRAY = "[$MODE"
private const val DIALOG_ID = "Ljp/co/sony/mc/camera/view/messagedialog/DialogId;"

private val rawStrings = mapOf(
    "xperia_raw_usb_txt" to "PC (USB)",
    "xperia_raw_wifi_txt" to "PC (Wi\u2011Fi)",
)

/** Labels for the two connect-mode entries; looked up by name at runtime. */
private val rawConnectModeStringsPatch = resourcePatch {
    execute {
        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            rawStrings.forEach { (name, text) ->
                resources.appendChild(document.createElement("string").apply {
                    setAttribute("name", name)
                    textContent = text
                })
            }
        }
    }
}

/** Classes whose `mode == RTMP_URL` comparisons must also accept the raw modes. */
private val rtmpComparisonClasses = listOf(
    "Ljp/co/sony/mc/camera/controller/StateMachine;",
    "Ljp/co/sony/mc/camera/view/messagedialog/StartStreamingDialogBuilder;",
    "Ljp/co/sony/mc/camera/view/uistate/StreamingUiState\$isRtmpItemInvisible\$1;",
)

/**
 * Adds "PC via USB" and "PC via Wi-Fi" to Live streaming's "Connect to" list. They reuse Sony's RTMP URL
 * flow (settings items, start dialog, StateMachine → RtmpManager.connect), where the Raw H.264 stream
 * patch takes over the transport.
 */
@Suppress("unused")
val rawConnectModePatch = bytecodePatch(
    name = "Raw stream connect modes",
    description = "Adds \"PC via USB\" and \"PC via Wi-Fi\" entries to Live streaming's Connect to list for the " +
            "raw H.264 transport. USB needs no settings (adb reverse tcp:6970 tcp:6970 on the PC); Wi-Fi takes " +
            "the PC from the RTMP stream URL field (rtmp://pc-ip).",
) {
    compatibleWith(SONY_CAMERA)

    dependsOn(rawConnectModeStringsPatch, rawH264StreamPatch)

    extendWith("extensions/sony-camera.mpe")

    execute {
        // 1. Two more enum constants (ordinals 3 and 4), built inside $values() with its three locals.
        Fingerprint(definingClass = MODE, name = "\$values", parameters = emptyList(), returnType = MODE_ARRAY).method.apply {
            val body = instructions.size
            addInstructions(
                0,
                """
                    const/4 v0, 0x5
                    new-array v0, v0, $MODE_ARRAY
                    const/4 v1, 0x0
                    sget-object v2, $MODE->RTMP_URL:$MODE
                    aput-object v2, v0, v1
                    const/4 v1, 0x1
                    sget-object v2, $MODE->YOUTUBE:$MODE
                    aput-object v2, v0, v1
                    const/4 v1, 0x2
                    sget-object v2, $MODE->FACEBOOK:$MODE
                    aput-object v2, v0, v1
                    const-string v1, "RAW_USB"
                    const/4 v2, 0x3
                    invoke-static { v1, v2 }, $EXTENSION_CLASS->create(Ljava/lang/String;I)Ljava/lang/Object;
                    move-result-object v1
                    check-cast v1, $MODE
                    aput-object v1, v0, v2
                    const-string v1, "RAW_WIFI"
                    const/4 v2, 0x4
                    invoke-static { v1, v2 }, $EXTENSION_CLASS->create(Ljava/lang/String;I)Ljava/lang/Object;
                    move-result-object v1
                    check-cast v1, $MODE
                    aput-object v1, v0, v2
                    return-object v0
                """,
            )
            removeInstructions(instructions.size - body, body)
        }

        // 2. Offer them: Companion.getOptions() = values() minus FACEBOOK.
        Fingerprint(definingClass = "${MODE.dropLast(1)}\$Companion;", name = "getOptions", parameters = emptyList(), returnType = MODE_ARRAY).method.apply {
            val body = instructions.size
            addInstructions(
                0,
                """
                    invoke-static { }, $MODE->values()$MODE_ARRAY
                    move-result-object p0
                    invoke-static { p0 }, $EXTENSION_CLASS->options([Ljava/lang/Object;)[Ljava/lang/Object;
                    move-result-object p0
                    check-cast p0, $MODE_ARRAY
                    return-object p0
                """,
            )
            removeInstructions(instructions.size - body, body)
        }

        // 3. Labels. StreamingConnectMode.getTextId() has no locals: the extension returns the final id
        //    (raw label, or mTextId). The settings-row lookup keeps its own table for Sony's entries.
        Fingerprint(definingClass = MODE, name = "getTextId", parameters = emptyList(), returnType = "I").method.apply {
            val body = instructions.size
            addInstructions(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS->textId(Ljava/lang/Object;)I
                    move-result p0
                    return p0
                """,
            )
            removeInstructions(instructions.size - body, body)
        }
        Fingerprint(
            definingClass = "Ljp/co/sony/mc/camera/view/setting/settingitem/CameraSettingResource;",
            name = "getStreamingSettingTextId",
            parameters = listOf("Ljp/co/sony/mc/camera/configuration/parameters/UserSettingValue;"),
            returnType = "I",
        ).method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS->rawTextId(Ljava/lang/Object;)I
                    move-result v0
                    if-eqz v0, :original
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // 4. `mode == RTMP_URL` comparisons: normalise the compared register first.
        var normalised = 0
        rtmpComparisonClasses.forEach { className ->
            mutableClassDefBy(className).methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                val sites = instructions.withIndex().filter { (_, insn) ->
                    insn.opcode == Opcode.SGET_OBJECT &&
                        (insn as ReferenceInstruction).reference
                            .let { it is FieldReference && it.definingClass == MODE && it.name == "RTMP_URL" }
                }.map { it.index }
                sites.reversed().forEach { index ->
                    val constant = (method.getInstruction(index) as OneRegisterInstruction).registerA
                    val branch = (index + 1..minOf(index + 4, instructions.size - 1)).firstNotNullOfOrNull { i ->
                        val insn = method.getInstruction(i)
                        if (insn.opcode == Opcode.IF_NE || insn.opcode == Opcode.IF_EQ) insn as TwoRegisterInstruction else null
                    } ?: return@forEach
                    val compared = if (branch.registerA == constant) branch.registerB else branch.registerA
                    method.addInstructions(
                        index,
                        """
                            invoke-static { v$compared }, $EXTENSION_CLASS->normalize(Ljava/lang/Object;)Ljava/lang/Object;
                            move-result-object v$compared
                        """,
                    )
                    normalised++
                }
            }
        }
        if (normalised < 3) throw PatchException("Only $normalised RTMP_URL comparisons patched")

        // 5. Readiness: USB always, Wi-Fi once the URL field has a host.
        Fingerprint(
            definingClass = "Ljp/co/sony/mc/camera/view/viewmodel/CameraSettingsModel\$isStreamingConnectReady\$1;",
            name = "invoke",
            parameters = listOf(MODE, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
            returnType = "Ljava/lang/Boolean;",
        ).method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p1, p2 }, $EXTENSION_CLASS->readiness(Ljava/lang/Object;Ljava/lang/String;)I
                    move-result v0
                    if-eqz v0, :original
                    const/4 p1, 0x1
                    if-eq v0, p1, :ready
                    const/4 p1, 0x0
                    :ready
                    invoke-static { p1 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object p0
                    return-object p0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // 6. Start gate (throws NoWhenBranchMatchedException on unknown modes): answer for raw modes first.
        Fingerprint(
            definingClass = "Ljp/co/sony/mc/camera/setting/SettingAppearanceChecker;",
            name = "getKeyDialogForStreamingAvailable",
            parameters = listOf("Ljp/co/sony/mc/camera/setting/CameraSettingsHolder;"),
            returnType = DIALOG_ID,
        ).method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_CLASS->keyDialog(Ljava/lang/Object;)I
                    move-result v0
                    if-eqz v0, :original
                    const/4 p0, 0x1
                    if-ne v0, p0, :notSetUp
                    sget-object p0, $DIALOG_ID->DLG_INVALID:$DIALOG_ID
                    return-object p0
                    :notSetUp
                    sget-object p0, $DIALOG_ID->DUE_TO_STREAMING_SETTING_NOT_SETUP:$DIALOG_ID
                    return-object p0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
