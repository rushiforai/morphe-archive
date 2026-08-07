.class public Lcom/p1/mobile/putong/data/Relationship;
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
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "relationship"


# instance fields
.field public anonymousLikeItemId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public avatarIdentifier:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public coinSign:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public consumeType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public convType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public diamondSign:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public extend:Lcom/p1/mobile/putong/data/RelationshipExtendLetter;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public kankanId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public likeProfileId:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public localLikeFrom:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public localStatus:Lcom/p1/mobile/putong/data/MatchFrom;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public message:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public needUndoPrompt:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public otherKankanId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public otherMessage:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public otherState:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public otherStatus:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MatchFrom;",
            ">;"
        }
    .end annotation
.end field

.field public otherTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MatchFrom;",
            ">;"
        }
    .end annotation
.end field

.field public picksTracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public richListTracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public scenarios:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public scene:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public state:Lcom/p1/mobile/putong/data/RelationshipStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public status:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MatchFrom;",
            ">;"
        }
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MatchFrom;",
            ">;"
        }
    .end annotation
.end field

.field public topics:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
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

.field public trackerId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public updateTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public useAnonymousLikeItemId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public ussTracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Relationship$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Relationship$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/Relationship$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Relationship$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Relationship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
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

.method public static synthetic a(Lcom/p1/mobile/putong/data/MatchFrom;)Lcom/p1/mobile/putong/data/MatchFrom;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/MatchFrom;)Lcom/p1/mobile/putong/data/MatchFrom;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/MatchFrom;)Lcom/p1/mobile/putong/data/MatchFrom;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/MatchFrom;)Lcom/p1/mobile/putong/data/MatchFrom;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/Relationship;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Relationship;->nullCheck()V

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

    .line 242
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Relationship;->clone()Lcom/p1/mobile/putong/data/Relationship;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Relationship;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    new-instance v2, Ll/qwc0;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/qwc0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 24
    .line 25
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 26
    .line 27
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    new-instance v2, Ll/rwc0;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/rwc0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 47
    .line 48
    :cond_1
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 49
    .line 50
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherState:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->otherState:Ljava/lang/String;

    .line 59
    .line 60
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Relationship;->needUndoPrompt:Z

    .line 61
    .line 62
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Relationship;->needUndoPrompt:Z

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->message:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->message:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherMessage:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->otherMessage:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->extend:Lcom/p1/mobile/putong/data/RelationshipExtendLetter;

    .line 73
    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RelationshipExtendLetter;->clone()Lcom/p1/mobile/putong/data/RelationshipExtendLetter;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->extend:Lcom/p1/mobile/putong/data/RelationshipExtendLetter;

    .line 81
    .line 82
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 83
    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    new-instance v2, Ll/swc0;

    .line 87
    .line 88
    invoke-direct {v2}, Ll/swc0;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 96
    .line 97
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 98
    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 102
    .line 103
    if-eqz v1, :cond_4

    .line 104
    .line 105
    new-instance v2, Ll/twc0;

    .line 106
    .line 107
    invoke-direct {v2}, Ll/twc0;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 115
    .line 116
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 117
    .line 118
    if-eqz v1, :cond_5

    .line 119
    .line 120
    new-instance v2, Ll/uwc0;

    .line 121
    .line 122
    invoke-direct {v2}, Ll/uwc0;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 130
    .line 131
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 132
    .line 133
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 136
    .line 137
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 140
    .line 141
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

    .line 144
    .line 145
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 148
    .line 149
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->avatarIdentifier:Ljava/lang/String;

    .line 152
    .line 153
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->avatarIdentifier:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->coinSign:Ljava/lang/String;

    .line 156
    .line 157
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->coinSign:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->localLikeFrom:Ljava/lang/String;

    .line 160
    .line 161
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->localLikeFrom:Ljava/lang/String;

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 164
    .line 165
    if-eqz v1, :cond_6

    .line 166
    .line 167
    new-instance v2, Ll/vwc0;

    .line 168
    .line 169
    invoke-direct {v2}, Ll/vwc0;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 177
    .line 178
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 179
    .line 180
    if-eqz v1, :cond_7

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RelationshipExtensions;->clone()Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 187
    .line 188
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->anonymousLikeItemId:Ljava/lang/String;

    .line 189
    .line 190
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->anonymousLikeItemId:Ljava/lang/String;

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->useAnonymousLikeItemId:Ljava/lang/String;

    .line 193
    .line 194
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->useAnonymousLikeItemId:Ljava/lang/String;

    .line 195
    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 197
    .line 198
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 201
    .line 202
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 203
    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 205
    .line 206
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 207
    .line 208
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 209
    .line 210
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 213
    .line 214
    if-eqz v1, :cond_8

    .line 215
    .line 216
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DclExtensions;->clone()Lcom/p1/mobile/putong/data/DclExtensions;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 221
    .line 222
    :cond_8
    iget v1, p0, Lcom/p1/mobile/putong/data/Relationship;->likeProfileId:I

    .line 223
    .line 224
    iput v1, v0, Lcom/p1/mobile/putong/data/Relationship;->likeProfileId:I

    .line 225
    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 227
    .line 228
    if-eqz v1, :cond_9

    .line 229
    .line 230
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SwipeCardInfo;->clone()Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 235
    .line 236
    :cond_9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 237
    .line 238
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 239
    .line 240
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 241
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Relationship;->clone()Lcom/p1/mobile/putong/data/Relationship;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Relationship;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 36
    .line 37
    cmpl-double v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 62
    .line 63
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 64
    .line 65
    cmpl-double v1, v3, v5

    .line 66
    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherState:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->otherState:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Relationship;->needUndoPrompt:Z

    .line 90
    .line 91
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Relationship;->needUndoPrompt:Z

    .line 92
    .line 93
    if-ne v1, v3, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->message:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->message:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherMessage:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->otherMessage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->extend:Lcom/p1/mobile/putong/data/RelationshipExtendLetter;

    .line 116
    .line 117
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->extend:Lcom/p1/mobile/putong/data/RelationshipExtendLetter;

    .line 118
    .line 119
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 156
    .line 157
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 166
    .line 167
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 176
    .line 177
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 186
    .line 187
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

    .line 196
    .line 197
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 206
    .line 207
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    if-eqz v1, :cond_2

    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->avatarIdentifier:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->avatarIdentifier:Ljava/lang/String;

    .line 218
    .line 219
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-eqz v1, :cond_2

    .line 224
    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->coinSign:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->coinSign:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    if-eqz v1, :cond_2

    .line 234
    .line 235
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->localLikeFrom:Ljava/lang/String;

    .line 236
    .line 237
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->localLikeFrom:Ljava/lang/String;

    .line 238
    .line 239
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_2

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 246
    .line 247
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 248
    .line 249
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    if-eqz v1, :cond_2

    .line 254
    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 256
    .line 257
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 258
    .line 259
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    if-eqz v1, :cond_2

    .line 264
    .line 265
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->anonymousLikeItemId:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->anonymousLikeItemId:Ljava/lang/String;

    .line 268
    .line 269
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    if-eqz v1, :cond_2

    .line 274
    .line 275
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->useAnonymousLikeItemId:Ljava/lang/String;

    .line 276
    .line 277
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->useAnonymousLikeItemId:Ljava/lang/String;

    .line 278
    .line 279
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    if-eqz v1, :cond_2

    .line 284
    .line 285
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 286
    .line 287
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 288
    .line 289
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    if-eqz v1, :cond_2

    .line 294
    .line 295
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 296
    .line 297
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 298
    .line 299
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    if-eqz v1, :cond_2

    .line 304
    .line 305
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 306
    .line 307
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    if-eqz v1, :cond_2

    .line 314
    .line 315
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 316
    .line 317
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 318
    .line 319
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    if-eqz v1, :cond_2

    .line 324
    .line 325
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 326
    .line 327
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 328
    .line 329
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    if-eqz v1, :cond_2

    .line 334
    .line 335
    iget v1, p0, Lcom/p1/mobile/putong/data/Relationship;->likeProfileId:I

    .line 336
    .line 337
    iget v3, p1, Lcom/p1/mobile/putong/data/Relationship;->likeProfileId:I

    .line 338
    .line 339
    if-ne v1, v3, :cond_2

    .line 340
    .line 341
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 342
    .line 343
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 344
    .line 345
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result v1

    .line 349
    if-eqz v1, :cond_2

    .line 350
    .line 351
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 352
    .line 353
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 354
    .line 355
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    move-result p0

    .line 359
    if-eqz p0, :cond_2

    .line 360
    .line 361
    return v0

    .line 362
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "relationship"

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
    if-nez v0, :cond_21

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Relationship;->createdTime:D

    .line 33
    .line 34
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    const/16 v1, 0x20

    .line 41
    .line 42
    ushr-long v5, v3, v1

    .line 43
    .line 44
    xor-long/2addr v3, v5

    .line 45
    long-to-int v3, v3

    .line 46
    add-int/2addr v0, v3

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz v3, :cond_2

    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move v3, v2

    .line 59
    :goto_2
    add-int/2addr v0, v3

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 63
    .line 64
    if-eqz v3, :cond_3

    .line 65
    .line 66
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    goto :goto_3

    .line 71
    :cond_3
    move v3, v2

    .line 72
    :goto_3
    add-int/2addr v0, v3

    .line 73
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

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
    long-to-int v1, v3

    .line 85
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v1, :cond_4

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    goto :goto_4

    .line 97
    :cond_4
    move v1, v2

    .line 98
    :goto_4
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherState:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v1, :cond_5

    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    goto :goto_5

    .line 110
    :cond_5
    move v1, v2

    .line 111
    :goto_5
    add-int/2addr v0, v1

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Relationship;->needUndoPrompt:Z

    .line 115
    .line 116
    if-eqz v1, :cond_6

    .line 117
    .line 118
    const/16 v1, 0x4cf

    .line 119
    .line 120
    goto :goto_6

    .line 121
    :cond_6
    const/16 v1, 0x4d5

    .line 122
    .line 123
    :goto_6
    add-int/2addr v0, v1

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->message:Ljava/lang/String;

    .line 127
    .line 128
    if-eqz v1, :cond_7

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    goto :goto_7

    .line 135
    :cond_7
    move v1, v2

    .line 136
    :goto_7
    add-int/2addr v0, v1

    .line 137
    mul-int/lit8 v0, v0, 0x29

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherMessage:Ljava/lang/String;

    .line 140
    .line 141
    if-eqz v1, :cond_8

    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    goto :goto_8

    .line 148
    :cond_8
    move v1, v2

    .line 149
    :goto_8
    add-int/2addr v0, v1

    .line 150
    mul-int/lit8 v0, v0, 0x29

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->extend:Lcom/p1/mobile/putong/data/RelationshipExtendLetter;

    .line 153
    .line 154
    if-eqz v1, :cond_9

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RelationshipExtendLetter;->hashCode()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    goto :goto_9

    .line 161
    :cond_9
    move v1, v2

    .line 162
    :goto_9
    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 166
    .line 167
    if-eqz v1, :cond_a

    .line 168
    .line 169
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    goto :goto_a

    .line 174
    :cond_a
    move v1, v2

    .line 175
    :goto_a
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 179
    .line 180
    if-eqz v1, :cond_b

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    goto :goto_b

    .line 187
    :cond_b
    move v1, v2

    .line 188
    :goto_b
    add-int/2addr v0, v1

    .line 189
    mul-int/lit8 v0, v0, 0x29

    .line 190
    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 192
    .line 193
    if-eqz v1, :cond_c

    .line 194
    .line 195
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    goto :goto_c

    .line 200
    :cond_c
    move v1, v2

    .line 201
    :goto_c
    add-int/2addr v0, v1

    .line 202
    mul-int/lit8 v0, v0, 0x29

    .line 203
    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 205
    .line 206
    if-eqz v1, :cond_d

    .line 207
    .line 208
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    goto :goto_d

    .line 213
    :cond_d
    move v1, v2

    .line 214
    :goto_d
    add-int/2addr v0, v1

    .line 215
    mul-int/lit8 v0, v0, 0x29

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 218
    .line 219
    if-eqz v1, :cond_e

    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    goto :goto_e

    .line 226
    :cond_e
    move v1, v2

    .line 227
    :goto_e
    add-int/2addr v0, v1

    .line 228
    mul-int/lit8 v0, v0, 0x29

    .line 229
    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 231
    .line 232
    if-eqz v1, :cond_f

    .line 233
    .line 234
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    goto :goto_f

    .line 239
    :cond_f
    move v1, v2

    .line 240
    :goto_f
    add-int/2addr v0, v1

    .line 241
    mul-int/lit8 v0, v0, 0x29

    .line 242
    .line 243
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 244
    .line 245
    if-eqz v1, :cond_10

    .line 246
    .line 247
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    goto :goto_10

    .line 252
    :cond_10
    move v1, v2

    .line 253
    :goto_10
    add-int/2addr v0, v1

    .line 254
    mul-int/lit8 v0, v0, 0x29

    .line 255
    .line 256
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

    .line 257
    .line 258
    if-eqz v1, :cond_11

    .line 259
    .line 260
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    goto :goto_11

    .line 265
    :cond_11
    move v1, v2

    .line 266
    :goto_11
    add-int/2addr v0, v1

    .line 267
    mul-int/lit8 v0, v0, 0x29

    .line 268
    .line 269
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 270
    .line 271
    if-eqz v1, :cond_12

    .line 272
    .line 273
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    goto :goto_12

    .line 278
    :cond_12
    move v1, v2

    .line 279
    :goto_12
    add-int/2addr v0, v1

    .line 280
    mul-int/lit8 v0, v0, 0x29

    .line 281
    .line 282
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->avatarIdentifier:Ljava/lang/String;

    .line 283
    .line 284
    if-eqz v1, :cond_13

    .line 285
    .line 286
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    goto :goto_13

    .line 291
    :cond_13
    move v1, v2

    .line 292
    :goto_13
    add-int/2addr v0, v1

    .line 293
    mul-int/lit8 v0, v0, 0x29

    .line 294
    .line 295
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->coinSign:Ljava/lang/String;

    .line 296
    .line 297
    if-eqz v1, :cond_14

    .line 298
    .line 299
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    goto :goto_14

    .line 304
    :cond_14
    move v1, v2

    .line 305
    :goto_14
    add-int/2addr v0, v1

    .line 306
    mul-int/lit8 v0, v0, 0x29

    .line 307
    .line 308
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->localLikeFrom:Ljava/lang/String;

    .line 309
    .line 310
    if-eqz v1, :cond_15

    .line 311
    .line 312
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    goto :goto_15

    .line 317
    :cond_15
    move v1, v2

    .line 318
    :goto_15
    add-int/2addr v0, v1

    .line 319
    mul-int/lit8 v0, v0, 0x29

    .line 320
    .line 321
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->topics:Ljava/util/List;

    .line 322
    .line 323
    if-eqz v1, :cond_16

    .line 324
    .line 325
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 326
    .line 327
    .line 328
    move-result v1

    .line 329
    goto :goto_16

    .line 330
    :cond_16
    move v1, v2

    .line 331
    :goto_16
    add-int/2addr v0, v1

    .line 332
    mul-int/lit8 v0, v0, 0x29

    .line 333
    .line 334
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 335
    .line 336
    if-eqz v1, :cond_17

    .line 337
    .line 338
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RelationshipExtensions;->hashCode()I

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    goto :goto_17

    .line 343
    :cond_17
    move v1, v2

    .line 344
    :goto_17
    add-int/2addr v0, v1

    .line 345
    mul-int/lit8 v0, v0, 0x29

    .line 346
    .line 347
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->anonymousLikeItemId:Ljava/lang/String;

    .line 348
    .line 349
    if-eqz v1, :cond_18

    .line 350
    .line 351
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    goto :goto_18

    .line 356
    :cond_18
    move v1, v2

    .line 357
    :goto_18
    add-int/2addr v0, v1

    .line 358
    mul-int/lit8 v0, v0, 0x29

    .line 359
    .line 360
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->useAnonymousLikeItemId:Ljava/lang/String;

    .line 361
    .line 362
    if-eqz v1, :cond_19

    .line 363
    .line 364
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    goto :goto_19

    .line 369
    :cond_19
    move v1, v2

    .line 370
    :goto_19
    add-int/2addr v0, v1

    .line 371
    mul-int/lit8 v0, v0, 0x29

    .line 372
    .line 373
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 374
    .line 375
    if-eqz v1, :cond_1a

    .line 376
    .line 377
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    goto :goto_1a

    .line 382
    :cond_1a
    move v1, v2

    .line 383
    :goto_1a
    add-int/2addr v0, v1

    .line 384
    mul-int/lit8 v0, v0, 0x29

    .line 385
    .line 386
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->kankanId:Ljava/lang/String;

    .line 387
    .line 388
    if-eqz v1, :cond_1b

    .line 389
    .line 390
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 391
    .line 392
    .line 393
    move-result v1

    .line 394
    goto :goto_1b

    .line 395
    :cond_1b
    move v1, v2

    .line 396
    :goto_1b
    add-int/2addr v0, v1

    .line 397
    mul-int/lit8 v0, v0, 0x29

    .line 398
    .line 399
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->otherKankanId:Ljava/lang/String;

    .line 400
    .line 401
    if-eqz v1, :cond_1c

    .line 402
    .line 403
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    goto :goto_1c

    .line 408
    :cond_1c
    move v1, v2

    .line 409
    :goto_1c
    add-int/2addr v0, v1

    .line 410
    mul-int/lit8 v0, v0, 0x29

    .line 411
    .line 412
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 413
    .line 414
    if-eqz v1, :cond_1d

    .line 415
    .line 416
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 417
    .line 418
    .line 419
    move-result v1

    .line 420
    goto :goto_1d

    .line 421
    :cond_1d
    move v1, v2

    .line 422
    :goto_1d
    add-int/2addr v0, v1

    .line 423
    mul-int/lit8 v0, v0, 0x29

    .line 424
    .line 425
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 426
    .line 427
    if-eqz v1, :cond_1e

    .line 428
    .line 429
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DclExtensions;->hashCode()I

    .line 430
    .line 431
    .line 432
    move-result v1

    .line 433
    goto :goto_1e

    .line 434
    :cond_1e
    move v1, v2

    .line 435
    :goto_1e
    add-int/2addr v0, v1

    .line 436
    mul-int/lit8 v0, v0, 0x29

    .line 437
    .line 438
    iget v1, p0, Lcom/p1/mobile/putong/data/Relationship;->likeProfileId:I

    .line 439
    .line 440
    add-int/2addr v0, v1

    .line 441
    mul-int/lit8 v0, v0, 0x29

    .line 442
    .line 443
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->cardInfo:Lcom/p1/mobile/putong/data/SwipeCardInfo;

    .line 444
    .line 445
    if-eqz v1, :cond_1f

    .line 446
    .line 447
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SwipeCardInfo;->hashCode()I

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    goto :goto_1f

    .line 452
    :cond_1f
    move v1, v2

    .line 453
    :goto_1f
    add-int/2addr v0, v1

    .line 454
    mul-int/lit8 v0, v0, 0x29

    .line 455
    .line 456
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 457
    .line 458
    if-eqz v1, :cond_20

    .line 459
    .line 460
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 461
    .line 462
    .line 463
    move-result v2

    .line 464
    :cond_20
    add-int/2addr v0, v2

    .line 465
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 466
    .line 467
    :cond_21
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, ""

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    new-instance v0, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 44
    .line 45
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_4

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->picksTracker:Ljava/lang/String;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    new-instance v0, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->otherStatus:Ljava/util/List;

    .line 61
    .line 62
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 63
    .line 64
    if-nez v0, :cond_6

    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 75
    .line 76
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 77
    .line 78
    if-nez v0, :cond_7

    .line 79
    .line 80
    new-instance v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->tags:Ljava/util/List;

    .line 86
    .line 87
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 88
    .line 89
    if-nez v0, :cond_8

    .line 90
    .line 91
    new-instance v0, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->otherTags:Ljava/util/List;

    .line 97
    .line 98
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 99
    .line 100
    if-nez v0, :cond_9

    .line 101
    .line 102
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->trackerId:Ljava/lang/String;

    .line 103
    .line 104
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 105
    .line 106
    if-nez v0, :cond_a

    .line 107
    .line 108
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->richListTracker:Ljava/lang/String;

    .line 109
    .line 110
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 111
    .line 112
    if-nez v0, :cond_b

    .line 113
    .line 114
    sget-object v0, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 121
    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->localStatus:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 123
    .line 124
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 125
    .line 126
    if-nez v0, :cond_c

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->scene:Ljava/lang/String;

    .line 129
    .line 130
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 131
    .line 132
    if-nez v0, :cond_d

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 135
    .line 136
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 137
    .line 138
    if-nez v0, :cond_e

    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/data/DclExtensions;->new_()Lcom/p1/mobile/putong/data/DclExtensions;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->dclExtensions:Lcom/p1/mobile/putong/data/DclExtensions;

    .line 145
    .line 146
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 147
    .line 148
    if-nez v0, :cond_f

    .line 149
    .line 150
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Relationship;->diamondSign:Ljava/lang/String;

    .line 151
    .line 152
    :cond_f
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Relationship;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
