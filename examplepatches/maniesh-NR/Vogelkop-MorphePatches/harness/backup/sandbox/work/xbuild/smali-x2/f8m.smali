.class public final Lf8m;
.super Lryl;
.source "SourceFile"

# interfaces
.implements Ljbl;


# static fields
.field public static e:Ls14;


# instance fields
.field public final c:Ls14;

.field public final d:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ls14;)V
    .registers 3

    invoke-direct {p0}, Lryl;-><init>()V

    iput-object p2, p0, Lf8m;->c:Ls14;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lf8m;->d:Landroid/net/Uri;

    sget-object p0, Lf8m;->e:Ls14;

    if-eqz p0, :cond_1e

    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lmgh;

    iget-object p1, p0, Lmgh;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/api/Callback;

    if-eqz p1, :cond_1e

    const-string p1, "2fa error"

    invoke-virtual {p0, p1}, Lmgh;->e(Ljava/lang/Object;)V

    :cond_1e
    sput-object p2, Lf8m;->e:Ls14;

    return-void
.end method


# virtual methods
.method public final onActivityResult(IILandroid/content/Intent;)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    invoke-virtual {p0}, Lryl;->g0()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1}, Lryl;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Landroid/content/Intent;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f010049

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    move-result-object v0

    iget-object v1, p0, Lf8m;->d:Landroid/net/Uri;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const v1, 0xf00e

    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0, p1, v1, v0}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lryl;->onDestroy()V

    sget-object v0, Lf8m;->e:Ls14;

    iget-object p0, p0, Lf8m;->c:Ls14;

    if-ne v0, p0, :cond_c

    const/4 v0, 0x0

    sput-object v0, Lf8m;->e:Ls14;

    :cond_c
    iget-object p0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast p0, Lmgh;

    iget-object v0, p0, Lmgh;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    if-nez v0, :cond_17

    return-void

    :cond_17
    const-string v0, "2fa error"

    invoke-virtual {p0, v0}, Lmgh;->e(Ljava/lang/Object;)V

    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "two-factor-authentication"

    return-object p0
.end method
