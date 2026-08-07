.class public Ll/a3l;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/i3l;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/a3l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e0(Ll/a3l;Ll/q2l;Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a3l;->o0(Ll/q2l;Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->S0:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Ll/a3l;Ll/q2l;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a3l;->q0(Ll/q2l;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic i0(Ll/a3l;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a3l;->r0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->t1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k0(Ll/a3l;Ll/q2l;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a3l;->p0(Ll/q2l;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final l0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "enter_hide_avatar_config"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Ll/a3l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final m0(Ll/q2l;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->R:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1}, Ll/p2l;->a(Ll/q2l;)Landroid/text/SpannableString;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 30
    .line 31
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->x:I

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ll/v2l;

    .line 38
    .line 39
    invoke-direct {v2, p0, p1}, Ll/v2l;-><init>(Ll/a3l;Ll/q2l;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 47
    .line 48
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->a:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final n0(Ll/q2l;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/q2l;->g()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->unEquipUserRight(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/w2l;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/w2l;-><init>(Ll/a3l;Ll/q2l;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/x2l;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/x2l;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic o0(Ll/q2l;Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->T0:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/i3l;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, p1, v1}, Ll/i3l;->f(Ll/q2l;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ll/a3l;->x0(Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic p0(Ll/q2l;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/q2l;->g()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->equipUserRight(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/y2l;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/y2l;-><init>(Ll/a3l;Ll/q2l;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/z2l;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/z2l;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic q0(Ll/q2l;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->u1:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Ll/a3l;->x0(Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/i3l;

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-virtual {p0, p1, p2}, Ll/i3l;->f(Ll/q2l;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic r0(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i3l;

    .line 4
    .line 5
    iget-object p0, p0, Ll/a3l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0}, Ll/i3l;->j(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public s0(Ll/q2l;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/q2l;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/a3l;->n0(Ll/q2l;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Ll/q2l;->h()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/a3l;->m0(Ll/q2l;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public t0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a3l;->l0(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/a3l;->u0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a3l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getHideAvatarRight(Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/t2l;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/t2l;-><init>(Ll/a3l;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/u2l;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/u2l;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final x0(Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;->flush:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/a3l;->u0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
