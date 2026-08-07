.class public Ll/w34;
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
.field public i:Ll/kcg0;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

.field public k:Ljava/text/DecimalFormat;

.field public l:Ll/kcg0;

.field public m:Z

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public final p:Ll/ku3;


# direct methods
.method public constructor <init>(Ll/dum;Ll/ku3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/w34;->p:Ll/ku3;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/w34;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w34;->n4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic K3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->r4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/fwk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "callFansLiveButtonBubble"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic P3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->remaining:I

    .line 2
    .line 3
    if-lez p0, :cond_0

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

.method public static synthetic T3(Ll/w34;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->q4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic U3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->y4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    return-void
.end method

.method public static synthetic V3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/Long;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w34;->u4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/Long;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w34;->v4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;)Lrx/c;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->bubbleConfigs:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/n34;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/n34;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 27
    .line 28
    int-to-long v1, p0

    .line 29
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, p0}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic Y3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z3(Ll/w34;Ll/vxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->x4(Ll/vxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w34;->w4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b4(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)V

    return-void
.end method

.method public static synthetic c4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d4(Ll/w34;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w34;->m4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic e4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0xa02e

    .line 10
    .line 11
    .line 12
    if-ne v0, p0, :cond_0

    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Db:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const v0, 0xa02f

    .line 21
    .line 22
    .line 23
    if-ne v0, p0, :cond_1

    .line 24
    .line 25
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Eb:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void

    .line 31
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic f4(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->t4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    return-void
.end method

.method public static synthetic g4(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method private l4()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    instance-of v1, v1, Ll/mc50;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/mc50;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    return-object v0
.end method

.method private synthetic m4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w34;->z4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic n4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w34;->G4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->remaining:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-lez v1, :cond_0

    .line 8
    .line 9
    if-lez p2, :cond_0

    .line 10
    .line 11
    move v1, v3

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v2

    .line 14
    :goto_0
    invoke-virtual {v0, v1}, Ll/ku3;->r4(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 18
    .line 19
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->remaining:I

    .line 20
    .line 21
    if-lez p1, :cond_1

    .line 22
    .line 23
    if-gtz p2, :cond_1

    .line 24
    .line 25
    move v2, v3

    .line 26
    :cond_1
    invoke-virtual {v0, v2}, Ll/ku3;->q4(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/w34;->B4()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final B4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w34;->p:Ll/ku3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ku3;->o4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w34;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/w34;->n:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/w34;->n:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public D4(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w34;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/w34;->h4(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Ll/w34;->o:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public E4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/w34;->l4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->n5(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I
    .locals 2

    .line 1
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->availableTime:D

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-double v0, v0

    .line 10
    sub-double/2addr p0, v0

    .line 11
    double-to-int p0, p0

    .line 12
    div-int/lit16 p0, p0, 0x3e8

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final G4()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/w34;->C4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/w34;->j:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    const-string v3, ""

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget v4, v0, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->remaining:I

    .line 13
    .line 14
    if-lez v4, :cond_0

    .line 15
    .line 16
    move v4, v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v4, v2

    .line 19
    :goto_0
    invoke-virtual {p0, v0}, Ll/w34;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Ll/w34;->j:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/w34;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0, v0}, Ll/w34;->k4(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v4, v2

    .line 37
    :cond_2
    :goto_1
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 38
    .line 39
    iget-boolean v5, p0, Ll/w34;->m:Z

    .line 40
    .line 41
    invoke-virtual {v0, v5}, Ll/ku3;->t4(Z)V

    .line 42
    .line 43
    .line 44
    if-eqz v4, :cond_3

    .line 45
    .line 46
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ll/ku3;->q4(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ll/ku3;->r4(Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_3
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 64
    .line 65
    if-eqz v4, :cond_4

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Ll/ku3;->q4(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/ku3;->r4(Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 76
    .line 77
    invoke-virtual {v0, v3}, Ll/ku3;->s4(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_4
    invoke-virtual {v0, v2}, Ll/ku3;->q4(Z)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Ll/ku3;->r4(Z)V

    .line 87
    .line 88
    .line 89
    :goto_2
    invoke-virtual {p0}, Ll/w34;->B4()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public H4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Landroid/view/ViewGroup;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/CharSequence;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v2}, Ll/ku3;->t4(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/w34;->B4()V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v3, Ll/zvk;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-direct {v3, v4}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const-string v4, "#f79533"

    .line 55
    .line 56
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    const-string v5, "#f7c333"

    .line 61
    .line 62
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    filled-new-array {v4, v5}, [I

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-virtual {v3, v4}, Ll/zvk;->e([I)Ll/zvk;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3, v2}, Ll/zvk;->k(Z)Ll/zvk;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    const/16 v3, 0xc

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Ll/zvk;->t(I)Ll/zvk;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v2, v1}, Ll/zvk;->v(Z)Ll/zvk;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const/high16 v2, 0x41200000    # 10.0f

    .line 89
    .line 90
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v1, v2}, Ll/zvk;->l(I)Ll/zvk;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    sget v2, Ll/zvk;->D:I

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ll/zvk;->i(I)Ll/zvk;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 105
    .line 106
    mul-int/lit16 p1, p1, 0x3e8

    .line 107
    .line 108
    int-to-long v2, p1

    .line 109
    invoke-virtual {v1, v2, v3}, Ll/zvk;->a(J)Ll/zvk;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance v1, Ll/m34;

    .line 114
    .line 115
    invoke-direct {v1, v0}, Ll/m34;-><init>(Ll/fwk;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v1}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    new-instance v1, Ll/nmj;

    .line 123
    .line 124
    const/16 v2, 0x1388

    .line 125
    .line 126
    invoke-direct {v1, v2}, Ll/nmj;-><init>(I)V

    .line 127
    .line 128
    .line 129
    const-string v2, "settingButton"

    .line 130
    .line 131
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v1, v2}, Ll/nmj;->e(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Ll/nmj;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    check-cast v1, Landroid/view/View;

    .line 144
    .line 145
    if-eqz v1, :cond_1

    .line 146
    .line 147
    invoke-virtual {v0, p1, v1, p2}, Ll/fwk;->r(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Ll/w34;->n:Ljava/lang/String;

    .line 152
    .line 153
    :cond_1
    :goto_0
    return-void
.end method

.method public I4(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/zvk;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-direct {v1, v2}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p2}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const-string v1, "#f79533"

    .line 26
    .line 27
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const-string v2, "#f7c333"

    .line 32
    .line 33
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    filled-new-array {v1, v2}, [I

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p2, v1}, Ll/zvk;->e([I)Ll/zvk;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-virtual {p2, v1}, Ll/zvk;->k(Z)Ll/zvk;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const/16 v1, 0xc

    .line 51
    .line 52
    invoke-virtual {p2, v1}, Ll/zvk;->t(I)Ll/zvk;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-virtual {p2, v1}, Ll/zvk;->v(Z)Ll/zvk;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget v1, Ll/zvk;->D:I

    .line 62
    .line 63
    invoke-virtual {p2, v1}, Ll/zvk;->i(I)Ll/zvk;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    new-instance v1, Ll/u34;

    .line 71
    .line 72
    invoke-direct {v1, v0}, Ll/u34;-><init>(Ll/fwk;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2, v1}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    new-instance v1, Ll/v34;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/v34;-><init>(Ll/w34;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2, v1}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    iget-object v1, p0, Ll/w34;->p:Ll/ku3;

    .line 89
    .line 90
    invoke-virtual {v1}, Ll/ku3;->n4()Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    if-eqz v1, :cond_1

    .line 95
    .line 96
    invoke-virtual {v0, p2, v1, p1}, Ll/fwk;->r(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Ll/w34;->o:Ljava/lang/String;

    .line 101
    .line 102
    :cond_1
    :goto_0
    return-void
.end method

.method public J4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w34;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/jfv;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/jfv;->d()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/h34;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/h34;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/j34;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/j34;-><init>(Ll/w34;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/k34;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/k34;-><init>(Ll/w34;)V

    .line 51
    .line 52
    .line 53
    new-instance v2, Ll/l34;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/l34;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Ll/w34;->l:Ll/kcg0;

    .line 67
    .line 68
    return-void
.end method

.method public K4(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "00:00:00"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/w34;->p:Ll/ku3;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/ku3;->s4(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/w34;->p:Ll/ku3;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Ll/ku3;->r4(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/w34;->p:Ll/ku3;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p1, v0}, Ll/ku3;->t4(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/w34;->B4()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public L4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w34;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/w34;->j:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/w34;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, p1, v0}, Ll/w34;->A4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/a34;

    .line 30
    .line 31
    invoke-direct {v1, p1}, Ll/a34;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->takeWhile(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/b34;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Ll/b34;-><init>(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/c34;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Ll/c34;-><init>(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/d34;

    .line 57
    .line 58
    invoke-direct {v1, p0, p1}, Ll/d34;-><init>(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const/4 v1, 0x1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/e34;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/e34;-><init>()V

    .line 73
    .line 74
    .line 75
    new-instance v2, Ll/f34;

    .line 76
    .line 77
    invoke-direct {v2}, Ll/f34;-><init>()V

    .line 78
    .line 79
    .line 80
    new-instance v3, Ll/g34;

    .line 81
    .line 82
    invoke-direct {v3, p0, p1}, Ll/g34;-><init>(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Ll/w34;->i:Ll/kcg0;

    .line 94
    .line 95
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onSettingDialogDismiss()Ll/v3f$c;

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
    new-instance v1, Ll/y24;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/y24;-><init>(Ll/w34;)V

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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onSettingDialogShow()Ll/v3f$c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/z24;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/z24;-><init>(Ll/w34;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public h4(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/w34;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/w34;->j4()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vwt;->t3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, p1, v0}, Ll/w34;->I4(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final i4()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w34;->j:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->remaining:I

    .line 8
    .line 9
    if-lez v2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/w34;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-gtz p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    return v1
.end method

.method public j4()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/w34;->l4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->E7(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/q34;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/q34;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/r34;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/r34;-><init>(Ll/w34;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/s34;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/s34;-><init>(Ll/w34;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/i34;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/i34;-><init>(Ll/w34;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/t34;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/t34;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final k4(I)Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/w34;->k:Ljava/text/DecimalFormat;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/text/DecimalFormat;

    .line 6
    .line 7
    const-string v1, "00"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/w34;->k:Ljava/text/DecimalFormat;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/w34;->k:Ljava/text/DecimalFormat;

    .line 15
    .line 16
    div-int/lit16 v1, p1, 0xe10

    .line 17
    .line 18
    int-to-long v1, v1

    .line 19
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/w34;->k:Ljava/text/DecimalFormat;

    .line 24
    .line 25
    rem-int/lit16 v2, p1, 0xe10

    .line 26
    .line 27
    div-int/lit8 v2, v2, 0x3c

    .line 28
    .line 29
    int-to-long v2, v2

    .line 30
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object p0, p0, Ll/w34;->k:Ljava/text/DecimalFormat;

    .line 35
    .line 36
    rem-int/lit8 p1, p1, 0x3c

    .line 37
    .line 38
    int-to-long v2, p1

    .line 39
    invoke-virtual {p0, v2, v3}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, ":"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/w34;->i:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/w34;->m:Z

    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePush;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePush;->resultMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic p4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w34;->l4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->n5(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic q4(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/w34;->o:Ljava/lang/String;

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w34;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/w34;->m:Z

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic s4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->Q2()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p1, v0}, Ll/w34;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Landroid/view/ViewGroup;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t()V
    .locals 4

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyPushStreamReady()Ll/v3f$c;

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
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-wide/16 v1, 0x1

    .line 26
    .line 27
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/x24;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/x24;-><init>(Ll/w34;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

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
    new-instance v1, Ll/i34;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/i34;-><init>(Ll/w34;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/o34;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/o34;-><init>(Ll/w34;)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/p34;

    .line 61
    .line 62
    invoke-direct {p0}, Ll/p34;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic t4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w34;->j:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w34;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, v0, p1}, Ll/w34;->A4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic u4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/Long;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Ll/w34;->k4(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic v4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/w34;->K4(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/w34;->j:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/w34;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0, p2, p1}, Ll/w34;->A4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic w4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w34;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-gtz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final synthetic x4(Ll/vxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w34;->E4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic y4(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w34;->J4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final z4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w34;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Ll/w34;->o:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
