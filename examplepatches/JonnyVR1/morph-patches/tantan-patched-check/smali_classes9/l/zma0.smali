.class public Ll/zma0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public b:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/zma0;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/zma0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zma0;->k0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/zma0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zma0;->m0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/zma0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zma0;->l0()V

    return-void
.end method

.method public static synthetic h0(Ll/zma0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zma0;->n0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic n0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zma0;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vma0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/vma0;-><init>(Ll/zma0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;

    .line 5
    .line 6
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->n()Ljava/util/Calendar;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    long-to-double v3, v3

    .line 23
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/core/api/d0;->P3(D)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/wma0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/wma0;-><init>(Ll/zma0;)V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/xma0;

    .line 37
    .line 38
    invoke-direct {v2, p0}, Ll/xma0;-><init>(Ll/zma0;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->p()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "loop_input_type"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 16
    .line 17
    iput-object v0, p0, Ll/zma0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->v(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->k:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopBirthdayFrag;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->f5()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic k0(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/zma0;->b:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->m()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic l0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/zma0;->b:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->m()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m0(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/b;->s()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/yma0;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ll/yma0;-><init>(Ll/zma0;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xs(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public o0(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method
