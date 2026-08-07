.class public Ll/vg00;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/fh00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/vg00;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/vg00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vg00;->j0()V

    return-void
.end method

.method public static synthetic f0(Ll/vg00;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vg00;->i0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/vg00;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vg00;->k0(Ll/vg60;)V

    return-void
.end method

.method public static synthetic h0(Ll/vg00;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vg00;->l0(Ll/pf60;)V

    return-void
.end method

.method private synthetic i0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/api/b;->S2()Lrx/c;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Ll/fh00;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/fh00;->r()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic j0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/fh00;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/fh00;->e()Ll/vg60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->R2(Ll/vg60;)Lrx/c;

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/rg00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rg00;-><init>(Ll/vg00;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/sg00;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/sg00;-><init>(Ll/vg00;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/b;->O2()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/tg00;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/tg00;-><init>(Ll/vg00;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 37
    .line 38
    iget-object v0, v0, Ll/jka;->Q0:Lrx/subjects/b;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/ug00;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/ug00;-><init>(Ll/vg00;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic k0(Ll/vg60;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/vg00;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/vg00;->b:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-object p1, p0, Ll/vg00;->a:Ll/vg60;

    .line 10
    .line 11
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Ll/fh00;

    .line 23
    .line 24
    invoke-virtual {p0, v1, p1}, Ll/fh00;->l(ZLl/vg60;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic l0(Ll/pf60;)V
    .locals 2

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/vg00;->b:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/vg00;->a:Ll/vg60;

    .line 5
    .line 6
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    :goto_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/fh00;

    .line 19
    .line 20
    iget-object v1, p0, Ll/vg00;->a:Ll/vg60;

    .line 21
    .line 22
    invoke-virtual {v0, p1, v1}, Ll/fh00;->l(ZLl/vg60;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/vg00;->a:Ll/vg60;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/vg60;->c()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/api/b;->S2()Lrx/c;

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method
