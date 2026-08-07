.class public Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivesuggestlive"


# instance fields
.field public anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public callback:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public chatMessages:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;",
            ">;"
        }
    .end annotation
.end field

.field public coverLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;",
            ">;"
        }
    .end annotation
.end field

.field public coverLabelsV2:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;",
            ">;"
        }
    .end annotation
.end field

.field public guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public liveMode:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public liveType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public memberCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public redPacketIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public state:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public streamFlvUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public streamFlvUrlIpv6:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public subtitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public videoCaptureScore:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public videoCaptureUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;)Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static convertFrom(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 42
    .line 43
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    if-eqz p2, :cond_0

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 50
    .line 51
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 52
    .line 53
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 54
    .line 55
    if-eqz p2, :cond_1

    .line 56
    .line 57
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 60
    .line 61
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlvIpv6:Ljava/lang/String;

    .line 62
    .line 63
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 64
    .line 65
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 66
    .line 67
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 68
    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 70
    .line 71
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 72
    .line 73
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 74
    .line 75
    double-to-int p2, v0

    .line 76
    iput p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 77
    .line 78
    instance-of p2, p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 79
    .line 80
    if-eqz p2, :cond_2

    .line 81
    .line 82
    move-object p2, p0

    .line 83
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 84
    .line 85
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 86
    .line 87
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 88
    .line 89
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 90
    .line 91
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 92
    .line 93
    return-object p1
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;)Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->nullCheck()V

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

    .line 222
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 43
    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 53
    .line 54
    :cond_3
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 55
    .line 56
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 79
    .line 80
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 81
    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 89
    .line 90
    :cond_5
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureScore:F

    .line 91
    .line 92
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureScore:F

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 95
    .line 96
    if-eqz v1, :cond_6

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 103
    .line 104
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 113
    .line 114
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 115
    .line 116
    if-eqz v1, :cond_8

    .line 117
    .line 118
    new-instance v2, Ll/p62;

    .line 119
    .line 120
    invoke-direct {v2}, Ll/p62;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 128
    .line 129
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 130
    .line 131
    if-eqz v1, :cond_9

    .line 132
    .line 133
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 138
    .line 139
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 140
    .line 141
    if-eqz v1, :cond_a

    .line 142
    .line 143
    new-instance v2, Ll/q62;

    .line 144
    .line 145
    invoke-direct {v2}, Ll/q62;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 153
    .line 154
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 155
    .line 156
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 159
    .line 160
    if-eqz v1, :cond_b

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 167
    .line 168
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 169
    .line 170
    if-eqz v1, :cond_c

    .line 171
    .line 172
    new-instance v2, Ll/r62;

    .line 173
    .line 174
    invoke-direct {v2}, Ll/r62;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 182
    .line 183
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 184
    .line 185
    if-eqz v1, :cond_d

    .line 186
    .line 187
    new-instance v2, Ll/s62;

    .line 188
    .line 189
    invoke-direct {v2}, Ll/s62;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 197
    .line 198
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 199
    .line 200
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 203
    .line 204
    if-eqz v1, :cond_e

    .line 205
    .line 206
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 211
    .line 212
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 213
    .line 214
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 215
    .line 216
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 217
    .line 218
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 219
    .line 220
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 221
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 74
    .line 75
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 76
    .line 77
    if-ne v1, v3, :cond_2

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureScore:F

    .line 130
    .line 131
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureScore:F

    .line 132
    .line 133
    cmpl-float v1, v1, v3

    .line 134
    .line 135
    if-nez v1, :cond_2

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 148
    .line 149
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 158
    .line 159
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 160
    .line 161
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_2

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 168
    .line 169
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 170
    .line 171
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 178
    .line 179
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 180
    .line 181
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_2

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 188
    .line 189
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 198
    .line 199
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 200
    .line 201
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_2

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 208
    .line 209
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 210
    .line 211
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-eqz v1, :cond_2

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 218
    .line 219
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 228
    .line 229
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    if-eqz v1, :cond_2

    .line 236
    .line 237
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 238
    .line 239
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 240
    .line 241
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    if-eqz v1, :cond_2

    .line 246
    .line 247
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 248
    .line 249
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 250
    .line 251
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    if-eqz v1, :cond_2

    .line 256
    .line 257
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 258
    .line 259
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 260
    .line 261
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result p0

    .line 265
    if-eqz p0, :cond_2

    .line 266
    .line 267
    return v0

    .line 268
    :cond_2
    return v2
