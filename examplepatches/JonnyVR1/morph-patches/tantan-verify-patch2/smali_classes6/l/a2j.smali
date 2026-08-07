.class public Ll/a2j;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/i2j;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/a2j;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/a2j;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e0(Ll/a2j;Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a2j;->q0(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/a2j;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a2j;->x0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g0(Ll/a2j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a2j;->u0()V

    return-void
.end method

.method public static synthetic h0(Ll/a2j;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a2j;->r0(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic i0(Ll/a2j;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a2j;->t0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Ll/a2j;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/a2j;->p0(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic k0(Ll/a2j;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a2j;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private m0(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/a2j;->e:Z

    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/data/DetectRequest;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DetectRequest;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, v0, Lcom/p1/mobile/putong/data/DetectRequest;->category:Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 10
    .line 11
    new-instance p2, Lcom/p1/mobile/putong/data/DetectText;

    .line 12
    .line 13
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/DetectText;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p2, Lcom/p1/mobile/putong/data/DetectText;->key:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, p2, Lcom/p1/mobile/putong/data/DetectText;->value:Ljava/lang/String;

    .line 19
    .line 20
    new-instance p1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, v0, Lcom/p1/mobile/putong/data/DetectRequest;->text:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/a2j;->a:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 33
    .line 34
    invoke-virtual {p2, v0}, Ll/jka;->P6(Lcom/p1/mobile/putong/data/DetectRequest;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Ll/w1j;

    .line 43
    .line 44
    invoke-direct {p2, p0, p5, p4}, Ll/w1j;-><init>(Ll/a2j;Ll/x20;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    new-instance p3, Ll/x1j;

    .line 48
    .line 49
    invoke-direct {p3, p0, p5}, Ll/x1j;-><init>(Ll/a2j;Ll/x20;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method private n0(Ljava/lang/String;Ll/x20;)V
    .locals 7

    .line 1
    const-string v0, "moment"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    const-string v4, "moment"

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    move-object v1, p0

    .line 11
    move-object v2, p1

    .line 12
    move-object v6, p2

    .line 13
    invoke-direct/range {v1 .. v6}, Ll/a2j;->m0(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic t0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/i2j;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/i2j;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic u0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/i2j;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/i2j;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/i2j;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a2j;->l0(Ll/i2j;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/t1j;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/t1j;-><init>(Ll/a2j;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/u1j;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/u1j;-><init>(Ll/a2j;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(Ll/i2j;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Moment;->new_()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    iget-boolean p1, p0, Ll/a2j;->d:Z

    .line 14
    .line 15
    iput-boolean p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->commentAtOnce:Z

    .line 16
    .line 17
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 18
    .line 19
    iget-object v1, p0, Ll/a2j;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "forwardMoment"

    .line 26
    .line 27
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceType:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MomentType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MomentType;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Ll/a2j;->f:Z

    .line 37
    .line 38
    iget-object p1, p0, Ll/a2j;->a:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ll/jka;->X6(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Ll/y1j;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/y1j;-><init>(Ll/a2j;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ll/z1j;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/z1j;-><init>(Ll/a2j;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic p0(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/a2j;->e:Z

    .line 3
    .line 4
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 5
    .line 6
    invoke-virtual {p3, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    check-cast p3, Lcom/p1/mobile/putong/data/CommonData;

    .line 11
    .line 12
    iget-object p3, p3, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 13
    .line 14
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Detect;->text:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Detect;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-interface {p1}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p0, p0, Ll/a2j;->a:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p3, p0}, Ll/ksg;->l(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->s:I

    .line 47
    .line 48
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W2:I

    .line 59
    .line 60
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic q0(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/a2j;->e:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/a2j;->f:Z

    .line 3
    .line 4
    const-string p1, "\u8f6c\u53d1\u6210\u529f"

    .line 5
    .line 6
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Ll/i2j;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/i2j;->m()V

    .line 14
    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 17
    .line 18
    iget-object p0, p0, Ll/a2j;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll/jka;->Qb(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/a2j;->f:Z

    .line 3
    .line 4
    invoke-static {p1}, Ll/i4h;->i(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/i2j;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/i2j;->m()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic x0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a2j;->o0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y0(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p0, p1}, Ll/o1j0;->i(IZ)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-boolean v0, p0, Ll/a2j;->e:Z

    .line 17
    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    iget-boolean v0, p0, Ll/a2j;->f:Z

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    new-instance v0, Ll/v1j;

    .line 32
    .line 33
    invoke-direct {v0, p0, p1}, Ll/v1j;-><init>(Ll/a2j;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, p1, v0}, Ll/a2j;->n0(Ljava/lang/String;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    invoke-virtual {p0, p1}, Ll/a2j;->o0(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    :goto_0
    return-void
.end method
