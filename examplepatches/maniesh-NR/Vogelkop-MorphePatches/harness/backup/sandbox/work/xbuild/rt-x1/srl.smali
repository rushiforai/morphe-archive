.class public final Lsrl;
.super Lurl;
.source "SourceFile"


# instance fields
.field public final q:Li3j;


# direct methods
.method public constructor <init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;Li3j;)V
    .registers 8

    new-instance v0, Lnrl;

    iget-object v1, p1, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v1, v1, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/mainmenu/ToggleAnimationView;

    const v2, 0x7f13004a

    invoke-direct {v0, v1, v2}, Lnrl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;I)V

    invoke-direct {p0, p1, p2, p3, v0}, Lurl;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;Lnrl;)V

    iput-object p4, p0, Lsrl;->q:Li3j;

    return-void
.end method


# virtual methods
.method public final W()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final isEnabled()Z
    .registers 2

    iget-object p0, p0, Lurl;->o:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "compression"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final k0(Z)V
    .registers 3

    iget-object p0, p0, Lurl;->o:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "compression"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method

.method public final r0(Lqrl;)V
    .registers 10

    iget-object p0, p0, Lsrl;->q:Li3j;

    iget-object v0, p0, Li3j;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Li3j;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    const-string v2, "show_conflicting_settings_warning"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_55

    iget-object v1, p0, Li3j;->c:Ljava/lang/Object;

    check-cast v1, Lydn;

    iget-object v2, v1, Lydn;->d:Lvdn;

    iget-boolean v2, v2, Lvdn;->a:Z

    if-eqz v2, :cond_55

    iget-object v1, v1, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_55

    const v1, 0x7f14140d

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f14053c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Li3j;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const v1, 0x7f1409d3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Li3j;->d:Ljava/lang/Object;

    check-cast v0, Lz77;

    new-instance v2, Lql5;

    iget-object p0, p0, Li3j;->b:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Lcom/opera/android/settings/SettingsManager;

    move-object v7, p1

    invoke-direct/range {v2 .. v7}, Lql5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Lqrl;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_55
    move-object v7, p1

    invoke-virtual {v7}, Lqrl;->run()V

    return-void
.end method
