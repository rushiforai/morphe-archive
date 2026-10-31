package app.morphe.patches.tv360

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation

private const val HUAWEI16_ZOOM_OWNER = "Ln2/y;"
private const val HUAWEI16_RESIZE_VIEW = "Lcom/google/android/exoplayer2/ui/AspectRatioFrameLayout;"
private const val HUAWEI16_RESIZE_CALL = "$HUAWEI16_RESIZE_VIEW->setResizeMode(I)V"
private const val HUAWEI16_ZOOM_HELPER =
    "$HUAWEI16_ZOOM_OWNER->morpheHuawei16ForceZoom($HUAWEI16_RESIZE_VIEW" + "I)V"

/**
 * Huawei TV360 Bitel 1.6 (161): selectable player resize mode at patch time.
 *
 * Evidence from the user's unmodified APK, SHA-256
 * 0ba200d9e60d4808d4131cf612118ed5c449728c082600426816a94ab8057fbd:
 * Ln2/y;->a(Z)V has two invokes to AspectRatioFrameLayout.setResizeMode(I)V
 * in classes.dex. The first is immediately preceded by const/4 v0, 4;
 * the second invokes on v4 and passes v2. The value of v2 has not been
 * independently resolved, so this patch deliberately does NOT rewrite v2.
 *
 * For ZOOM, replace only the second invoke; the first is already ZOOM(4).
 * For FIT, replace both invokes so both branches receive resize mode 0.
 * All replacements are equal-width static invokes with identical registers.
 *
 * The selection is a MORPHE PATCH OPTION applied when building the APK,
 * not an in-player toggle or gesture. Changing it requires rebuilding.
 * Do not change ExoPlayer or player media assets.
 */
@Suppress("unused")
val tv360Huawei16StandardPlaybackZoomPatch = bytecodePatch(
    name = "TV360 Bitel 1.6 - Video Resize (Fit / Fill)",
    description = "Select FIT (no crop) or FILL (crop-to-fill) in Morphe before rebuilding the APK; not a runtime player menu.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))

    val resizeOption = stringOption(
        key = "tv360Huawei16ResizeMode",
        default = "fill",
        values = mapOf(
            "Ajustar (FIT, sin recorte)" to "fit",
            "Llenar pantalla (ZOOM, recorta bordes)" to "fill",
        ),
        title = "Modo de encuadre del video",
        description = "Se elige al parchear; para cambiarlo hay que generar otra APK.",
    )

    execute {
        val selectedMode = when (resizeOption.value) {
            "fit" -> 0
            "fill" -> 4
            else -> throw PatchException("Huawei 1.6 resize: invalid selection")
        }
        val method = Fingerprint(
            definingClass = HUAWEI16_ZOOM_OWNER,
            name = "a",
            returnType = "V",
            parameters = listOf("Z"),
        ).method
        val instructions = method.implementation?.instructions?.toList()
            ?: throw PatchException("Huawei 1.6 zoom: Ln2/y.a(Z) has no implementation")

        val calls = instructions.withIndex().filter { (_, insn) ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                (insn as? ReferenceInstruction)?.reference?.toString() == HUAWEI16_RESIZE_CALL
        }
        if (calls.size != 2) {
            throw PatchException(
                "Huawei 1.6 zoom: expected exactly two video resize calls, found ${calls.size}"
            )
        }

        val first = calls[0]
        val firstArgs = first.value as? FiveRegisterInstruction
            ?: throw PatchException("Huawei 1.6 zoom: first invoke is not 35c")
        if (firstArgs.registerCount != 2 || first.index < 1) {
            throw PatchException("Huawei 1.6 zoom: unexpected first invoke arguments")
        }
        val initial = instructions[first.index - 1]
        val initialReg = initial as? OneRegisterInstruction
            ?: throw PatchException("Huawei 1.6 zoom: missing first resize mode register")
        val initialLiteral = initial as? NarrowLiteralInstruction
            ?: throw PatchException("Huawei 1.6 zoom: missing first resize mode literal")
        if (initial.opcode != Opcode.CONST_4 ||
            initialReg.registerA != firstArgs.registerD ||
            initialLiteral.narrowLiteral != 4
        ) {
            throw PatchException("Huawei 1.6 zoom: expected first resize mode ZOOM (4)")
        }

        val second = calls[1]
        val secondArgs = second.value as? FiveRegisterInstruction
            ?: throw PatchException("Huawei 1.6 zoom: second invoke is not 35c")
        if (secondArgs.registerCount != 2 ||
            secondArgs.registerC != firstArgs.registerC ||
            secondArgs.registerD == firstArgs.registerD
        ) {
            throw PatchException("Huawei 1.6 zoom: unexpected second resize argument layout")
        }

        val owner = mutableClassDefBy(HUAWEI16_ZOOM_OWNER)
        if (owner.methods.any { it.name == "morpheHuawei16ForceZoom" }) {
            throw PatchException("Huawei 1.6 zoom: helper already exists")
        }
        val helper = ImmutableMethod(
            HUAWEI16_ZOOM_OWNER,
            "morpheHuawei16ForceZoom",
            listOf(
                ImmutableMethodParameter(HUAWEI16_RESIZE_VIEW, null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable()
        helper.addInstructions(
            0,
            """
            const/4 p1, 0x$selectedMode
            invoke-virtual {p0, p1}, $HUAWEI16_RESIZE_CALL
            return-void
            """.trimIndent(),
        )
        owner.methods.add(helper)

        // Both original invocations are 35c; static replacements keep DEX width.
        // FIT must also replace the first call, whose original literal is ZOOM(4).
        val replacements = if (selectedMode == 0) listOf(first, second) else listOf(second)
        for (target in replacements.sortedByDescending { it.index }) {
            val args = target.value as FiveRegisterInstruction
            method.replaceInstruction(
                target.index,
                "invoke-static {v${args.registerC}, v${args.registerD}}, $HUAWEI16_ZOOM_HELPER",
            )
        }
    }
}
