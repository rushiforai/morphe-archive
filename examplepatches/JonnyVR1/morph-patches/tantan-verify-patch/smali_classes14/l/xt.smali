.class public Ll/xt;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/du;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/data/Gender;

.field public i:Ljava/lang/String;

.field public j:Z

.field public k:I

.field public l:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Picture;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Video;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z

.field public p:Z

.field public q:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/xt;->p:Z

    .line 6
    .line 7
    return-void
.end method

.method private synthetic P0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/du;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/du;->w()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ll/nt;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/nt;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic f0(Ll/xt;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->F0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/xt;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->H0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic h0(Ll/xt;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->G0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic i0(Ll/xt;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->I0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j0(Ll/xt;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xt;->P0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/xt;Ll/cvx;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->J0(Ll/cvx;)V

    return-void
.end method

.method public static synthetic l0(Ll/v2i0;)Ll/ewi;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ewi;->b(Ll/v2i0;)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m0(Ll/xt;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->Q0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic n0(Ll/xt;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->L0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic o0(Ll/v2i0;)Ll/ewi;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ewi;->b(Ll/v2i0;)Ll/ewi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p0(Ll/xt;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->N0(Ll/x20;)V

    return-void
.end method

.method public static synthetic q0(Ll/xt;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->S0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic r0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->l()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic t0(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    new-instance v1, Ll/lt;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/lt;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static synthetic u0(Ll/xt;Ll/cvx;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xt;->R0(Ll/cvx;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic x0(Ll/xt;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xt;->O0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic y0(Ll/xt;Ll/cvx;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xt;->U0(Ll/cvx;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic z0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/FacebookApi;->t()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method


# virtual methods
.method public A0(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Picture;",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xt;->l:Ll/qcj;

    .line 2
    .line 3
    return-void
.end method

.method public C0(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Video;",
            "Ljava/io/File;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xt;->m:Ll/qcj;

    .line 2
    .line 3
    return-void
.end method

.method public D0(Ll/ewi;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/du;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/du;->M(Ll/ewi;)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Ll/xt;->f:I

    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    sget-object v0, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 15
    .line 16
    iget-object p1, p1, Ll/ewi;->b:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->y(Ljava/lang/String;Z)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v0, Ll/uxj0;->b:Ll/y20;

    .line 24
    .line 25
    new-instance v1, Ll/ot;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/ot;-><init>(Ll/xt;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/du;

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    invoke-virtual {p1, v0}, Ll/du;->B(Z)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast v0, Ll/du;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ll/du;->s(Ll/ewi;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p0, Ll/du;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/du;->u()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public E0(IZZZZILjava/lang/String;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;ZLl/uyh0;IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ll/xt;->a:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/xt;->b:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/xt;->c:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Ll/xt;->d:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Ll/xt;->e:Z

    .line 10
    .line 11
    iput p6, p0, Ll/xt;->f:I

    .line 12
    .line 13
    iput-object p7, p0, Ll/xt;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p8, p0, Ll/xt;->h:Lcom/p1/mobile/putong/data/Gender;

    .line 16
    .line 17
    iput-object p9, p0, Ll/xt;->i:Ljava/lang/String;

    .line 18
    .line 19
    iput-boolean p10, p0, Ll/xt;->j:Z

    .line 20
    .line 21
    iput p12, p0, Ll/xt;->k:I

    .line 22
    .line 23
    iput-boolean p13, p0, Ll/xt;->o:Z

    .line 24
    .line 25
    return-void
.end method

.method public final synthetic F0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->m(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/du;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Ll/du;->B(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic G0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/du;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/du;->v(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic H0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/du;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/du;->K(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic I0(Ljava/util/List;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xt;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    new-instance v3, Ll/mt;

    .line 21
    .line 22
    invoke-direct {v3, v2}, Ll/mt;-><init>(Lcom/p1/mobile/putong/data/Media;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    instance-of p1, p1, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->f()V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public final synthetic J0(Ll/cvx;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1, p1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic N0(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/du;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/du;->q()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic O0(Landroid/os/Bundle;)V
    .locals 12

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    check-cast v0, Ll/du;

    .line 5
    .line 6
    iget v1, p0, Ll/xt;->f:I

    .line 7
    .line 8
    iget-object v2, p0, Ll/xt;->i:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v3, p0, Ll/xt;->g:Ljava/lang/String;

    .line 11
    .line 12
    iget-boolean v4, p0, Ll/xt;->c:Z

    .line 13
    .line 14
    iget v5, p0, Ll/xt;->a:I

    .line 15
    .line 16
    iget-boolean v6, p0, Ll/xt;->j:Z

    .line 17
    .line 18
    iget-object v7, p0, Ll/xt;->h:Lcom/p1/mobile/putong/data/Gender;

    .line 19
    .line 20
    invoke-virtual/range {v0 .. v7}, Ll/du;->A(ILjava/lang/String;Ljava/lang/String;ZIZLcom/p1/mobile/putong/data/Gender;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p1, Ll/du;

    .line 26
    .line 27
    iget v0, p0, Ll/xt;->f:I

    .line 28
    .line 29
    iget-boolean v1, p0, Ll/xt;->c:Z

    .line 30
    .line 31
    invoke-virtual {p1, v0, v1}, Ll/du;->y(IZ)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    move-object v0, p1

    .line 37
    check-cast v0, Ll/du;

    .line 38
    .line 39
    iget v1, p0, Ll/xt;->a:I

    .line 40
    .line 41
    iget v2, p0, Ll/xt;->f:I

    .line 42
    .line 43
    iget-boolean v3, p0, Ll/xt;->c:Z

    .line 44
    .line 45
    iget v4, p0, Ll/xt;->k:I

    .line 46
    .line 47
    iget-boolean v5, p0, Ll/xt;->j:Z

    .line 48
    .line 49
    iget-object v6, p0, Ll/xt;->h:Lcom/p1/mobile/putong/data/Gender;

    .line 50
    .line 51
    iget-boolean v7, p0, Ll/xt;->b:Z

    .line 52
    .line 53
    iget-boolean v8, p0, Ll/xt;->o:Z

    .line 54
    .line 55
    invoke-virtual/range {v0 .. v8}, Ll/du;->z(IIZIZLcom/p1/mobile/putong/data/Gender;ZZ)V

    .line 56
    .line 57
    .line 58
    iget p1, p0, Ll/xt;->f:I

    .line 59
    .line 60
    sget v0, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->B:I

    .line 61
    .line 62
    if-ne p1, v0, :cond_0

    .line 63
    .line 64
    new-instance p1, Ll/pt;

    .line 65
    .line 66
    invoke-direct {p1}, Ll/pt;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance v0, Ll/vt;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/vt;-><init>(Ll/xt;)V

    .line 76
    .line 77
    .line 78
    new-instance v1, Ll/wt;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/wt;-><init>(Ll/xt;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    new-instance p1, Ll/dt;

    .line 91
    .line 92
    invoke-direct {p1}, Ll/dt;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    new-instance v0, Ll/et;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Ll/et;-><init>(Ll/xt;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    goto/16 :goto_2

    .line 112
    .line 113
    :cond_0
    iget p1, p0, Ll/xt;->a:I

    .line 114
    .line 115
    const/4 v0, 0x0

    .line 116
    const/4 v1, 0x1

    .line 117
    if-lez p1, :cond_1

    .line 118
    .line 119
    move v4, v1

    .line 120
    goto :goto_0

    .line 121
    :cond_1
    move v4, v0

    .line 122
    :goto_0
    iget-boolean v5, p0, Ll/xt;->c:Z

    .line 123
    .line 124
    new-instance v2, Ll/cvx;

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    const/4 v6, 0x1

    .line 131
    const/16 v7, 0xc8

    .line 132
    .line 133
    invoke-direct/range {v2 .. v7}, Ll/cvx;-><init>(Landroid/content/Context;ZZZI)V

    .line 134
    .line 135
    .line 136
    if-eqz v4, :cond_2

    .line 137
    .line 138
    invoke-virtual {v2}, Ll/cvx;->t()Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    new-instance v3, Ll/ft;

    .line 143
    .line 144
    invoke-direct {v3, p0, v2}, Ll/ft;-><init>(Ll/xt;Ll/cvx;)V

    .line 145
    .line 146
    .line 147
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {p1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2}, Ll/cvx;->t()Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iget-object v3, p0, Ll/xt;->l:Ll/qcj;

    .line 159
    .line 160
    invoke-static {v3}, Ll/cvx;->n(Ll/qcj;)Lrx/c$d;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-virtual {p1, v3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    new-instance v3, Ll/gt;

    .line 169
    .line 170
    invoke-direct {v3}, Ll/gt;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    new-instance v3, Ll/ht;

    .line 178
    .line 179
    invoke-direct {v3, p0}, Ll/ht;-><init>(Ll/xt;)V

    .line 180
    .line 181
    .line 182
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    invoke-virtual {p1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 187
    .line 188
    .line 189
    :cond_2
    if-eqz v5, :cond_3

    .line 190
    .line 191
    invoke-virtual {v2}, Ll/cvx;->u()Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    new-instance v3, Ll/jt;

    .line 196
    .line 197
    invoke-direct {v3, p0, v2}, Ll/jt;-><init>(Ll/xt;Ll/cvx;)V

    .line 198
    .line 199
    .line 200
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {p1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v2}, Ll/cvx;->u()Lrx/c;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    iget-object v3, p0, Ll/xt;->m:Ll/qcj;

    .line 212
    .line 213
    invoke-static {v3}, Ll/cvx;->n(Ll/qcj;)Lrx/c$d;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-virtual {p1, v3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    new-instance v3, Ll/kt;

    .line 222
    .line 223
    invoke-direct {v3}, Ll/kt;-><init>()V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p1, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    new-instance v3, Ll/qt;

    .line 231
    .line 232
    invoke-direct {v3, p0}, Ll/qt;-><init>(Ll/xt;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    invoke-virtual {p1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 240
    .line 241
    .line 242
    :cond_3
    invoke-virtual {v2}, Ll/cvx;->r()Lrx/c;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    new-instance v3, Ll/rt;

    .line 247
    .line 248
    invoke-direct {v3, p0}, Ll/rt;-><init>(Ll/xt;)V

    .line 249
    .line 250
    .line 251
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-virtual {p1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 256
    .line 257
    .line 258
    new-instance p1, Ll/xoh0;

    .line 259
    .line 260
    invoke-direct {p1}, Ll/xoh0;-><init>()V

    .line 261
    .line 262
    .line 263
    iget-object v3, p0, Ll/xt;->g:Ljava/lang/String;

    .line 264
    .line 265
    const-string v6, "signup"

    .line 266
    .line 267
    invoke-static {v3, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    if-nez v3, :cond_5

    .line 272
    .line 273
    iget-object v3, p0, Ll/xt;->g:Ljava/lang/String;

    .line 274
    .line 275
    const-string v7, "sign_up_select_image"

    .line 276
    .line 277
    invoke-static {v3, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 278
    .line 279
    .line 280
    move-result v3

    .line 281
    if-eqz v3, :cond_4

    .line 282
    .line 283
    goto :goto_1

    .line 284
    :cond_4
    iget-object v6, p0, Ll/xt;->g:Ljava/lang/String;

    .line 285
    .line 286
    :cond_5
    :goto_1
    new-instance v3, Ll/st;

    .line 287
    .line 288
    invoke-direct {v3, p0, v2}, Ll/st;-><init>(Ll/xt;Ll/cvx;)V

    .line 289
    .line 290
    .line 291
    new-instance v2, Ll/tt;

    .line 292
    .line 293
    invoke-direct {v2, p0}, Ll/tt;-><init>(Ll/xt;)V

    .line 294
    .line 295
    .line 296
    new-instance v11, Ll/xt$a;

    .line 297
    .line 298
    invoke-direct {v11, p0, p1, v6}, Ll/xt$a;-><init>(Ll/xt;Ll/xoh0;Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    new-instance v10, Ll/xt$b;

    .line 302
    .line 303
    invoke-direct {v10, p0, p1, v6}, Ll/xt$b;-><init>(Ll/xt;Ll/xoh0;Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    new-instance v9, Ll/xt$c;

    .line 307
    .line 308
    invoke-direct {v9, p0, p1, v6}, Ll/xt$c;-><init>(Ll/xt;Ll/xoh0;Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    invoke-static {}, Ll/wzx;->k()Z

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    if-eqz p1, :cond_6

    .line 316
    .line 317
    new-instance v2, Ll/wzx;

    .line 318
    .line 319
    invoke-direct {v2}, Ll/wzx;-><init>()V

    .line 320
    .line 321
    .line 322
    move-object p1, v3

    .line 323
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    sget v1, Ll/wcc0;->I:I

    .line 332
    .line 333
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    new-instance v7, Ll/ut;

    .line 338
    .line 339
    invoke-direct {v7, p0, p1}, Ll/ut;-><init>(Ll/xt;Ll/x20;)V

    .line 340
    .line 341
    .line 342
    const/4 v8, 0x0

    .line 343
    move v6, v5

    .line 344
    move v5, v4

    .line 345
    move-object v4, v0

    .line 346
    invoke-virtual/range {v2 .. v11}, Ll/wzx;->e(Landroid/app/Activity;Landroid/view/View;ZZLl/x20;Ll/y20;Ll/l6e;Ll/k6e;Ll/j6e;)V

    .line 347
    .line 348
    .line 349
    goto :goto_2

    .line 350
    :cond_6
    move-object p1, v3

    .line 351
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 352
    .line 353
    .line 354
    move-result-object v3

    .line 355
    const-string v4, "android.permission.READ_EXTERNAL_STORAGE"

    .line 356
    .line 357
    filled-new-array {v4}, [Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v4

    .line 361
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 362
    .line 363
    .line 364
    move-result-object v3

    .line 365
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    invoke-virtual {v0, p1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    invoke-virtual {p1, v11}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->p(Ll/j6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 382
    .line 383
    .line 384
    move-result-object p1

    .line 385
    invoke-virtual {p1, v10}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->t(Ll/k6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    invoke-virtual {p1, v9}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->v(Ll/l6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 398
    .line 399
    .line 400
    :goto_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 401
    .line 402
    check-cast p1, Ll/du;

    .line 403
    .line 404
    iget-boolean p0, p0, Ll/xt;->e:Z

    .line 405
    .line 406
    invoke-virtual {p1, p0}, Ll/du;->N(Z)V

    .line 407
    .line 408
    .line 409
    return-void
.end method

.method public final synthetic Q0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/du;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/du;->x(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic R0(Ll/cvx;Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "yes"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "no"

    .line 11
    .line 12
    :goto_0
    const-string v1, "have_photo_or_not"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    filled-new-array {v0}, [Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "e_picture_selection_photo_num"

    .line 23
    .line 24
    const-string v2, "p_picture_selection_view"

    .line 25
    .line 26
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/wzx;->k()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast v0, Ll/du;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/du;->q()V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v0, Ll/du;

    .line 45
    .line 46
    invoke-virtual {v0, p2}, Ll/du;->H(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    iget-boolean p2, p1, Ll/cvx;->g:Z

    .line 50
    .line 51
    if-eqz p2, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const/4 p2, 0x0

    .line 72
    const/4 v0, 0x0

    .line 73
    invoke-virtual {p0, p2, v0, p1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method public final synthetic S0(Ll/vg60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/du;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/du;->I(Ll/vg60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic U0(Ll/cvx;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/du;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/du;->J(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-boolean p2, p1, Ll/cvx;->g:Z

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportLoaderManager()Landroidx/loader/app/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p2, 0x0

    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-virtual {p0, p2, v0, p1}, Landroidx/loader/app/a;->e(ILandroid/os/Bundle;Landroidx/loader/app/a$a;)Ll/utv;

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public V0(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xt;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method

.method public W0(Ljava/lang/String;)Ll/xt;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xt;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public X0(Z)Ll/xt;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xt;->p:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ct;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ct;-><init>(Ll/xt;)V

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
