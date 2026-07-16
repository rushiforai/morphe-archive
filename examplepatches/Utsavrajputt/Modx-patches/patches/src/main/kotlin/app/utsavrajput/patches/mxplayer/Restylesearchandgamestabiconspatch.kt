package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.utsavrajput.patches.shared.Constants.COMPATIBILITY_MX_PLAYER
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Swaps the native bottom-nav icons for the Search->Tools / Games->About
 * tabs by calling directly into the extension module's own
 * IconAssets.modxLogo() / IconAssets.aboutNormal() at runtime.
 *
 * ATTEMPT HISTORY (why this version looks the way it does):
 * 1. Resource-file byte replace (rawResourcePatch on the vector .xml) —
 *    crashed the BUILD: Morphe's resource encoder (ArsclibResourceCoder /
 *    AaptMacroProcessor) XML-parses every *.xml resource file before
 *    repackaging, so raw PNG bytes inside a .xml-named entry blew up with
 *    "unterminated entity ref".
 * 2. New raster resource + <bitmap> wrapper pointing at it — built fine,
 *    but the new @drawable reference was never actually resolved (this
 *    build's resource coder doesn't do full aapt2-style linking/ID
 *    assignment for brand-new resource names), so the icon silently
 *    stayed the old vector.
 * 3. Bytecode: fingerprint Ley7;->c() (HomeTabHelper, the method that
 *    actually renders each tab icon) and inject an override right after
 *    its ImageView.setImageDrawable() call — this compiled and installed,
 *    but caused `VerifyError: target dex pc 0x.. is not at instruction
 *    start` at app launch. Root cause: this method already contains
 *    internal branches (if/goto) from its original logic, and inserting
 *    instructions in the *middle* of the method (not at index 0) does not
 *    get those pre-existing branch targets recalculated by this
 *    patcher's addInstructions — every previously-working patch in this
 *    project only ever prepends at index 0 for exactly this reason.
 *
 * THIS VERSION avoids all three problems: no resource files are touched
 * at all, and the injected bytecode goes into Ln4d;->j0() — the same
 * onResume-triggered method CaptureTabHostPatch already prepends to
 * safely — strictly at index 0, with straight-line code only (no
 * internal branches), which is the only injection pattern proven stable
 * in this codebase.
 *
 * Mechanism: Ln4d; (HomeTabFragment) holds one ViewGroup field per bottom
 * tab (confirmed via the O1() dispatcher mapping found earlier: Games ->
 * field `y`, Search -> field `A`). Each tab's icon ImageView lives inside
 * that container at a fixed child resource id (0x7f0a0886, confirmed via
 * the findViewById() call inside Ley7;->c() that originally locates it).
 * So: grab the container from Ln4d;, findViewById() the icon inside it,
 * and setImageBitmap() our own artwork on it directly — same visual
 * result as patching the render method, without touching its bytecode.
 *
 * Runs on every onResume (same firing point as CaptureTabHostPatch), so
 * the override re-applies any time the tab bar is redrawn — no worse than
 * a possible one-frame flash of the original icon on first render.
 *
 * Requires extendWith("extensions/core.mpe") (declared in
 * RepurposeSearchAndGamesTabsPatch) so IconAssets is present in the
 * merged DEX at runtime.
 */
object TabHostResumeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == "Ln4d;" && method.name == "j0"
    },
)

val restyleSearchAndGamesTabIconsPatch = bytecodePatch(
    name = "Restyle Search/Games tab icons to Tools/About",
    description = "Overrides the native Search/Games bottom-nav icons with the Modx Tools/About artwork.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)
    extendWith("extensions/core.mpe")

    execute {
        TabHostResumeFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Ln4d;->A:Landroid/view/ViewGroup;
                const v1, 0x7f0a0886
                invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v0
                check-cast v0, Landroid/widget/ImageView;
                invoke-static {}, Lapp/utsavrajput/extension/IconAssets;->modxLogo()Landroid/graphics/Bitmap;
                move-result-object v1
                invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
                const v1, 0xff9e9e9e
                sget-object v2, Landroid/graphics/PorterDuff${'$'}Mode;->SRC_IN:Landroid/graphics/PorterDuff${'$'}Mode;
                invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff${'$'}Mode;)V

                iget-object v0, p0, Ln4d;->y:Landroid/view/ViewGroup;
                const v1, 0x7f0a0886
                invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
                move-result-object v0
                check-cast v0, Landroid/widget/ImageView;
                invoke-static {}, Lapp/utsavrajput/extension/IconAssets;->aboutNormal()Landroid/graphics/Bitmap;
                move-result-object v1
                invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
            """,
        )
    }
}
