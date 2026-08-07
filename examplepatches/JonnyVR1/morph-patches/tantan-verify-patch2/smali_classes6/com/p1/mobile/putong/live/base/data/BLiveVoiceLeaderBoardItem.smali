.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoiceleaderboarditem"


# instance fields
.field public amount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public anchorId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public anchorImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public anchorMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public anchorName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public gap:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public honoredguestList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;"
        }
    .end annotation
.end field

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public liveState:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public rank:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->nullCheck()V

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

    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->rank:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->rank:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorName:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorName:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorImage:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorImage:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 39
    .line 40
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->amount:J

    .line 41
    .line 42
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->amount:J

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 47
    .line 48
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->gap:J

    .line 49
    .line 50
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->gap:J

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->honoredguestList:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    new-instance v2, Ll/g92;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/g92;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->honoredguestList:Ljava/util/List;

    .line 66
    .line 67
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 68
    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 76
    .line 77
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 78
    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 82
    .line 83
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 84
    .line 85
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->rank:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->rank:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorName:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorName:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorImage:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorImage:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->amount:J

    .line 82
    .line 83
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->amount:J

    .line 84
    .line 85
    cmp-long v1, v3, v5

    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->gap:J

    .line 100
    .line 101
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->gap:J

    .line 102
    .line 103
    cmp-long v1, v3, v5

    .line 104
    .line 105
    if-nez v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->honoredguestList:Ljava/util/List;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->honoredguestList:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 130
    .line 131
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_2

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 140
    .line 141
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-eqz p0, :cond_2

    .line 146
    .line 147
    return v0

    .line 148
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoiceleaderboarditem"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_b

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->rank:J

    .line 8
    .line 9
    const/16 v3, 0x20

    .line 10
    .line 11
    ushr-long v4, v1, v3

    .line 12
    .line 13
    xor-long/2addr v1, v4

    .line 14
    long-to-int v1, v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x29

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorId:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v1, v2

    .line 29
    :goto_0
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move v1, v2

    .line 42
    :goto_1
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    move v1, v2

    .line 55
    :goto_2
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorName:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_3

    .line 67
    :cond_3
    move v1, v2

    .line 68
    :goto_3
    add-int/2addr v0, v1

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorImage:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    goto :goto_4

    .line 80
    :cond_4
    move v1, v2

    .line 81
    :goto_4
    add-int/2addr v0, v1

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 85
    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->hashCode()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    goto :goto_5

    .line 93
    :cond_5
    move v1, v2

    .line 94
    :goto_5
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->amount:J

    .line 98
    .line 99
    ushr-long v6, v4, v3

    .line 100
    .line 101
    xor-long/2addr v4, v6

    .line 102
    long-to-int v1, v4

    .line 103
    add-int/2addr v0, v1

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    goto :goto_6

    .line 115
    :cond_6
    move v1, v2

    .line 116
    :goto_6
    add-int/2addr v0, v1

    .line 117
    mul-int/lit8 v0, v0, 0x29

    .line 118
    .line 119
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->gap:J

    .line 120
    .line 121
    ushr-long v6, v4, v3

    .line 122
    .line 123
    xor-long v3, v4, v6

    .line 124
    .line 125
    long-to-int v1, v3

    .line 126
    add-int/2addr v0, v1

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->honoredguestList:Ljava/util/List;

    .line 130
    .line 131
    if-eqz v1, :cond_7

    .line 132
    .line 133
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    goto :goto_7

    .line 138
    :cond_7
    move v1, v2

    .line 139
    :goto_7
    add-int/2addr v0, v1

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 143
    .line 144
    if-eqz v1, :cond_8

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->hashCode()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    goto :goto_8

    .line 151
    :cond_8
    move v1, v2

    .line 152
    :goto_8
    add-int/2addr v0, v1

    .line 153
    mul-int/lit8 v0, v0, 0x29

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 156
    .line 157
    if-eqz v1, :cond_9

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    goto :goto_9

    .line 164
    :cond_9
    move v1, v2

    .line 165
    :goto_9
    add-int/2addr v0, v1

    .line 166
    mul-int/lit8 v0, v0, 0x29

    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 169
    .line 170
    if-eqz v1, :cond_a

    .line 171
    .line 172
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    :cond_a
    add-int/2addr v0, v2

    .line 177
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 178
    .line 179
    :cond_b
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorName:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorName:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorImage:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorImage:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->honoredguestList:Ljava/util/List;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->honoredguestList:Ljava/util/List;

    .line 59
    .line 60
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 61
    .line 62
    if-nez v0, :cond_8

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 69
    .line 70
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 71
    .line 72
    if-nez v0, :cond_9

    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 83
    .line 84
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 85
    .line 86
    if-nez v0, :cond_a

    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 97
    .line 98
    :cond_a
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
