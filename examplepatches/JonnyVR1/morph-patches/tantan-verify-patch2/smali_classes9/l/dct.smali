.class public Ll/dct;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;",
        "Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;)Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->getUserItemCardsList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/dct;->D(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;->BLiveUserItemCards:Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;->getOtherUserItemCardsList()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0, p2}, Ll/dct;->D(Ljava/util/List;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;->BLiveOtherUserItemCardsList:Ljava/util/List;

    .line 24
    .line 25
    return-object p1
.end method

.method public final D(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->name:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getIcon()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->icon:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getStartTs()J

    .line 48
    .line 49
    .line 50
    move-result-wide v2

    .line 51
    iput-wide v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->startTs:J

    .line 52
    .line 53
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getDuration()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iput v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->duration:I

    .line 64
    .line 65
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 70
    .line 71
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getType()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->type:Ljava/lang/String;

    .line 76
    .line 77
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getText()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->text:Ljava/lang/String;

    .line 88
    .line 89
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;

    .line 94
    .line 95
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCard;->getIsResult()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    xor-int/lit8 v2, v2, 0x1

    .line 100
    .line 101
    iput-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->showCountdown:Z

    .line 102
    .line 103
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    add-int/lit8 v0, v0, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_0
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.pk.itemCards"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dct;->B(Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dct;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livepkitem/LongLinkLiveMessage$PkItemCardsDetail;)Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowListWithBoth;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
