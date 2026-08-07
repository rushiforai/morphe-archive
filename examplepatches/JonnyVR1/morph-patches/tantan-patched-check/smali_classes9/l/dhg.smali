.class public Ll/dhg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/nsv<",
            "Ll/w5g;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V
    .locals 4

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    const-string v0, ""

    iput-object v0, p0, Ll/dhg;->a:Ljava/lang/String;

    .line 114
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/dhg;->b:Ljava/util/List;

    .line 115
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRankingsList()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;

    .line 116
    invoke-static {}, Ll/w5g;->a()Ll/w5g$a;

    move-result-object v1

    .line 117
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getAmount()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ll/w5g$a;->b(J)Ll/w5g$a;

    move-result-object v1

    .line 118
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getRank()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ll/w5g$a;->c(J)Ll/w5g$a;

    move-result-object v1

    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getUserId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/w5g$a;->d(Ljava/lang/String;)Ll/w5g$a;

    move-result-object v1

    .line 120
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getUserImage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/w5g$a;->e(Ljava/lang/String;)Ll/w5g$a;

    move-result-object v1

    .line 121
    invoke-virtual {v1}, Ll/w5g$a;->a()Ll/w5g;

    move-result-object v1

    .line 122
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    move-result-object v0

    invoke-static {v0}, Ll/f3t;->c(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    move-result-object v0

    .line 123
    invoke-static {v1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    move-result-object v1

    invoke-virtual {v1, v0}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    move-result-object v0

    .line 124
    iget-object v1, p0, Ll/dhg;->b:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>(Ll/hcr;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/dhg;->a:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/dhg;->b:Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/hcr;->d()Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 34
    .line 35
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    if-nez v2, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {}, Ll/w5g;->a()Ll/w5g$a;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 45
    .line 46
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3}, Ljava/lang/Double;->longValue()J

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    invoke-virtual {v2, v3, v4}, Ll/w5g$a;->b(J)Ll/w5g$a;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ll/w5g$a;->d(Ljava/lang/String;)Ll/w5g$a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ll/w5g$a;->e(Ljava/lang/String;)Ll/w5g$a;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 79
    .line 80
    int-to-long v3, v3

    .line 81
    invoke-virtual {v2, v3, v4}, Ll/w5g$a;->c(J)Ll/w5g$a;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2}, Ll/w5g$a;->a()Ll/w5g;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->user:Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p1, v1}, Ll/hcr;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v2, v1}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget-object v2, p0, Ll/dhg;->b:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dhg;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/nsv<",
            "Ll/w5g;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dhg;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/dhg;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
