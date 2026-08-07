.class public Ll/t14;
.super Ll/z44;
.source "SourceFile"


# instance fields
.field public k:Ll/f24;

.field public l:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>(Ll/dum;Ll/zed0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/z44;-><init>(Ll/dum;Ll/n54;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n4(Ll/t14;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t14;->o4()V

    return-void
.end method


# virtual methods
.method public X3()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/z44;->X3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/n44;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/n44;->n()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->e1:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v2:I

    .line 26
    .line 27
    new-instance v2, Ll/s14;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/s14;-><init>(Ll/t14;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Ll/t14;->l:Lcom/p1/mobile/android/app/Dialog;

    .line 47
    .line 48
    return-void
.end method

.method public j4()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/z44;->j4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/z44;->S3()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/t14;->k:Ll/f24;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/f24;

    .line 12
    .line 13
    iget-object v1, p0, Ll/z44;->j:Ll/n54;

    .line 14
    .line 15
    check-cast v1, Ll/zed0;

    .line 16
    .line 17
    iget-object v1, v1, Ll/zed0;->l:Ll/nv2;

    .line 18
    .line 19
    invoke-direct {v0, p0, v1}, Ll/f24;-><init>(Ll/t14;Ll/nv2;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/t14;->k:Ll/f24;

    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/t14;->k:Ll/f24;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/f24;->d()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/z44;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/t14;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public l4()V
    .locals 2

    .line 1
    new-instance v0, Ll/c210;

    .line 2
    .line 3
    const/16 v1, 0x1130

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/c210;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/szl;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/szl;->f()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/t14;->l:Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    invoke-static {v0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/t14;->k:Ll/f24;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/f24;->b()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic o4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/z44;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/u54;->k(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/n44;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Ll/n44;->F(Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/n44;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Ll/n44;->F(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
