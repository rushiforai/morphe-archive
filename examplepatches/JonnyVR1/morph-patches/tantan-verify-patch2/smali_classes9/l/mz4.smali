.class public Ll/mz4;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/az4;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/az4;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/az4;-><init>(Ll/mz4;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/mz4;->i:Ll/az4;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "chatManager"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic K3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M3(Ll/mz4;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mz4;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/mz4;Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mz4;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/mz4;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mz4;->Y3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic P3(Ll/mz4;Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mz4;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)V

    return-void
.end method

.method public static synthetic R3(Ll/mz4;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mz4;->U3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic S3(Ll/mz4;Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mz4;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)V

    return-void
.end method


# virtual methods
.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iput-object p1, p0, Ll/mz4;->j:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 13
    .line 14
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xc:I

    .line 15
    .line 16
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    iget-object v0, p0, Ll/mz4;->i:Ll/az4;

    .line 22
    .line 23
    iget-object v0, v0, Ll/az4;->h:Lv/VEditText;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/mz4;->i:Ll/az4;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/az4;->n()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wc:I

    .line 35
    .line 36
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic U3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 11
    .line 12
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 13
    .line 14
    const v0, 0xac45

    .line 15
    .line 16
    .line 17
    if-eq p0, v0, :cond_0

    .line 18
    .line 19
    const v0, 0xac46

    .line 20
    .line 21
    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    const v0, 0xac47

    .line 25
    .line 26
    .line 27
    if-eq p0, v0, :cond_0

    .line 28
    .line 29
    const v0, 0xac48

    .line 30
    .line 31
    .line 32
    if-ne p0, v0, :cond_1

    .line 33
    .line 34
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wc:I

    .line 41
    .line 42
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mz4;->j:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic W3(Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mz4;->j:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 2
    .line 3
    return-object p1
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Lrx/c;
    .locals 1

    .line 1
    iget-object p1, p0, Ll/mz4;->j:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

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
    iget-object p0, p0, Ll/mz4;->j:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 10
    .line 11
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->D4(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/kz4;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/kz4;-><init>(Ll/mz4;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ll/lz4;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/lz4;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public final synthetic Y3(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/mz4;->i:Ll/az4;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/az4;->p()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Z3(Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yc:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->F6(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveChatJailedType;Ljava/util/List;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance p2, Ll/cz4;

    .line 31
    .line 32
    invoke-direct {p2, p0}, Ll/cz4;-><init>(Ll/mz4;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/dz4;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/dz4;-><init>(Ll/mz4;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->D4(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ez4;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ez4;-><init>(Ll/mz4;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/fz4;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/fz4;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showDialog()Ll/v3f$d;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lrx/c;

    .line 52
    .line 53
    new-instance v1, Ll/gz4;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/gz4;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/hz4;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/hz4;-><init>(Ll/mz4;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v1, p0, Ll/mz4;->i:Ll/az4;

    .line 76
    .line 77
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    new-instance v2, Ll/iz4;

    .line 81
    .line 82
    invoke-direct {v2, v1}, Ll/iz4;-><init>(Ll/az4;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/jz4;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/jz4;-><init>(Ll/mz4;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    return-void
.end method
