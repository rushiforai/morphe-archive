.class public Ll/ax00;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/cx00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Z

.field public d:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/ax00;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ax00;->i0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic g0(Ll/ax00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ax00;->j0()V

    return-void
.end method

.method public static synthetic h0(Ll/ax00;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ax00;->k0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic i0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/cx00;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ax00;->d:Lcom/p1/mobile/putong/feed/data/Moment;

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
    invoke-virtual {p1, v0}, Ll/cx00;->m(Ljava/util/ArrayList;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Ll/cx00;

    .line 25
    .line 26
    iget v0, p0, Ll/ax00;->b:I

    .line 27
    .line 28
    iget-boolean p0, p0, Ll/ax00;->c:Z

    .line 29
    .line 30
    invoke-virtual {p1, v0, p0}, Ll/cx00;->j(IZ)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic j0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/cx00;

    .line 4
    .line 5
    iget-object v0, v0, Ll/cx00;->g:Ll/vw00;

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
    check-cast p0, Ll/cx00;

    .line 16
    .line 17
    iget-object p0, p0, Ll/cx00;->g:Ll/vw00;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/vw00;->C()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private synthetic k0(Lcom/p1/mobile/android/app/c;)V
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
    check-cast p1, Ll/cx00;

    .line 12
    .line 13
    iget-object p1, p1, Ll/cx00;->g:Ll/vw00;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

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
    check-cast p0, Ll/cx00;

    .line 24
    .line 25
    iget-object p0, p0, Ll/cx00;->g:Ll/vw00;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/vw00;->E()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/ww00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ww00;-><init>(Ll/ax00;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/xw00;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/xw00;-><init>(Ll/ax00;)V

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
    new-instance v1, Ll/yw00;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/yw00;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/zw00;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/zw00;-><init>(Ll/ax00;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(Ljava/lang/String;IZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ax00;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput p2, p0, Ll/ax00;->b:I

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/ax00;->c:Z

    .line 6
    .line 7
    return-void
.end method

.method public m0()Ljava/util/List;
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
    iget-object p0, p0, Ll/ax00;->a:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/og3;->c:Ll/og3;

    .line 4
    .line 5
    const-string v1, "moment id"

    .line 6
    .line 7
    filled-new-array {v1, p0, v0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
