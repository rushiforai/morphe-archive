.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;
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
.field public i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public k:Z

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "gift"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic L3(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic M3(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->h4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "sticker"

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

.method public static synthetic P3(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic R3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->i4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->j4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "gift"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic U3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;Ljava/util/List;)V
    .locals 1

    .line 1
    new-instance v0, Ll/i8u;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/i8u;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;->b(Z)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/j8u;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/j8u;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p2, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->J(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic V3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->g4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic W3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V

    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "gift"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->k4()V

    .line 2
    .line 3
    .line 4
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showDialog()Ll/v3f$d;

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
    new-instance v1, Ll/b8u;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/b8u;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/k8u;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/k8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->openGiftStickerDialog()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lrx/c;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/l8u;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/l8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    new-instance v0, Ll/m8u;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Ll/m8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 80
    .line 81
    .line 82
    const-class v1, Ll/i5g0;

    .line 83
    .line 84
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Ll/b5g0;

    .line 88
    .line 89
    const/16 v1, 0xc80

    .line 90
    .line 91
    invoke-direct {v0, v1}, Ll/b5g0;-><init>(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lrx/c;

    .line 99
    .line 100
    new-instance v1, Ll/n8u;

    .line 101
    .line 102
    invoke-direct {v1}, Ll/n8u;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/o8u;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/o8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public Z3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->m:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->m:Ljava/lang/String;

    .line 25
    .line 26
    :goto_0
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 39
    .line 40
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 41
    .line 42
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 43
    .line 44
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 45
    .line 46
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 47
    .line 48
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 49
    .line 50
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 51
    .line 52
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 55
    .line 56
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 57
    .line 58
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 59
    .line 60
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 61
    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 65
    .line 66
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 67
    .line 68
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_1

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 75
    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 81
    .line 82
    .line 83
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->StickerEvent:Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$StickerEvent;->addSticker()Ll/v3f$d;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 97
    .line 98
    if-eqz p0, :cond_2

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 101
    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method public a4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;->getBindingItem()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final b4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/yec0;->S5:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    .line 21
    .line 22
    new-instance p1, Ll/c0s;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    .line 25
    .line 26
    invoke-direct {p1, p0, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    .line 30
    .line 31
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->j(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/b5g0;

    .line 35
    .line 36
    const/16 v1, 0xc80

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ll/b5g0;-><init>(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lrx/c;

    .line 46
    .line 47
    new-instance v1, Ll/p8u;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/p8u;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/q8u;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/q8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->T4()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/r8u;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/r8u;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    .line 90
    .line 91
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    new-instance v1, Ll/s8u;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/s8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-object p1
.end method

.method public final c4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->X5:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;

    .line 17
    .line 18
    new-instance v1, Ll/c0s;

    .line 19
    .line 20
    invoke-direct {v1, p0, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;->a:Landroid/view/View;

    .line 24
    .line 25
    new-instance v3, Ll/c8u;

    .line 26
    .line 27
    invoke-direct {v3, v1}, Ll/c8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;->e:Landroid/view/View;

    .line 34
    .line 35
    new-instance v3, Ll/d8u;

    .line 36
    .line 37
    invoke-direct {v3, p0}, Ll/d8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const/4 v5, 0x2

    .line 50
    invoke-direct {v2, v3, v5}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 51
    .line 52
    .line 53
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;->j:Lv/VRecyclerView;

    .line 54
    .line 55
    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 59
    .line 60
    const v3, 0x44184000    # 609.0f

    .line 61
    .line 62
    .line 63
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-virtual {v2, v3}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMaxHeight(I)V

    .line 68
    .line 69
    .line 70
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 71
    .line 72
    const v3, 0x43b98000    # 371.0f

    .line 73
    .line 74
    .line 75
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {v2, v3}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMinHeight(I)V

    .line 80
    .line 81
    .line 82
    new-instance v4, Ll/n5g0;

    .line 83
    .line 84
    const/high16 v2, 0x41400000    # 12.0f

    .line 85
    .line 86
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v8

    .line 98
    const/4 v9, 0x0

    .line 99
    invoke-direct/range {v4 .. v9}, Ll/n5g0;-><init>(IIIIZ)V

    .line 100
    .line 101
    .line 102
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;->j:Lv/VRecyclerView;

    .line 103
    .line 104
    invoke-virtual {v2, v4}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 105
    .line 106
    .line 107
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    const/4 v4, 0x0

    .line 114
    invoke-direct {v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;-><init>(Lcom/p1/mobile/android/app/Act;Z)V

    .line 115
    .line 116
    .line 117
    new-instance v3, Ll/e8u;

    .line 118
    .line 119
    invoke-direct {v3, p0}, Ll/e8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->I(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d$a;)V

    .line 123
    .line 124
    .line 125
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;->j:Lv/VRecyclerView;

    .line 126
    .line 127
    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 128
    .line 129
    .line 130
    new-instance v3, Ll/b5g0;

    .line 131
    .line 132
    const/16 v4, 0xc80

    .line 133
    .line 134
    invoke-direct {v3, v4}, Ll/b5g0;-><init>(I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v3}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    check-cast v3, Lrx/c;

    .line 142
    .line 143
    new-instance v4, Ll/f8u;

    .line 144
    .line 145
    invoke-direct {v4}, Ll/f8u;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-virtual {p0, v3}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    new-instance v3, Ll/g8u;

    .line 157
    .line 158
    invoke-direct {v3, v0, v2}, Ll/g8u;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerPickView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 166
    .line 167
    .line 168
    return-object v1
.end method

.method public d4(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->o(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e4(Ll/xsl;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->k:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic g4(Ljava/util/List;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->k:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h4(Ljava/util/List;)V
    .locals 1

    .line 1
    new-instance v0, Ll/h8u;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/h8u;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->l:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveCustomStickerPickView;->setStickerList(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic i4(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->j4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->b4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final k4()V
    .locals 2

    .line 1
    new-instance v0, Ll/qc80;

    .line 2
    .line 3
    const/16 v1, 0xc80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/qc80;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 21
    .line 22
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v0, Ll/e74;

    .line 33
    .line 34
    const/16 v1, 0x320

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ll/e74;-><init>(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->k1:I

    .line 52
    .line 53
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->p8:I

    .line 64
    .line 65
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 70
    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->c4()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 78
    .line 79
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/a;->i:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 82
    .line 83
    .line 84
    return-void
.end method
