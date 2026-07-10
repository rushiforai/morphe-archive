package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.utsavrajput.patches.shared.Constants.COMPATIBILITY_MX_PLAYER
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
// ─────────────────────────────────────────────────────────────────────────
// Root cause:
// Tapping the top-right avatar opens MeTabOttActivity (the "Me"/Profile
// tab), which has a Settings entry buried inside it. This patch makes the
// avatar jump straight to Settings (ActivityPreferencesOnlineTheme),
// skipping MeTabOttActivity entirely.
//
// Discovery (MX Player 2.14.1):
// - Avatar view id: R.id.me_tab_entry_point, set up in Lo4b; (fragment
//   MXFatafatTabContainerFragment, shared toolbar header) onViewCreated():
//       findViewById(R.id.me_tab_entry_point)
//           .setOnClickListener(new <dispatcher>(this, 11))
// - <dispatcher> is a SHARED synthetic onClick class (`Lbl;` in 2.14.1,
//   matched structurally by AvatarClickDispatcherFingerprint above since
//   the class letter changes every build) that many unrelated click
//   sources route through via a packed-switch on instance field `b:I`
//   (case index) with captured object in field `c:Ljava/lang/Object;`.
// - Case 11 (current build) launches:
//     MeTabOttActivity$a;->a(Landroid/app/Activity;Landroid/os/Bundle;Ljava/lang/String;)V
//
// Why prepend instead of rewriting the switch:
// Lbl;->onClick is shared by ~20 unrelated features (case 0..20+).
// Rewriting/removing the packed-switch body is fragile since R8 reassigns
// case numbers on every rebuild. Instead we prepend a guard at offset 0
// (same dead-code-insertion approach as HideVideoOttTabPatch): if this
// listener instance's case index equals the avatar's case, launch
// Settings and return immediately - before the switch ever runs. Every
// other case is untouched, and the original avatar-case body becomes
// harmless dead code below our early return.
//
// Fragility - re-verify these against Fingerprints.kt/decompile on every
// MX Player version bump:
//   - avatarCaseIndex (11): re-derive by finding the case whose body calls
//     MeTabOttActivity$a;->a(...) and reading its packed-switch case value.
//   - synthetic field names `b` (case index, I) and `c` (captured object,
//     Ljava/lang/Object;) on the dispatcher class - R8-generated, can be
//     renamed on a fresh build. If this patch silently no-ops after an
//     update, check these first.
// ─────────────────────────────────────────────────────────────────────────

private const val AVATAR_CASE_INDEX = 11

@Suppress("unused")
val redirectAvatarToSettingsPatch = bytecodePatch(
    name = "Redirect avatar click to Settings",
    description = "Makes the top-right avatar open Settings directly instead of the Me/Profile tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)

    execute {
        val method = AvatarClickDispatcherFingerprint.method
        val dispatcherClass = method.definingClass
require(
    method.instructions.any { instruction ->
        (instruction as? ReferenceInstruction)?.reference?.toString()
            ?.contains("MeTabOttActivity") == true
    },
) {
    "MeTabOttActivity launch call not found inside the matched onClick " +
        "dispatcher - re-verify AvatarClickDispatcherFingerprint / " +
        "AVATAR_CASE_INDEX for this MX Player version."
}
        method.addInstructions(
            0,
            """
                iget v0, p0, $dispatcherClass->b:I
                const/16 v1, 0x${AVATAR_CASE_INDEX.toString(16)}
                if-ne v0, v1, :avatar_redirect_skip

                iget-object v0, p0, $dispatcherClass->c:Ljava/lang/Object;
                check-cast v0, Landroidx/fragment/app/Fragment;
                invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/m;
                move-result-object v1

                new-instance v2, Landroid/content/Intent;
                const-class v3, Lcom/mxtech/videoplayer/ad/local/ActivityPreferencesOnlineTheme;
                invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
                invoke-virtual {v1, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
                return-void

                :avatar_redirect_skip
                nop
            """,
        )
    }
}
