package app.mctoolbox.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mctoolbox.patches.shared.Constants.COMPATIBILITY_MCTOOLBOX

@Suppress("unused")
val mctoolboxPremiumPatch = bytecodePatch(
    name = "Premium",
    description = "Enables premium features by bypassing in-app purchase verification.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MCTOOLBOX)

    execute {
        SubscribeBypassFingerprint.method.addInstructions(0, """
            move-object/from16 v10, p0
            move-object/from16 v11, p1
            move-object/from16 v12, p2
            check-cast v10, Lve0;
            iget-object v10, v10, Lve0;->b:Ltc0;
            iget-object v13, v10, Ltc0;->b:Lio/mrarm/mctoolbox/bridge/a;
            check-cast v13, Lio/mrarm/mctoolbox/bridge/b;
            const/4 v14, 0x1
            invoke-virtual {v10, v14}, Ltc0;->d(Z)V
            const-string v10, "internal/premium_unlocked"
            invoke-virtual {v13, v10, v14}, Lio/mrarm/mctoolbox/bridge/b;->R(Ljava/lang/String;Z)V
            iget-object v10, v13, Lio/mrarm/mctoolbox/bridge/b;->c:Lya0;
            invoke-virtual {v10, v14}, Lya0;->H(Z)V
            const/4 v10, 0x0
            invoke-static {v10}, Ln21;->e(Z)Z
            invoke-static {v11}, Lea2;->h(Landroid/content/Context;)Landroid/app/Activity;
            move-result-object v10
            if-eqz v10, :skip_toast
            const-string v14, "Premium activated!"
            const/4 v15, 0x1
            invoke-static {v10, v14, v15}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
            move-result-object v10
            invoke-virtual {v10}, Landroid/widget/Toast;->show()V
            :skip_toast
            new-instance v10, Landroid/view/KeyEvent;
            const/4 v14, 0x4
            const/4 v15, 0x1
            invoke-direct {v10, v14, v15}, Landroid/view/KeyEvent;-><init>(II)V
            invoke-virtual {v12}, Landroid/view/View;->getRootView()Landroid/view/View;
            move-result-object v11
            invoke-virtual {v11, v10}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z
            return-void
        """.trimIndent())
    }
}
