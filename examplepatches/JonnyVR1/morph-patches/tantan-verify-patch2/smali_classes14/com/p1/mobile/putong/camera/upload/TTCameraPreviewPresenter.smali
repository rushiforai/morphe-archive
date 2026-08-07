.class public Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ovh0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/camera/TTCameraConfig;

.field public final b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

.field public c:Lcom/p1/mobile/putong/camera/upload/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/camera/upload/a<",
            "Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/zuh0;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/camera/TTCameraConfig;Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;)V
    .locals 6
    .param p2    # Lcom/p1/mobile/putong/camera/TTCameraConfig;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/camera/upload/a;

    .line 5
    .line 6
    new-instance v3, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-direct {v3, p1, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;-><init>(Ljava/util/HashMap;Ll/kvh0;)V

    .line 10
    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    const-string v5, "preferences"

    .line 14
    .line 15
    const-class v1, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;

    .line 16
    .line 17
    const-string v2, "camera_video_map"

    .line 18
    .line 19
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/camera/upload/a;-><init>(Ljava/lang/Class;Ljava/lang/String;Lcom/p1/mobile/putong/camera/upload/a$a;ZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->c:Lcom/p1/mobile/putong/camera/upload/a;

    .line 23
    .line 24
    new-instance p1, Ll/zuh0;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/zuh0;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->d:Ll/zuh0;

    .line 30
    .line 31
    invoke-static {}, Ll/xth0;->f()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->e:Ljava/lang/String;

    .line 36
    .line 37
    iput-object p2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->a:Lcom/p1/mobile/putong/camera/TTCameraConfig;

    .line 38
    .line 39
    iput-object p3, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->r0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->t0()V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->x0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->u0()V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->s0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->q0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->y0(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ovh0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ovh0;->destroy()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/xth0;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->c:Lcom/p1/mobile/putong/camera/upload/a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/a;->a()Lcom/p1/mobile/putong/camera/upload/a$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->a(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;)Ljava/util/HashMap;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_1

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 42
    .line 43
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->s(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->p(Z)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->q(Z)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_1
    return v1
.end method

.method public o0()V
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->d:Ll/zuh0;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->h()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->e:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Ll/zuh0;->n(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/dvh0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/dvh0;-><init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/evh0;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/evh0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public p0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/bvh0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/bvh0;-><init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ll/cvh0;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/cvh0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic q0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->s(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->p(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->q(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/ovh0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ovh0;->s()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->h:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/ovh0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ovh0;->s()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/ovh0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ovh0;->u()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final synthetic s0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->c:Lcom/p1/mobile/putong/camera/upload/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/a;->a()Lcom/p1/mobile/putong/camera/upload/a$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;

    .line 8
    .line 9
    invoke-static {v0, p2, p1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;->b(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter$LocalUrlMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->c:Lcom/p1/mobile/putong/camera/upload/a;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/camera/upload/a;->b(Lcom/p1/mobile/putong/camera/upload/a$a;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic t0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ovh0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ovh0;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ovh0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ovh0;->j()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic x0(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x3e8

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/16 v0, 0x3e9

    .line 13
    .line 14
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/camera/upload/b;->a()Lcom/p1/mobile/putong/camera/upload/b;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Lcom/p1/mobile/putong/camera/upload/b$b;

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-direct {v2, v3, v0, p1}, Lcom/p1/mobile/putong/camera/upload/b$b;-><init>(IILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/camera/upload/b;->c(Lcom/p1/mobile/putong/camera/upload/b$b;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/ovh0;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/ovh0;->l(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic y0(Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x3e8

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/16 v0, 0x3e9

    .line 13
    .line 14
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/camera/upload/b;->a()Lcom/p1/mobile/putong/camera/upload/b;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    new-instance v2, Lcom/p1/mobile/putong/camera/upload/b$b;

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-direct {v2, v3, v0, v4}, Lcom/p1/mobile/putong/camera/upload/b$b;-><init>(IILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/camera/upload/b;->c(Lcom/p1/mobile/putong/camera/upload/b$b;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Ll/ovh0;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/ovh0;->k(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public z0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->f()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->n()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/16 v0, 0x3e8

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/16 v0, 0x3e9

    .line 25
    .line 26
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/camera/upload/b;->a()Lcom/p1/mobile/putong/camera/upload/b;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Lcom/p1/mobile/putong/camera/upload/b$b;

    .line 31
    .line 32
    const/4 v3, 0x2

    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-direct {v2, v3, v0, v4}, Lcom/p1/mobile/putong/camera/upload/b$b;-><init>(IILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/camera/upload/b;->c(Lcom/p1/mobile/putong/camera/upload/b$b;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/ovh0;

    .line 43
    .line 44
    new-instance v0, Ljava/lang/RuntimeException;

    .line 45
    .line 46
    const-string v1, "file path is null or empty"

    .line 47
    .line 48
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/ovh0;->k(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->l()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->n()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->d:Ll/zuh0;

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->f()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v2, Ll/fvh0;

    .line 78
    .line 79
    invoke-direct {v2, p0}, Ll/fvh0;-><init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v0, v2}, Ll/zuh0;->s(Ljava/lang/String;Ll/z20;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    goto :goto_1

    .line 87
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->f()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v1, v0}, Ll/zuh0;->r(Ljava/lang/String;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    goto :goto_1

    .line 98
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->n()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->d:Ll/zuh0;

    .line 103
    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->f()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v1, v0}, Ll/zuh0;->p(Ljava/lang/String;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    goto :goto_1

    .line 117
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;->b:Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewConfig;->f()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v1, v0}, Ll/zuh0;->o(Ljava/lang/String;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    :goto_1
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    new-instance v1, Ll/gvh0;

    .line 140
    .line 141
    invoke-direct {v1, p0}, Ll/gvh0;-><init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ll/hvh0;

    .line 149
    .line 150
    invoke-direct {v1, p0}, Ll/hvh0;-><init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    new-instance v1, Ll/ivh0;

    .line 158
    .line 159
    invoke-direct {v1, p0}, Ll/ivh0;-><init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V

    .line 160
    .line 161
    .line 162
    new-instance v2, Ll/jvh0;

    .line 163
    .line 164
    invoke-direct {v2, p0}, Ll/jvh0;-><init>(Lcom/p1/mobile/putong/camera/upload/TTCameraPreviewPresenter;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 172
    .line 173
    .line 174
    return-void
.end method
