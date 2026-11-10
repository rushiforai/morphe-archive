// recon 2026-11-09
package app.template.patches.ivy.quickpanel

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal object QuickPanelViewFrameInAnimFingerprint : Fingerprint(
 name = "frameInAnim",
 definingClass = "Lcom/stinger/ivy/quickpanel/QuickPanelView;",
 returnType = "Landroid/view/animation/Animation;",
 accessFlags = listOf(AccessFlags.PUBLIC),
 parameters = listOf(),
 filters = listOf(
  methodCall(definingClass = "Lcom/stinger/ivy/utils/AnimationUtils;", name = "getAnimation"),
 ),
)

internal object QuickPanelViewFrameOutAnimFingerprint : Fingerprint(
 name = "frameOutAnim",
 definingClass = "Lcom/stinger/ivy/quickpanel/QuickPanelView;",
 returnType = "Landroid/view/animation/Animation;",
 accessFlags = listOf(AccessFlags.PUBLIC),
 parameters = listOf("Landroid/view/View;"),
 filters = listOf(
  methodCall(definingClass = "Lcom/stinger/ivy/utils/AnimationUtils;", name = "getAnimation"),
 ),
)

internal object QuickPanelViewRibbonsInAnimFingerprint : Fingerprint(
 name = "ribbonsInAnim",
 definingClass = "Lcom/stinger/ivy/quickpanel/QuickPanelView;",
 returnType = "Landroid/view/animation/Animation;",
 accessFlags = listOf(AccessFlags.PUBLIC),
 parameters = listOf(),
 filters = listOf(
  methodCall(definingClass = "Lcom/stinger/ivy/utils/AnimationUtils;", name = "getAnimation"),
 ),
)

internal object QuickPanelViewRibbonsOutAnimFingerprint : Fingerprint(
 name = "ribbonsOutAnim",
 definingClass = "Lcom/stinger/ivy/quickpanel/QuickPanelView;",
 returnType = "Landroid/view/animation/Animation;",
 accessFlags = listOf(AccessFlags.PUBLIC),
 parameters = listOf(),
 filters = listOf(
  methodCall(definingClass = "Lcom/stinger/ivy/utils/AnimationUtils;", name = "getAnimation"),
 ),
)
