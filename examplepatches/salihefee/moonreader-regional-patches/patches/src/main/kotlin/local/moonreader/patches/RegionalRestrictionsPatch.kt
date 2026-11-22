package local.moonreader.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val REGION_MESSAGE = "This version works for Russian & Belarusian paid users only."
internal const val EXPIRY_MESSAGE = "It's expired, please install the new version instead."

private object RegionalStartupFingerprint : Fingerprint(
    definingClass = "Lcom/flyersoft/moonreaderp/ActivityMain;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf(REGION_MESSAGE, EXPIRY_MESSAGE),
)

/** Match relationships between instructions, never absolute offsets or a particular cutoff date. */
internal object RegionalChecks {
    private fun BuilderInstruction.stringValue() =
        ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun BuilderInstruction.calls(owner: String, name: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
        return opcode.name.startsWith("invoke-") && ref.definingClass == owner && ref.name == name
    }

    private fun uniqueString(instructions: List<BuilderInstruction>, value: String): Int {
        val matches = instructions.indices.filter { instructions[it].stringValue() == value }
        require(matches.size == 1) { "Expected one restriction message: $value; found ${matches.size}. Unsupported or already-patched APK." }
        return matches.single()
    }

    private fun exitBlock(instructions: List<BuilderInstruction>, message: Int, target: Int): Boolean {
        if (target !in (message + 2)..minOf(message + 12, instructions.lastIndex)) return false
        val block = instructions.subList(message + 1, target)
        return block.any { it.calls("Lcom/flyersoft/tools/T;", "showToastText") } &&
            block.any { it.calls("Lcom/flyersoft/moonreaderp/ActivityMain;", "finish") } &&
            block.any { it.opcode == Opcode.RETURN_VOID }
    }

    private fun registerResultMatches(instructions: List<BuilderInstruction>, branch: Int): Boolean =
        branch >= 1 && instructions[branch - 1].opcode == Opcode.MOVE_RESULT &&
            (instructions[branch - 1] as OneRegisterInstruction).registerA ==
            (instructions[branch] as? OneRegisterInstruction)?.registerA

    /** Validate both checks before mutating either one. */
    fun apply(method: MutableMethod) {
        val implementation = requireNotNull(method.implementation) { "Startup method has no code" }
        val instructions = implementation.instructions.toList()
        val regionMessage = uniqueString(instructions, REGION_MESSAGE)
        val expiryMessage = uniqueString(instructions, EXPIRY_MESSAGE)
        require(regionMessage < expiryMessage) { "Restriction order changed; refusing to patch" }
        val regionStart = maxOf(0, regionMessage - 64)
        val regionWindow = instructions.subList(regionStart, regionMessage)
        require(regionWindow.any { it.calls("Ljava/util/Locale;", "getCountry") } &&
            regionWindow.any { it.calls("Ljava/util/Locale;", "getLanguage") } &&
            regionWindow.any { it.stringValue() == "ru" } &&
            regionWindow.any { it.stringValue() == "be" }) {
            "Regional locale check changed; refusing to patch"
        }
        val regionBranches = (regionStart until regionMessage).filter { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.IF_NEZ && index >= 2 &&
                registerResultMatches(instructions, index) &&
                instructions[index - 2].calls("Ljava/lang/String;", "equalsIgnoreCase") &&
                exitBlock(instructions, regionMessage, (instruction as BuilderOffsetInstruction).target.location.index)
        }
        require(regionBranches.isNotEmpty()) { "No recognized regional acceptance branch; refusing to patch" }
        val regionTargets = regionBranches.map {
            (instructions[it] as BuilderOffsetInstruction).target.location.index
        }.distinct()
        require(regionTargets.size == 1 && regionTargets.single() < expiryMessage) {
            "Ambiguous regional acceptance branches; refusing to patch"
        }
        val expiryBranches = (maxOf(2, expiryMessage - 20) until expiryMessage).filter { index ->
            val instruction = instructions[index]
            instruction.opcode == Opcode.IF_EQZ && registerResultMatches(instructions, index) &&
                instructions[index - 2].calls("Ljava/util/Date;", "after") &&
                exitBlock(instructions, expiryMessage, (instruction as BuilderOffsetInstruction).target.location.index)
        }
        require(expiryBranches.size == 1) { "Expected one fixed-date acceptance branch; refusing to patch" }
        for (index in listOf(regionBranches.first(), expiryBranches.single())) {
            val branch = instructions[index] as BuilderOffsetInstruction
            implementation.replaceInstruction(index, BuilderInstruction20t(Opcode.GOTO_16, branch.target))
        }
    }
}

@Suppress("unused")
val removeRegionalRestrictionsPatch = patch(
    name = "Remove regional and expiration restrictions",
    description = "Allow any device locale and remove the fixed expiration cutoff in the regional Moon+ Reader Pro build. Stops if the expected checks are missing or ambiguous. Download the original regional APK from https://moondownload.com/ (mrp_ru_arm64.apk or mrp_ru_universal.apk), then select I already have an APK in Manager.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Moon+ Reader Pro (regional build)",
        packageName = "com.flyersoft.moonreaderp",
        description = "Get the original APK at https://moondownload.com/ under the Russian & Belarusian paid users section: mrp_ru_arm64.apk (tested) or mrp_ru_universal.apk (untested).",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x274B72,
        targets = listOf(
            AppTarget(version = "10.8", description = "Download the regional APK from https://moondownload.com/: mrp_ru_arm64.apk (tested) or mrp_ru_universal.apk (untested)."),
            AppTarget(version = null, isExperimental = true),
        ),
    ))
    execute { RegionalChecks.apply(RegionalStartupFingerprint.method) }
}
