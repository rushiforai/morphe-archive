.class public Lcom/facebook/aura/main/AuraMainActivity;
.super Landroidx/fragment/app/FragmentActivity;

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugJsonBridge;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method
