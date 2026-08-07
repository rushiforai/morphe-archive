.class public Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivesendlivegiftresult"


# instance fields
.field public bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public effectExt:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public remainingDiamonds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public remainingDurationSec:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public remainingTantanCoins:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public tip:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public tradeNo:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->nullCheck()V

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

    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingTantanCoins:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingTantanCoins:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 57
    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 67
    .line 68
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 69
    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 77
    .line 78
    :cond_5
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDurationSec:J

    .line 79
    .line 80
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDurationSec:J

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 95
    .line 96
    :cond_6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDiamonds:J

    .line 97
    .line 98
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDiamonds:J

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 101
    .line 102
    if-eqz v1, :cond_7

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 109
    .line 110
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 111
    .line 112
    if-eqz v1, :cond_8

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 119
    .line 120
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 121
    .line 122
    if-eqz p0, :cond_9

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 129
    .line 130
    :cond_9
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingTantanCoins:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingTantanCoins:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 22
    .line 23
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDurationSec:J

    .line 102
    .line 103
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDurationSec:J

    .line 104
    .line 105
    cmp-long v1, v3, v5

    .line 106
    .line 107
    if-nez v1, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 122
    .line 123
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDiamonds:J

    .line 130
    .line 131
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDiamonds:J

    .line 132
    .line 133
    cmp-long v1, v3, v5

    .line 134
    .line 135
    if-nez v1, :cond_2

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 140
    .line 141
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 148
    .line 149
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 150
    .line 151
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_2

    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 158
    .line 159
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 160
    .line 161
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_2

    .line 166
    .line 167
    return v0

    .line 168
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivesendlivegiftresult"

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
    if-nez v0, :cond_d

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingTantanCoins:J

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 85
    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 98
    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    goto :goto_6

    .line 106
    :cond_6
    move v1, v2

    .line 107
    :goto_6
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 111
    .line 112
    if-eqz v1, :cond_7

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    goto :goto_7

    .line 119
    :cond_7
    move v1, v2

    .line 120
    :goto_7
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDurationSec:J

    .line 124
    .line 125
    ushr-long v6, v4, v3

    .line 126
    .line 127
    xor-long/2addr v4, v6

    .line 128
    long-to-int v1, v4

    .line 129
    add-int/2addr v0, v1

    .line 130
    mul-int/lit8 v0, v0, 0x29

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    goto :goto_8

    .line 141
    :cond_8
    move v1, v2

    .line 142
    :goto_8
    add-int/2addr v0, v1

    .line 143
    mul-int/lit8 v0, v0, 0x29

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 146
    .line 147
    if-eqz v1, :cond_9

    .line 148
    .line 149
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->hashCode()I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    goto :goto_9

    .line 154
    :cond_9
    move v1, v2

    .line 155
    :goto_9
    add-int/2addr v0, v1

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDiamonds:J

    .line 159
    .line 160
    ushr-long v6, v4, v3

    .line 161
    .line 162
    xor-long v3, v4, v6

    .line 163
    .line 164
    long-to-int v1, v3

    .line 165
    add-int/2addr v0, v1

    .line 166
    mul-int/lit8 v0, v0, 0x29

    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 169
    .line 170
    if-eqz v1, :cond_a

    .line 171
    .line 172
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->hashCode()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    goto :goto_a

    .line 177
    :cond_a
    move v1, v2

    .line 178
    :goto_a
    add-int/2addr v0, v1

    .line 179
    mul-int/lit8 v0, v0, 0x29

    .line 180
    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 182
    .line 183
    if-eqz v1, :cond_b

    .line 184
    .line 185
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->hashCode()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    goto :goto_b

    .line 190
    :cond_b
    move v1, v2

    .line 191
    :goto_b
    add-int/2addr v0, v1

    .line 192
    mul-int/lit8 v0, v0, 0x29

    .line 193
    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 195
    .line 196
    if-eqz v1, :cond_c

    .line 197
    .line 198
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->hashCode()I

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    :cond_c
    add-int/2addr v0, v2

    .line 203
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 204
    .line 205
    :cond_d
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, ""

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 44
    .line 45
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 46
    .line 47
    if-nez v0, :cond_5

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 54
    .line 55
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_6

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 60
    .line 61
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 62
    .line 63
    if-nez v0, :cond_7

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 70
    .line 71
    :cond_7
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
