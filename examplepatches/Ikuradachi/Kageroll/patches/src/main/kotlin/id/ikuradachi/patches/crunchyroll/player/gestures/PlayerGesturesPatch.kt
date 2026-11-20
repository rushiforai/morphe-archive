package id.ikuradachi.patches.crunchyroll.player.gestures

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private const val SWIPE_HELPER_CLASS = "Lid/ikuradachi/kageroll/extension/crunchyroll/SwipeGestureHelper;"
private const val MASK_BRIGHTNESS = 1
private const val MASK_VOLUME = 1 shl 1

@Suppress("unused")
val playerGesturesPatch = bytecodePatch(
    name = "Player gestures",
    description = "Enables pinch-to-zoom, double-tap-to-seek, and vertical swipe gestures for brightness and volume.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")
    extendWith("extensions/extension.mpe")

    val enablePinchToZoom = booleanOption(
        key = "enablePinchToZoom",
        default = true,
        title = "Enable pinch-to-zoom",
        description = "Allows pinching on the video player to zoom or cycle aspect modes.",
    )
    val enableDoubleTapToSeek = booleanOption(
        key = "enableDoubleTapToSeek",
        default = true,
        title = "Enable double-tap-to-seek",
        description = "Enables double-tapping the left or right side of the player to seek.",
    )
    val enableBrightnessSwipe = booleanOption(
        key = "enableBrightnessSwipe",
        default = true,
        title = "Enable brightness swipe",
        description = "Allows swiping vertically on the left side of the player to adjust screen brightness.",
    )
    val enableVolumeSwipe = booleanOption(
        key = "enableVolumeSwipe",
        default = true,
        title = "Enable volume swipe",
        description = "Allows swiping vertically on the right side of the player to adjust media volume.",
    )

    execute {
        // 1. Unlock remote feature gates on PlayerGesturesConfigImpl (pinch_to_zoom & double_tap_to_seek).
        if (enablePinchToZoom.value == true || enableDoubleTapToSeek.value == true) {
            val serializerClass = PlayerGesturesConfigDescriptorFingerprint.matchAll(1..1)
                .single()
                .originalClassDef
            val deserializeMethod = serializerClass.methods.single {
                it.name == "deserialize" && it.returnType == "Ljava/lang/Object;"
            }
            val configType = deserializeMethod.implementation!!.instructions
                .lastOrNull { it.opcode == Opcode.NEW_INSTANCE }
                ?.let { (it as ReferenceInstruction).reference.toString() }
                ?: error("Failed to resolve PlayerGesturesConfigImpl class from serializer")

            val configClass = mutableClassDefBy(configType)
            val initWithFlags = configClass.methods.single {
                it.name == "<init>" && it.parameterTypes.map { p -> p.toString() } == listOf("I", "Z", "Z")
            }
            val booleanFields = initWithFlags.implementation!!.instructions
                .filter { it.opcode == Opcode.IPUT_BOOLEAN }
                .map { (it as ReferenceInstruction).reference as FieldReference }
                .distinctBy { it.name }
            check(booleanFields.size == 2) {
                "Expected 2 boolean fields in $configType.<init>(IZZ), found ${booleanFields.size}"
            }

            val pinchFieldName = booleanFields[0].name
            val seekFieldName = booleanFields[1].name

            val boolGetters = configClass.methods.filter {
                it.returnType == "Z" &&
                    it.parameterTypes.isEmpty() &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                    !AccessFlags.STATIC.isSet(it.accessFlags)
            }
            check(boolGetters.size == 2) {
                "Expected 2 boolean getter methods in $configType, found ${boolGetters.size}"
            }

            for (getter in boolGetters) {
                val fieldRead = getter.implementation!!.instructions
                    .firstOrNull { it.opcode == Opcode.IGET_BOOLEAN }
                    ?.let { ((it as ReferenceInstruction).reference as FieldReference).name }
                    ?: error("Missing IGET_BOOLEAN in $configType.${getter.name}")

                val shouldEnable = when (fieldRead) {
                    pinchFieldName -> enablePinchToZoom.value == true
                    seekFieldName -> enableDoubleTapToSeek.value == true
                    else -> error("Unexpected boolean field $fieldRead in $configType.${getter.name}")
                }

                if (shouldEnable) {
                    check(getter.implementation!!.registerCount >= 1) {
                        "Insufficient registers in $configType.${getter.name}"
                    }
                    getter.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """.trimIndent(),
                    )
                }
            }
        }

        // 2. Configure and attach vertical brightness/volume swipe handler + HUD.
        var swipeMask = 0
        if (enableBrightnessSwipe.value == true) swipeMask = swipeMask or MASK_BRIGHTNESS
        if (enableVolumeSwipe.value == true) swipeMask = swipeMask or MASK_VOLUME

        val maskMethod = SwipeGestureHelperMaskFingerprint.matchAll(1..1).single().method
        check(maskMethod.implementation!!.registerCount >= 1) {
            "Insufficient registers in SwipeGestureHelper.getEnabledSwipeMask"
        }
        maskMethod.addInstructions(
            0,
            """
                const/4 v0, 0x${swipeMask.toString(16)}
                return v0
            """.trimIndent(),
        )

        if (swipeMask != 0) {
            val bindMatch = PlayerGesturesBindFingerprint.matchAll(1..1).single()
            val bindMethod = bindMatch.method
            val bindInstructions = bindMethod.implementation!!.instructions
            val setOnTouchIdx = bindMatch.instructionMatches[1].index
            check(bindInstructions[setOnTouchIdx + 1].opcode == Opcode.RETURN_VOID) {
                "Expected RETURN_VOID after setOnTouchListener in PlayerGesturesLayout.h5"
            }
            bindMethod.addInstructions(
                setOnTouchIdx + 1,
                "invoke-static {p0}, $SWIPE_HELPER_CLASS->attach(Landroid/view/ViewGroup;)V",
            )

            val onTouchMatch = PlayerGesturesOnTouchFingerprint.matchAll(1..1).single()
            val onTouchMethod = onTouchMatch.method
            val onTouchImpl = onTouchMethod.implementation!!
            check(onTouchImpl.registerCount >= 4) {
                "Unexpected register count in u10.c0.onTouch: ${onTouchImpl.registerCount}"
            }
            val igetMatch = onTouchMatch.instructionMatches[0]
            val layoutReg = igetMatch.getInstruction<TwoRegisterInstruction>().registerA
            check(layoutReg in 0..15) {
                "Layout register out of range in u10.c0.onTouch: v$layoutReg"
            }
            val insertIdx = igetMatch.index + 1
            val resumeInstr = onTouchImpl.instructions[insertIdx]
            onTouchMethod.addInstructionsWithLabels(
                insertIdx,
                """
                    invoke-static {v$layoutReg, p2}, $SWIPE_HELPER_CLASS->onTouch(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z
                    move-result v0
                    if-eqz v0, :normal_touch
                    const/4 v0, 0x1
                    return v0
                """.trimIndent(),
                ExternalLabel("normal_touch", resumeInstr),
            )
        }
    }
}
