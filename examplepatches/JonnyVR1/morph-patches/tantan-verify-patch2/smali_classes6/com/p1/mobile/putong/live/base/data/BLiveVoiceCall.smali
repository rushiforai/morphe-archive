.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoicecall"


# instance fields
.field public anchor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public anchorPicture:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public anchorUserName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public awayReason:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public contribution:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public hangupReason:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public hatInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public inAction:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public intendPosition:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public inviteId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public isAway:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public isHost:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public isSpeak:Z

.field public isVoiceGaming:Z

.field public mutedByAnchor:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public mutedByUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public pkCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;

.field public playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

.field public pointType:Ljava/lang/String;

.field public popularity:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public position:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public role:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public startTime:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public state:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public user:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public userNameGradientColors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public userPicture:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public userRecvRewardPoint:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public userSendRewardPoint:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public voiceLiveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public volume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "unknown_"

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 10
    .line 11
    iput p3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 12
    .line 13
    iput-object p4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 14
    .line 15
    return-object v0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->nullCheck()V

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

    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 43
    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 51
    .line 52
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 55
    .line 56
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 59
    .line 60
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 95
    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 99
    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 101
    .line 102
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 103
    .line 104
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 105
    .line 106
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 107
    .line 108
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 109
    .line 110
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isHost:Z

    .line 111
    .line 112
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isHost:Z

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 115
    .line 116
    if-eqz v1, :cond_0

    .line 117
    .line 118
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 123
    .line 124
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 125
    .line 126
    if-eqz p0, :cond_1

    .line 127
    .line 128
    new-instance v1, Ll/k82;

    .line 129
    .line 130
    invoke-direct {v1}, Ll/k82;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 138
    .line 139
    :cond_1
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 84
    .line 85
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 86
    .line 87
    cmp-long v1, v3, v5

    .line 88
    .line 89
    if-nez v1, :cond_2

    .line 90
    .line 91
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 92
    .line 93
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 94
    .line 95
    cmp-long v1, v3, v5

    .line 96
    .line 97
    if-nez v1, :cond_2

    .line 98
    .line 99
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 100
    .line 101
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 102
    .line 103
    if-ne v1, v3, :cond_2

    .line 104
    .line 105
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 106
    .line 107
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 108
    .line 109
    if-ne v1, v3, :cond_2

    .line 110
    .line 111
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 112
    .line 113
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 114
    .line 115
    if-ne v1, v3, :cond_2

    .line 116
    .line 117
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 118
    .line 119
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 120
    .line 121
    if-ne v1, v3, :cond_2

    .line 122
    .line 123
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 124
    .line 125
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 126
    .line 127
    if-ne v1, v3, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_2

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_2

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_2

    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 160
    .line 161
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_2

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_2

    .line 178
    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 180
    .line 181
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_2

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 192
    .line 193
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_2

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_2

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 210
    .line 211
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 212
    .line 213
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-eqz v1, :cond_2

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 220
    .line 221
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_2

    .line 228
    .line 229
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 230
    .line 231
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 232
    .line 233
    cmp-long v1, v3, v5

    .line 234
    .line 235
    if-nez v1, :cond_2

    .line 236
    .line 237
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 238
    .line 239
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 240
    .line 241
    cmp-long v1, v3, v5

    .line 242
    .line 243
    if-nez v1, :cond_2

    .line 244
    .line 245
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isHost:Z

    .line 246
    .line 247
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isHost:Z

    .line 248
    .line 249
    if-ne v1, v3, :cond_2

    .line 250
    .line 251
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 252
    .line 253
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 254
    .line 255
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-eqz v1, :cond_2

    .line 260
    .line 261
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 262
    .line 263
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 264
    .line 265
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result p0

    .line 269
    if-eqz p0, :cond_2

    .line 270
    .line 271
    return v0

    .line 272
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoicecall"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 10

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_17

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 100
    .line 101
    const/16 v1, 0x20

    .line 102
    .line 103
    ushr-long v5, v3, v1

    .line 104
    .line 105
    xor-long/2addr v3, v5

    .line 106
    long-to-int v3, v3

    .line 107
    add-int/2addr v0, v3

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 111
    .line 112
    ushr-long v5, v3, v1

    .line 113
    .line 114
    xor-long/2addr v3, v5

    .line 115
    long-to-int v3, v3

    .line 116
    add-int/2addr v0, v3

    .line 117
    mul-int/lit8 v0, v0, 0x29

    .line 118
    .line 119
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 120
    .line 121
    add-int/2addr v0, v3

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 125
    .line 126
    add-int/2addr v0, v3

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 130
    .line 131
    const/16 v4, 0x4d5

    .line 132
    .line 133
    const/16 v5, 0x4cf

    .line 134
    .line 135
    if-eqz v3, :cond_7

    .line 136
    .line 137
    move v3, v5

    .line 138
    goto :goto_7

    .line 139
    :cond_7
    move v3, v4

    .line 140
    :goto_7
    add-int/2addr v0, v3

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 144
    .line 145
    if-eqz v3, :cond_8

    .line 146
    .line 147
    move v3, v5

    .line 148
    goto :goto_8

    .line 149
    :cond_8
    move v3, v4

    .line 150
    :goto_8
    add-int/2addr v0, v3

    .line 151
    mul-int/lit8 v0, v0, 0x29

    .line 152
    .line 153
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 154
    .line 155
    if-eqz v3, :cond_9

    .line 156
    .line 157
    move v3, v5

    .line 158
    goto :goto_9

    .line 159
    :cond_9
    move v3, v4

    .line 160
    :goto_9
    add-int/2addr v0, v3

    .line 161
    mul-int/lit8 v0, v0, 0x29

    .line 162
    .line 163
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 177
    .line 178
    if-eqz v3, :cond_b

    .line 179
    .line 180
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    goto :goto_b

    .line 185
    :cond_b
    move v3, v2

    .line 186
    :goto_b
    add-int/2addr v0, v3

    .line 187
    mul-int/lit8 v0, v0, 0x29

    .line 188
    .line 189
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz v3, :cond_c

    .line 192
    .line 193
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    goto :goto_c

    .line 198
    :cond_c
    move v3, v2

    .line 199
    :goto_c
    add-int/2addr v0, v3

    .line 200
    mul-int/lit8 v0, v0, 0x29

    .line 201
    .line 202
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 203
    .line 204
    if-eqz v3, :cond_d

    .line 205
    .line 206
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    goto :goto_d

    .line 211
    :cond_d
    move v3, v2

    .line 212
    :goto_d
    add-int/2addr v0, v3

    .line 213
    mul-int/lit8 v0, v0, 0x29

    .line 214
    .line 215
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 216
    .line 217
    if-eqz v3, :cond_e

    .line 218
    .line 219
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    goto :goto_e

    .line 224
    :cond_e
    move v3, v2

    .line 225
    :goto_e
    add-int/2addr v0, v3

    .line 226
    mul-int/lit8 v0, v0, 0x29

    .line 227
    .line 228
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 229
    .line 230
    if-eqz v3, :cond_f

    .line 231
    .line 232
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    goto :goto_f

    .line 237
    :cond_f
    move v3, v2

    .line 238
    :goto_f
    add-int/2addr v0, v3

    .line 239
    mul-int/lit8 v0, v0, 0x29

    .line 240
    .line 241
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 242
    .line 243
    if-eqz v3, :cond_10

    .line 244
    .line 245
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    goto :goto_10

    .line 250
    :cond_10
    move v3, v2

    .line 251
    :goto_10
    add-int/2addr v0, v3

    .line 252
    mul-int/lit8 v0, v0, 0x29

    .line 253
    .line 254
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 255
    .line 256
    if-eqz v3, :cond_11

    .line 257
    .line 258
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 259
    .line 260
    .line 261
    move-result v3

    .line 262
    goto :goto_11

    .line 263
    :cond_11
    move v3, v2

    .line 264
    :goto_11
    add-int/2addr v0, v3

    .line 265
    mul-int/lit8 v0, v0, 0x29

    .line 266
    .line 267
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 268
    .line 269
    if-eqz v3, :cond_12

    .line 270
    .line 271
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 272
    .line 273
    .line 274
    move-result v3

    .line 275
    goto :goto_12

    .line 276
    :cond_12
    move v3, v2

    .line 277
    :goto_12
    add-int/2addr v0, v3

    .line 278
    mul-int/lit8 v0, v0, 0x29

    .line 279
    .line 280
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 281
    .line 282
    if-eqz v3, :cond_13

    .line 283
    .line 284
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    goto :goto_13

    .line 289
    :cond_13
    move v3, v2

    .line 290
    :goto_13
    add-int/2addr v0, v3

    .line 291
    mul-int/lit8 v0, v0, 0x29

    .line 292
    .line 293
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 294
    .line 295
    ushr-long v8, v6, v1

    .line 296
    .line 297
    xor-long/2addr v6, v8

    .line 298
    long-to-int v3, v6

    .line 299
    add-int/2addr v0, v3

    .line 300
    mul-int/lit8 v0, v0, 0x29

    .line 301
    .line 302
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 303
    .line 304
    ushr-long v8, v6, v1

    .line 305
    .line 306
    xor-long/2addr v6, v8

    .line 307
    long-to-int v1, v6

    .line 308
    add-int/2addr v0, v1

    .line 309
    mul-int/lit8 v0, v0, 0x29

    .line 310
    .line 311
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isHost:Z

    .line 312
    .line 313
    if-eqz v1, :cond_14

    .line 314
    .line 315
    move v4, v5

    .line 316
    :cond_14
    add-int/2addr v0, v4

    .line 317
    mul-int/lit8 v0, v0, 0x29

    .line 318
    .line 319
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 320
    .line 321
    if-eqz v1, :cond_15

    .line 322
    .line 323
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->hashCode()I

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    goto :goto_14

    .line 328
    :cond_15
    move v1, v2

    .line 329
    :goto_14
    add-int/2addr v0, v1

    .line 330
    mul-int/lit8 v0, v0, 0x29

    .line 331
    .line 332
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 333
    .line 334
    if-eqz v1, :cond_16

    .line 335
    .line 336
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    :cond_16
    add-int/2addr v0, v2

    .line 341
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 342
    .line 343
    :cond_17
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 62
    .line 63
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_a

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 68
    .line 69
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 74
    .line 75
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 76
    .line 77
    if-nez v0, :cond_c

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 80
    .line 81
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 82
    .line 83
    if-nez v0, :cond_d

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 86
    .line 87
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 88
    .line 89
    if-nez v0, :cond_e

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 92
    .line 93
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v0, :cond_f

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 98
    .line 99
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 100
    .line 101
    if-nez v0, :cond_10

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 104
    .line 105
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 106
    .line 107
    if-nez v0, :cond_11

    .line 108
    .line 109
    new-instance v0, Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 115
    .line 116
    :cond_11
    return-void
.end method

.method public setGrabHatGameInfo(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hatInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPointType(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pointType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setVoiceGameStatus(Z)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isVoiceGaming:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
