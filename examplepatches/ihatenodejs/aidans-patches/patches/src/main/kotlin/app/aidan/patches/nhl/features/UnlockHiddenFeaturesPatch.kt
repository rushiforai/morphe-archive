package app.aidan.patches.nhl.features

import app.aidan.patches.nhl.shared.COMPATIBILITY_NHL
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val unlockHiddenFeaturesPatch = bytecodePatch(
    name = "Unlock Hidden Features",
    description = "Unlocks the internal Developer Settings menu, Draft Mini Tracker, and NHL GameZone on the Home surface, with independent options for each feature.",
    default = false
) {
    category("Features")
    compatibleWith(COMPATIBILITY_NHL)

    val enableDeveloperSettings = booleanOption(
        key = "enableDeveloperSettings",
        title = "Enable Developer Tools & Settings",
        description = "Unlocks the internal Developer Settings screen inside Settings (Environment switcher, Analytics Debugger, String Key Overlay, Mock Localization, Invalidate Cache, and Ad Inspector), and activates the nhl://setAPI deep link.",
        default = false
    )

    val enableDraftMiniTracker = booleanOption(
        key = "enableDraftMiniTracker",
        title = "Enable Draft Mini Tracker",
        description = "Forces the shipped Draft Mini Tracker visibility gate on; tracker content still depends on NHL draft data.",
        default = true
    )

    val showGameZoneOnHome = booleanOption(
        key = "showGameZoneOnHome",
        title = "Show GameZone on Home",
        description = "Forces the shipped NHL GameZone Home visibility gate on; web content and authentication remain server-controlled.",
        default = true
    )

    execute {
        if (enableDeveloperSettings.value == true) {
            forceDeveloperSettingsEnabled()
        }
        if (enableDraftMiniTracker.value == true) {
            forceDraftMiniTrackerEnabled()
        }
        if (showGameZoneOnHome.value == true) {
            forceGameZoneShownOnHome()
        }
    }
}

private fun BytecodePatchContext.forceDeveloperSettingsEnabled() {
    val gateClass = mutableClassDefByOrNull("Llpk;")
    val gateMethod = gateClass?.methods?.singleOrNull { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.name == "a" &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "Z"
    } ?: throw PatchException("Missing required method Llpk.a()Z (developer mode gate)")

    val implementation = gateMethod.implementation
        ?: throw PatchException("Missing required method Llpk.a()Z (developer mode gate)")

    gateMethod.addInstructions(
        0,
        """
        const/4 v0, 0x0
        return v0
        """.trimIndent()
    )
}

private fun BytecodePatchContext.forceDraftMiniTrackerEnabled() {
    val draftClass = mutableClassDefByOrNull("Loi5;")
        ?: throw PatchException("Missing required class Loi5 (DraftConfigResponse)")

    val hasField = draftClass.fields.any { field ->
        field.name == "a" && field.type == "Z"
    }
    if (!hasField) {
        throw PatchException("Missing required field Loi5.a:Z (isMiniTrackerActive)")
    }

    val constructor = draftClass.methods.singleOrNull { method ->
        method.name == "<init>" &&
            method.parameterTypes == listOf("I", "Z", "Lfva;", "Lfva;", "Lfva;") &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required constructor Loi5.<init>(IZLfva;Lfva;Lfva;)V")

    val implementation = constructor.implementation
        ?: throw PatchException("DraftConfigResponse constructor has no implementation")
    val returnIndices = implementation.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_VOID) index else null
    }
    if (returnIndices.isEmpty()) {
        throw PatchException("Unexpected DraftConfigResponse constructor terminator")
    }

    for (returnIndex in returnIndices.asReversed()) {
        constructor.addInstructions(
            returnIndex,
            """
            const/4 v0, 0x1
            iput-boolean v0, p0, Loi5;->a:Z
            """.trimIndent()
        )
    }
}

private fun BytecodePatchContext.forceGameZoneShownOnHome() {
    val gameZoneClass = mutableClassDefByOrNull("Lhv7;")
        ?: throw PatchException("Missing required class Lhv7 (GameZoneConfigResponse)")

    val hasField = gameZoneClass.fields.any { field ->
        field.name == "a" && field.type == "Ljava/lang/Boolean;"
    }
    if (!hasField) {
        throw PatchException("Missing required field Lhv7.a:Ljava/lang/Boolean; (showOnHome)")
    }

    val constructor = gameZoneClass.methods.singleOrNull { method ->
        method.name == "<init>" &&
            method.parameterTypes == listOf("I", "Ljava/lang/Boolean;", "Ljava/lang/String;") &&
            method.returnType == "V"
    } ?: throw PatchException("Missing required constructor Lhv7.<init>(ILjava/lang/Boolean;Ljava/lang/String;)V")

    val implementation = constructor.implementation
        ?: throw PatchException("GameZoneConfigResponse constructor has no implementation")

    val returnIndices = implementation.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .reversed()

    if (returnIndices.isEmpty()) {
        throw PatchException("GameZoneConfigResponse constructor has no return instructions")
    }

    for (returnIdx in returnIndices) {
        constructor.addInstructions(
            returnIdx,
            """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            iput-object v0, p0, Lhv7;->a:Ljava/lang/Boolean;
            """.trimIndent()
        )
    }
}