.end method

.method public expendToFullLive()Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlvIpv6:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 28
    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 32
    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->id:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 66
    .line 67
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 68
    .line 69
    int-to-double v1, v1

    .line 70
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLive;->setExtraRoomCoverUrl(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 88
    .line 89
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 90
    .line 91
    return-object v0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivesuggestlive"

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecommendCategory()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_18

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 87
    .line 88
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    goto :goto_6

    .line 100
    :cond_6
    move v1, v2

    .line 101
    :goto_6
    add-int/2addr v0, v1

    .line 102
    mul-int/lit8 v0, v0, 0x29

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    goto :goto_7

    .line 113
    :cond_7
    move v1, v2

    .line 114
    :goto_7
    add-int/2addr v0, v1

    .line 115
    mul-int/lit8 v0, v0, 0x29

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 118
    .line 119
    if-eqz v1, :cond_8

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    goto :goto_8

    .line 126
    :cond_8
    move v1, v2

    .line 127
    :goto_8
    add-int/2addr v0, v1

    .line 128
    mul-int/lit8 v0, v0, 0x29

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 131
    .line 132
    if-eqz v1, :cond_9

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->hashCode()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    goto :goto_9

    .line 139
    :cond_9
    move v1, v2

    .line 140
    :goto_9
    add-int/2addr v0, v1

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 144
    .line 145
    if-eqz v1, :cond_a

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->hashCode()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    goto :goto_a

    .line 152
    :cond_a
    move v1, v2

    .line 153
    :goto_a
    add-int/2addr v0, v1

    .line 154
    mul-int/lit8 v0, v0, 0x29

    .line 155
    .line 156
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureScore:F

    .line 157
    .line 158
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 166
    .line 167
    if-eqz v1, :cond_b

    .line 168
    .line 169
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    goto :goto_b

    .line 174
    :cond_b
    move v1, v2

    .line 175
    :goto_b
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 179
    .line 180
    if-eqz v1, :cond_c

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->hashCode()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    goto :goto_c

    .line 187
    :cond_c
    move v1, v2

    .line 188
    :goto_c
    add-int/2addr v0, v1

    .line 189
    mul-int/lit8 v0, v0, 0x29

    .line 190
    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 192
    .line 193
    if-eqz v1, :cond_d

    .line 194
    .line 195
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    goto :goto_d

    .line 200
    :cond_d
    move v1, v2

    .line 201
    :goto_d
    add-int/2addr v0, v1

    .line 202
    mul-int/lit8 v0, v0, 0x29

    .line 203
    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 205
    .line 206
    if-eqz v1, :cond_e

    .line 207
    .line 208
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->hashCode()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    goto :goto_e

    .line 213
    :cond_e
    move v1, v2

    .line 214
    :goto_e
    add-int/2addr v0, v1

    .line 215
    mul-int/lit8 v0, v0, 0x29

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 218
    .line 219
    if-eqz v1, :cond_f

    .line 220
    .line 221
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    goto :goto_f

    .line 226
    :cond_f
    move v1, v2

    .line 227
    :goto_f
    add-int/2addr v0, v1

    .line 228
    mul-int/lit8 v0, v0, 0x29

    .line 229
    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 231
    .line 232
    if-eqz v1, :cond_10

    .line 233
    .line 234
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    goto :goto_10

    .line 239
    :cond_10
    move v1, v2

    .line 240
    :goto_10
    add-int/2addr v0, v1

    .line 241
    mul-int/lit8 v0, v0, 0x29

    .line 242
    .line 243
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 244
    .line 245
    if-eqz v1, :cond_11

    .line 246
    .line 247
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->hashCode()I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    goto :goto_11

    .line 252
    :cond_11
    move v1, v2

    .line 253
    :goto_11
    add-int/2addr v0, v1

    .line 254
    mul-int/lit8 v0, v0, 0x29

    .line 255
    .line 256
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 257
    .line 258
    if-eqz v1, :cond_12

    .line 259
    .line 260
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    goto :goto_12

    .line 265
    :cond_12
    move v1, v2

    .line 266
    :goto_12
    add-int/2addr v0, v1

    .line 267
    mul-int/lit8 v0, v0, 0x29

    .line 268
    .line 269
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 270
    .line 271
    if-eqz v1, :cond_13

    .line 272
    .line 273
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    goto :goto_13

    .line 278
    :cond_13
    move v1, v2

    .line 279
    :goto_13
    add-int/2addr v0, v1

    .line 280
    mul-int/lit8 v0, v0, 0x29

    .line 281
    .line 282
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 283
    .line 284
    if-eqz v1, :cond_14

    .line 285
    .line 286
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    goto :goto_14

    .line 291
    :cond_14
    move v1, v2

    .line 292
    :goto_14
    add-int/2addr v0, v1

    .line 293
    mul-int/lit8 v0, v0, 0x29

    .line 294
    .line 295
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 296
    .line 297
    if-eqz v1, :cond_15

    .line 298
    .line 299
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->hashCode()I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    goto :goto_15

    .line 304
    :cond_15
    move v1, v2

    .line 305
    :goto_15
    add-int/2addr v0, v1

    .line 306
    mul-int/lit8 v0, v0, 0x29

    .line 307
    .line 308
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 309
    .line 310
    if-eqz v1, :cond_16

    .line 311
    .line 312
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    goto :goto_16

    .line 317
    :cond_16
    move v1, v2

    .line 318
    :goto_16
    add-int/2addr v0, v1

    .line 319
    mul-int/lit8 v0, v0, 0x29

    .line 320
    .line 321
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 322
    .line 323
    if-eqz v1, :cond_17

    .line 324
    .line 325
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    :cond_17
    add-int/2addr v0, v2

    .line 330
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 331
    .line 332
    :cond_18
    return v0
.end method

.method public isOnLive()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "onlive"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 44
    .line 45
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 46
    .line 47
    if-nez v0, :cond_5

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 54
    .line 55
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_6

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 60
    .line 61
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_7

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 66
    .line 67
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_8

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 72
    .line 73
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 74
    .line 75
    if-nez v0, :cond_9

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 82
    .line 83
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 84
    .line 85
    if-nez v0, :cond_a

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 92
    .line 93
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 94
    .line 95
    if-nez v0, :cond_b

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 102
    .line 103
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 104
    .line 105
    if-nez v0, :cond_c

    .line 106
    .line 107
    new-instance v0, Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 113
    .line 114
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 115
    .line 116
    if-nez v0, :cond_d

    .line 117
    .line 118
    new-instance v0, Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 124
    .line 125
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 126
    .line 127
    if-nez v0, :cond_e

    .line 128
    .line 129
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 130
    .line 131
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 132
    .line 133
    if-nez v0, :cond_f

    .line 134
    .line 135
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 140
    .line 141
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 142
    .line 143
    if-nez v0, :cond_10

    .line 144
    .line 145
    new-instance v0, Ljava/util/ArrayList;

    .line 146
    .line 147
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .line 149
    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 151
    .line 152
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 153
    .line 154
    if-nez v0, :cond_11

    .line 155
    .line 156
    new-instance v0, Ljava/util/ArrayList;

    .line 157
    .line 158
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 162
    .line 163
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 164
    .line 165
    if-nez v0, :cond_12

    .line 166
    .line 167
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 168
    .line 169
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 170
    .line 171
    if-nez v0, :cond_13

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 174
    .line 175
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 176
    .line 177
    if-nez v0, :cond_14

    .line 178
    .line 179
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 180
    .line 181
    :cond_14
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
