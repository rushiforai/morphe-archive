// recon 2026-11-09
package app.template.patches.ivy.offline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.IVY_COMPATIBILITY
import app.template.patches.shared.returnEarly

@Suppress("unused")
val ivyOfflinePatch = bytecodePatch(
 name = "Force offline",
 description = "Disables Firebase and RSS network fetches.",
 default = true,
) {
 compatibleWith(IVY_COMPATIBILITY)

 execute {
  // FirebaseApp.initializeApp(): return null before FirebaseOptions is read.
  FirebaseAppInitializeAppFingerprint.method.addInstructions(
   0,
   """
   const/4 v0, 0
   return-object v0
   """.trimIndent(),
  )

  // FirebaseHelper.<clinit>: return before FirebaseDatabase.getInstance().
  FirebaseHelperClinitFingerprint.method.addInstructions(0, "return-void")

  // FirebaseHelper.getHelpItems(): notify the listener with null, then return.
  FirebaseHelperGetHelpItemsFingerprint.method.addInstructions(
   0,
   """
   const/4 v0, 0
   invoke-interface {v2, v0}, Lcom/stinger/ivy/firebase/FirebaseHelper${'$'}DataListener;->onDataChange(Ljava/lang/Object;)V
   return-void
   """.trimIndent(),
  )

  // FirebaseHelper.getRssItems(): notify the listener with null, then return.
  FirebaseHelperGetRssItemsFingerprint.method.addInstructions(
   0,
   """
   const/4 v0, 0
   invoke-interface {v3, v0}, Lcom/stinger/ivy/firebase/FirebaseHelper${'$'}DataListener;->onDataChange(Ljava/lang/Object;)V
   return-void
   """.trimIndent(),
  )

  // RssCrawl.updateFeed(): return before RssReader network fetch.
  RssCrawlUpdateFeedFingerprint.method.returnEarly()

  // RssDialogHelper.lambda$customDialog$5: return before RssReader network fetch.
  RssDialogHelperCustomDialogFingerprint.method.returnEarly()
 }
}
