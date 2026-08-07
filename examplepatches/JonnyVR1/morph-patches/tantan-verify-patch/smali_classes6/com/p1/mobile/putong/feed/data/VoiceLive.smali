.class public Lcom/p1/mobile/putong/feed/data/VoiceLive;
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
            "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "voicelive"


# instance fields
.field public anchor:Lcom/p1/mobile/putong/data/Owner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public basicLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LiveBasicLabel;",
            ">;"
        }
    .end annotation
.end field

.field public callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public callback:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public endTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public feedStyle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public masksMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LiveUserMask;",
            ">;"
        }
    .end annotation
.end field

.field public memberCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public messageCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public messages:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public momentText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public rewardPoint:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public rewarderCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public room:Lcom/p1/mobile/putong/data/Owner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public specialLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LiveSpecialLabel;",
            ">;"
        }
    .end annotation
.end field

.field public startTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public state:Lcom/p1/mobile/putong/data/LiveState;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;
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
        index = 0x9
    .end annotation
.end field

.field public users:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveGame:Lcom/p1/mobile/putong/data/VoiceLiveGame;

.field public voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/VoiceLive$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/VoiceLive$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/VoiceLive$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/VoiceLive$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->masksMap:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/LiveSpecialLabel;)Lcom/p1/mobile/putong/data/LiveSpecialLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->clone()Lcom/p1/mobile/putong/data/LiveSpecialLabel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/LiveBasicLabel;)Lcom/p1/mobile/putong/data/LiveBasicLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveBasicLabel;->clone()Lcom/p1/mobile/putong/data/LiveBasicLabel;

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

