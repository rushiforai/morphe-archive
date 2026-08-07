.class public Lcom/p1/mobile/putong/core/ui/citytop/a;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/citytop/b$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/e85;",
        ">;",
        "Lcom/p1/mobile/putong/core/ui/citytop/b$a<",
        "Lcom/p1/mobile/putong/core/data/Greeting;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public final b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

.field public c:Lcom/p1/mobile/putong/core/ui/citytop/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/core/ui/citytop/b<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;"
        }
    .end annotation
.end field

.field public d:I

.field public e:J


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->a:Z

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/citytop/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/citytop/a;->p0()V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/citytop/a;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->r0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/citytop/a;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->s0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/citytop/a;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->o0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/citytop/a;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->q0(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method private synthetic o0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/e85;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/e85;->d()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/e85;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Ll/e85;->c(ZZ)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/e85;

    .line 20
    .line 21
    const-string p1, "\u57ce\u5e02\u5c01\u9762\u597d\u53cb\u7533\u8bf7"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/e85;->f(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic p0()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->e:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/s75;->b:Ll/byd0;

    .line 14
    .line 15
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->e:J

    .line 16
    .line 17
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/s75;->o()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private synthetic q0(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xf9;->H3()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/xf9;->W3()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Z0:Ll/xf9;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xf9;->a4()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/a;->t0()V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method private synthetic r0(Ll/vg60;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->e:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->e:J

    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/no7;->B3()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/a;->t0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/w75;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/w75;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/a;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/x75;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/x75;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/y75;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/y75;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/z75;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/z75;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/a;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 54
    .line 55
    iget-object v0, v0, Ll/no7;->T:Lrx/subjects/a;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/a85;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/a85;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/a;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/b85;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/b85;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/a;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public m0()Landroidx/recyclerview/widget/k$e;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->c:Lcom/p1/mobile/putong/core/ui/citytop/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/citytop/b;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/citytop/b;-><init>(Lcom/p1/mobile/putong/core/ui/citytop/b$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->c:Lcom/p1/mobile/putong/core/ui/citytop/b;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->c:Lcom/p1/mobile/putong/core/ui/citytop/b;

    .line 13
    .line 14
    return-object p0
.end method

.method public final n0(Lcom/p1/mobile/putong/core/data/Greeting;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/no7;->F3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Greeting;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic s0(Ll/vg60;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->a:Z

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    if-nez p1, :cond_1

    .line 28
    .line 29
    move v1, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {p1}, Ll/vg60;->d()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    :goto_0
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->d:I

    .line 36
    .line 37
    if-lez v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    xor-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->a:Z

    .line 52
    .line 53
    :cond_2
    if-eqz p1, :cond_4

    .line 54
    .line 55
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_2

    .line 71
    :cond_4
    :goto_1
    move v1, v0

    .line 72
    :goto_2
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->d:I

    .line 73
    .line 74
    if-lt v1, v2, :cond_5

    .line 75
    .line 76
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->a:Z

    .line 77
    .line 78
    :cond_5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 79
    .line 80
    check-cast p0, Ll/e85;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ll/e85;->e(Ll/vg60;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public t0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 4
    .line 5
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Ll/s75;->b:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->a2()Ll/m65;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/m65;->M()Lcom/p1/mobile/putong/data/Links;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {v0, v3, v1, v2, p0}, Ll/no7;->E3(ZJLcom/p1/mobile/putong/data/Links;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public u0(Lcom/p1/mobile/putong/core/data/Greeting;Z)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->n0(Lcom/p1/mobile/putong/core/data/Greeting;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    const-string v2, "like"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v2, "dislike"

    .line 24
    .line 25
    :goto_0
    const-string v3, "cityc_greet_list_action_type"

    .line 26
    .line 27
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    filled-new-array {v2}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "e_city_cover_received_like_user_card"

    .line 36
    .line 37
    invoke-static {v3, v1, v2}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 45
    .line 46
    move-object/from16 v2, p1

    .line 47
    .line 48
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    new-instance v11, Ll/c85;

    .line 55
    .line 56
    invoke-direct {v11}, Ll/c85;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v12, Ll/d85;

    .line 60
    .line 61
    invoke-direct {v12}, Ll/d85;-><init>()V

    .line 62
    .line 63
    .line 64
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->pageId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v13

    .line 70
    const-string v15, ""

    .line 71
    .line 72
    const-string v16, ""

    .line 73
    .line 74
    const/4 v7, 0x0

    .line 75
    const/4 v8, 0x0

    .line 76
    const-string v9, "p_city_cover"

    .line 77
    .line 78
    const/4 v10, 0x0

    .line 79
    const/4 v14, 0x0

    .line 80
    move/from16 v6, p2

    .line 81
    .line 82
    invoke-static/range {v4 .. v16}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_2

    .line 87
    .line 88
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/ui/citytop/a;->x0(Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->a2()Ll/m65;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public x(Landroid/view/View;F)V
    .locals 3

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    cmpl-float v0, p2, p0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x4

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->e:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->e:Lv/VImage;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d:Lv/VImage;

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    cmpg-float p0, p2, p0

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->e:Lv/VImage;

    .line 33
    .line 34
    if-gez p0, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d:Lv/VImage;

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d:Lv/VImage;

    .line 45
    .line 46
    neg-float p1, p2

    .line 47
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/citytop/CityTopItemView;->d:Lv/VImage;

    .line 55
    .line 56
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public x0(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->a2()Ll/m65;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/m65;->U(Lcom/p1/mobile/putong/core/data/Greeting;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->h2:Ll/no7;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/no7;->V3(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->d:I

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    sub-int/2addr p1, v0

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->d:I

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->a2()Ll/m65;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ll/m65;->T()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-gtz p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p1, Ll/e85;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;->a2()Ll/m65;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ll/m65;->T()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    const/4 v2, 0x0

    .line 55
    if-gtz v1, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    move v0, v2

    .line 59
    :goto_0
    invoke-virtual {p1, v2, v0}, Ll/e85;->c(ZZ)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->d:I

    .line 63
    .line 64
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 65
    .line 66
    if-lez p1, :cond_2

    .line 67
    .line 68
    check-cast p0, Ll/e85;

    .line 69
    .line 70
    int-to-long v0, p1

    .line 71
    const-wide/16 v2, 0x63

    .line 72
    .line 73
    invoke-static {v0, v1, v2, v3}, Ll/a9g0;->a(JJ)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v0, "\u57ce\u5e02\u5c01\u9762\u597d\u53cb\u7533\u8bf7\uff08%s\uff09"

    .line 82
    .line 83
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0, p1}, Ll/e85;->f(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    check-cast p0, Ll/e85;

    .line 92
    .line 93
    const-string p1, "\u57ce\u5e02\u5c01\u9762\u597d\u53cb\u7533\u8bf7"

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/e85;->f(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public y0(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/citytop/a;->b:Lcom/p1/mobile/putong/core/ui/citytop/CityTopLikersAct;

    .line 2
    .line 3
    const-string v0, "from_city_centre_received_like"

    .line 4
    .line 5
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/d;->i(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic z(Ljava/lang/Object;Z)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/citytop/a;->u0(Lcom/p1/mobile/putong/core/data/Greeting;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
