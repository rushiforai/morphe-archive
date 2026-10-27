package app.template.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_MX_PLAYER_AD
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val removeBottomBarPatch = bytecodePatch(
    name = "Remove bottom navigation bar",
    description = "Removes the bottom navigation bar from the UI and moves Me to the upper-right " +
        "corner of the Home toolbar. Leave unchecked to keep the bottom navigation bar.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER_AD)

    dependsOn(mxIntegrityCorePatch)

    execute {
        val localTabClass = LocalTabOnCreateFingerprint.classDef
        val baseMediaClass = BaseMediaPrepareMenuFingerprint.classDef

        // Locate bottom bar container field `J:Landroid/view/ViewGroup;` from `a1()V`.
        val showBarMethod = localTabClass.requireMethod("a1", "V", emptyList())
        val barFieldRef = showBarMethod.instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? FieldReference }
            .firstOrNull { it.definingClass == localTabClass.type && it.type == "Landroid/view/ViewGroup;" }
            ?: throw PatchException("Failed to locate bottom bar ViewGroup field on ${localTabClass.type}")

        val onCreateMethod = localTabClass.requireMethod("Q", "V", listOf("Landroid/os/Bundle;"))
        val selectInitialTabMethod = localTabClass.requireMethod("O0", "V", listOf("Z"))

        // 1. Force `O0(Z)V` to always select the Local ("Folders") tab even if a previous
        //    session stored "me", "transfer", or "localmusic" in SharedPreferences/Intent.
        for ((idx, insn) in selectInitialTabMethod.instructions.withIndex()) {
            val str = ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string ?: continue
            if (str == "tabName_mx" || str == "tab") {
                val reg = (insn as OneRegisterInstruction).registerA
                selectInitialTabMethod.replaceInstruction(idx, "const-string v$reg, \"_mx_force_local\"")
            }
        }

        // 2. Keep bottom bar `J` hidden (`View.GONE` = 0x8) across `Q(Bundle)`, `a1()`, `T0(ZZ)`,
        //    and the action-mode exit `()V` method (`x` in 3.3.1, `v` in 3.4.0/3.4.1).
        onCreateMethod.appendBeforeReturnVoid(
            """
                iget-object v0, p0, $barFieldRef
                if-eqz v0, :cond_bar_done
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                :cond_bar_done
            """.trimIndent(),
        )

        localTabClass.replaceMethodBody(
            method = showBarMethod,
            localRegisters = 2,
            smaliInstructions = """
                iget-object v0, p0, $barFieldRef
                if-eqz v0, :done
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                :done
                return-void
            """.trimIndent(),
        )

        val resumeBarMethod = localTabClass.requireMethod("T0", "V", listOf("Z", "Z"))
        resumeBarMethod.addInstructions(0, "const/4 p1, 0x1")

        val exitActionModeMethod = localTabClass.methods.firstOrNull { candidate ->
            val insns = candidate.implementation?.instructions?.toList() ?: return@firstOrNull false
            candidate.name != "a1" &&
                candidate.parameterTypes.isEmpty() &&
                candidate.returnType == "V" &&
                insns.size <= 20 &&
                insns.any { insn ->
                    val fRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
                    fRef == barFieldRef
                } &&
                insns.any { insn ->
                    val mRef = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    mRef?.name == "setVisibility" && mRef.parameterTypes == listOf("I")
                }
        } ?: throw PatchException("Failed to locate action-mode bottom bar method on ${localTabClass.type}")
        val setVisIdx = exitActionModeMethod.instructions.indexOfFirst { insn ->
            val mRef = (insn as? ReferenceInstruction)?.reference as? MethodReference
            mRef?.name == "setVisibility" && mRef.parameterTypes == listOf("I")
        }
        val visReg = (exitActionModeMethod.getInstruction(setVisIdx) as FiveRegisterInstruction).registerD
        exitActionModeMethod.addInstructions(setVisIdx, "const/16 v$visReg, 0x8")

        // 3. Resolve `R.id.account` and `MediaListFragment.isRoot()` (`Q9` in 3.3.1, `N9` in 3.4.x)
        //    dynamically from `ActivityMediaList.Z(Menu)Z`.
        val baseZMethod = BaseMediaPrepareMenuFingerprint.method
        val baseZInsns = baseZMethod.instructions
        val findItemIdx = baseZInsns.indexOfFirst { insn ->
            val mRef = (insn as? ReferenceInstruction)?.reference as? MethodReference
            mRef?.definingClass == "Landroid/view/Menu;" &&
                mRef.name == "findItem" &&
                mRef.parameterTypes == listOf("I")
        }
        if (findItemIdx < 2) {
            throw PatchException("Menu->findItem(I) not found in ${baseMediaClass.type}->Z(Menu)Z")
        }
        val accountIdLiteral = (searchBackLiteral(baseZInsns, findItemIdx)
            ?: throw PatchException("Failed to resolve R.id.account literal in ${baseMediaClass.type}->Z"))

        val isRootMethodRef = baseZInsns
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
            .firstOrNull {
                it.definingClass == MEDIA_LIST_FRAGMENT_CLASS &&
                    it.parameterTypes.isEmpty() &&
                    it.returnType == "Z"
            } ?: throw PatchException("Failed to resolve MediaListFragment isRoot() method in ${baseMediaClass.type}->Z")

        val accountIdHex = "0x${accountIdLiteral.toUInt().toString(16)}"
        val meIconResId = resolveMeNormalIconResId(TabTypeClinitFingerprint.originalClassDef)
        val meIconHex = "0x${meIconResId.toUInt().toString(16)}"

        // 4. In `LocalTab.X0(Menu)V`:
        //    - Resolve `TabType.ME`'s `normalIcon` drawable ID at patch time (`TabType.normalIcon` is
        //      `private final int`, so runtime `iget` from another class would throw `IllegalAccessError`).
        //    - `nop` the stock `Apps.j(p1, R.id.account, false)` call so it never hides `R.id.account`.
        //    - Inject our clean icon-only `Me` item setup at index `0` where `v0..v5` are completely
        //      uninitialized (`UNINIT`) and original instructions `0..1` immediately re-initialize
        //      `v0` and `v1` afterwards, while `<BaseMedia>->H0()V` tints `Me` to match the toolbar.
        val updateMenuMethod = localTabClass.requireMethod("X0", "V", listOf("Landroid/view/Menu;"))
        val accountConstIdx = updateMenuMethod.instructions.indexOfLast { insn ->
            insn.opcode == Opcode.CONST &&
                (insn as? NarrowLiteralInstruction)?.narrowLiteral == accountIdLiteral
        }
        if (accountConstIdx < 0 || accountConstIdx + 1 >= updateMenuMethod.instructions.size) {
            throw PatchException("R.id.account Menu toggle not found in ${localTabClass.type}->X0(Menu)V")
        }
        val hideAccountCall = (updateMenuMethod.getInstruction(accountConstIdx + 1) as? ReferenceInstruction)
            ?.reference as? MethodReference
        if (hideAccountCall?.definingClass != "Lcom/mxtech/app/Apps;" || hideAccountCall.name != "j") {
            throw PatchException("Unexpected instruction after R.id.account const in ${localTabClass.type}->X0(Menu)V: $hideAccountCall")
        }
        updateMenuMethod.replaceInstruction(accountConstIdx + 1, "nop")
        updateMenuMethod.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :cond_skip_me_icon
                const v0, $accountIdHex
                invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;
                move-result-object v0
                if-eqz v0, :cond_skip_me_icon
                const/4 v1, 0x0
                invoke-interface {v0, v1}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;
                const-string v1, ""
                invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
                const v1, $meIconHex
                invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;
                const/4 v1, 0x2
                invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V
                iget-object v1, p0, Lcom/mxtech/videoplayer/b;->b:Lcom/mxtech/videoplayer/ad/ActivityWelcomeMX;
                invoke-virtual {v1}, Lcom/mxtech/videoplayer/ActivityList;->y6()Landroidx/fragment/app/Fragment;
                move-result-object v1
                const/4 v2, 0x1
                instance-of v3, v1, $AD_MEDIA_LIST_FRAGMENT_CLASS
                if-eqz v3, :cond_apply_me_vis
                check-cast v1, $AD_MEDIA_LIST_FRAGMENT_CLASS
                invoke-virtual {v1}, $isRootMethodRef
                move-result v2
                :cond_apply_me_vis
                invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;
            """.trimIndent(),
            ExternalLabel("cond_skip_me_icon", updateMenuMethod.getInstruction(0)),
        )

        // 5. Wire `LocalTab.X(MenuItem)Z` (`onOptionsItemSelected`) for `R.id.account` to
        //    `BaseMedia.O()V`, which launches `MXLocalMePageActivity` (the Me page).
        val menuClickMethod = localTabClass.requireMethod("X", "Z", listOf("Landroid/view/MenuItem;"))
        menuClickMethod.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :cond_normal_menu_click
                invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I
                move-result v0
                const v1, $accountIdHex
                if-ne v0, v1, :cond_normal_menu_click
                invoke-virtual {p0}, ${baseMediaClass.type}->O()V
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
            ExternalLabel("cond_normal_menu_click", menuClickMethod.getInstruction(0)),
        )
    }
}

private fun searchBackLiteral(
    insns: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    fromIdx: Int,
): Int? {
    for (idx in (fromIdx - 1) downTo (fromIdx - 6).coerceAtLeast(0)) {
        val lit = insns[idx] as? NarrowLiteralInstruction ?: continue
        if (insns[idx].opcode == Opcode.CONST) return lit.narrowLiteral
    }
    return null
}
