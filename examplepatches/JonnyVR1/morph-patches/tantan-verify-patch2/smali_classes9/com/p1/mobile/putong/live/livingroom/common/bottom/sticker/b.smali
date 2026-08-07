.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/mu40;",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;>;"
        }
    .end annotation
.end field

.field public k:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public l:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->j:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->k:Lrx/subjects/b;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->init()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic K3(Ljava/util/List;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ll/b5g0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->M4(Ll/b5g0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->C4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic R3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->I4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->G4(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Landroid/util/Pair;)Ljava/lang/Boolean;
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

.method public static synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private U4(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->setMaskVisibility(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->setMaskVisibility()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic V3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->L4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method

.method private V4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->z(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->m(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->W4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->J(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/l9u;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/l9u;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/m9u;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/m9u;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/n9u;

    .line 53
    .line 54
    invoke-direct {v1, p0, p1}, Ll/n9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic W3(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->K4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->J4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;)Lrx/c;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;->Version:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->H(J)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;->Url:Ljava/lang/String;

    .line 18
    .line 19
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;->Version:J

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->u(Ljava/lang/String;J)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 27
    .line 28
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static synthetic a4(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic b4(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->I()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic c4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "sticker_modify_result_submit"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "sticker_modify_result_approve"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "sticker_modify_result_reject"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static synthetic d4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->O4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->F4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V

    return-void
.end method

.method public static synthetic f4(Landroid/net/NetworkInfo;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic h4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->Q4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)V

    return-void
.end method

.method public static synthetic i4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->B4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    return-void
.end method

.method private init()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b$a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->setOnDragListener(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer$b;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic j4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->P4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->S5(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic l4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->N4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic m4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->E4(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n4(Ljava/util/List;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o4(Landroid/util/Pair;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic p4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->H4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic q4(Ll/jsv;Ljava/util/List;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->D4(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic s4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->l:Z

    return-void
.end method

.method public static bridge synthetic t4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->x4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Z)V

    return-void
.end method

.method public static bridge synthetic u4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;ILcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->R4(ILcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

    return-void
.end method

.method public static bridge synthetic v4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->U4(Z)V

    return-void
.end method

.method private y4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->i:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fillResult(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 34
    .line 35
    .line 36
    return-object p1

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method


# virtual methods
.method public final A4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->i:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public final synthetic B4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->getCurrentSticker()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getTemplateId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->setCustomId(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    instance-of v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->W4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic C4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->k:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic D4(Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->i:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic E4(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/ew40;->f()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/j9u;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/j9u;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic F4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/t9u;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/t9u;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic G4(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/k9u;

    .line 11
    .line 12
    invoke-direct {v1, p0, v0}, Ll/k9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->j:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public final synthetic H4(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->S4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->q(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic J4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->k:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic K4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->J()V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->y4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->V4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic L4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->m(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->W4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic M4(Ll/b5g0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->z4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic N4(Ljava/lang/Boolean;)V
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

.method public final synthetic O4(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/ew40;->e()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->liveStickerIds:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ljava/lang/String;

    .line 29
    .line 30
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 31
    .line 32
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/jfv;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/jfv;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->y4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->V4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final synthetic P4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->getCurrentSticker()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 13
    .line 14
    const-string v2, "sticker_modify_result_reject"

    .line 15
    .line 16
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getTemplateId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->A4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->k:Lrx/subjects/b;

    .line 40
    .line 41
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->J()V

    .line 62
    .line 63
    .line 64
    :cond_3
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic Q4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;->getRoomId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/mu40;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->l:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsg;->getLiveStickersList()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->J()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    const/4 v0, 0x0

    .line 45
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getTemplateId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getVersion()J

    .line 68
    .line 69
    .line 70
    move-result-wide v1

    .line 71
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getContent()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;->getX()F

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    iput v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getPosition()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Position;->getY()F

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    iput v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 102
    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftIcon()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;->getGiftId()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 116
    .line 117
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->y4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    if-eqz p1, :cond_2

    .line 122
    .line 123
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->V4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 124
    .line 125
    .line 126
    :cond_2
    :goto_0
    return-void
.end method

.method public final R4(ILcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V
    .locals 6

    .line 1
    invoke-interface {p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getPosition()Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getContent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getCategory()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getTemplateId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    new-instance v4, Lcom/alibaba/fastjson/JSONObject;

    .line 18
    .line 19
    invoke-direct {v4}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v5, "templateId"

    .line 23
    .line 24
    invoke-virtual {v4, v5, v3}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    const-string v3, "category"

    .line 28
    .line 29
    invoke-virtual {v4, v3, v2}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    const-string v2, "content"

    .line 33
    .line 34
    invoke-virtual {v4, v2, v1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    new-instance v1, Lcom/alibaba/fastjson/JSONObject;

    .line 38
    .line 39
    invoke-direct {v1}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v2, "x"

    .line 43
    .line 44
    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    const-string v2, "y"

    .line 50
    .line 51
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 52
    .line 53
    invoke-virtual {v1, v2, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    const-string v0, "position"

    .line 57
    .line 58
    invoke-virtual {v4, v0, v1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    const-string v0, "changeType"

    .line 62
    .line 63
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {v4, v0, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    check-cast p0, Ll/mu40;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getCustomId()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p0, p1, v4}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->q6(Ljava/lang/String;Ljava/lang/String;Lcom/alibaba/fastjson/JSONObject;)Lrx/c;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final S4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s4(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/h9u;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/h9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/i9u;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/i9u;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o5()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/u8u;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/u8u;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/x8u;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/x8u;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/y8u;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/y8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/z8u;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/z8u;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/a9u;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/a9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/b9u;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/b9u;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/c9u;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/c9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

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
    new-instance v1, Ll/d9u;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/d9u;-><init>()V

    .line 78
    .line 79
    .line 80
    new-instance v2, Ll/f9u;

    .line 81
    .line 82
    invoke-direct {v2}, Ll/f9u;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->k:Lrx/subjects/b;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/g9u;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/g9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->addSticker()Ll/v3f$d;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lrx/c;

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    new-instance v1, Ll/v8u;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/v8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatViewRightChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;->chatRightChange()Ll/v3f$d;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, Lrx/c;

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v1, Ll/w8u;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Ll/w8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public T4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->R4(ILcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->u()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final W4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->getCurrentSticker()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v1, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->i:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ll/s9u;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Ll/s9u;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 29
    .line 30
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->position:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->setGiftPosition(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->backgroundUrl:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/GiftSticker;->k0(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ll/jfv;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jfv;->c()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public t()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t8u;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/t8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/b5g0;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->changeVisible()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lrx/c;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/p9u;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/p9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ll/mu40;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/mbt;

    .line 57
    .line 58
    invoke-direct {v1}, Ll/mbt;-><init>()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->z4()Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    new-instance v3, Ll/w9u;

    .line 75
    .line 76
    invoke-direct {v3}, Ll/w9u;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v2, v3}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v2, Ll/x9u;

    .line 88
    .line 89
    invoke-direct {v2, p0}, Ll/x9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ll/mu40;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/oo2;->n1()Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v2, Ll/y9u;

    .line 110
    .line 111
    invoke-direct {v2}, Ll/y9u;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v2, Ll/z9u;

    .line 123
    .line 124
    invoke-direct {v2, p0}, Ll/z9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    check-cast v0, Ll/mu40;

    .line 139
    .line 140
    invoke-virtual {v0}, Ll/oo2;->L0()Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v2, Ll/aau;

    .line 149
    .line 150
    invoke-direct {v2, p0}, Ll/aau;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 158
    .line 159
    .line 160
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v1, Ll/bau;

    .line 169
    .line 170
    invoke-direct {v1}, Ll/bau;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    new-instance v1, Ll/cau;

    .line 178
    .line 179
    invoke-direct {v1}, Ll/cau;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->k:Lrx/subjects/b;

    .line 199
    .line 200
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    new-instance v1, Ll/e9u;

    .line 204
    .line 205
    invoke-direct {v1, p0}, Ll/e9u;-><init>(Lrx/subjects/b;)V

    .line 206
    .line 207
    .line 208
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public w4(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->getCurrentSticker()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->x4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerContainer;->m(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/mu40;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    new-instance v2, Lcom/alibaba/fastjson/JSONObject;

    .line 34
    .line 35
    invoke-direct {v2}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v3, "templateId"

    .line 39
    .line 40
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v2, v3, v4}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    const-string v3, "category"

    .line 46
    .line 47
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v2, v3, v4}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-string v3, "content"

    .line 53
    .line 54
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getContent()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v2, v3, v4}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-nez v3, :cond_1

    .line 68
    .line 69
    const-string v3, "giftId"

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v2, v3, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    :cond_1
    new-instance p1, Lcom/alibaba/fastjson/JSONObject;

    .line 77
    .line 78
    invoke-direct {p1}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getPosition()Landroid/util/Pair;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v3, "x"

    .line 86
    .line 87
    iget-object v4, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 88
    .line 89
    invoke-virtual {p1, v3, v4}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    const-string v3, "y"

    .line 93
    .line 94
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 95
    .line 96
    invoke-virtual {p1, v3, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    const-string v0, "position"

    .line 100
    .line 101
    invoke-virtual {v2, v0, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->z3(Ljava/lang/String;Lcom/alibaba/fastjson/JSONObject;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    new-instance v0, Ll/o9u;

    .line 109
    .line 110
    invoke-direct {v0}, Ll/o9u;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    new-instance v0, Ll/q9u;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Ll/q9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 124
    .line 125
    .line 126
    new-instance v1, Ll/r9u;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/r9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public final x4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/mu40;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/c;->getCustomId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->j4(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Ll/u9u;

    .line 22
    .line 23
    invoke-direct {p2}, Ll/u9u;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/v9u;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/v9u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final z4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/b;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
