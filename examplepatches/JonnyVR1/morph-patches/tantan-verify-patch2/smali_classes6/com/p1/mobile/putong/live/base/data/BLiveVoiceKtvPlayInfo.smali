.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoicektvplayinfo"


# instance fields
.field public author:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public bestSingerName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public cover:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public durationSecond:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public giftUv:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public level:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public levelTip:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public lyricType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public lyricUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public maxLevel:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public nextLevelGiftUv:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public orderId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public prepareRemainSeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public provider:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public schema:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public score:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public showBgSvgaUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public showLevel:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public songCode:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public songUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_0

    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_0
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nullCheck()V

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

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 43
    .line 44
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 45
    .line 46
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 51
    .line 52
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->durationSecond:J

    .line 53
    .line 54
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->durationSecond:J

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 61
    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 65
    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 73
    .line 74
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 77
    .line 78
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->level:I

    .line 79
    .line 80
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->level:I

    .line 81
    .line 82
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->maxLevel:I

    .line 83
    .line 84
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->maxLevel:I

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 89
    .line 90
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->score:J

    .line 91
    .line 92
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->score:J

    .line 93
    .line 94
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showLevel:Z

    .line 95
    .line 96
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showLevel:Z

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 99
    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 101
    .line 102
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->giftUv:I

    .line 103
    .line 104
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->giftUv:I

    .line 105
    .line 106
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nextLevelGiftUv:I

    .line 107
    .line 108
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nextLevelGiftUv:I

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 111
    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 115
    .line 116
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 117
    .line 118
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 94
    .line 95
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 96
    .line 97
    cmp-long v1, v3, v5

    .line 98
    .line 99
    if-nez v1, :cond_2

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->durationSecond:J

    .line 112
    .line 113
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->durationSecond:J

    .line 114
    .line 115
    cmp-long v1, v3, v5

    .line 116
    .line 117
    if-nez v1, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->level:I

    .line 160
    .line 161
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->level:I

    .line 162
    .line 163
    if-ne v1, v3, :cond_2

    .line 164
    .line 165
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->maxLevel:I

    .line 166
    .line 167
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->maxLevel:I

    .line 168
    .line 169
    if-ne v1, v3, :cond_2

    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 174
    .line 175
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-eqz v1, :cond_2

    .line 180
    .line 181
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->score:J

    .line 182
    .line 183
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->score:J

    .line 184
    .line 185
    cmp-long v1, v3, v5

    .line 186
    .line 187
    if-nez v1, :cond_2

    .line 188
    .line 189
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showLevel:Z

    .line 190
    .line 191
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showLevel:Z

    .line 192
    .line 193
    if-ne v1, v3, :cond_2

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 196
    .line 197
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-eqz v1, :cond_2

    .line 204
    .line 205
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->giftUv:I

    .line 206
    .line 207
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->giftUv:I

    .line 208
    .line 209
    if-ne v1, v3, :cond_2

    .line 210
    .line 211
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nextLevelGiftUv:I

    .line 212
    .line 213
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nextLevelGiftUv:I

    .line 214
    .line 215
    if-ne v1, v3, :cond_2

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-eqz v1, :cond_2

    .line 226
    .line 227
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 228
    .line 229
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    if-eqz p0, :cond_2

    .line 236
    .line 237
    return v0

    .line 238
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoicektvplayinfo"

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
    if-nez v0, :cond_12

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    goto :goto_7

    .line 108
    :cond_7
    move v1, v2

    .line 109
    :goto_7
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 113
    .line 114
    const/16 v1, 0x20

    .line 115
    .line 116
    ushr-long v5, v3, v1

    .line 117
    .line 118
    xor-long/2addr v3, v5

    .line 119
    long-to-int v3, v3

    .line 120
    add-int/2addr v0, v3

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 124
    .line 125
    if-eqz v3, :cond_8

    .line 126
    .line 127
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    goto :goto_8

    .line 132
    :cond_8
    move v3, v2

    .line 133
    :goto_8
    add-int/2addr v0, v3

    .line 134
    mul-int/lit8 v0, v0, 0x29

    .line 135
    .line 136
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->durationSecond:J

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz v3, :cond_9

    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    goto :goto_9

    .line 154
    :cond_9
    move v3, v2

    .line 155
    :goto_9
    add-int/2addr v0, v3

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz v3, :cond_a

    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    goto :goto_a

    .line 167
    :cond_a
    move v3, v2

    .line 168
    :goto_a
    add-int/2addr v0, v3

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 172
    .line 173
    if-eqz v3, :cond_b

    .line 174
    .line 175
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->hashCode()I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    goto :goto_b

    .line 180
    :cond_b
    move v3, v2

    .line 181
    :goto_b
    add-int/2addr v0, v3

    .line 182
    mul-int/lit8 v0, v0, 0x29

    .line 183
    .line 184
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 185
    .line 186
    if-eqz v3, :cond_c

    .line 187
    .line 188
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    goto :goto_c

    .line 193
    :cond_c
    move v3, v2

    .line 194
    :goto_c
    add-int/2addr v0, v3

    .line 195
    mul-int/lit8 v0, v0, 0x29

    .line 196
    .line 197
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->level:I

    .line 198
    .line 199
    add-int/2addr v0, v3

    .line 200
    mul-int/lit8 v0, v0, 0x29

    .line 201
    .line 202
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->maxLevel:I

    .line 203
    .line 204
    add-int/2addr v0, v3

    .line 205
    mul-int/lit8 v0, v0, 0x29

    .line 206
    .line 207
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 208
    .line 209
    if-eqz v3, :cond_d

    .line 210
    .line 211
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    goto :goto_d

    .line 216
    :cond_d
    move v3, v2

    .line 217
    :goto_d
    add-int/2addr v0, v3

    .line 218
    mul-int/lit8 v0, v0, 0x29

    .line 219
    .line 220
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->score:J

    .line 221
    .line 222
    ushr-long v5, v3, v1

    .line 223
    .line 224
    xor-long/2addr v3, v5

    .line 225
    long-to-int v1, v3

    .line 226
    add-int/2addr v0, v1

    .line 227
    mul-int/lit8 v0, v0, 0x29

    .line 228
    .line 229
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showLevel:Z

    .line 230
    .line 231
    if-eqz v1, :cond_e

    .line 232
    .line 233
    const/16 v1, 0x4cf

    .line 234
    .line 235
    goto :goto_e

    .line 236
    :cond_e
    const/16 v1, 0x4d5

    .line 237
    .line 238
    :goto_e
    add-int/2addr v0, v1

    .line 239
    mul-int/lit8 v0, v0, 0x29

    .line 240
    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 242
    .line 243
    if-eqz v1, :cond_f

    .line 244
    .line 245
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    goto :goto_f

    .line 250
    :cond_f
    move v1, v2

    .line 251
    :goto_f
    add-int/2addr v0, v1

    .line 252
    mul-int/lit8 v0, v0, 0x29

    .line 253
    .line 254
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->giftUv:I

    .line 255
    .line 256
    add-int/2addr v0, v1

    .line 257
    mul-int/lit8 v0, v0, 0x29

    .line 258
    .line 259
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nextLevelGiftUv:I

    .line 260
    .line 261
    add-int/2addr v0, v1

    .line 262
    mul-int/lit8 v0, v0, 0x29

    .line 263
    .line 264
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 265
    .line 266
    if-eqz v1, :cond_10

    .line 267
    .line 268
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    goto :goto_10

    .line 273
    :cond_10
    move v1, v2

    .line 274
    :goto_10
    add-int/2addr v0, v1

    .line 275
    mul-int/lit8 v0, v0, 0x29

    .line 276
    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 278
    .line 279
    if-eqz v1, :cond_11

    .line 280
    .line 281
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    :cond_11
    add-int/2addr v0, v2

    .line 286
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 287
    .line 288
    :cond_12
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 54
    .line 55
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 56
    .line 57
    if-nez v0, :cond_8

    .line 58
    .line 59
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 68
    .line 69
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_9

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 74
    .line 75
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 76
    .line 77
    if-nez v0, :cond_a

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 80
    .line 81
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 82
    .line 83
    if-nez v0, :cond_b

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 90
    .line 91
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 92
    .line 93
    if-nez v0, :cond_c

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 96
    .line 97
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 98
    .line 99
    if-nez v0, :cond_d

    .line 100
    .line 101
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 102
    .line 103
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 104
    .line 105
    if-nez v0, :cond_e

    .line 106
    .line 107
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 108
    .line 109
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 110
    .line 111
    if-nez v0, :cond_f

    .line 112
    .line 113
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 114
    .line 115
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 116
    .line 117
    if-nez v0, :cond_10

    .line 118
    .line 119
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 120
    .line 121
    :cond_10
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
