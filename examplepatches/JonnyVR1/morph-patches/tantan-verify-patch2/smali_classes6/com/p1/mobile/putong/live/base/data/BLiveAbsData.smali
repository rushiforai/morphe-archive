.class public Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ">;"
        }
    .end annotation
.end field

.field public static final MULTI_CALL:Ljava/lang/String; = "multi_call"

.field public static final NORMAL_LIVE:Ljava/lang/String; = "live"

.field public static final TYPE:Ljava/lang/String; = "bliveabsdata"

.field public static final VOICE_LIVE:Ljava/lang/String; = "voice-live"


# instance fields
.field public anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public basicLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;",
            ">;"
        }
    .end annotation
.end field

.field public callback:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public endTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public enterRoomType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public liveMode:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public memberCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public requestExtra:Ljava/lang/String;

.field public rewardPoint:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public simplechat:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public specialLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;",
            ">;"
        }
    .end annotation
.end field

.field public startTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public state:Lcom/p1/mobile/putong/live/base/data/BLiveState;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public subSource:Ljava/lang/String;

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public videoCapture:Lcom/p1/mobile/putong/data/Media;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->nullCheck()V

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

    .line 142
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 39
    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->basicLabels:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    new-instance v2, Ll/zq1;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/zq1;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->basicLabels:Ljava/util/List;

    .line 58
    .line 59
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 60
    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 68
    .line 69
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 70
    .line 71
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 74
    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 86
    .line 87
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 96
    .line 97
    :cond_6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 98
    .line 99
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 100
    .line 101
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->startTime:D

    .line 102
    .line 103
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->startTime:D

    .line 104
    .line 105
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 106
    .line 107
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->specialLabels:Ljava/util/List;

    .line 110
    .line 111
    if-eqz v1, :cond_7

    .line 112
    .line 113
    new-instance v2, Ll/ar1;

    .line 114
    .line 115
    invoke-direct {v2}, Ll/ar1;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->specialLabels:Ljava/util/List;

    .line 123
    .line 124
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 125
    .line 126
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 131
    .line 132
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->simplechat:Z

    .line 133
    .line 134
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->simplechat:Z

    .line 135
    .line 136
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->enterRoomType:I

    .line 137
    .line 138
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->enterRoomType:I

    .line 139
    .line 140
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->basicLabels:Ljava/util/List;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->basicLabels:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 84
    .line 85
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 86
    .line 87
    cmpl-double v1, v3, v5

    .line 88
    .line 89
    if-nez v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_2

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 104
    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 112
    .line 113
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 114
    .line 115
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_2

    .line 120
    .line 121
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 122
    .line 123
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 124
    .line 125
    cmpl-double v1, v3, v5

    .line 126
    .line 127
    if-nez v1, :cond_2

    .line 128
    .line 129
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->startTime:D

    .line 130
    .line 131
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->startTime:D

    .line 132
    .line 133
    cmpl-double v1, v3, v5

    .line 134
    .line 135
    if-nez v1, :cond_2

    .line 136
    .line 137
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 138
    .line 139
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 140
    .line 141
    cmpl-double v1, v3, v5

    .line 142
    .line 143
    if-nez v1, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->specialLabels:Ljava/util/List;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->specialLabels:Ljava/util/List;

    .line 148
    .line 149
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_2

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_2

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 166
    .line 167
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_2

    .line 174
    .line 175
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->simplechat:Z

    .line 176
    .line 177
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->simplechat:Z

    .line 178
    .line 179
    if-ne v1, v3, :cond_2

    .line 180
    .line 181
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->enterRoomType:I

    .line 182
    .line 183
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->enterRoomType:I

    .line 184
    .line 185
    if-ne p0, p1, :cond_2

    .line 186
    .line 187
    return v0

    .line 188
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveabsdata"

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecommendCategory()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "basic"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public getRecommendCategoryForTrack()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "NA"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 17
    .line 18
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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->basicLabels:Ljava/util/List;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 98
    .line 99
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 100
    .line 101
    .line 102
    move-result-wide v3

    .line 103
    mul-int/lit8 v0, v0, 0x29

    .line 104
    .line 105
    const/16 v1, 0x20

    .line 106
    .line 107
    ushr-long v5, v3, v1

    .line 108
    .line 109
    xor-long/2addr v3, v5

    .line 110
    long-to-int v3, v3

    .line 111
    add-int/2addr v0, v3

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz v3, :cond_7

    .line 117
    .line 118
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    goto :goto_7

    .line 123
    :cond_7
    move v3, v2

    .line 124
    :goto_7
    add-int/2addr v0, v3

    .line 125
    mul-int/lit8 v0, v0, 0x29

    .line 126
    .line 127
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 128
    .line 129
    if-eqz v3, :cond_8

    .line 130
    .line 131
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->hashCode()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    goto :goto_8

    .line 136
    :cond_8
    move v3, v2

    .line 137
    :goto_8
    add-int/2addr v0, v3

    .line 138
    mul-int/lit8 v0, v0, 0x29

    .line 139
    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 141
    .line 142
    if-eqz v3, :cond_9

    .line 143
    .line 144
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->hashCode()I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    goto :goto_9

    .line 149
    :cond_9
    move v3, v2

    .line 150
    :goto_9
    add-int/2addr v0, v3

    .line 151
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 152
    .line 153
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 154
    .line 155
    .line 156
    move-result-wide v3

    .line 157
    mul-int/lit8 v0, v0, 0x29

    .line 158
    .line 159
    ushr-long v5, v3, v1

    .line 160
    .line 161
    xor-long/2addr v3, v5

    .line 162
    long-to-int v3, v3

    .line 163
    add-int/2addr v0, v3

    .line 164
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->startTime:D

    .line 165
    .line 166
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 167
    .line 168
    .line 169
    move-result-wide v3

    .line 170
    mul-int/lit8 v0, v0, 0x29

    .line 171
    .line 172
    ushr-long v5, v3, v1

    .line 173
    .line 174
    xor-long/2addr v3, v5

    .line 175
    long-to-int v3, v3

    .line 176
    add-int/2addr v0, v3

    .line 177
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 178
    .line 179
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 180
    .line 181
    .line 182
    move-result-wide v3

    .line 183
    mul-int/lit8 v0, v0, 0x29

    .line 184
    .line 185
    ushr-long v5, v3, v1

    .line 186
    .line 187
    xor-long/2addr v3, v5

    .line 188
    long-to-int v1, v3

    .line 189
    add-int/2addr v0, v1

    .line 190
    mul-int/lit8 v0, v0, 0x29

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->specialLabels:Ljava/util/List;

    .line 193
    .line 194
    if-eqz v1, :cond_a

    .line 195
    .line 196
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    goto :goto_a

    .line 201
    :cond_a
    move v1, v2

    .line 202
    :goto_a
    add-int/2addr v0, v1

    .line 203
    mul-int/lit8 v0, v0, 0x29

    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 206
    .line 207
    if-eqz v1, :cond_b

    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    goto :goto_b

    .line 214
    :cond_b
    move v1, v2

    .line 215
    :goto_b
    add-int/2addr v0, v1

    .line 216
    mul-int/lit8 v0, v0, 0x29

    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 219
    .line 220
    if-eqz v1, :cond_c

    .line 221
    .line 222
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    :cond_c
    add-int/2addr v0, v2

    .line 227
    mul-int/lit8 v0, v0, 0x29

    .line 228
    .line 229
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->simplechat:Z

    .line 230
    .line 231
    if-eqz v1, :cond_d

    .line 232
    .line 233
    const/16 v1, 0x4cf

    .line 234
    .line 235
    goto :goto_c

    .line 236
    :cond_d
    const/16 v1, 0x4d5

    .line 237
    .line 238
    :goto_c
    add-int/2addr v0, v1

    .line 239
    mul-int/lit8 v0, v0, 0x29

    .line 240
    .line 241
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->enterRoomType:I

    .line 242
    .line 243
    add-int/2addr v0, v1

    .line 244
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 245
    .line 246
    :cond_e
    return v0
