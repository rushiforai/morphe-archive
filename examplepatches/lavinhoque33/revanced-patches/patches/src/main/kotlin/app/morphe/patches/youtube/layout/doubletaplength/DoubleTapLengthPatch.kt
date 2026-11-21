package app.morphe.patches.youtube.layout.doubletaplength

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.youtube.player.components.doubleTapInfoConstructorFingerprint
import app.morphe.patches.youtube.player.components.doubleTapInfoFloatFingerprint
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.Constants.PLAYER_PATH
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.CUSTOM_DOUBLE_TAP_LENGTH
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.ResourceGroup
import app.morphe.util.Utils.printWarn
import app.morphe.util.copyResources
import app.morphe.util.findElementByAttributeValueOrThrow
import app.morphe.util.fingerprint.matchOrNull
import app.morphe.util.valueOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val DURATION = "Lj$/time/Duration;"
private const val EXTENSION = "$PLAYER_PATH/DoubleTapSeekPatch;"
private const val MAX_SEEK_SECONDS = Int.MAX_VALUE / 1_000

private var directionalSeekAvailable = false

private val directionalSeekBytecodePatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)

    execute {
        directionalSeekAvailable = false
        val constructor = doubleTapInfoConstructorFingerprint.matchOrNull(doubleTapInfoFloatFingerprint)?.method
        val storeIndex = constructor?.durationStoreIndex()
        if (constructor == null || storeIndex == null) {
            printWarn("Directional double-tap seek is unavailable: the native gesture duration store was not found.")
            return@execute
        }

        // The gesture record supplies the same signed duration to seeking and the cumulative overlay.
        // The event and direction have already been saved, so p1/p2 can hold the wide factory argument.
        constructor.addInstructionsWithLabels(
            storeIndex,
            """
                invoke-static {p2}, $EXTENSION->getOverrideSeconds(I)I
                move-result p2
                if-eqz p2, :store_duration
                int-to-long p1, p2
                invoke-static {p1, p2}, $DURATION->ofSeconds(J)$DURATION
                move-result-object p4
            """,
            ExternalLabel("store_duration", constructor.getInstruction(storeIndex))
        )
        directionalSeekAvailable = true
    }
}

/** Match the constructor's parameter stores, even if the independent chapter hook was applied first. */
private fun MutableMethod.durationStoreIndex(): Int? {
    val body = implementation ?: return null
    val instructions = body.instructions
    val stores = listOf(
        Opcode.IPUT_OBJECT to "Landroid/view/MotionEvent;",
        Opcode.IPUT to "I",
        Opcode.IPUT_BOOLEAN to "Z",
        Opcode.IPUT_OBJECT to DURATION,
    )
    val firstStore = instructions.size - stores.size - 1
    if (firstStore < 0 || instructions.last().opcode != Opcode.RETURN_VOID) return null

    val receiver = body.registerCount - 5
    stores.forEachIndexed { offset, (opcode, type) ->
        val store = instructions[firstStore + offset] as? TwoRegisterInstruction ?: return null
        val field = store.getReference<FieldReference>() ?: return null
        if (store.opcode != opcode || field.definingClass != definingClass || field.type != type ||
            store.registerA != receiver + offset + 1 || store.registerB != receiver
        ) {
            return null
        }
    }

    return firstStore + stores.lastIndex
}

@Suppress("unused")
val doubleTapLengthPatch = resourcePatch(
    CUSTOM_DOUBLE_TAP_LENGTH.title,
    CUSTOM_DOUBLE_TAP_LENGTH.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(settingsPatch, directionalSeekBytecodePatch)

    val doubleTapLengthArraysOption = stringOption(
        key = "doubleTapLengthArrays",
        default = "3, 5, 10, 15, 20, 30, 60, 120, 180",
        title = "Double-tap to seek values",
        description = "A comma-separated list of seek lengths in seconds for the YouTube and RVX settings.",
        required = true,
    )

    execute {
        val lengths = doubleTapLengthArraysOption.valueOrThrow().split(",").map { value ->
            value.trim().toIntOrNull()?.takeIf { it in 1..MAX_SEEK_SECONDS }
                ?: throw PatchException("Invalid double-tap seek length (seconds): '$value'")
        }

        copyResources("youtube/doubletap", ResourceGroup("values-v21", "arrays.xml"))
        appendSeekLengths(
            "res/values-v21/arrays.xml",
            "double_tap_length_entries",
            "double_tap_length_values",
            lengths
        )

        if (directionalSeekAvailable) {
            appendSeekLengths(
                "res/values/arrays.xml",
                "revanced_double_tap_seek_length_entries",
                "revanced_double_tap_seek_length_entry_values",
                lengths,
                suffix = " s"
            )
            addPreference(arrayOf("PREFERENCE_SCREEN: PLAYER", "SETTINGS: DIRECTIONAL_DOUBLE_TAP_SEEK"))
        }

        addPreference(CUSTOM_DOUBLE_TAP_LENGTH)
    }
}

private fun ResourcePatchContext.appendSeekLengths(
    path: String,
    entriesName: String,
    valuesName: String,
    lengths: List<Int>,
    suffix: String = "",
) {
    document(path).use { document ->
        val arrays = document.documentElement.childNodes
        val entries = arrays.findElementByAttributeValueOrThrow("name", entriesName)
        val values = arrays.findElementByAttributeValueOrThrow("name", valuesName)

        lengths.forEach { length ->
            val seconds = length.toString()
            entries.appendChild(document.createElement("item").apply { textContent = seconds + suffix })
            values.appendChild(document.createElement("item").apply { textContent = seconds })
        }
    }
}
