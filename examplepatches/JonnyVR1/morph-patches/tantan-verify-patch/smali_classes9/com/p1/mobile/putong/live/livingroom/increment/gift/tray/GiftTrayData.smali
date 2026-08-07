.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;
    }
.end annotation


# static fields
.field public static final Y:Ljava/lang/Long;

.field public static final Z:Ljava/lang/Long;


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ljava/lang/String;

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/String;

.field public E:Ljava/lang/String;

.field public F:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

.field public G:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

.field public H:Ljava/lang/String;

.field public I:Z

.field public J:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

.field public K:Z

.field public L:Z

.field public M:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;"
        }
    .end annotation
.end field

.field public N:Z

.field public O:Ljava/lang/String;

.field public P:J

.field public Q:J

.field public R:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

.field public S:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

.field public T:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

.field public U:Ljava/lang/String;

.field public V:Ljava/lang/String;

.field public W:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public X:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;

.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

.field public c:J

.field public d:I

.field public e:I

.field public f:Ljava/lang/String;

.field public g:I

.field public h:Ljava/lang/String;

.field public i:J

.field public j:Ljava/lang/String;

.field public k:I

.field public l:I

.field public m:Z

.field public n:Ljava/lang/String;

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public p:Z

.field public q:Z

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Z

.field public u:I

.field public v:Ljava/lang/String;

.field public w:Ljava/lang/String;

.field public x:Ljava/lang/String;

.field public y:Ljava/lang/String;

.field public z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->Y:Ljava/lang/Long;

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->Z:Ljava/lang/Long;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 15
    .line 16
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->c:J

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->m:Z

    .line 22
    .line 23
    const-string v1, ""

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v2, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o:Ljava/util/List;

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->q:Z

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->A:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->D:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->E:Ljava/lang/String;

    .line 55
    .line 56
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->K:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->L:Z

    .line 59
    .line 60
    new-instance v0, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->O:Ljava/lang/String;

    .line 68
    .line 69
    new-instance v0, Landroid/util/SparseArray;

    .line 70
    .line 71
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->W:Landroid/util/SparseArray;

    .line 75
    .line 76
    return-void
.end method

.method public static D(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;)V
    .locals 0

    .line 1
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 2
    .line 3
    if-lez p2, :cond_1

    .line 4
    .line 5
    invoke-virtual {p3, p2}, Ll/oo2;->w0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 34
    .line 35
    return-void
.end method

