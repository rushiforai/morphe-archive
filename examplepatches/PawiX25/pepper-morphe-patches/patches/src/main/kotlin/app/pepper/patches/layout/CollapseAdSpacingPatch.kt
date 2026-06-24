package app.pepper.patches.layout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.pepper.patches.ads.hideBannerAdsPatch
import app.pepper.patches.shared.PEPPER_FAMILY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Fix spacing around hidden ad cells in deal-detail RecyclerView
 *
 * Companion fix for [hideBannerAdsPatch]. When ad cells are collapsed to
 * `height=0` + zero margins, the section ItemDecoration `m07` still adds a
 * bottom offset under each ad AND paints a `shadow_divider` drawable on top
 * of the next view — RecyclerView ItemDecoration runs for every adapter
 * position regardless of view visibility. Result: doubled section gap and a
 * shadow line clipping the next subheader.
 *
 * Patch: insert two compact guards into m07.
 *
 *   • `getItemOffsets` (a()): if the row's view type matches small_ad /
 *     medium_ad / large_ad, write `Rect.set(0, 0, 0, 0)` and return. Skips
 *     the offset entirely for collapsed ad cells.
 *
 *   • `onDraw` (b()): inside the per-item iteration, if the type is an ad,
 *     branch to the existing "skip this item" target. Skips both the
 *     shadow_divider draw and the colored-rect paint for ad rows.
 *
 * Resource IDs are configurable per package — each Pepper variant has its
 * own `R.id.adapter_delegate_view_type_*_ad`. Defaults match Pepper PL; if
 * a regional build shifts the ID space, override via patch options.
 */
