// recon 2026-11-09
package app.template.patches.ivy.quickpanel

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.IVY_COMPATIBILITY

@Suppress("unused")
val ivyQuickPanelNoTransitionPatch = bytecodePatch(
 name = "Remove Quick Panel transition animation",
 description = "Forces the Quick Panel frame, ribbon and edge-slide animations to finish instantly while keeping the animation listeners that set the panel visible.",
 default = true,
) {
 compatibleWith(IVY_COMPATIBILITY)

 execute {
  // frameInAnim(): set the loaded animation duration to 0 ms.
  QuickPanelViewFrameInAnimFingerprint.method.addInstructions(
   7,
   """
   const-wide/16 v1, 0
   invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V
   return-object v0
   """.trimIndent(),
  )

  // frameOutAnim(): set the loaded animation duration to 0 ms.
  QuickPanelViewFrameOutAnimFingerprint.method.addInstructions(
   7,
   """
   const-wide/16 v0, 0
   invoke-virtual {v3, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V
   return-object v3
   """.trimIndent(),
  )

  // ribbonsInAnim(): set the loaded animation duration to 0 ms.
  QuickPanelViewRibbonsInAnimFingerprint.method.addInstructions(
   8,
   """
   const-wide/16 v1, 0
   invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V
   return-object v0
   """.trimIndent(),
  )

  // ribbonsOutAnim(): set the loaded animation duration to 0 ms.
  QuickPanelViewRibbonsOutAnimFingerprint.method.addInstructions(
   8,
   """
   const-wide/16 v1, 0
   invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V
   return-object v0
   """.trimIndent(),
  )
 }
}