.method public static E(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 4

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 4
    .line 5
    new-instance v2, Ll/rzj;

    .line 6
    .line 7
    invoke-direct {v2, v0}, Ll/rzj;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;

    .line 15
    .line 16
    sget-object v2, Ll/htd0;->c:Ll/htd0;

    .line 17
    .line 18
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/hiv;

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ll/hiv;->l(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 29
    .line 30
    const-string v3, "\u5f00\u51fa"

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    new-instance p0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v1, :cond_0

    .line 65
    .line 66
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;->giftPicUrl:Ljava/lang/String;

    .line 67
    .line 68
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 72
    .line 73
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 74
    .line 75
    :goto_0
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 76
    .line 77
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 78
    .line 79
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 80
    .line 81
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x:Ljava/lang/String;

    .line 82
    .line 83
    iget p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 84
    .line 85
    iput p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 86
    .line 87
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 88
    .line 89
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 108
    .line 109
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 123
    .line 124
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 125
    .line 126
    if-eqz v1, :cond_2

    .line 127
    .line 128
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;->giftPicUrl:Ljava/lang/String;

    .line 129
    .line 130
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_2
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 134
    .line 135
    :goto_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 136
    .line 137
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->U:Ljava/lang/String;

    .line 138
    .line 139
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 140
    .line 141
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->V:Ljava/lang/String;

    .line 142
    .line 143
    return-void
.end method

.method public static synthetic a(Ljava/lang/Integer;Ljava/lang/Integer;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static synthetic b(ILcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;->giftItemId:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

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

.method public static f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-long v0, v0

    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    mul-long/2addr v0, v2

    .line 11
    long-to-float p0, v0

    .line 12
    const/high16 v0, 0x43480000    # 200.0f

    .line 13
    .line 14
    add-float/2addr p0, v0

    .line 15
    const/high16 v0, 0x43fa0000    # 500.0f

    .line 16
    .line 17
    add-float/2addr p0, v0

    .line 18
    float-to-int p0, p0

    .line 19
    return p0
.end method

.method public static g(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x12c

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v1, -0x1

    .line 17
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 18
    .line 19
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 20
    .line 21
    const-wide/16 v3, 0x2ee

    .line 22
    .line 23
    sub-long/2addr v1, v3

    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->p:Z

    .line 28
    .line 29
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->H:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->O:Ljava/lang/String;

    .line 34
    .line 35
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 36
    .line 37
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->P:J

    .line 38
    .line 39
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 40
    .line 41
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->Q:J

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    xor-int/lit8 v1, p1, 0x1

    .line 50
    .line 51
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->K:Z

    .line 52
    .line 53
    if-nez p1, :cond_0

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 56
    .line 57
    iput-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 58
    .line 59
    :cond_0
    return-object v0
.end method

.method public static h(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x12c

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getLiveResourceId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getDuration()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    const-wide/16 v3, 0x2ee

    .line 24
    .line 25
    sub-long/2addr v1, v3

    .line 26
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->p:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getPriority()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->H:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getToMyQueue()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->N:Z

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getVideoEffectExtrasList()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    new-instance p1, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->K:Z

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsg;->getVideoEffectExtrasList()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_0

    .line 81
    .line 82
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;

    .line 87
    .line 88
    new-instance v2, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;->getId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;->getType()J

    .line 95
    .line 96
    .line 97
    move-result-wide v4

    .line 98
    long-to-int v4, v4

    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;->getValue()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-direct {v2, v3, v4, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_0
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 111
    .line 112
    :cond_1
    return-object v0
.end method

.method public static k(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
    .locals 5

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;-><init>()V

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->N:Z

    .line 31
    .line 32
    const/16 v1, 0x12c

    .line 33
    .line 34
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 35
    .line 36
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 37
    .line 38
    const-wide/16 v3, 0x2ee

    .line 39
    .line 40
    sub-long/2addr v1, v3

    .line 41
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->p:Z

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->Y:Ljava/lang/Long;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 52
    .line 53
    iput-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->j:Ljava/lang/String;

    .line 54
    .line 55
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->H:Ljava/lang/String;

    .line 56
    .line 57
    return-object v0
.end method

.method public static m(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vwt;->j4()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-le p0, v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/vwt;->i4()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    :goto_0
    int-to-long v0, p0

    .line 26
    return-wide v0

    .line 27
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/vwt;->h4()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    goto :goto_0
.end method

.method public static n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x43c80000    # 400.0f

    .line 7
    .line 8
    add-float/2addr p0, v0

    .line 9
    float-to-int p0, p0

    .line 10
    return p0
.end method

.method public static o(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
    .locals 6
    .param p2    # Ll/oo2;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->f:Ljava/lang/String;

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 17
    .line 18
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->g:I

    .line 19
    .line 20
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 21
    .line 22
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->A:Ljava/lang/String;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->A:Ljava/lang/String;

    .line 54
    .line 55
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 56
    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_1

    .line 66
    .line 67
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 75
    .line 76
    invoke-virtual {v1}, Ll/ine0;->d()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 81
    .line 82
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 83
    .line 84
    invoke-virtual {v1}, Ll/ine0;->b()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->D:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 91
    .line 92
    invoke-virtual {v1}, Ll/ine0;->a()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 99
    .line 100
    invoke-virtual {v1}, Ll/ine0;->c()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->E:Ljava/lang/String;

    .line 105
    .line 106
    const/4 v1, 0x1

    .line 107
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->p:Z

    .line 108
    .line 109
    if-eqz p2, :cond_2

    .line 110
    .line 111
    invoke-static {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->D(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2}, Ll/oo2;->A0()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->H:Ljava/lang/String;

    .line 119
    .line 120
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 121
    .line 122
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 123
    .line 124
    iget p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 125
    .line 126
    iput p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 127
    .line 128
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 129
    .line 130
    iput-wide v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 131
    .line 132
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 133
    .line 134
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->j:Ljava/lang/String;

    .line 135
    .line 136
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->drawParam:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 137
    .line 138
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->G:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 139
    .line 140
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 141
    .line 142
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->S:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 143
    .line 144
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 145
    .line 146
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->T:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 147
    .line 148
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 149
    .line 150
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->R:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 151
    .line 152
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGiftBrief()Z

    .line 153
    .line 154
    .line 155
    move-result p2

    .line 156
    if-nez p2, :cond_4

    .line 157
    .line 158
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isLianMaiBrief()Z

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    if-nez p2, :cond_4

    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAudienceBrief()Z

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    if-eqz p2, :cond_3

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isEnterRoomBrief()Z

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    if-eqz p2, :cond_5

    .line 176
    .line 177
    const/4 p2, -0x1

    .line 178
    iput p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_4
    :goto_2
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 182
    .line 183
    :cond_5
    :goto_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->r()Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    if-eqz p2, :cond_6

    .line 188
    .line 189
    iget-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->G:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 190
    .line 191
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->p(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)J

    .line 192
    .line 193
    .line 194
    move-result-wide v2

    .line 195
    iput-wide v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 196
    .line 197
    const/16 p2, 0xc8

    .line 198
    .line 199
    iput p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 200
    .line 201
    iget-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->G:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 202
    .line 203
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 204
    .line 205
    iput-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->imgUrl:Ljava/lang/String;

    .line 206
    .line 207
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isLianMaiBrief()Z

    .line 208
    .line 209
    .line 210
    move-result p2

    .line 211
    if-nez p2, :cond_c

    .line 212
    .line 213
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAudienceBrief()Z

    .line 214
    .line 215
    .line 216
    move-result p2

    .line 217
    if-eqz p2, :cond_7

    .line 218
    .line 219
    goto/16 :goto_4

    .line 220
    .line 221
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isMultiCall()Z

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    if-eqz p2, :cond_8

    .line 226
    .line 227
    iget-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->S:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 228
    .line 229
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 230
    .line 231
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->position:Ljava/lang/String;

    .line 232
    .line 233
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->name:Ljava/lang/String;

    .line 234
    .line 235
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->lj:I

    .line 236
    .line 237
    filled-new-array {v2, p2}, [Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object p2

    .line 241
    invoke-static {v3, p2}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p2

    .line 245
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 246
    .line 247
    goto/16 :goto_5

    .line 248
    .line 249
    :cond_8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGuildCall()Z

    .line 250
    .line 251
    .line 252
    move-result p2

    .line 253
    if-eqz p2, :cond_9

    .line 254
    .line 255
    iget-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->T:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 256
    .line 257
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 258
    .line 259
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->position:Ljava/lang/String;

    .line 260
    .line 261
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->name:Ljava/lang/String;

    .line 262
    .line 263
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->lj:I

    .line 264
    .line 265
    filled-new-array {v2, p2}, [Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p2

    .line 269
    invoke-static {v3, p2}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p2

    .line 273
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 274
    .line 275
    goto :goto_5

    .line 276
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isLuckyGift()Z

    .line 277
    .line 278
    .line 279
    move-result p2

    .line 280
    if-eqz p2, :cond_a

    .line 281
    .line 282
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->E(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 283
    .line 284
    .line 285
    goto :goto_5

    .line 286
    :cond_a
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->r()Z

    .line 287
    .line 288
    .line 289
    move-result p2

    .line 290
    if-eqz p2, :cond_b

    .line 291
    .line 292
    sget-object p2, Ll/zrv;->e:Landroid/app/Application;

    .line 293
    .line 294
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->pd:I

    .line 295
    .line 296
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Y4:I

    .line 297
    .line 298
    invoke-virtual {p2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v3

    .line 306
    invoke-virtual {p2, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p2

    .line 310
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 311
    .line 312
    goto :goto_5

    .line 313
    :cond_b
    sget-object p2, Ll/zrv;->e:Landroid/app/Application;

    .line 314
    .line 315
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->pd:I

    .line 316
    .line 317
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 318
    .line 319
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    invoke-virtual {p2, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p2

    .line 331
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 332
    .line 333
    goto :goto_5

    .line 334
    :cond_c
    :goto_4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 335
    .line 336
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    .line 338
    .line 339
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 340
    .line 341
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->r5:I

    .line 342
    .line 343
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 351
    .line 352
    invoke-virtual {v2}, Ll/ine0;->b()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v2

    .line 356
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p2

    .line 363
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 364
    .line 365
    :goto_5
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 366
    .line 367
    if-eqz p2, :cond_d

    .line 368
    .line 369
    iget-wide v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 370
    .line 371
    const-wide/16 v4, 0x2710

    .line 372
    .line 373
    add-long/2addr v2, v4

    .line 374
    iput-wide v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 375
    .line 376
    :cond_d
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->hasVoiceMode:Z

    .line 377
    .line 378
    iput-boolean p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->I:Z

    .line 379
    .line 380
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 381
    .line 382
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->J:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 383
    .line 384
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 385
    .line 386
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 387
    .line 388
    .line 389
    move-result p2

    .line 390
    xor-int/lit8 v2, p2, 0x1

    .line 391
    .line 392
    iput-boolean v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->K:Z

    .line 393
    .line 394
    if-nez p2, :cond_e

    .line 395
    .line 396
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 397
    .line 398
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 399
    .line 400
    :cond_e
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->effectExt:Ljava/lang/String;

    .line 401
    .line 402
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 403
    .line 404
    .line 405
    move-result p2

    .line 406
    if-nez p2, :cond_f

    .line 407
    .line 408
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->q:Z

    .line 409
    .line 410
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->effectExt:Ljava/lang/String;

    .line 411
    .line 412
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->s:Ljava/lang/String;

    .line 413
    .line 414
    :cond_f
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tradeNo:Ljava/lang/String;

    .line 415
    .line 416
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 417
    .line 418
    .line 419
    move-result p2

    .line 420
    if-nez p2, :cond_10

    .line 421
    .line 422
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tradeNo:Ljava/lang/String;

    .line 423
    .line 424
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->r:Ljava/lang/String;

    .line 425
    .line 426
    :cond_10
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 427
    .line 428
    iput p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->l:I

    .line 429
    .line 430
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 431
    .line 432
    iput-boolean p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->t:Z

    .line 433
    .line 434
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 435
    .line 436
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->U:Ljava/lang/String;

    .line 437
    .line 438
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 439
    .line 440
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->V:Ljava/lang/String;

    .line 441
    .line 442
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 443
    .line 444
    iput-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 445
    .line 446
    return-object v0
.end method

.method public static p(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)J
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit16 p0, p0, -0x2ee

    .line 6
    .line 7
    int-to-long v0, p0

    .line 8
    return-wide v0
.end method


# virtual methods
.method public A(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o:Ljava/util/List;

    .line 7
    .line 8
    new-instance p1, Ll/szj;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/szj;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public B(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->W:Landroid/util/SparseArray;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C()Ljava/lang/Integer;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    return-object p0
.end method

.method public F(Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->X:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->ownLuxury:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->owmNormal:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->x()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->otherLuxury:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;->otherNormal:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 29
    .line 30
    return-object p0
.end method

.method public l()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SendGiftExtraInfo{sendGiftUserId=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', receiveGiftUserId=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', receiveGiftUserName=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->D:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', roomId=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->E:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "\'}"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public q()Ljava/lang/Object;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->W:Landroid/util/SparseArray;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->G:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public s()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 2
    .line 3
    const/16 v0, 0x64

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0xc8

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    const/16 v0, 0x12c

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public u()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public v()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->j:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "stickFace"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public w()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public x()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 2
    .line 3
    const/16 v0, 0xc8

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0x12c

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public y()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->u:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public z()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {}, Ll/eb20;->b()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return p0
.end method
