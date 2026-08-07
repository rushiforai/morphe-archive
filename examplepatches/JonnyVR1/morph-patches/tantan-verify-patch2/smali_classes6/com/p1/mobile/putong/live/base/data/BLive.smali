.class public Lcom/p1/mobile/putong/live/base/data/BLive;
.super Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final EMPTY:Lcom/p1/mobile/putong/live/base/data/BLive;

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blive"


# instance fields
.field public callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field private from:I

.field public messageCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public redPacketIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public rewarderCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field private roomCoverUrl:Ljava/lang/String;

.field public rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public videoCaptureScore:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLive;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLive$1;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLive$1;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;
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

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;
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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLive;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLive;->nullCheck()V

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

    .line 244
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLive;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLive;-><init>()V

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
    new-instance v2, Ll/wq1;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/wq1;-><init>()V

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
    new-instance v2, Ll/xq1;

    .line 114
    .line 115
    invoke-direct {v2}, Ll/xq1;-><init>()V

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->enterRoomType:I

    .line 137
    .line 138
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->enterRoomType:I

    .line 139
    .line 140
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->messageCount:J

    .line 141
    .line 142
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->messageCount:J

    .line 143
    .line 144
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->rewarderCount:D

    .line 145
    .line 146
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->rewarderCount:D

    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 149
    .line 150
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->redPacketIds:Ljava/util/List;

    .line 153
    .line 154
    if-eqz v1, :cond_8

    .line 155
    .line 156
    new-instance v2, Ll/yq1;

    .line 157
    .line 158
    invoke-direct {v2}, Ll/yq1;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->redPacketIds:Ljava/util/List;

    .line 166
    .line 167
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 168
    .line 169
    if-eqz v1, :cond_9

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 176
    .line 177
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 178
    .line 179
    if-eqz v1, :cond_a

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 186
    .line 187
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 188
    .line 189
    if-eqz v1, :cond_b

    .line 190
    .line 191
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 196
    .line 197
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 198
    .line 199
    if-eqz v1, :cond_c

    .line 200
    .line 201
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 206
    .line 207
    :cond_c
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->videoCaptureScore:F

    .line 208
    .line 209
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->videoCaptureScore:F

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 212
    .line 213
    if-eqz v1, :cond_d

    .line 214
    .line 215
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 220
    .line 221
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 222
    .line 223
    if-eqz v1, :cond_e

    .line 224
    .line 225
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 230
    .line 231
    :cond_e
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 232
    .line 233
    if-eqz p0, :cond_f

    .line 234
    .line 235
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 240
    .line 241
    :cond_f
    return-object v0
.end method

.method public bridge synthetic clone()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 242
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLive;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 243
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLive;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLive;

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
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->messageCount:J

    .line 22
    .line 23
    iget-wide v5, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->messageCount:J

    .line 24
    .line 25
    cmp-long p1, v3, v5

    .line 26
    .line 27
    if-nez p1, :cond_3

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->rewarderCount:D

    .line 30
    .line 31
    iget-wide v5, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->rewarderCount:D

    .line 32
    .line 33
    cmpl-double p1, v3, v5

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->redPacketIds:Ljava/util/List;

    .line 48
    .line 49
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->redPacketIds:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 58
    .line 59
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 60
    .line 61
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 68
    .line 69
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 70
    .line 71
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 78
    .line 79
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 80
    .line 81
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 88
    .line 89
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 90
    .line 91
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    iget p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->videoCaptureScore:F

    .line 98
    .line 99
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->videoCaptureScore:F

    .line 100
    .line 101
    cmpl-float p1, p1, v3

    .line 102
    .line 103
    if-nez p1, :cond_3

    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 106
    .line 107
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 108
    .line 109
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 116
    .line 117
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 118
    .line 119
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_3

    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 126
    .line 127
    iget-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 128
    .line 129
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_3

    .line 134
    .line 135
    return v0

    .line 136
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blive"

    .line 2
    .line 3
    return-object p0
.end method

.method public getExtraRoomCoverUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->roomCoverUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->from:I

    .line 2
    .line 3
    return p0
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
    .locals 6

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_9

    .line 4
    .line 5
    invoke-super {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->messageCount:J

    .line 12
    .line 13
    const/16 v3, 0x20

    .line 14
    .line 15
    ushr-long v4, v1, v3

    .line 16
    .line 17
    xor-long/2addr v1, v4

    .line 18
    long-to-int v1, v1

    .line 19
    add-int/2addr v0, v1

    .line 20
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->rewarderCount:D

    .line 21
    .line 22
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    mul-int/lit8 v0, v0, 0x29

    .line 27
    .line 28
    ushr-long v3, v1, v3

    .line 29
    .line 30
    xor-long/2addr v1, v3

    .line 31
    long-to-int v1, v1

    .line 32
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move v1, v2

    .line 46
    :goto_0
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->redPacketIds:Ljava/util/List;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    move v1, v2

    .line 59
    :goto_1
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_2

    .line 71
    :cond_2
    move v1, v2

    .line 72
    :goto_2
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 76
    .line 77
    if-eqz v1, :cond_3

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    goto :goto_3

    .line 84
    :cond_3
    move v1, v2

    .line 85
    :goto_3
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 89
    .line 90
    if-eqz v1, :cond_4

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    goto :goto_4

    .line 97
    :cond_4
    move v1, v2

    .line 98
    :goto_4
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 102
    .line 103
    if-eqz v1, :cond_5

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    goto :goto_5

    .line 110
    :cond_5
    move v1, v2

    .line 111
    :goto_5
    add-int/2addr v0, v1

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->videoCaptureScore:F

    .line 115
    .line 116
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 124
    .line 125
    if-eqz v1, :cond_6

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->hashCode()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    goto :goto_6

    .line 132
    :cond_6
    move v1, v2

    .line 133
    :goto_6
    add-int/2addr v0, v1

    .line 134
    mul-int/lit8 v0, v0, 0x29

    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 137
    .line 138
    if-eqz v1, :cond_7

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->hashCode()I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    goto :goto_7

    .line 145
    :cond_7
    move v1, v2

    .line 146
    :goto_7
    add-int/2addr v0, v1

    .line 147
    mul-int/lit8 v0, v0, 0x29

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->officialShowLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;

    .line 150
    .line 151
    if-eqz v1, :cond_8

    .line 152
    .line 153
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowInfo;->hashCode()I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    :cond_8
    add-int/2addr v0, v2

    .line 158
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 159
    .line 160
    :cond_9
    return v0
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

.method public isMultiCall()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->onGoing:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->redPacketIds:Ljava/util/List;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->redPacketIds:Ljava/util/List;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 32
    .line 33
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 34
    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveCallInfo;

    .line 42
    .line 43
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 44
    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 52
    .line 53
    :cond_4
    return-void
.end method

.method public setExtraRoomCoverUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->roomCoverUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFrom(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->from:I

    .line 2
    .line 3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
