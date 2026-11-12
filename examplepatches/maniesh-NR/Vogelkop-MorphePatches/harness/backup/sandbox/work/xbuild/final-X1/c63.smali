.class public abstract Lc63;
.super Landroidx/fragment/app/i;
.source "SourceFile"


# instance fields
.field public final a:Lgjm;

.field public final b:Lqcf;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lgjm;Lqcf;Ljava/lang/Object;)V
    .registers 4

    invoke-direct {p0}, Landroidx/fragment/app/i;-><init>()V

    iput-object p1, p0, Lc63;->a:Lgjm;

    iput-object p2, p0, Lc63;->b:Lqcf;

    iput-object p3, p0, Lc63;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public abstract g0(Landroid/os/Bundle;)Landroid/app/Dialog;
.end method

.method public abstract h0()Ljava/lang/Class;
.end method

.method public i0(Z)V
    .registers 2

    return-void
.end method

.method public final j0(Ljava/lang/Object;)V
    .registers 3

    iget-object v0, p0, Lc63;->d:Ljava/lang/Object;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iput-object p1, p0, Lc63;->d:Ljava/lang/Object;

    invoke-virtual {p0}, Lc63;->h0()Ljava/lang/Class;

    move-result-object v0

    iget-object p0, p0, Lc63;->a:Lgjm;

    invoke-virtual {p0, v0, p1}, Lgjm;->h(Ljava/lang/Class;Ljava/lang/Object;)V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Landroidx/fragment/app/i;->getDialog()Landroid/app/Dialog;

    move-result-object p1

    if-eqz p1, :cond_21

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v0, 0x1f4

    if-lt p1, v0, :cond_1d

    const/4 p1, 0x1

    goto :goto_1e

    :cond_1d
    const/4 p1, 0x0

    :goto_1e
    invoke-virtual {p0, p1}, Lc63;->i0(Z)V

    :cond_21
    return-void
.end method

.method public final onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4

    invoke-virtual {p0, p1}, Lc63;->g0(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object p1

    iget-object v0, p0, Lc63;->b:Lqcf;

    invoke-interface {v0, p1}, Lqcf;->a(Landroid/app/Dialog;)V

    new-instance v0, Lkz0;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lkz0;-><init>(Ljava/lang/Object;Landroid/app/Dialog;B)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    return-object p1
.end method

.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onDismiss(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lc63;->c:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lc63;->j0(Ljava/lang/Object;)V

    return-void
.end method
