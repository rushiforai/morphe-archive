.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoiceroomfeed"


# instance fields
.field public anchorId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public anchorLocation:Lcom/p1/mobile/putong/data/Location;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public feedTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public feedType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public index:I

.field public intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public liveTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;",
            ">;"
        }
    .end annotation
.end field

.field public liveTemplate:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public maskMode:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public memberAvatars:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;",
            ">;"
        }
    .end annotation
.end field

.field public memberCount:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public roomTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public roomTopic:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public roomTopicId:Ljava/lang/String;
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
        index = 0xd
    .end annotation
.end field

.field public streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public user:Lcom/p1/mobile/putong/data/User;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static convertFrom(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 20
    .line 21
    return-object p1
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->nullCheck()V

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

    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->maskMode:Z

    .line 35
    .line 36
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->maskMode:Z

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    new-instance v2, Ll/v92;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/v92;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 52
    .line 53
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    new-instance v2, Ll/w92;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/w92;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 67
    .line 68
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    new-instance v2, Ll/x92;

    .line 77
    .line 78
    invoke-direct {v2}, Ll/x92;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 86
    .line 87
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 92
    .line 93
    if-eqz v1, :cond_3

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 100
    .line 101
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 102
    .line 103
    if-eqz v1, :cond_4

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 110
    .line 111
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 112
    .line 113
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 116
    .line 117
    if-eqz v1, :cond_5

    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 124
    .line 125
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 126
    .line 127
    if-eqz v1, :cond_6

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Location;->clone()Lcom/p1/mobile/putong/data/Location;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 134
    .line 135
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 136
    .line 137
    if-eqz v1, :cond_7

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 144
    .line 145
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 146
    .line 147
    if-eqz p0, :cond_8

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 154
    .line 155
    :cond_8
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->maskMode:Z

    .line 84
    .line 85
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->maskMode:Z

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 160
    .line 161
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 180
    .line 181
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 190
    .line 191
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 200
    .line 201
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 202
    .line 203
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result p0

    .line 207
    if-eqz p0, :cond_2

    .line 208
    .line 209
    return v0

    .line 210
    :cond_2
    return v2
.end method

.method public expendToFullLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 28
    .line 29
    return-object v0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoiceroomfeed"

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
    if-nez v0, :cond_14

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->maskMode:Z

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    const/16 v1, 0x4cf

    .line 104
    .line 105
    goto :goto_7

    .line 106
    :cond_7
    const/16 v1, 0x4d5

    .line 107
    .line 108
    :goto_7
    add-int/2addr v0, v1

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v1, :cond_8

    .line 114
    .line 115
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    goto :goto_8

    .line 120
    :cond_8
    move v1, v2

    .line 121
    :goto_8
    add-int/2addr v0, v1

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 125
    .line 126
    if-eqz v1, :cond_9

    .line 127
    .line 128
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    goto :goto_9

    .line 133
    :cond_9
    move v1, v2

    .line 134
    :goto_9
    add-int/2addr v0, v1

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz v1, :cond_a

    .line 140
    .line 141
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    goto :goto_a

    .line 146
    :cond_a
    move v1, v2

    .line 147
    :goto_a
    add-int/2addr v0, v1

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 151
    .line 152
    if-eqz v1, :cond_b

    .line 153
    .line 154
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    goto :goto_b

    .line 159
    :cond_b
    move v1, v2

    .line 160
    :goto_b
    add-int/2addr v0, v1

    .line 161
    mul-int/lit8 v0, v0, 0x29

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 164
    .line 165
    if-eqz v1, :cond_c

    .line 166
    .line 167
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    goto :goto_c

    .line 172
    :cond_c
    move v1, v2

    .line 173
    :goto_c
    add-int/2addr v0, v1

    .line 174
    mul-int/lit8 v0, v0, 0x29

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 177
    .line 178
    if-eqz v1, :cond_d

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    goto :goto_d

    .line 185
    :cond_d
    move v1, v2

    .line 186
    :goto_d
    add-int/2addr v0, v1

    .line 187
    mul-int/lit8 v0, v0, 0x29

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 190
    .line 191
    if-eqz v1, :cond_e

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->hashCode()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    goto :goto_e

    .line 198
    :cond_e
    move v1, v2

    .line 199
    :goto_e
    add-int/2addr v0, v1

    .line 200
    mul-int/lit8 v0, v0, 0x29

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 203
    .line 204
    if-eqz v1, :cond_f

    .line 205
    .line 206
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    goto :goto_f

    .line 211
    :cond_f
    move v1, v2

    .line 212
    :goto_f
    add-int/2addr v0, v1

    .line 213
    mul-int/lit8 v0, v0, 0x29

    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 216
    .line 217
    if-eqz v1, :cond_10

    .line 218
    .line 219
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->hashCode()I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    goto :goto_10

    .line 224
    :cond_10
    move v1, v2

    .line 225
    :goto_10
    add-int/2addr v0, v1

    .line 226
    mul-int/lit8 v0, v0, 0x29

    .line 227
    .line 228
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 229
    .line 230
    if-eqz v1, :cond_11

    .line 231
    .line 232
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Location;->hashCode()I

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    goto :goto_11

    .line 237
    :cond_11
    move v1, v2

    .line 238
    :goto_11
    add-int/2addr v0, v1

    .line 239
    mul-int/lit8 v0, v0, 0x29

    .line 240
    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 242
    .line 243
    if-eqz v1, :cond_12

    .line 244
    .line 245
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->hashCode()I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    goto :goto_12

    .line 250
    :cond_12
    move v1, v2

    .line 251
    :goto_12
    add-int/2addr v0, v1

    .line 252
    mul-int/lit8 v0, v0, 0x29

    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 255
    .line 256
    if-eqz v1, :cond_13

    .line 257
    .line 258
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->hashCode()I

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    :cond_13
    add-int/2addr v0, v2

    .line 263
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 264
    .line 265
    :cond_14
    return v0
.end method

.method public isCreateRoomType()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "createVoiceLive"

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

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    new-instance v0, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 55
    .line 56
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 57
    .line 58
    if-nez v0, :cond_8

    .line 59
    .line 60
    new-instance v0, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 66
    .line 67
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_9

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

    .line 72
    .line 73
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 74
    .line 75
    if-nez v0, :cond_a

    .line 76
    .line 77
    new-instance v0, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 83
    .line 84
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 85
    .line 86
    if-nez v0, :cond_b

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 89
    .line 90
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 91
    .line 92
    if-nez v0, :cond_c

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 99
    .line 100
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 101
    .line 102
    if-nez v0, :cond_d

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 109
    .line 110
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 111
    .line 112
    if-nez v0, :cond_e

    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 115
    .line 116
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 117
    .line 118
    if-nez v0, :cond_f

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/data/Location;->new_()Lcom/p1/mobile/putong/data/Location;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 125
    .line 126
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 127
    .line 128
    if-nez v0, :cond_10

    .line 129
    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 135
    .line 136
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 137
    .line 138
    if-nez v0, :cond_11

    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 145
    .line 146
    :cond_11
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
