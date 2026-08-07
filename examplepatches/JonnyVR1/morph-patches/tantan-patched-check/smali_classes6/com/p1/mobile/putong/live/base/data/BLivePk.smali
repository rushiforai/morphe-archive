.class public Lcom/p1/mobile/putong/live/base/data/BLivePk;
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
            "Lcom/p1/mobile/putong/live/base/data/BLivePk;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivepk"


# instance fields
.field public appid:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public bountyId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public category:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public channel:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public channelKey:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public createdTime:Ljava/lang/String;
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

.field public isOnceMore:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public mvpUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public otherChannel:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public owner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public peerChannelKey:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public pkBackgroundSvgaUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public pkBackgroundUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public pkPlayingBuffInfo:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public players:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;",
            ">;"
        }
    .end annotation
.end field

.field public showWinTimesTag:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public state:Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePk$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePk$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLivePk;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePk;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePk;->nullCheck()V

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

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePk;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePk;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLivePk;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePk;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->category:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->category:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channel:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channel:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channelKey:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channelKey:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->otherChannel:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->otherChannel:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->appid:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->appid:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    new-instance v2, Ll/h42;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/h42;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 44
    .line 45
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 54
    .line 55
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->owner:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->owner:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;

    .line 60
    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->createdTime:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->createdTime:Ljava/lang/String;

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->isOnceMore:Z

    .line 68
    .line 69
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->isOnceMore:Z

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->mvpUserId:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->mvpUserId:Ljava/lang/String;

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->showWinTimesTag:Z

    .line 76
    .line 77
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->showWinTimesTag:Z

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 80
    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->bountyId:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->bountyId:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 88
    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 96
    .line 97
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundUrl:Ljava/lang/String;

    .line 98
    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundUrl:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundSvgaUrl:Ljava/lang/String;

    .line 102
    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundSvgaUrl:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkPlayingBuffInfo:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 106
    .line 107
    if-eqz v1, :cond_3

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkPlayingBuffInfo:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 114
    .line 115
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->peerChannelKey:Ljava/lang/String;

    .line 116
    .line 117
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->peerChannelKey:Ljava/lang/String;

    .line 118
    .line 119
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePk;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePk;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->category:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->category:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channel:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channel:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channelKey:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channelKey:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->otherChannel:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->otherChannel:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->appid:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->appid:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->owner:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->owner:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;

    .line 106
    .line 107
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->createdTime:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->createdTime:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->isOnceMore:Z

    .line 124
    .line 125
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->isOnceMore:Z

    .line 126
    .line 127
    if-ne v1, v3, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->mvpUserId:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->mvpUserId:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->showWinTimesTag:Z

    .line 140
    .line 141
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->showWinTimesTag:Z

    .line 142
    .line 143
    if-ne v1, v3, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->bountyId:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->bountyId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 166
    .line 167
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundUrl:Ljava/lang/String;

    .line 176
    .line 177
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundUrl:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_2

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundSvgaUrl:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundSvgaUrl:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_2

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkPlayingBuffInfo:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 196
    .line 197
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkPlayingBuffInfo:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->peerChannelKey:Ljava/lang/String;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->peerChannelKey:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    if-eqz p0, :cond_2

    .line 214
    .line 215
    return v0

    .line 216
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivepk"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_15

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->category:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channel:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channelKey:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->otherChannel:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->appid:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->owner:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v2

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_9

    .line 134
    :cond_9
    move v1, v2

    .line 135
    :goto_9
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->createdTime:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_a

    .line 147
    :cond_a
    move v1, v2

    .line 148
    :goto_a
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->isOnceMore:Z

    .line 152
    .line 153
    const/16 v3, 0x4d5

    .line 154
    .line 155
    const/16 v4, 0x4cf

    .line 156
    .line 157
    if-eqz v1, :cond_b

    .line 158
    .line 159
    move v1, v4

    .line 160
    goto :goto_b

    .line 161
    :cond_b
    move v1, v3

    .line 162
    :goto_b
    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->mvpUserId:Ljava/lang/String;

    .line 166
    .line 167
    if-eqz v1, :cond_c

    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    goto :goto_c

    .line 174
    :cond_c
    move v1, v2

    .line 175
    :goto_c
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->showWinTimesTag:Z

    .line 179
    .line 180
    if-eqz v1, :cond_d

    .line 181
    .line 182
    move v3, v4

    .line 183
    :cond_d
    add-int/2addr v0, v3

    .line 184
    mul-int/lit8 v0, v0, 0x29

    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 187
    .line 188
    if-eqz v1, :cond_e

    .line 189
    .line 190
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    goto :goto_d

    .line 195
    :cond_e
    move v1, v2

    .line 196
    :goto_d
    add-int/2addr v0, v1

    .line 197
    mul-int/lit8 v0, v0, 0x29

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->bountyId:Ljava/lang/String;

    .line 200
    .line 201
    if-eqz v1, :cond_f

    .line 202
    .line 203
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    goto :goto_e

    .line 208
    :cond_f
    move v1, v2

    .line 209
    :goto_e
    add-int/2addr v0, v1

    .line 210
    mul-int/lit8 v0, v0, 0x29

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 213
    .line 214
    if-eqz v1, :cond_10

    .line 215
    .line 216
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->hashCode()I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    goto :goto_f

    .line 221
    :cond_10
    move v1, v2

    .line 222
    :goto_f
    add-int/2addr v0, v1

    .line 223
    mul-int/lit8 v0, v0, 0x29

    .line 224
    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundUrl:Ljava/lang/String;

    .line 226
    .line 227
    if-eqz v1, :cond_11

    .line 228
    .line 229
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    goto :goto_10

    .line 234
    :cond_11
    move v1, v2

    .line 235
    :goto_10
    add-int/2addr v0, v1

    .line 236
    mul-int/lit8 v0, v0, 0x29

    .line 237
    .line 238
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundSvgaUrl:Ljava/lang/String;

    .line 239
    .line 240
    if-eqz v1, :cond_12

    .line 241
    .line 242
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    goto :goto_11

    .line 247
    :cond_12
    move v1, v2

    .line 248
    :goto_11
    add-int/2addr v0, v1

    .line 249
    mul-int/lit8 v0, v0, 0x29

    .line 250
    .line 251
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkPlayingBuffInfo:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 252
    .line 253
    if-eqz v1, :cond_13

    .line 254
    .line 255
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->hashCode()I

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    goto :goto_12

    .line 260
    :cond_13
    move v1, v2

    .line 261
    :goto_12
    add-int/2addr v0, v1

    .line 262
    mul-int/lit8 v0, v0, 0x29

    .line 263
    .line 264
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->peerChannelKey:Ljava/lang/String;

    .line 265
    .line 266
    if-eqz v1, :cond_14

    .line 267
    .line 268
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    :cond_14
    add-int/2addr v0, v2

    .line 273
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 274
    .line 275
    :cond_15
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->category:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->category:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channel:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channel:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channelKey:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channelKey:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->otherChannel:Ljava/lang/String;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->otherChannel:Ljava/lang/String;

    .line 40
    .line 41
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->appid:Ljava/lang/String;

    .line 42
    .line 43
    if-nez v0, :cond_5

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->appid:Ljava/lang/String;

    .line 46
    .line 47
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 48
    .line 49
    if-nez v0, :cond_6

    .line 50
    .line 51
    new-instance v0, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 57
    .line 58
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 59
    .line 60
    if-nez v0, :cond_7

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 67
    .line 68
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->owner:Ljava/lang/String;

    .line 69
    .line 70
    if-nez v0, :cond_8

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->owner:Ljava/lang/String;

    .line 73
    .line 74
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;

    .line 75
    .line 76
    if-nez v0, :cond_9

    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkSeekState;

    .line 87
    .line 88
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->createdTime:Ljava/lang/String;

    .line 89
    .line 90
    if-nez v0, :cond_a

    .line 91
    .line 92
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->createdTime:Ljava/lang/String;

    .line 93
    .line 94
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->mvpUserId:Ljava/lang/String;

    .line 95
    .line 96
    if-nez v0, :cond_b

    .line 97
    .line 98
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->mvpUserId:Ljava/lang/String;

    .line 99
    .line 100
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 101
    .line 102
    if-nez v0, :cond_c

    .line 103
    .line 104
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 113
    .line 114
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->bountyId:Ljava/lang/String;

    .line 115
    .line 116
    if-nez v0, :cond_d

    .line 117
    .line 118
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->bountyId:Ljava/lang/String;

    .line 119
    .line 120
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 121
    .line 122
    if-nez v0, :cond_e

    .line 123
    .line 124
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkScoreViewConfig:Lcom/p1/mobile/putong/live/base/data/BLivePkScoreViewConfig;

    .line 129
    .line 130
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundUrl:Ljava/lang/String;

    .line 131
    .line 132
    if-nez v0, :cond_f

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundUrl:Ljava/lang/String;

    .line 135
    .line 136
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundSvgaUrl:Ljava/lang/String;

    .line 137
    .line 138
    if-nez v0, :cond_10

    .line 139
    .line 140
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkBackgroundSvgaUrl:Ljava/lang/String;

    .line 141
    .line 142
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkPlayingBuffInfo:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 143
    .line 144
    if-nez v0, :cond_11

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->pkPlayingBuffInfo:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 151
    .line 152
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->peerChannelKey:Ljava/lang/String;

    .line 153
    .line 154
    if-nez v0, :cond_12

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->peerChannelKey:Ljava/lang/String;

    .line 157
    .line 158
    :cond_12
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
