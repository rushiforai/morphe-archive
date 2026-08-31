package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val simplifyNavigationPatch = bytecodePatch(
    name = "Simplify Navigation",
    description = "Removes the Templates, Inbox, and AI Lab bottom navigation tabs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        BaseMainActivityInitMainTab6InvokeFingerprint.method.addInstructions(
            0,
            """
                const/4 v1, 0x0
                const-class v0, Lcom/vega/ui/BadgeButton;
                const v2, 0x7f093824
                iget-object v3, p0, Lcom/vega/main/BaseMainActivity${'$'}initMainTab${'$'}6;->e:Lcom/vega/main/BaseMainActivity;
                invoke-virtual {v3, v3, v2, v0}, Lcom/vega/ui/start/BaseInfraActivity;->findViewByIdCached(Lcom/kanyun/kace/AndroidExtensionsBase;ILjava/lang/Class;)Landroid/view/View;
                move-result-object v5
                invoke-static {v5, v1}, Lcom/vega/infrastructure/extensions/ViewExtKt;->d(Landroid/view/View;Z)V
                const v2, 0x7f09384c
                invoke-virtual {v3, v3, v2, v0}, Lcom/vega/ui/start/BaseInfraActivity;->findViewByIdCached(Lcom/kanyun/kace/AndroidExtensionsBase;ILjava/lang/Class;)Landroid/view/View;
                move-result-object v5
                invoke-static {v5, v1}, Lcom/vega/infrastructure/extensions/ViewExtKt;->d(Landroid/view/View;Z)V
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )

        BaseMainActivityInitMainTab7InvokeFingerprint.method.addInstructions(
            0,
            """
                const/4 v1, 0x0
                const-class v0, Lcom/vega/ui/BadgeButton;
                const v2, 0x7f093842
                iget-object v3, p0, Lcom/vega/main/BaseMainActivity${'$'}initMainTab${'$'}7;->e:Lcom/vega/main/BaseMainActivity;
                invoke-virtual {v3, v3, v2, v0}, Lcom/vega/ui/start/BaseInfraActivity;->findViewByIdCached(Lcom/kanyun/kace/AndroidExtensionsBase;ILjava/lang/Class;)Landroid/view/View;
                move-result-object v5
                invoke-static {v5, v1}, Lcom/vega/infrastructure/extensions/ViewExtKt;->d(Landroid/view/View;Z)V
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )

        BaseMainActivityInitMainTab10InvokeFingerprint.method.addInstructions(
            0,
            """
                const/4 v1, 0x0
                const-class v0, Lcom/vega/ui/BadgeButton;
                const v2, 0x7f093818
                iget-object v3, p0, Lcom/vega/main/BaseMainActivity${'$'}initMainTab${'$'}10;->e:Lcom/vega/main/BaseMainActivity;
                invoke-virtual {v3, v3, v2, v0}, Lcom/vega/ui/start/BaseInfraActivity;->findViewByIdCached(Lcom/kanyun/kace/AndroidExtensionsBase;ILjava/lang/Class;)Landroid/view/View;
                move-result-object v5
                invoke-static {v5, v1}, Lcom/vega/infrastructure/extensions/ViewExtKt;->d(Landroid/view/View;Z)V
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )
    }
}
