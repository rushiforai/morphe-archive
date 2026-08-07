.class public Ll/z44;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/n44;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

.field public j:Ll/n54;


# direct methods
.method public constructor <init>(Ll/dum;Ll/n54;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/z44;->j:Ll/n54;

    .line 5
    .line 6
    new-instance p1, Ll/n44;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/n44;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic J3(Ll/z44;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->Z3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic K3(Ll/z44;Ll/qvd;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->e4(Ll/qvd;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/z44;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->Y3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M3(Ll/z44;Ll/qvd;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->f4(Ll/qvd;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/z44;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->a4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O3(Ll/z44;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->b4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic P3(Ll/z44;Ll/u24;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->d4(Ll/u24;)V

    return-void
.end method

.method public static synthetic R3(Ll/z44;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z44;->c4(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public S3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/n44;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n44;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public T3()V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/z44;->U3()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/n9c0;->p0:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v2:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/w44;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/w44;-><init>(Ll/z44;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget v0, Ll/n9c0;->X0:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public U3()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->g1:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public V3(Ll/qvd;)V
    .locals 2

    .line 1
    iget v0, p1, Ll/qvd;->e:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object p1, p1, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 7
    .line 8
    iput-object p1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    invoke-static {p1}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/z44;->S3()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Ll/n44;

    .line 23
    .line 24
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 25
    .line 26
    iget-object v1, p0, Ll/z44;->j:Ll/n54;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/n54;->Z3()Ll/qvd;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ll/qvd;->m()Ll/j2s;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object p0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, p0}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, v0, p0}, Ll/n44;->C(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const/4 p1, 0x3

    .line 49
    if-ne v0, p1, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/z44;->S3()V

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public W3()V
    .locals 0

    .line 1
    return-void
.end method

.method public X3()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic Y3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z44;->S3()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/z44;->j:Ll/n54;

    .line 5
    .line 6
    iget-object p0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Ll/n54;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Z3(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b4(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/n54;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic c4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z44;->j:Ll/n54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic d4(Ll/u24;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/u24;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object p1, p1, Ll/u24;->b:Ll/h64;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/z44;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic e4(Ll/qvd;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/n44;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/n44;->q()Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic f4(Ll/qvd;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object p1, p1, Ll/qvd;->d:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/u54;->j(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

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

.method public g4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 15
    .line 16
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0}, Ll/z44;->S3()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    iget-boolean v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 42
    .line 43
    :goto_1
    iget-object v1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 46
    .line 47
    xor-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-static {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->H7(Ljava/lang/String;ZZ)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/u44;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/u44;-><init>(Ll/z44;)V

    .line 64
    .line 65
    .line 66
    new-instance v2, Ll/v44;

    .line 67
    .line 68
    invoke-direct {v2, p0}, Ll/v44;-><init>(Ll/z44;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public h4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/z44;->S3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/z44;->j:Ll/n54;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/qvd;->m()Ll/j2s;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/cqj$a;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/cqj$a;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 28
    .line 29
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v4, "gift-audience-none-callaudience"

    .line 32
    .line 33
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 34
    .line 35
    invoke-static {v3, v4, v2}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v0, v2}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0}, Ll/cqj$a;->h(Ll/coj;)Ll/cqj$a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/cqj$a;->d()Ll/cqj;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance v1, Ll/lx50;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/lx50;-><init>()V

    .line 64
    .line 65
    .line 66
    const/16 v2, 0x1130

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ll/lx50;->i(I)Ll/lx50;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1, v0}, Ll/lx50;->h(Ll/cqj;)Ll/lx50;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v1, "callVoiceVice"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public i4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/z44;->S3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/z44;->j:Ll/n54;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/qvd;->m()Ll/j2s;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/j2s;->k(Ljava/lang/String;)Ll/h64;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0x1130

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v3, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 38
    .line 39
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v4, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 56
    .line 57
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p0, v3, v4, v1}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v4, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 78
    .line 79
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p0, v3, v4, v1}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string v1, "call"

    .line 90
    .line 91
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string v1, "live"

    .line 96
    .line 97
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    const-string v1, "callVoiceVice"

    .line 102
    .line 103
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->giftSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v1, "liveRoom"

    .line 108
    .line 109
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public j4()V
    .locals 0

    .line 1
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z44;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/n44;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/n44;->G(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public l4()V
    .locals 0

    .line 1
    return-void
.end method

.method public m4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/u54;->g(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->S7(Ljava/lang/String;Z)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/x44;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/x44;-><init>(Ll/z44;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/y44;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/y44;-><init>(Ll/z44;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->personalManager()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/q44;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/q44;-><init>(Ll/z44;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/z44;->j:Ll/n54;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/n54;->a4()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/r44;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/r44;-><init>(Ll/z44;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/s44;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/s44;-><init>(Ll/z44;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/t44;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/t44;-><init>(Ll/z44;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void
.end method
