.class public Ll/zld0;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/ou40;",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

.field public j:Z

.field public k:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/zld0;->k:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic J3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic K3(Ll/zld0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zld0;->l4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic L3(Ll/zld0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zld0;->j4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)V

    return-void
.end method

.method public static synthetic M3(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zld0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->M(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic O3(Ll/zld0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zld0;->e4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic P3(Ll/zld0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zld0;->i4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic S3(Ll/zld0;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zld0;->k4(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fillResult(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U3(Landroid/net/NetworkInfo;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V3(Landroid/util/Pair;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic W3(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zld0;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method

.method public static synthetic X3(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->z(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic Y3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z3(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zld0;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b4(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zld0;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method

.method public static synthetic c4(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zld0;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/util/List;)V

    return-void
.end method

.method private synthetic e4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->e(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private n4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zld0;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->i(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/zld0;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatViewRightChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;->chatRightChange()Ll/v3f$d;

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
    new-instance v1, Ll/yld0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/yld0;-><init>(Ll/zld0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final d4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->x(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 14
    .line 15
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 16
    .line 17
    cmp-long v1, v1, v3

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->A(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fillResult(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 32
    .line 33
    .line 34
    return-object p1

    .line 35
    :cond_0
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 38
    .line 39
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 40
    .line 41
    cmp-long v1, v1, v3

    .line 42
    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->A(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fillResult(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/zld0;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 63
    .line 64
    filled-new-array {v0}, [Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->V7([Ljava/lang/String;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/hld0;

    .line 77
    .line 78
    invoke-direct {v1, p0, p1}, Ll/hld0;-><init>(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 79
    .line 80
    .line 81
    new-instance p0, Ll/ild0;

    .line 82
    .line 83
    invoke-direct {p0}, Ll/ild0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    :goto_0
    const/4 p0, 0x0

    .line 94
    return-object p0
.end method

.method public final synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/util/List;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ll/mld0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/mld0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    new-instance v0, Ll/nld0;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ll/nld0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v0, Ll/old0;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/old0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance p2, Ll/pld0;

    .line 35
    .line 36
    invoke-direct {p2, p0}, Ll/pld0;-><init>(Ll/zld0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    const/4 p1, 0x1

    .line 47
    iput-boolean p1, p0, Ll/zld0;->j:Z

    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/RoomStickerContainer;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/zld0;->i:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ll/zld0;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic h4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/ew40;->e()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->liveStickerIds:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final synthetic i4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;->getRoomId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/ou40;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic j4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;->getLiveStickersList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Ll/zld0;->n4()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getTemplateId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getVersion()J

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getContent()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;->getX()F

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iput v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;->getY()F

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iput v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftIcon()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Ll/zld0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final synthetic k4(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s4(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic l4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m1()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zld0;->j:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->N()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final m4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zld0;->n4()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/zld0;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/zld0;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/zld0;->n4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final o4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zld0;->n4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jld0;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Ll/jld0;-><init>(Ll/zld0;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final p4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->J(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/kld0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/kld0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/lld0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/lld0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p0, p0, Ll/zld0;->k:Lrx/subjects/b;

    .line 32
    .line 33
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/e9u;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/e9u;-><init>(Lrx/subjects/b;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final q4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V
    .locals 1

    .line 1
    instance-of p0, p2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->x(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 20
    .line 21
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->position:I

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->setGiftPosition(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->backgroundUrl:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->k0(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public t()V
    .locals 3

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->changeVisible()Ll/v3f$d;

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
    new-instance v1, Ll/gld0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/gld0;-><init>(Ll/zld0;)V

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/ou40;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/oo2;->K0()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/rld0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/rld0;-><init>(Ll/zld0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/sld0;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/sld0;-><init>(Ll/zld0;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Ll/ou40;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/oo2;->L0()Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/tld0;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/tld0;-><init>(Ll/zld0;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Ll/uld0;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/uld0;-><init>(Ll/zld0;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    const/4 v1, 0x1

    .line 111
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/vld0;

    .line 116
    .line 117
    invoke-direct {v1}, Ll/vld0;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/wld0;

    .line 125
    .line 126
    invoke-direct {v1}, Ll/wld0;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object v1, p0, Ll/zld0;->k:Lrx/subjects/b;

    .line 146
    .line 147
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    new-instance v2, Ll/e9u;

    .line 151
    .line 152
    invoke-direct {v2, v1}, Ll/e9u;-><init>(Lrx/subjects/b;)V

    .line 153
    .line 154
    .line 155
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/zld0;->k:Lrx/subjects/b;

    .line 163
    .line 164
    new-instance v1, Ll/xld0;

    .line 165
    .line 166
    invoke-direct {v1, p0}, Ll/xld0;-><init>(Ll/zld0;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    new-instance v1, Ll/sld0;

    .line 178
    .line 179
    invoke-direct {v1, p0}, Ll/sld0;-><init>(Ll/zld0;)V

    .line 180
    .line 181
    .line 182
    new-instance p0, Ll/qld0;

    .line 183
    .line 184
    invoke-direct {p0}, Ll/qld0;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 192
    .line 193
    .line 194
    return-void
.end method
