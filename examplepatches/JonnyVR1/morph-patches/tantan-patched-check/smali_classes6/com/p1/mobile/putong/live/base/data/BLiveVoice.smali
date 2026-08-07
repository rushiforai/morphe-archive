.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoice;
.super Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static ALL_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static AUCTION_STRATEGY:Ljava/lang/String; = null

.field public static BOTTOM_EIGHT_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static BOTTOM_NINE_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static BOTTOM_TEN_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static EIGHT_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static final EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

.field public static FIVE_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            ">;"
        }
    .end annotation
.end field

.field public static NINE_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static TEN_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static THREE_DEPUTY_STRATEGY:Ljava/lang/String; = null

.field public static final TYPE:Ljava/lang/String; = "blivevoice"

.field public static VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

.field public static VOICE_LIVE_MODEL_RADIO_3:Ljava/lang/String;

.field public static VOICE_LIVE_MODEL_RADIO_5:Ljava/lang/String;

.field public static VOICE_NINE_MIC_BOSS_POSITION:I


# instance fields
.field public auctionId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public bossState:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public callNumbers:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public canFollowAnchor:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public gameId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public onCallView:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;"
        }
    .end annotation
.end field

.field public template:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public templateType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 6
    .line 7
    const-string v0, "eightCall"

    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "nineCall"

    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "tenCall"

    .line 16
    .line 17
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "allCall"

    .line 20
    .line 21
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->ALL_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "auctionCall"

    .line 24
    .line 25
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->AUCTION_STRATEGY:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, "bottomEightCall"

    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "bottomNineCall"

    .line 32
    .line 33
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "bottomTenCall"

    .line 36
    .line 37
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->BOTTOM_TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "threeCall"

    .line 40
    .line 41
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->THREE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 42
    .line 43
    const-string v0, "fiveCall"

    .line 44
    .line 45
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->FIVE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "boss"

    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 50
    .line 51
    const-string v0, "radio3"

    .line 52
    .line 53
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_3:Ljava/lang/String;

    .line 54
    .line 55
    const-string v0, "radio5"

    .line 56
    .line 57
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_5:Ljava/lang/String;

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    sput v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_NINE_MIC_BOSS_POSITION:I

    .line 62
    .line 63
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice$1;

    .line 64
    .line 65
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice$1;-><init>()V

    .line 66
    .line 67
    .line 68
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 69
    .line 70
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

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->nullCheck()V

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

    .line 210
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 208
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;-><init>()V

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
    new-instance v2, Ll/d82;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/d82;-><init>()V

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
    new-instance v2, Ll/e82;

    .line 114
    .line 115
    invoke-direct {v2}, Ll/e82;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 141
    .line 142
    if-eqz v1, :cond_8

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 149
    .line 150
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 151
    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->gameId:Ljava/lang/String;

    .line 155
    .line 156
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->gameId:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 159
    .line 160
    if-eqz v1, :cond_9

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->clone()Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 167
    .line 168
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->tags:Ljava/util/List;

    .line 169
    .line 170
    if-eqz v1, :cond_a

    .line 171
    .line 172
    new-instance v2, Ll/f82;

    .line 173
    .line 174
    invoke-direct {v2}, Ll/f82;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->tags:Ljava/util/List;

    .line 182
    .line 183
    :cond_a
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->canFollowAnchor:Z

    .line 184
    .line 185
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->canFollowAnchor:Z

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 188
    .line 189
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->templateType:Ljava/lang/String;

    .line 192
    .line 193
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->templateType:Ljava/lang/String;

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->auctionId:Ljava/lang/String;

    .line 196
    .line 197
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->auctionId:Ljava/lang/String;

    .line 198
    .line 199
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callNumbers:I

    .line 200
    .line 201
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callNumbers:I

    .line 202
    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->bossState:Ljava/lang/String;

    .line 204
    .line 205
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->bossState:Ljava/lang/String;

    .line 206
    .line 207
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 209
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

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
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->gameId:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->gameId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 54
    .line 55
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->tags:Ljava/util/List;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->tags:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->canFollowAnchor:Z

    .line 72
    .line 73
    iget-boolean v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->canFollowAnchor:Z

    .line 74
    .line 75
    if-ne p1, v3, :cond_3

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->templateType:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->templateType:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->auctionId:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->auctionId:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_3

    .line 106
    .line 107
    iget p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callNumbers:I

    .line 108
    .line 109
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callNumbers:I

    .line 110
    .line 111
    if-ne p1, v3, :cond_3

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->bossState:Ljava/lang/String;

    .line 114
    .line 115
    iget-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->bossState:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_3

    .line 122
    .line 123
    return v0

    .line 124
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoice"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_a

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->gameId:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    move v1, v2

    .line 61
    :goto_3
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->tags:Ljava/util/List;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    goto :goto_4

    .line 73
    :cond_4
    move v1, v2

    .line 74
    :goto_4
    add-int/2addr v0, v1

    .line 75
    mul-int/lit8 v0, v0, 0x29

    .line 76
    .line 77
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->canFollowAnchor:Z

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    const/16 v1, 0x4cf

    .line 82
    .line 83
    goto :goto_5

    .line 84
    :cond_5
    const/16 v1, 0x4d5

    .line 85
    .line 86
    :goto_5
    add-int/2addr v0, v1

    .line 87
    mul-int/lit8 v0, v0, 0x29

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v1, :cond_6

    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    goto :goto_6

    .line 98
    :cond_6
    move v1, v2

    .line 99
    :goto_6
    add-int/2addr v0, v1

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->templateType:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v1, :cond_7

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    goto :goto_7

    .line 111
    :cond_7
    move v1, v2

    .line 112
    :goto_7
    add-int/2addr v0, v1

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->auctionId:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v1, :cond_8

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    goto :goto_8

    .line 124
    :cond_8
    move v1, v2

    .line 125
    :goto_8
    add-int/2addr v0, v1

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callNumbers:I

    .line 129
    .line 130
    add-int/2addr v0, v1

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->bossState:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz v1, :cond_9

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    :cond_9
    add-int/2addr v0, v2

    .line 142
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 143
    .line 144
    :cond_a
    return v0
.end method

.method public isIncomerArea()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->isOverseasArea()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->isMainLandArea()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public isMainLandArea()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

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

.method public isOverseasArea()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EIGHT_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->TEN_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->NINE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->THREE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->FIVE_DEPUTY_STRATEGY:Ljava/lang/String;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->gameId:Ljava/lang/String;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->gameId:Ljava/lang/String;

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 29
    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->new_()Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 37
    .line 38
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->tags:Ljava/util/List;

    .line 39
    .line 40
    if-nez v0, :cond_4

    .line 41
    .line 42
    new-instance v0, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->tags:Ljava/util/List;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->onCallView:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->templateType:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_6

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->templateType:Ljava/lang/String;

    .line 60
    .line 61
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->auctionId:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_7

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->auctionId:Ljava/lang/String;

    .line 66
    .line 67
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->bossState:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_8

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->bossState:Ljava/lang/String;

    .line 72
    .line 73
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public update(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/data/BLiveVoice;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 34
    .line 35
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 48
    .line 49
    :cond_3
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 50
    .line 51
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 52
    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 58
    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 66
    .line 67
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 68
    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 76
    .line 77
    :cond_5
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 78
    .line 79
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 80
    .line 81
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->startTime:D

    .line 82
    .line 83
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->startTime:D

    .line 84
    .line 85
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 86
    .line 87
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 90
    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 92
    .line 93
    return-object p0
.end method