.end method

.method public isFriendLive()Z
    .locals 1

    .line 1
    const-string v0, "friends"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isLiving()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 2
    .line 3
    const-string v0, "onlive"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isNormalLive()Z
    .locals 2

    .line 1
    const-string v0, "live"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

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
    instance-of p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 12
    .line 13
    if-eqz p0, :cond_0

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

.method public isOfficialShowRoom()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "officialShow"

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

.method public isVoiceLive()Z
    .locals 2

    .line 1
    const-string v0, "voice-live"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

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
    instance-of p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 12
    .line 13
    if-eqz p0, :cond_0

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

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 52
    .line 53
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->basicLabels:Ljava/util/List;

    .line 54
    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->basicLabels:Ljava/util/List;

    .line 63
    .line 64
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 65
    .line 66
    if-nez v0, :cond_6

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 69
    .line 70
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 71
    .line 72
    if-nez v0, :cond_7

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 79
    .line 80
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 81
    .line 82
    if-nez v0, :cond_8

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 89
    .line 90
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->specialLabels:Ljava/util/List;

    .line 91
    .line 92
    if-nez v0, :cond_9

    .line 93
    .line 94
    new-instance v0, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->specialLabels:Ljava/util/List;

    .line 100
    .line 101
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 102
    .line 103
    if-nez v0, :cond_a

    .line 104
    .line 105
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 106
    .line 107
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 108
    .line 109
    if-nez v0, :cond_b

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 112
    .line 113
    :cond_b
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
