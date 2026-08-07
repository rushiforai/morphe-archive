.class public Lcom/p1/mobile/putong/data/Live;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final EMPTY:Lcom/p1/mobile/putong/data/Live;

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "live"


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
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LiveBasicLabel;",
            ">;"
        }
    .end annotation
.end field

.field public callback:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public coverPicUrl:Lcom/p1/mobile/putong/data/Media;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public endTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public memberCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public messageCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public redPacketIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public rewardPoint:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public rewarderCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public room:Lcom/p1/mobile/putong/data/Owner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public snapshot:Lcom/p1/mobile/putong/data/Media;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public specialLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
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
        index = 0x8
    .end annotation
.end field

.field public state:Lcom/p1/mobile/putong/data/LiveState;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
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
        index = 0xa
    .end annotation
.end field

.field public videoCapture:Lcom/p1/mobile/putong/data/Media;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public whetherToBlur:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Live;->new_()Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/data/Live;->EMPTY:Lcom/p1/mobile/putong/data/Live;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/Live$1;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Live$1;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/data/Live;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/data/Live$2;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Live$2;-><init>()V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/data/Live;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    .line 21
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

.method public static synthetic a(Lcom/p1/mobile/putong/data/LiveBasicLabel;)Lcom/p1/mobile/putong/data/LiveBasicLabel;
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

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/LiveSpecialLabel;)Lcom/p1/mobile/putong/data/LiveSpecialLabel;
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

.method public static new_()Lcom/p1/mobile/putong/data/Live;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Live;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Live;->nullCheck()V

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

    .line 181
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Live;->clone()Lcom/p1/mobile/putong/data/Live;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Live;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Live;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 39
    .line 40
    :cond_2
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 41
    .line 42
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 43
    .line 44
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 45
    .line 46
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 57
    .line 58
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 59
    .line 60
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    new-instance v2, Ll/jqr;

    .line 75
    .line 76
    invoke-direct {v2}, Ll/jqr;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 84
    .line 85
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 86
    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    new-instance v2, Ll/kqr;

    .line 90
    .line 91
    invoke-direct {v2}, Ll/kqr;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 99
    .line 100
    :cond_5
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 101
    .line 102
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 103
    .line 104
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 105
    .line 106
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 107
    .line 108
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 109
    .line 110
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 113
    .line 114
    if-eqz v1, :cond_6

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/StreamCdnInfo;->clone()Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 121
    .line 122
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 123
    .line 124
    if-eqz v1, :cond_7

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RecommendInfo;->clone()Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 131
    .line 132
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 133
    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 137
    .line 138
    if-eqz v1, :cond_8

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 145
    .line 146
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 147
    .line 148
    if-eqz v1, :cond_9

    .line 149
    .line 150
    new-instance v2, Ll/lqr;

    .line 151
    .line 152
    invoke-direct {v2}, Ll/lqr;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 160
    .line 161
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 162
    .line 163
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 164
    .line 165
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 166
    .line 167
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 170
    .line 171
    if-eqz p0, :cond_a

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 178
    .line 179
    :cond_a
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Live;->clone()Lcom/p1/mobile/putong/data/Live;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Live;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Live;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 54
    .line 55
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 56
    .line 57
    cmpl-double v1, v3, v5

    .line 58
    .line 59
    if-nez v1, :cond_2

    .line 60
    .line 61
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 62
    .line 63
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 64
    .line 65
    cmpl-double v1, v3, v5

    .line 66
    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 72
    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 80
    .line 81
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 82
    .line 83
    cmpl-double v1, v3, v5

    .line 84
    .line 85
    if-nez v1, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_2

    .line 126
    .line 127
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 128
    .line 129
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 130
    .line 131
    cmpl-double v1, v3, v5

    .line 132
    .line 133
    if-nez v1, :cond_2

    .line 134
    .line 135
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 136
    .line 137
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 138
    .line 139
    cmp-long v1, v3, v5

    .line 140
    .line 141
    if-nez v1, :cond_2

    .line 142
    .line 143
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 144
    .line 145
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 146
    .line 147
    cmpl-double v1, v3, v5

    .line 148
    .line 149
    if-nez v1, :cond_2

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 152
    .line 153
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 154
    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 162
    .line 163
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 182
    .line 183
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 184
    .line 185
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-eqz v1, :cond_2

    .line 190
    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 192
    .line 193
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 194
    .line 195
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    if-eqz v1, :cond_2

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 202
    .line 203
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 204
    .line 205
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-eqz v1, :cond_2

    .line 210
    .line 211
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 212
    .line 213
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 214
    .line 215
    if-ne v1, v3, :cond_2

    .line 216
    .line 217
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 218
    .line 219
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 220
    .line 221
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    if-eqz p0, :cond_2

    .line 226
    .line 227
    return v0

    .line 228
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live"

    .line 2
    .line 3
    return-object p0
.end method

