.class public final Lrrl;
.super Lurl;
.source "SourceFile"


# instance fields
.field public final q:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;)V
    .registers 7

    new-instance v0, Lnrl;

    iget-object v1, p1, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v1, v1, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/mainmenu/ToggleAnimationView;

    const v2, 0x7f130049

    invoke-direct {v0, v1, v2}, Lnrl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;I)V

    invoke-direct {p0, p1, p2, p3, v0}, Lurl;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;Lnrl;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lrrl;->q:Z

    return-void
.end method


# virtual methods
.method public final isEnabled()Z
    .registers 2

    iget-boolean v0, p0, Lrrl;->q:Z

    if-eqz v0, :cond_10

    iget-object p0, p0, Lurl;->o:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "ad_blocking"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final k0(Z)V
    .registers 4

    if-eqz p1, :cond_1f

    iget-boolean v0, p0, Lrrl;->q:Z

    if-nez v0, :cond_1f

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance p1, Lgpk;

    const/16 v0, 0x1a

    invoke-direct {p1, v0}, Lgpk;-><init>(B)V

    const v0, 0x7f14008b

    const v1, 0x7f14008a

    invoke-static {p0, p1, v0, v1}, Lxf8;->s0(Landroid/content/Context;Lekj;II)V

    return-void

    :cond_1f
    iget-object p0, p0, Lurl;->o:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "ad_blocking"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method