@Suppress("unused")
val collapseAdSpacingPatch = bytecodePatch(
    name = "Fix spacing around hidden ad cells",
    description = "Removes the empty space and shadow divider left behind by " +
        "hidden banner-ad cells in deal-detail screens.",
) {
    compatibleWith(*PEPPER_FAMILY)

    dependsOn(hideBannerAdsPatch)

    val smallAdViewTypeIdOpt by stringOption(
        key = "smallAdViewTypeId",
        default = "0x7f0a009e",
        title = "small_ad view-type R.id (hex)",
        description = "Resource ID of `adapter_delegate_view_type_small_ad`. " +
            "Default is correct for Pepper PL v8.12.00; look up the package's " +
            "value in res/values/public.xml if a future build shifts ID slots.",
        required = true,
    )

    val mediumAdViewTypeIdOpt by stringOption(
        key = "mediumAdViewTypeId",
        default = "0x7f0a0084",
        title = "medium_ad view-type R.id (hex)",
        description = "Resource ID of `adapter_delegate_view_type_medium_ad`.",
        required = true,
    )

    val largeAdViewTypeIdOpt by stringOption(
        key = "largeAdViewTypeId",
        default = "0x7f0a007c",
        title = "large_ad view-type R.id (hex)",
        description = "Resource ID of `adapter_delegate_view_type_large_ad`.",
        required = true,
    )

    execute {
        fun parseHex(s: String): Int =
            (if (s.startsWith("0x") || s.startsWith("0X")) s.substring(2) else s)
                .toLong(16).toInt()

        val smallId = parseHex(smallAdViewTypeIdOpt!!)
        val mediumId = parseHex(mediumAdViewTypeIdOpt!!)
        val largeId = parseHex(largeAdViewTypeIdOpt!!)

        val eMethod = ItemDecorationEFingerprint.method
        val aMethod = ItemDecorationGetItemOffsetsFingerprint.method
        val bMethod = ItemDecorationOnDrawFingerprint.method

        // All three fingerprints must converge on the same class. If they don't,
        // the obfuscated class layout has changed enough that re-checking is needed
        // before applying patches, rather than blindly modifying the wrong methods.
        val targetClass = eMethod.definingClass.toString()
        if (aMethod.definingClass.toString() != targetClass ||
            bMethod.definingClass.toString() != targetClass) {
            throw PatchException(
                "ItemDecoration fingerprints split across classes " +
                    "(e=${eMethod.definingClass}, a=${aMethod.definingClass}, " +
                    "b=${bMethod.definingClass}). The deal-detail decoration class " +
                    "may have been refactored — re-derive fingerprints."
            )
        }

        // ----- Patch a(): zero-offset guard --------------------------------
        // a()'s body has the pattern (right after the position-validation block):
        //
        //     invoke-virtual {p3, p2}, Lgm9;->c(I)I    # adapter.getItemViewType(pos)
        //     move-result p4                            # currentType
        //     add-int/lit8 p2, p2, 0x1                  # next position
        //
        // Two-step injection (avoids a trailing-label edge case in the inline
        // smali compiler — labels with no following instruction in the snippet
        // resolve unreliably, which silently broke an earlier inline goto-
        // around-zero-block layout):
        //
        //  1. Append a zero-block right before the method's final return-void:
        //         const/4 v0, 0x0
        //         invoke-virtual {p1, v0, v0, v0, v0}, Rect;->set(IIII)V
        //         return-void
        //  2. At the original guard position, inject the type-checking branches
        //     and bind their target externally to the zero-block's first
        //     instruction.
        //
        // .locals is 1 (only v0 is a local), so we reuse v0 — restoring its
        // `0` value at the end of the no-match fallthrough, since downstream
        // code expects v0 == 0 for the Rect.set(0, 0, 0, bottom) calls.
        val aImpl = aMethod.implementation
            ?: throw PatchException("getItemOffsets has no implementation")
        val aInsnsInitial = aImpl.instructions.toList()
        val aCurrTypeIdx = aInsnsInitial.findFirstAdapterGetItemViewTypePattern()
            ?: throw PatchException(
                "getItemOffsets: c(I)I + move-result + add-int/lit8 pattern not found"
            )
        val aCurrTypeReg = (aInsnsInitial[aCurrTypeIdx + 1] as OneRegisterInstruction).registerA

        // Locate the FINAL return-void of the method — the trailing one in the
        // method body, after all the original return paths. Inserting before it
        // preserves every existing branch target (none of them aim at the very
        // last instruction).
        val aLastReturnIdx = aInsnsInitial.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        if (aLastReturnIdx < 0) {
            throw PatchException("getItemOffsets has no return-void instruction")
        }

        aMethod.addInstructions(
            aLastReturnIdx,
            """
            const/4 v0, 0x0
            invoke-virtual { p1, v0, v0, v0, v0 }, Landroid/graphics/Rect;->set(IIII)V
            return-void
            """.trimIndent()
        )

        // After the append, the instruction at aLastReturnIdx is our newly-inserted
        // const/4 v0, 0x0 — the zero-block's first instruction, which is what we
        // want as the if-eq external branch target.
        val aZeroBlockStart = aImpl.instructions.toList()[aLastReturnIdx]

        aMethod.addInstructionsWithLabels(
            aCurrTypeIdx + 2,
            """
            const v0, $smallId
            if-eq v$aCurrTypeReg, v0, :collapse_ad_zero
            const v0, $mediumId
            if-eq v$aCurrTypeReg, v0, :collapse_ad_zero
            const v0, $largeId
            if-eq v$aCurrTypeReg, v0, :collapse_ad_zero
            const/4 v0, 0x0
            """.trimIndent(),
            ExternalLabel("collapse_ad_zero", aZeroBlockStart),
        )

        // ----- Patch b(): skip-draw guard ----------------------------------
        // b() iterates over visible items. Each iteration begins with:
        //
        //     invoke-virtual {v11, v15}, Lgm9;->c(I)I  # currentType lookup
        //     move-result v2                            # currentType in v2
        //     add-int/lit8 v3, v15, 0x1
        //     ...
        //     invoke-virtual {v7, v15}, ...->B(I)Landroid/view/View;  # getChildAt
        //     move-result-object v4
        //     if-eqz v4, :cond_2                        # null view → skip iteration
        //
        // We hook the same `:cond_2` "skip this iteration" target: if currentType
        // is an ad cell, jump there. That's the existing register-restore +
        // goto-loop-tail path, so we don't need to replicate it.
        val bImpl = bMethod.implementation
            ?: throw PatchException("onDraw has no implementation")
        val bInsns = bImpl.instructions.toList()
        val bCurrTypeIdx = bInsns.findFirstAdapterGetItemViewTypePattern()
            ?: throw PatchException(
                "onDraw: c(I)I + move-result + add-int/lit8 pattern not found"
            )
        val bCurrTypeReg = (bInsns[bCurrTypeIdx + 1] as OneRegisterInstruction).registerA

        // Locate the if-eqz that follows `move-result-object v4` from the
        // getChildAt call — its branch target IS `:cond_2`.
        val bGetChildAtIdx = bInsns.indexOfFirst { insn ->
            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                (insn as? ReferenceInstruction)?.reference?.toString()
                    ?.endsWith("->B(I)Landroid/view/View;") == true
        }
        if (bGetChildAtIdx < 0 || bGetChildAtIdx + 2 >= bInsns.size) {
            throw PatchException("onDraw: getChildAt + move-result-object + if-eqz pattern not found")
        }
        val ifeqz = bInsns[bGetChildAtIdx + 2] as? BuilderInstruction21t
            ?: throw PatchException(
                "onDraw: instruction after getChildAt move-result is not a builder if-eqz"
            )
        if (ifeqz.opcode != Opcode.IF_EQZ) {
            throw PatchException(
                "onDraw: expected if-eqz after getChildAt move-result, got ${ifeqz.opcode}"
            )
        }
        val skipIterationInsn = ifeqz.target.location.instruction
            ?: throw PatchException("onDraw: if-eqz branch target has no instruction")

        // .locals is 19 (v0..v18) so v6 is a free scratch register at this
        // point in the iteration body — overwritten by the original code only
        // later (when computing top-Y for the drawable bounds).
        bMethod.addInstructionsWithLabels(
            bCurrTypeIdx + 2,
            """
            const v6, $smallId
            if-eq v$bCurrTypeReg, v6, :collapse_ad_skip
            const v6, $mediumId
            if-eq v$bCurrTypeReg, v6, :collapse_ad_skip
            const v6, $largeId
            if-eq v$bCurrTypeReg, v6, :collapse_ad_skip
            """.trimIndent(),
            ExternalLabel("collapse_ad_skip", skipIterationInsn),
        )
    }
}

/**
 * Find the index of the FIRST `invoke-virtual {?, ?}, ?->c(I)I` followed by
 * `move-result vX` followed by `add-int/lit8 vY, ?, 0x1`. Returns the index
 * of the invoke-virtual itself, so callers read the move-result at idx+1 and
 * insert at idx+2.
 *
 * The "+1 increment after move-result" suffix anchors this to the
 * "currentType, then next position" pattern used by both a() and b()'s loop
 * — distinguishing it from any later `c(I)I` calls (which fetch nextType and
 * are immediately followed by other operations).
 */
private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>.findFirstAdapterGetItemViewTypePattern(): Int? {
    for (idx in 0 until size - 2) {
        val invoke = this[idx]
        if (invoke.opcode != Opcode.INVOKE_VIRTUAL) continue
        val ref = (invoke as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if (ref.name != "c") continue
        if (ref.parameterTypes.size != 1 || ref.parameterTypes[0].toString() != "I") continue
        if (ref.returnType != "I") continue
        if (this[idx + 1].opcode != Opcode.MOVE_RESULT) continue
        if (this[idx + 2].opcode != Opcode.ADD_INT_LIT8) continue
        return idx
    }
    return null
}
