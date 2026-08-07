.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoiceauction"


# instance fields
.field public auctionRelation:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public currentUserQueueState:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public guestUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isChoosingPledgeRelation:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public leaderboards:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;",
            ">;"
        }
    .end annotation
.end field

.field public level:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public myLeaderboardGap:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public panelBg:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public panelBgId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public stage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public tagImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public updateTimeInSec:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public winnerUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public worth:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public worthBubble:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;)Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->liveId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->liveId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->roomId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->roomId:Ljava/lang/String;

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worth:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worth:J

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->level:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->level:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBg:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBg:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->stage:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->stage:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->auctionRelation:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->auctionRelation:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 47
    .line 48
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->guestUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->guestUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 57
    .line 58
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->winnerUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 59
    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->winnerUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 67
    .line 68
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->leaderboards:Ljava/util/List;

    .line 69
    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    new-instance v2, Ll/g82;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/g82;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->leaderboards:Ljava/util/List;

    .line 82
    .line 83
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->updateTimeInSec:J

    .line 84
    .line 85
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->updateTimeInSec:J

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBgId:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBgId:Ljava/lang/String;

    .line 90
    .line 91
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->myLeaderboardGap:J

    .line 92
    .line 93
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->myLeaderboardGap:J

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worthBubble:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worthBubble:Ljava/lang/String;

    .line 98
    .line 99
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->isChoosingPledgeRelation:Z

    .line 100
    .line 101
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->isChoosingPledgeRelation:Z

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->tagImage:Ljava/lang/String;

    .line 104
    .line 105
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->tagImage:Ljava/lang/String;

    .line 106
    .line 107
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->liveId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->liveId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->roomId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->roomId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worth:J

    .line 44
    .line 45
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worth:J

    .line 46
    .line 47
    cmp-long v1, v3, v5

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->level:I

    .line 52
    .line 53
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->level:I

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBg:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBg:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->stage:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->stage:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->auctionRelation:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->auctionRelation:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->guestUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->guestUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->winnerUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->winnerUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 110
    .line 111
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->leaderboards:Ljava/util/List;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->leaderboards:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_2

    .line 126
    .line 127
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->updateTimeInSec:J

    .line 128
    .line 129
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->updateTimeInSec:J

    .line 130
    .line 131
    cmp-long v1, v3, v5

    .line 132
    .line 133
    if-nez v1, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBgId:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBgId:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->myLeaderboardGap:J

    .line 146
    .line 147
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->myLeaderboardGap:J

    .line 148
    .line 149
    cmp-long v1, v3, v5

    .line 150
    .line 151
    if-nez v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worthBubble:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worthBubble:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_2

    .line 162
    .line 163
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->isChoosingPledgeRelation:Z

    .line 164
    .line 165
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->isChoosingPledgeRelation:Z

    .line 166
    .line 167
    if-ne v1, v3, :cond_2

    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->tagImage:Ljava/lang/String;

    .line 170
    .line 171
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->tagImage:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_2

    .line 178
    .line 179
    return v0

    .line 180
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoiceauction"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_e

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->liveId:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->roomId:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worth:J

    .line 48
    .line 49
    const/16 v1, 0x20

    .line 50
    .line 51
    ushr-long v5, v3, v1

    .line 52
    .line 53
    xor-long/2addr v3, v5

    .line 54
    long-to-int v3, v3

    .line 55
    add-int/2addr v0, v3

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->level:I

    .line 59
    .line 60
    add-int/2addr v0, v3

    .line 61
    mul-int/lit8 v0, v0, 0x29

    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBg:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz v3, :cond_3

    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    goto :goto_3

    .line 72
    :cond_3
    move v3, v2

    .line 73
    :goto_3
    add-int/2addr v0, v3

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v3, :cond_4

    .line 79
    .line 80
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    goto :goto_4

    .line 85
    :cond_4
    move v3, v2

    .line 86
    :goto_4
    add-int/2addr v0, v3

    .line 87
    mul-int/lit8 v0, v0, 0x29

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->stage:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v3, :cond_5

    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    goto :goto_5

    .line 98
    :cond_5
    move v3, v2

    .line 99
    :goto_5
    add-int/2addr v0, v3

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->auctionRelation:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 103
    .line 104
    if-eqz v3, :cond_6

    .line 105
    .line 106
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->hashCode()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    goto :goto_6

    .line 111
    :cond_6
    move v3, v2

    .line 112
    :goto_6
    add-int/2addr v0, v3

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->guestUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 116
    .line 117
    if-eqz v3, :cond_7

    .line 118
    .line 119
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->hashCode()I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    goto :goto_7

    .line 124
    :cond_7
    move v3, v2

    .line 125
    :goto_7
    add-int/2addr v0, v3

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->winnerUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 129
    .line 130
    if-eqz v3, :cond_8

    .line 131
    .line 132
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->hashCode()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    goto :goto_8

    .line 137
    :cond_8
    move v3, v2

    .line 138
    :goto_8
    add-int/2addr v0, v3

    .line 139
    mul-int/lit8 v0, v0, 0x29

    .line 140
    .line 141
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->leaderboards:Ljava/util/List;

    .line 142
    .line 143
    if-eqz v3, :cond_9

    .line 144
    .line 145
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    goto :goto_9

    .line 150
    :cond_9
    move v3, v2

    .line 151
    :goto_9
    add-int/2addr v0, v3

    .line 152
    mul-int/lit8 v0, v0, 0x29

    .line 153
    .line 154
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->updateTimeInSec:J

    .line 155
    .line 156
    ushr-long v5, v3, v1

    .line 157
    .line 158
    xor-long/2addr v3, v5

    .line 159
    long-to-int v3, v3

    .line 160
    add-int/2addr v0, v3

    .line 161
    mul-int/lit8 v0, v0, 0x29

    .line 162
    .line 163
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBgId:Ljava/lang/String;

    .line 164
    .line 165
    if-eqz v3, :cond_a

    .line 166
    .line 167
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    goto :goto_a

    .line 172
    :cond_a
    move v3, v2

    .line 173
    :goto_a
    add-int/2addr v0, v3

    .line 174
    mul-int/lit8 v0, v0, 0x29

    .line 175
    .line 176
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->myLeaderboardGap:J

    .line 177
    .line 178
    ushr-long v5, v3, v1

    .line 179
    .line 180
    xor-long/2addr v3, v5

    .line 181
    long-to-int v1, v3

    .line 182
    add-int/2addr v0, v1

    .line 183
    mul-int/lit8 v0, v0, 0x29

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worthBubble:Ljava/lang/String;

    .line 186
    .line 187
    if-eqz v1, :cond_b

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    goto :goto_b

    .line 194
    :cond_b
    move v1, v2

    .line 195
    :goto_b
    add-int/2addr v0, v1

    .line 196
    mul-int/lit8 v0, v0, 0x29

    .line 197
    .line 198
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->isChoosingPledgeRelation:Z

    .line 199
    .line 200
    if-eqz v1, :cond_c

    .line 201
    .line 202
    const/16 v1, 0x4cf

    .line 203
    .line 204
    goto :goto_c

    .line 205
    :cond_c
    const/16 v1, 0x4d5

    .line 206
    .line 207
    :goto_c
    add-int/2addr v0, v1

    .line 208
    mul-int/lit8 v0, v0, 0x29

    .line 209
    .line 210
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->tagImage:Ljava/lang/String;

    .line 211
    .line 212
    if-eqz v1, :cond_d

    .line 213
    .line 214
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    :cond_d
    add-int/2addr v0, v2

    .line 219
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 220
    .line 221
    :cond_e
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->liveId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->roomId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->roomId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBg:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBg:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->currentUserQueueState:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->stage:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->stage:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->auctionRelation:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->auctionRelation:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->guestUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->guestUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 58
    .line 59
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->winnerUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 60
    .line 61
    if-nez v0, :cond_8

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->winnerUser:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 68
    .line 69
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->leaderboards:Ljava/util/List;

    .line 70
    .line 71
    if-nez v0, :cond_9

    .line 72
    .line 73
    new-instance v0, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->leaderboards:Ljava/util/List;

    .line 79
    .line 80
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBgId:Ljava/lang/String;

    .line 81
    .line 82
    if-nez v0, :cond_a

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->panelBgId:Ljava/lang/String;

    .line 85
    .line 86
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worthBubble:Ljava/lang/String;

    .line 87
    .line 88
    if-nez v0, :cond_b

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->worthBubble:Ljava/lang/String;

    .line 91
    .line 92
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->tagImage:Ljava/lang/String;

    .line 93
    .line 94
    if-nez v0, :cond_c

    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->tagImage:Ljava/lang/String;

    .line 97
    .line 98
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