.method public getCoverUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public getRecommendCategory()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RecommendInfo;->category:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RecommendInfo;->category:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->memberCount:D

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
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 89
    .line 90
    if-eqz v3, :cond_4

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Media;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    goto :goto_4

    .line 97
    :cond_4
    move v3, v2

    .line 98
    :goto_4
    add-int/2addr v0, v3

    .line 99
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 100
    .line 101
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 102
    .line 103
    .line 104
    move-result-wide v3

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    ushr-long v5, v3, v1

    .line 108
    .line 109
    xor-long/2addr v3, v5

    .line 110
    long-to-int v3, v3

    .line 111
    add-int/2addr v0, v3

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 115
    .line 116
    if-eqz v3, :cond_5

    .line 117
    .line 118
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v3, :cond_6

    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

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
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

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
    mul-int/lit8 v0, v0, 0x29

    .line 152
    .line 153
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 154
    .line 155
    if-eqz v3, :cond_8

    .line 156
    .line 157
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    goto :goto_8

    .line 162
    :cond_8
    move v3, v2

    .line 163
    :goto_8
    add-int/2addr v0, v3

    .line 164
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 165
    .line 166
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 167
    .line 168
    .line 169
    move-result-wide v3

    .line 170
    mul-int/lit8 v0, v0, 0x29

    .line 171
    .line 172
    ushr-long v5, v3, v1

    .line 173
    .line 174
    xor-long/2addr v3, v5

    .line 175
    long-to-int v3, v3

    .line 176
    add-int/2addr v0, v3

    .line 177
    mul-int/lit8 v0, v0, 0x29

    .line 178
    .line 179
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 180
    .line 181
    ushr-long v5, v3, v1

    .line 182
    .line 183
    xor-long/2addr v3, v5

    .line 184
    long-to-int v3, v3

    .line 185
    add-int/2addr v0, v3

    .line 186
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 187
    .line 188
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 189
    .line 190
    .line 191
    move-result-wide v3

    .line 192
    mul-int/lit8 v0, v0, 0x29

    .line 193
    .line 194
    ushr-long v5, v3, v1

    .line 195
    .line 196
    xor-long/2addr v3, v5

    .line 197
    long-to-int v1, v3

    .line 198
    add-int/2addr v0, v1

    .line 199
    mul-int/lit8 v0, v0, 0x29

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 202
    .line 203
    if-eqz v1, :cond_9

    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/StreamCdnInfo;->hashCode()I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    goto :goto_9

    .line 210
    :cond_9
    move v1, v2

    .line 211
    :goto_9
    add-int/2addr v0, v1

    .line 212
    mul-int/lit8 v0, v0, 0x29

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 215
    .line 216
    if-eqz v1, :cond_a

    .line 217
    .line 218
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RecommendInfo;->hashCode()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    goto :goto_a

    .line 223
    :cond_a
    move v1, v2

    .line 224
    :goto_a
    add-int/2addr v0, v1

    .line 225
    mul-int/lit8 v0, v0, 0x29

    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 228
    .line 229
    if-eqz v1, :cond_b

    .line 230
    .line 231
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    goto :goto_b

    .line 236
    :cond_b
    move v1, v2

    .line 237
    :goto_b
    add-int/2addr v0, v1

    .line 238
    mul-int/lit8 v0, v0, 0x29

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 241
    .line 242
    if-eqz v1, :cond_c

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->hashCode()I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    goto :goto_c

    .line 249
    :cond_c
    move v1, v2

    .line 250
    :goto_c
    add-int/2addr v0, v1

    .line 251
    mul-int/lit8 v0, v0, 0x29

    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 254
    .line 255
    if-eqz v1, :cond_d

    .line 256
    .line 257
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    goto :goto_d

    .line 262
    :cond_d
    move v1, v2

    .line 263
    :goto_d
    add-int/2addr v0, v1

    .line 264
    mul-int/lit8 v0, v0, 0x29

    .line 265
    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 267
    .line 268
    if-eqz v1, :cond_e

    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    goto :goto_e

    .line 275
    :cond_e
    move v1, v2

    .line 276
    :goto_e
    add-int/2addr v0, v1

    .line 277
    mul-int/lit8 v0, v0, 0x29

    .line 278
    .line 279
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 280
    .line 281
    if-eqz v1, :cond_f

    .line 282
    .line 283
    const/16 v1, 0x4cf

    .line 284
    .line 285
    goto :goto_f

    .line 286
    :cond_f
    const/16 v1, 0x4d5

    .line 287
    .line 288
    :goto_f
    add-int/2addr v0, v1

    .line 289
    mul-int/lit8 v0, v0, 0x29

    .line 290
    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 292
    .line 293
    if-eqz v1, :cond_10

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->hashCode()I

    .line 296
    .line 297
    .line 298
    move-result v2

    .line 299
    :cond_10
    add-int/2addr v0, v2

    .line 300
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 301
    .line 302
    :cond_11
    return v0
.end method

.method public isLiving()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 2
    .line 3
    const-string v0, "onlive"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 52
    .line 53
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 54
    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 58
    .line 59
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 69
    .line 70
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 80
    .line 81
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 90
    .line 91
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 92
    .line 93
    if-nez v0, :cond_9

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendInfo;->new_()Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 100
    .line 101
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 102
    .line 103
    if-nez v0, :cond_a

    .line 104
    .line 105
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 106
    .line 107
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 108
    .line 109
    if-nez v0, :cond_b

    .line 110
    .line 111
    new-instance v0, Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 117
    .line 118
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 119
    .line 120
    if-nez v0, :cond_c

    .line 121
    .line 122
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 123
    .line 124
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Live;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
