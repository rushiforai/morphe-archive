.class public Lcom/p1/mobile/putong/live/base/data/BLiveCall;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveCall;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivecall"


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

.field public fakeId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public hangupReason:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
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

.field public isSpeak:Z

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

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

.field public opState:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public position:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public state:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
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

.field public videoInviteTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public volume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->nullCheck()V

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

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 43
    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 51
    .line 52
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 55
    .line 56
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 59
    .line 60
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 81
    .line 82
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 83
    .line 84
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 93
    .line 94
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 84
    .line 85
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 86
    .line 87
    cmp-long v1, v3, v5

    .line 88
    .line 89
    if-nez v1, :cond_2

    .line 90
    .line 91
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 92
    .line 93
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 94
    .line 95
    cmp-long v1, v3, v5

    .line 96
    .line 97
    if-nez v1, :cond_2

    .line 98
    .line 99
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 100
    .line 101
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 102
    .line 103
    if-ne v1, v3, :cond_2

    .line 104
    .line 105
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 106
    .line 107
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 108
    .line 109
    if-ne v1, v3, :cond_2

    .line 110
    .line 111
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 112
    .line 113
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 114
    .line 115
    if-ne v1, v3, :cond_2

    .line 116
    .line 117
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 118
    .line 119
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 120
    .line 121
    if-ne v1, v3, :cond_2

    .line 122
    .line 123
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 124
    .line 125
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 126
    .line 127
    if-ne v1, v3, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 160
    .line 161
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 180
    .line 181
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 182
    .line 183
    cmp-long v1, v3, v5

    .line 184
    .line 185
    if-nez v1, :cond_2

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 188
    .line 189
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_2

    .line 196
    .line 197
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 198
    .line 199
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 200
    .line 201
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    if-eqz p0, :cond_2

    .line 206
    .line 207
    return v0

    .line 208
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivecall"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDeputyViewPos()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 2
    .line 3
    add-int/lit8 p0, p0, -0x1

    .line 4
    .line 5
    return p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_11

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

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
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 120
    .line 121
    add-int/2addr v0, v3

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 125
    .line 126
    add-int/2addr v0, v3

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

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
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

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
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 154
    .line 155
    if-eqz v3, :cond_9

    .line 156
    .line 157
    move v4, v5

    .line 158
    :cond_9
    add-int/2addr v0, v4

    .line 159
    mul-int/lit8 v0, v0, 0x29

    .line 160
    .line 161
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 162
    .line 163
    if-eqz v3, :cond_a

    .line 164
    .line 165
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    goto :goto_9

    .line 170
    :cond_a
    move v3, v2

    .line 171
    :goto_9
    add-int/2addr v0, v3

    .line 172
    mul-int/lit8 v0, v0, 0x29

    .line 173
    .line 174
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 175
    .line 176
    if-eqz v3, :cond_b

    .line 177
    .line 178
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    goto :goto_a

    .line 183
    :cond_b
    move v3, v2

    .line 184
    :goto_a
    add-int/2addr v0, v3

    .line 185
    mul-int/lit8 v0, v0, 0x29

    .line 186
    .line 187
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v3, :cond_c

    .line 190
    .line 191
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    goto :goto_b

    .line 196
    :cond_c
    move v3, v2

    .line 197
    :goto_b
    add-int/2addr v0, v3

    .line 198
    mul-int/lit8 v0, v0, 0x29

    .line 199
    .line 200
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz v3, :cond_d

    .line 203
    .line 204
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    goto :goto_c

    .line 209
    :cond_d
    move v3, v2

    .line 210
    :goto_c
    add-int/2addr v0, v3

    .line 211
    mul-int/lit8 v0, v0, 0x29

    .line 212
    .line 213
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 214
    .line 215
    if-eqz v3, :cond_e

    .line 216
    .line 217
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    goto :goto_d

    .line 222
    :cond_e
    move v3, v2

    .line 223
    :goto_d
    add-int/2addr v0, v3

    .line 224
    mul-int/lit8 v0, v0, 0x29

    .line 225
    .line 226
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->videoInviteTime:J

    .line 227
    .line 228
    ushr-long v5, v3, v1

    .line 229
    .line 230
    xor-long/2addr v3, v5

    .line 231
    long-to-int v1, v3

    .line 232
    add-int/2addr v0, v1

    .line 233
    mul-int/lit8 v0, v0, 0x29

    .line 234
    .line 235
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 236
    .line 237
    if-eqz v1, :cond_f

    .line 238
    .line 239
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    goto :goto_e

    .line 244
    :cond_f
    move v1, v2

    .line 245
    :goto_e
    add-int/2addr v0, v1

    .line 246
    mul-int/lit8 v0, v0, 0x29

    .line 247
    .line 248
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 249
    .line 250
    if-eqz v1, :cond_10

    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    :cond_10
    add-int/2addr v0, v2

    .line 257
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 258
    .line 259
    :cond_11
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 62
    .line 63
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_a

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 68
    .line 69
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 74
    .line 75
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 76
    .line 77
    if-nez v0, :cond_c

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 80
    .line 81
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 82
    .line 83
    if-nez v0, :cond_d

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->fakeId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_d
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
