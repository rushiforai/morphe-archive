.class public Ll/dg70;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/feed/newui/preview/act/a;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:I

.field public d:Z

.field public e:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dg70;->b:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/dg70;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dg70;->o0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/dg70;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dg70;->n0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->P()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p0, v0, :cond_1

    .line 12
    .line 13
    :goto_0
    move v1, v2

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 16
    .line 17
    if-ne p0, v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic i0(Ll/dg70;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dg70;->l0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Ll/dg70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dg70;->m0()V

    return-void
.end method

.method private synthetic l0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 4
    .line 5
    iget-object v0, p0, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 16
    .line 17
    check-cast v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    :goto_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->v(Ljava/util/ArrayList;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 25
    .line 26
    iget v0, p0, Ll/dg70;->c:I

    .line 27
    .line 28
    iget-boolean p0, p0, Ll/dg70;->d:Z

    .line 29
    .line 30
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->k(IZ)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic m0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wf70;->e0()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private synthetic n0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->g:Ll/wf70;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/wf70;->o0()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 5

    .line 1
    new-instance v0, Ll/xf70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xf70;-><init>(Ll/dg70;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/yf70;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/yf70;-><init>(Ll/dg70;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/zf70;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/zf70;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/ag70;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/ag70;-><init>(Ll/dg70;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Ll/dg70;->b:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 50
    .line 51
    iget-object v2, p0, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    const-string v4, "preview"

    .line 58
    .line 59
    invoke-virtual {v1, v3, v2, v4}, Ll/jka;->Sb(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/bg70;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/bg70;-><init>(Ll/dg70;)V

    .line 70
    .line 71
    .line 72
    new-instance p0, Ll/cg70;

    .line 73
    .line 74
    invoke-direct {p0}, Ll/cg70;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public k0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public final synthetic o0(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->h:Ll/kxh;

    .line 26
    .line 27
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 32
    .line 33
    move-object v1, p1

    .line 34
    check-cast v1, Ll/pf60;

    .line 35
    .line 36
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v1, Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 39
    .line 40
    check-cast p1, Ll/pf60;

    .line 41
    .line 42
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    .line 45
    .line 46
    invoke-interface {p0, v0, v1, p1}, Ll/kxh;->m(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/p1/mobile/putong/data/Music;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public p0(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ll/dg70;->c:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/dg70;->d:Z

    .line 4
    .line 5
    return-void
.end method

.method public q0()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/dg70;->k0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/og3;->c:Ll/og3;

    .line 6
    .line 7
    const-string v1, "moment id"

    .line 8
    .line 9
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
