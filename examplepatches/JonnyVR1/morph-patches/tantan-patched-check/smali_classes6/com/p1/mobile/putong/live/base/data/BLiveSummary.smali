.class public Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveSummary;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivesummary"


# instance fields
.field public audienceCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public chatMsgCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public duration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public endTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public liveOrder:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public newFanbaseCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public newFollowCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public receiveGiftsUserCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public receivedGifts:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public rewardPoint:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public rewardPointType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public rewarderCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public riseDirection:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public spark:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public startTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public strawberry:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public voiceCallCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public voiceCallId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->nullCheck()V

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

    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveOrder:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveOrder:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewarderCount:D

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewarderCount:D

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallCount:D

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallCount:D

    .line 41
    .line 42
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->startTime:D

    .line 43
    .line 44
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->startTime:D

    .line 45
    .line 46
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->endTime:D

    .line 47
    .line 48
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->endTime:D

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->strawberry:D

    .line 55
    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->strawberry:D

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 59
    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 67
    .line 68
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 71
    .line 72
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->spark:I

    .line 73
    .line 74
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->spark:I

    .line 75
    .line 76
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receivedGifts:I

    .line 77
    .line 78
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receivedGifts:I

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receiveGiftsUserCount:I

    .line 81
    .line 82
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receiveGiftsUserCount:I

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 85
    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFanbaseCount:I

    .line 89
    .line 90
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFanbaseCount:I

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->chatMsgCount:I

    .line 93
    .line 94
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->chatMsgCount:I

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 97
    .line 98
    if-eqz v1, :cond_1

    .line 99
    .line 100
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 105
    .line 106
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 107
    .line 108
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 109
    .line 110
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveOrder:J

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveOrder:J

    .line 36
    .line 37
    cmp-long v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 42
    .line 43
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 44
    .line 45
    cmp-long v1, v3, v5

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 50
    .line 51
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 52
    .line 53
    cmpl-double v1, v3, v5

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewarderCount:D

    .line 58
    .line 59
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewarderCount:D

    .line 60
    .line 61
    cmpl-double v1, v3, v5

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 66
    .line 67
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 68
    .line 69
    cmpl-double v1, v3, v5

    .line 70
    .line 71
    if-nez v1, :cond_2

    .line 72
    .line 73
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 74
    .line 75
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 76
    .line 77
    cmpl-double v1, v3, v5

    .line 78
    .line 79
    if-nez v1, :cond_2

    .line 80
    .line 81
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallCount:D

    .line 82
    .line 83
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallCount:D

    .line 84
    .line 85
    cmpl-double v1, v3, v5

    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->startTime:D

    .line 90
    .line 91
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->startTime:D

    .line 92
    .line 93
    cmpl-double v1, v3, v5

    .line 94
    .line 95
    if-nez v1, :cond_2

    .line 96
    .line 97
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->endTime:D

    .line 98
    .line 99
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->endTime:D

    .line 100
    .line 101
    cmpl-double v1, v3, v5

    .line 102
    .line 103
    if-nez v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->strawberry:D

    .line 116
    .line 117
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->strawberry:D

    .line 118
    .line 119
    cmpl-double v1, v3, v5

    .line 120
    .line 121
    if-nez v1, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->spark:I

    .line 144
    .line 145
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->spark:I

    .line 146
    .line 147
    if-ne v1, v3, :cond_2

    .line 148
    .line 149
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receivedGifts:I

    .line 150
    .line 151
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receivedGifts:I

    .line 152
    .line 153
    if-ne v1, v3, :cond_2

    .line 154
    .line 155
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receiveGiftsUserCount:I

    .line 156
    .line 157
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receiveGiftsUserCount:I

    .line 158
    .line 159
    if-ne v1, v3, :cond_2

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 162
    .line 163
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_2

    .line 170
    .line 171
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFanbaseCount:I

    .line 172
    .line 173
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFanbaseCount:I

    .line 174
    .line 175
    if-ne v1, v3, :cond_2

    .line 176
    .line 177
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->chatMsgCount:I

    .line 178
    .line 179
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->chatMsgCount:I

    .line 180
    .line 181
    if-ne v1, v3, :cond_2

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 186
    .line 187
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_2

    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 194
    .line 195
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result p0

    .line 201
    if-eqz p0, :cond_2

    .line 202
    .line 203
    return v0

    .line 204
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivesummary"

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
    if-nez v0, :cond_8

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveOrder:J

    .line 35
    .line 36
    const/16 v1, 0x20

    .line 37
    .line 38
    ushr-long v5, v3, v1

    .line 39
    .line 40
    xor-long/2addr v3, v5

    .line 41
    long-to-int v3, v3

    .line 42
    add-int/2addr v0, v3

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 46
    .line 47
    ushr-long v5, v3, v1

    .line 48
    .line 49
    xor-long/2addr v3, v5

    .line 50
    long-to-int v3, v3

    .line 51
    add-int/2addr v0, v3

    .line 52
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 53
    .line 54
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 55
    .line 56
    .line 57
    move-result-wide v3

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    ushr-long v5, v3, v1

    .line 61
    .line 62
    xor-long/2addr v3, v5

    .line 63
    long-to-int v3, v3

    .line 64
    add-int/2addr v0, v3

    .line 65
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewarderCount:D

    .line 66
    .line 67
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 68
    .line 69
    .line 70
    move-result-wide v3

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    ushr-long v5, v3, v1

    .line 74
    .line 75
    xor-long/2addr v3, v5

    .line 76
    long-to-int v3, v3

    .line 77
    add-int/2addr v0, v3

    .line 78
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 79
    .line 80
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    ushr-long v5, v3, v1

    .line 87
    .line 88
    xor-long/2addr v3, v5

    .line 89
    long-to-int v3, v3

    .line 90
    add-int/2addr v0, v3

    .line 91
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 92
    .line 93
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 94
    .line 95
    .line 96
    move-result-wide v3

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    ushr-long v5, v3, v1

    .line 100
    .line 101
    xor-long/2addr v3, v5

    .line 102
    long-to-int v3, v3

    .line 103
    add-int/2addr v0, v3

    .line 104
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallCount:D

    .line 105
    .line 106
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 107
    .line 108
    .line 109
    move-result-wide v3

    .line 110
    mul-int/lit8 v0, v0, 0x29

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->startTime:D

    .line 118
    .line 119
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 120
    .line 121
    .line 122
    move-result-wide v3

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    ushr-long v5, v3, v1

    .line 126
    .line 127
    xor-long/2addr v3, v5

    .line 128
    long-to-int v3, v3

    .line 129
    add-int/2addr v0, v3

    .line 130
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->endTime:D

    .line 131
    .line 132
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 133
    .line 134
    .line 135
    move-result-wide v3

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    ushr-long v5, v3, v1

    .line 139
    .line 140
    xor-long/2addr v3, v5

    .line 141
    long-to-int v3, v3

    .line 142
    add-int/2addr v0, v3

    .line 143
    mul-int/lit8 v0, v0, 0x29

    .line 144
    .line 145
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz v3, :cond_2

    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    goto :goto_2

    .line 154
    :cond_2
    move v3, v2

    .line 155
    :goto_2
    add-int/2addr v0, v3

    .line 156
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->strawberry:D

    .line 157
    .line 158
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 159
    .line 160
    .line 161
    move-result-wide v3

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    ushr-long v5, v3, v1

    .line 165
    .line 166
    xor-long/2addr v3, v5

    .line 167
    long-to-int v1, v3

    .line 168
    add-int/2addr v0, v1

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 172
    .line 173
    if-eqz v1, :cond_3

    .line 174
    .line 175
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->hashCode()I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    goto :goto_3

    .line 180
    :cond_3
    move v1, v2

    .line 181
    :goto_3
    add-int/2addr v0, v1

    .line 182
    mul-int/lit8 v0, v0, 0x29

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 185
    .line 186
    if-eqz v1, :cond_4

    .line 187
    .line 188
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    goto :goto_4

    .line 193
    :cond_4
    move v1, v2

    .line 194
    :goto_4
    add-int/2addr v0, v1

    .line 195
    mul-int/lit8 v0, v0, 0x29

    .line 196
    .line 197
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->spark:I

    .line 198
    .line 199
    add-int/2addr v0, v1

    .line 200
    mul-int/lit8 v0, v0, 0x29

    .line 201
    .line 202
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receivedGifts:I

    .line 203
    .line 204
    add-int/2addr v0, v1

    .line 205
    mul-int/lit8 v0, v0, 0x29

    .line 206
    .line 207
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receiveGiftsUserCount:I

    .line 208
    .line 209
    add-int/2addr v0, v1

    .line 210
    mul-int/lit8 v0, v0, 0x29

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 213
    .line 214
    if-eqz v1, :cond_5

    .line 215
    .line 216
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    goto :goto_5

    .line 221
    :cond_5
    move v1, v2

    .line 222
    :goto_5
    add-int/2addr v0, v1

    .line 223
    mul-int/lit8 v0, v0, 0x29

    .line 224
    .line 225
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFanbaseCount:I

    .line 226
    .line 227
    add-int/2addr v0, v1

    .line 228
    mul-int/lit8 v0, v0, 0x29

    .line 229
    .line 230
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->chatMsgCount:I

    .line 231
    .line 232
    add-int/2addr v0, v1

    .line 233
    mul-int/lit8 v0, v0, 0x29

    .line 234
    .line 235
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 236
    .line 237
    if-eqz v1, :cond_6

    .line 238
    .line 239
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;->hashCode()I

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    goto :goto_6

    .line 244
    :cond_6
    move v1, v2

    .line 245
    :goto_6
    add-int/2addr v0, v1

    .line 246
    mul-int/lit8 v0, v0, 0x29

    .line 247
    .line 248
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 249
    .line 250
    if-eqz v1, :cond_7

    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    :cond_7
    add-int/2addr v0, v2

    .line 257
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 258
    .line 259
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 48
    .line 49
    :cond_6
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