.method public static new_()Lcom/p1/mobile/putong/feed/data/VoiceLive;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/VoiceLive;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/VoiceLive;->nullCheck()V

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

    .line 161
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLive;->clone()Lcom/p1/mobile/putong/feed/data/VoiceLive;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/VoiceLive;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/VoiceLive;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Owner;->clone()Lcom/p1/mobile/putong/data/Owner;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Owner;->clone()Lcom/p1/mobile/putong/data/Owner;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/StreamUrl;->clone()Lcom/p1/mobile/putong/data/StreamUrl;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 39
    .line 40
    :cond_2
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 41
    .line 42
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 43
    .line 44
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 45
    .line 46
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 47
    .line 48
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 49
    .line 50
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v1, :cond_3

    .line 63
    .line 64
    new-instance v2, Ll/wsn0;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/wsn0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 74
    .line 75
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 76
    .line 77
    if-eqz v1, :cond_4

    .line 78
    .line 79
    new-instance v2, Ll/xsn0;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/xsn0;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 89
    .line 90
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 91
    .line 92
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 95
    .line 96
    if-eqz v1, :cond_5

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/StreamCdnInfo;->clone()Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 103
    .line 104
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 109
    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 113
    .line 114
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 117
    .line 118
    if-eqz v1, :cond_6

    .line 119
    .line 120
    new-instance v2, Ll/ysn0;

    .line 121
    .line 122
    invoke-direct {v2}, Ll/ysn0;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 130
    .line 131
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 132
    .line 133
    if-eqz v1, :cond_7

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->clone()Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 140
    .line 141
    :cond_7
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 142
    .line 143
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 144
    .line 145
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 146
    .line 147
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 150
    .line 151
    if-eqz p0, :cond_8

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->clone()Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 158
    .line 159
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

    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLive;->clone()Lcom/p1/mobile/putong/feed/data/VoiceLive;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 54
    .line 55
    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 56
    .line 57
    cmpl-double v1, v3, v5

    .line 58
    .line 59
    if-nez v1, :cond_2

    .line 60
    .line 61
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 62
    .line 63
    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 64
    .line 65
    cmpl-double v1, v3, v5

    .line 66
    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 70
    .line 71
    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 72
    .line 73
    cmpl-double v1, v3, v5

    .line 74
    .line 75
    if-nez v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 110
    .line 111
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 118
    .line 119
    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 120
    .line 121
    cmpl-double v1, v3, v5

    .line 122
    .line 123
    if-nez v1, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 128
    .line 129
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 166
    .line 167
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 176
    .line 177
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 186
    .line 187
    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 188
    .line 189
    cmpl-double v1, v3, v5

    .line 190
    .line 191
    if-nez v1, :cond_2

    .line 192
    .line 193
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 194
    .line 195
    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 196
    .line 197
    cmpl-double v1, v3, v5

    .line 198
    .line 199
    if-nez v1, :cond_2

    .line 200
    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 202
    .line 203
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 204
    .line 205
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    if-eqz p0, :cond_2

    .line 210
    .line 211
    return v0

    .line 212
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voicelive"

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
    if-nez v0, :cond_f

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Owner;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Owner;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/StreamUrl;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 59
    .line 60
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 61
    .line 62
    .line 63
    move-result-wide v3

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    const/16 v1, 0x20

    .line 67
    .line 68
    ushr-long v5, v3, v1

    .line 69
    .line 70
    xor-long/2addr v3, v5

    .line 71
    long-to-int v3, v3

    .line 72
    add-int/2addr v0, v3

    .line 73
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 74
    .line 75
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 76
    .line 77
    .line 78
    move-result-wide v3

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    ushr-long v5, v3, v1

    .line 82
    .line 83
    xor-long/2addr v3, v5

    .line 84
    long-to-int v3, v3

    .line 85
    add-int/2addr v0, v3

    .line 86
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 87
    .line 88
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    ushr-long v5, v3, v1

    .line 95
    .line 96
    xor-long/2addr v3, v5

    .line 97
    long-to-int v3, v3

    .line 98
    add-int/2addr v0, v3

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 102
    .line 103
    if-eqz v3, :cond_4

    .line 104
    .line 105
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    goto :goto_4

    .line 110
    :cond_4
    move v3, v2

    .line 111
    :goto_4
    add-int/2addr v0, v3

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz v3, :cond_5

    .line 117
    .line 118
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    goto :goto_5

    .line 123
    :cond_5
    move v3, v2

    .line 124
    :goto_5
    add-int/2addr v0, v3

    .line 125
    mul-int/lit8 v0, v0, 0x29

    .line 126
    .line 127
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 128
    .line 129
    if-eqz v3, :cond_6

    .line 130
    .line 131
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    goto :goto_6

    .line 136
    :cond_6
    move v3, v2

    .line 137
    :goto_6
    add-int/2addr v0, v3

    .line 138
    mul-int/lit8 v0, v0, 0x29

    .line 139
    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 141
    .line 142
    if-eqz v3, :cond_7

    .line 143
    .line 144
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    goto :goto_7

    .line 149
    :cond_7
    move v3, v2

    .line 150
    :goto_7
    add-int/2addr v0, v3

    .line 151
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 152
    .line 153
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 154
    .line 155
    .line 156
    move-result-wide v3

    .line 157
    mul-int/lit8 v0, v0, 0x29

    .line 158
    .line 159
    ushr-long v5, v3, v1

    .line 160
    .line 161
    xor-long/2addr v3, v5

    .line 162
    long-to-int v3, v3

    .line 163
    add-int/2addr v0, v3

    .line 164
    mul-int/lit8 v0, v0, 0x29

    .line 165
    .line 166
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 167
    .line 168
    if-eqz v3, :cond_8

    .line 169
    .line 170
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/StreamCdnInfo;->hashCode()I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    goto :goto_8

    .line 175
    :cond_8
    move v3, v2

    .line 176
    :goto_8
    add-int/2addr v0, v3

    .line 177
    mul-int/lit8 v0, v0, 0x29

    .line 178
    .line 179
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 180
    .line 181
    if-eqz v3, :cond_9

    .line 182
    .line 183
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    goto :goto_9

    .line 188
    :cond_9
    move v3, v2

    .line 189
    :goto_9
    add-int/2addr v0, v3

    .line 190
    mul-int/lit8 v0, v0, 0x29

    .line 191
    .line 192
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 193
    .line 194
    if-eqz v3, :cond_a

    .line 195
    .line 196
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    goto :goto_a

    .line 201
    :cond_a
    move v3, v2

    .line 202
    :goto_a
    add-int/2addr v0, v3

    .line 203
    mul-int/lit8 v0, v0, 0x29

    .line 204
    .line 205
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 206
    .line 207
    if-eqz v3, :cond_b

    .line 208
    .line 209
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    goto :goto_b

    .line 214
    :cond_b
    move v3, v2

    .line 215
    :goto_b
    add-int/2addr v0, v3

    .line 216
    mul-int/lit8 v0, v0, 0x29

    .line 217
    .line 218
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 219
    .line 220
    if-eqz v3, :cond_c

    .line 221
    .line 222
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    goto :goto_c

    .line 227
    :cond_c
    move v3, v2

    .line 228
    :goto_c
    add-int/2addr v0, v3

    .line 229
    mul-int/lit8 v0, v0, 0x29

    .line 230
    .line 231
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 232
    .line 233
    if-eqz v3, :cond_d

    .line 234
    .line 235
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->hashCode()I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    goto :goto_d

    .line 240
    :cond_d
    move v3, v2

    .line 241
    :goto_d
    add-int/2addr v0, v3

    .line 242
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 243
    .line 244
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 245
    .line 246
    .line 247
    move-result-wide v3

    .line 248
    mul-int/lit8 v0, v0, 0x29

    .line 249
    .line 250
    ushr-long v5, v3, v1

    .line 251
    .line 252
    xor-long/2addr v3, v5

    .line 253
    long-to-int v3, v3

    .line 254
    add-int/2addr v0, v3

    .line 255
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 256
    .line 257
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 258
    .line 259
    .line 260
    move-result-wide v3

    .line 261
    mul-int/lit8 v0, v0, 0x29

    .line 262
    .line 263
    ushr-long v5, v3, v1

    .line 264
    .line 265
    xor-long/2addr v3, v5

    .line 266
    long-to-int v1, v3

    .line 267
    add-int/2addr v0, v1

    .line 268
    mul-int/lit8 v0, v0, 0x29

    .line 269
    .line 270
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 271
    .line 272
    if-eqz v1, :cond_e

    .line 273
    .line 274
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->hashCode()I

    .line 275
    .line 276
    .line 277
    move-result v2

    .line 278
    :cond_e
    add-int/2addr v0, v2

    .line 279
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 280
    .line 281
    :cond_f
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/data/Owner;->new_()Lcom/p1/mobile/putong/data/Owner;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/data/StreamUrl;->new_()Lcom/p1/mobile/putong/data/StreamUrl;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/data/LiveState;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 52
    .line 53
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 54
    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 58
    .line 59
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 60
    .line 61
    if-nez v0, :cond_6

    .line 62
    .line 63
    new-instance v0, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 69
    .line 70
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 71
    .line 72
    if-nez v0, :cond_7

    .line 73
    .line 74
    new-instance v0, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 80
    .line 81
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 82
    .line 83
    if-nez v0, :cond_8

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/data/StreamCdnInfo;->new_()Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 90
    .line 91
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 92
    .line 93
    if-nez v0, :cond_9

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 96
    .line 97
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 98
    .line 99
    if-nez v0, :cond_a

    .line 100
    .line 101
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 102
    .line 103
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 104
    .line 105
    if-nez v0, :cond_b

    .line 106
    .line 107
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 108
    .line 109
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 110
    .line 111
    if-nez v0, :cond_c

    .line 112
    .line 113
    new-instance v0, Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .line 117
    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 119
    .line 120
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 121
    .line 122
    if-nez v0, :cond_d

    .line 123
    .line 124
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->new_()Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 129
    .line 130
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 131
    .line 132
    if-nez v0, :cond_e

    .line 133
    .line 134
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->new_()Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 139
    .line 140
    :cond_e
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
