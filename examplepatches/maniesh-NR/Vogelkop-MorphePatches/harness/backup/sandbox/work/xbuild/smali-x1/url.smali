.class public abstract Lurl;
.super Lk8;
.source "SourceFile"


# instance fields
.field public final o:Lcom/opera/android/settings/SettingsManager;

.field public final p:Lnrl;


# direct methods
.method public constructor <init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lcom/opera/android/settings/SettingsManager;Lnrl;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lk8;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;)V

    iput-object p3, p0, Lurl;->o:Lcom/opera/android/settings/SettingsManager;

    iput-object p4, p0, Lurl;->p:Lnrl;

    return-void
.end method


# virtual methods
.method public final B()V
    .registers 1

    invoke-virtual {p0}, Lurl;->s0()V

    return-void
.end method

.method public final s0()V
    .registers 3

    invoke-virtual {p0}, Lk8;->q0()V

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    invoke-virtual {p0}, Lk8;->isEnabled()Z

    move-result v1

    iput-boolean v1, v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->c:Z

    invoke-virtual {v0}, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a()V

    invoke-virtual {p0}, Lk8;->isEnabled()Z

    move-result v0

    iget-object p0, p0, Lurl;->p:Lnrl;

    iget-boolean v1, p0, Lnrl;->a:Z

    if-eq v0, v1, :cond_24

    iput-boolean v0, p0, Lnrl;->a:Z

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/mainmenu/ToggleAnimationView;

    iget-object v1, p0, Ln2d;->m:Lp2d;

    if-nez v1, :cond_25

    :cond_24
    return-void

    :cond_25
    if-eqz v0, :cond_2a

    sget-object v0, Lnrl;->c:Lk2d;

    goto :goto_2c

    :cond_2a
    sget-object v0, Lnrl;->d:Lk2d;

    :goto_2c
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final y(Z)V
    .registers 2

    invoke-virtual {p0}, Lurl;->s0()V

    return-void
.end method
