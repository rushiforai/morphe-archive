// recon 2026-11-09
package app.template.patches.ivy.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.IVY_COMPATIBILITY
import app.template.patches.shared.returnEarly

@Suppress("unused")
val ivyAdsPatch = bytecodePatch(
 name = "Remove ads",
 description = "Removes AdMob initialization and the quick panel ad view.",
 default = true,
) {
 compatibleWith(IVY_COMPATIBILITY)

 execute {
  // attachInfo normally delegates to zzabg.attachInfo, which calls
  // zzamj.initialize before onCreate. Keep the provider attached, but skip that delegate.
  MobileAdsInitProviderAttachInfoFingerprint.method.addInstructions(
   0,
   """
   invoke-super {v1, v2, v3}, Landroid/content/ContentProvider;->attachInfo(Landroid/content/Context;Landroid/content/pm/ProviderInfo;)V
   return-void
   """.trimIndent(),
  )

  // zzabg.onCreate() returns false, so mirror the normal return value.
  MobileAdsInitProviderOnCreateFingerprint.method.returnEarly(false)

  // IvyApplication.onCreate():
  // 0021 const-string "ca-app-pub-..."
  // 0022 invoke-static MobileAds.initialize(...)
  // 0023 return-void
  // Returning immediately before instruction 22 skips only the MobileAds call.
  IvyApplicationOnCreateAdFingerprint.method.addInstructions(22, "return-void")

  // QuickPanelView.onFinishInflate():
  // 0044 iput-object mAdView
  // 0045 new-instance AdRequest$Builder
  // Inject at 45: hide the AdView, then return before any ad request is built.
  QuickPanelViewOnFinishInflateAdFingerprint.method.addInstructions(
   45,
   """
   iget-object v0, v2, Lcom/stinger/ivy/quickpanel/QuickPanelView;->mAdView:Lcom/google/android/gms/ads/AdView;
   const/16 v1, 8
   invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
   return-void
   """.trimIndent(),
  )
 }
}
