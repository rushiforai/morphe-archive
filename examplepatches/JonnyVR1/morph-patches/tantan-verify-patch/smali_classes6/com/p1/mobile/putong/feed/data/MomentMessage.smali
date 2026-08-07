.class public Lcom/p1/mobile/putong/feed/data/MomentMessage;
.super Lcom/tantanapp/common/data/CopyObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/CopyObject<",
        "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "momentmessage"


# instance fields
.field public accessory:Lcom/p1/mobile/putong/feed/data/Accessory;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public api_only_otherUser:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public cid:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public isBottom:Z

.field public isCommentFromKanKan:Z

.field public isNewComment:Z

.field public isTopic:Z

.field public likeOfMoment:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public liked:Z

.field public likes:I

.field public localCreatedSession:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public localCreatedTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public localInConversation:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public localInMoment:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public media:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public mediaComment:Lcom/p1/mobile/putong/data/Media;

.field public messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public moment:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public momentShowFromType:Ljava/lang/String;

.field public moreSubComments:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public owner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public parentCommentId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public recalled:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public replyCommentId:Ljava/lang/String;

.field private requestUrl:Ljava/lang/String;

.field public settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/feed/data/CommentStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public sticker:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public subCommentIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public value:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public viewHeight:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/CopyObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->viewHeight:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parseFieldSet:Ljava/util/HashSet;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public audio()Lcom/p1/mobile/putong/data/Audio;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Audio;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/data/Audio;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public beforeApiSerialize()Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->clone()Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->reverseParseComplete()V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public bridge synthetic beforeApiSerialize()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->beforeApiSerialize()Lcom/p1/mobile/putong/feed/data/MomentMessage;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->clone()Lcom/p1/mobile/putong/feed/data/MomentMessage;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tantanapp/common/data/CopyObject;->_id:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/tantanapp/common/data/CopyObject;->_id:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    new-instance v2, Ll/uo00;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/uo00;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 60
    .line 61
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 66
    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->clone()Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 74
    .line 75
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 76
    .line 77
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 80
    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->clone()Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 88
    .line 89
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 90
    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 94
    .line 95
    if-eqz v1, :cond_3

    .line 96
    .line 97
    new-instance v2, Ll/vo00;

    .line 98
    .line 99
    invoke-direct {v2}, Ll/vo00;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 107
    .line 108
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 109
    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 111
    .line 112
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 113
    .line 114
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 117
    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 121
    .line 122
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 125
    .line 126
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 129
    .line 130
    if-eqz v1, :cond_4

    .line 131
    .line 132
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->clone()Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 137
    .line 138
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 139
    .line 140
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 141
    .line 142
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 143
    .line 144
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 145
    .line 146
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 147
    .line 148
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 149
    .line 150
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 151
    .line 152
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 155
    .line 156
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 159
    .line 160
    if-eqz p0, :cond_5

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Accessory;->clone()Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 167
    .line 168
    :cond_5
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->clone()Lcom/p1/mobile/putong/feed/data/MomentMessage;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

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
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/CopyObject;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 22
    .line 23
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 24
    .line 25
    if-ne p1, v3, :cond_3

    .line 26
    .line 27
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 28
    .line 29
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 30
    .line 31
    if-ne p1, v3, :cond_3

    .line 32
    .line 33
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 34
    .line 35
    iget-wide v5, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 36
    .line 37
    cmpl-double p1, v3, v5

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 74
    .line 75
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_3

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_3

    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 92
    .line 93
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 94
    .line 95
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_3

    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 112
    .line 113
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 114
    .line 115
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-eqz p1, :cond_3

    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_3

    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 132
    .line 133
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 134
    .line 135
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_3

    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 142
    .line 143
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-eqz p1, :cond_3

    .line 150
    .line 151
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 152
    .line 153
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 154
    .line 155
    if-ne p1, v3, :cond_3

    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 160
    .line 161
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_3

    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_3

    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 178
    .line 179
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 180
    .line 181
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-eqz p1, :cond_3

    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 188
    .line 189
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 190
    .line 191
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_3

    .line 196
    .line 197
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 198
    .line 199
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 200
    .line 201
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-eqz p1, :cond_3

    .line 206
    .line 207
    iget p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 208
    .line 209
    iget v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 210
    .line 211
    if-ne p1, v3, :cond_3

    .line 212
    .line 213
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 214
    .line 215
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 216
    .line 217
    if-ne p1, v3, :cond_3

    .line 218
    .line 219
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 220
    .line 221
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 222
    .line 223
    if-ne p1, v3, :cond_3

    .line 224
    .line 225
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 226
    .line 227
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 228
    .line 229
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    if-eqz p1, :cond_3

    .line 234
    .line 235
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 236
    .line 237
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 238
    .line 239
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result p0

    .line 243
    if-eqz p0, :cond_3

    .line 244
    .line 245
    return v0

    .line 246
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "momentmessage"

    .line 2
    .line 3
    return-object p0
.end method

.method public getMomentShowFromType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->momentShowFromType:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_17

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/CopyObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 12
    .line 13
    const/16 v2, 0x4d5

    .line 14
    .line 15
    const/16 v3, 0x4cf

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move v1, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    move v1, v3

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v1, v2

    .line 32
    :goto_1
    add-int/2addr v0, v1

    .line 33
    iget-wide v4, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 34
    .line 35
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    const/16 v1, 0x20

    .line 42
    .line 43
    ushr-long v6, v4, v1

    .line 44
    .line 45
    xor-long/2addr v4, v6

    .line 46
    long-to-int v1, v4

    .line 47
    add-int/2addr v0, v1

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_2

    .line 60
    :cond_2
    move v1, v4

    .line 61
    :goto_2
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    goto :goto_3

    .line 73
    :cond_3
    move v1, v4

    .line 74
    :goto_3
    add-int/2addr v0, v1

    .line 75
    mul-int/lit8 v0, v0, 0x29

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    goto :goto_4

    .line 86
    :cond_4
    move v1, v4

    .line 87
    :goto_4
    add-int/2addr v0, v1

    .line 88
    mul-int/lit8 v0, v0, 0x29

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 91
    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    goto :goto_5

    .line 99
    :cond_5
    move v1, v4

    .line 100
    :goto_5
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v1, :cond_6

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    goto :goto_6

    .line 112
    :cond_6
    move v1, v4

    .line 113
    :goto_6
    add-int/2addr v0, v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 117
    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->hashCode()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    goto :goto_7

    .line 125
    :cond_7
    move v1, v4

    .line 126
    :goto_7
    add-int/2addr v0, v1

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 130
    .line 131
    if-eqz v1, :cond_8

    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    goto :goto_8

    .line 138
    :cond_8
    move v1, v4

    .line 139
    :goto_8
    add-int/2addr v0, v1

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 143
    .line 144
    if-eqz v1, :cond_9

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->hashCode()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    goto :goto_9

    .line 151
    :cond_9
    move v1, v4

    .line 152
    :goto_9
    add-int/2addr v0, v1

    .line 153
    mul-int/lit8 v0, v0, 0x29

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 156
    .line 157
    if-eqz v1, :cond_a

    .line 158
    .line 159
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    goto :goto_a

    .line 164
    :cond_a
    move v1, v4

    .line 165
    :goto_a
    add-int/2addr v0, v1

    .line 166
    mul-int/lit8 v0, v0, 0x29

    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 169
    .line 170
    if-eqz v1, :cond_b

    .line 171
    .line 172
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    goto :goto_b

    .line 177
    :cond_b
    move v1, v4

    .line 178
    :goto_b
    add-int/2addr v0, v1

    .line 179
    mul-int/lit8 v0, v0, 0x29

    .line 180
    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 182
    .line 183
    if-eqz v1, :cond_c

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    goto :goto_c

    .line 190
    :cond_c
    move v1, v4

    .line 191
    :goto_c
    add-int/2addr v0, v1

    .line 192
    mul-int/lit8 v0, v0, 0x29

    .line 193
    .line 194
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 195
    .line 196
    if-eqz v1, :cond_d

    .line 197
    .line 198
    move v1, v3

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 205
    .line 206
    if-eqz v1, :cond_e

    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    goto :goto_e

    .line 213
    :cond_e
    move v1, v4

    .line 214
    :goto_e
    add-int/2addr v0, v1

    .line 215
    mul-int/lit8 v0, v0, 0x29

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 218
    .line 219
    if-eqz v1, :cond_f

    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    goto :goto_f

    .line 226
    :cond_f
    move v1, v4

    .line 227
    :goto_f
    add-int/2addr v0, v1

    .line 228
    mul-int/lit8 v0, v0, 0x29

    .line 229
    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 231
    .line 232
    if-eqz v1, :cond_10

    .line 233
    .line 234
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    goto :goto_10

    .line 239
    :cond_10
    move v1, v4

    .line 240
    :goto_10
    add-int/2addr v0, v1

    .line 241
    mul-int/lit8 v0, v0, 0x29

    .line 242
    .line 243
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 244
    .line 245
    if-eqz v1, :cond_11

    .line 246
    .line 247
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->hashCode()I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    goto :goto_11

    .line 252
    :cond_11
    move v1, v4

    .line 253
    :goto_11
    add-int/2addr v0, v1

    .line 254
    mul-int/lit8 v0, v0, 0x29

    .line 255
    .line 256
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 257
    .line 258
    if-eqz v1, :cond_12

    .line 259
    .line 260
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 261
    .line 262
    .line 263
    move-result v1

    .line 264
    goto :goto_12

    .line 265
    :cond_12
    move v1, v4

    .line 266
    :goto_12
    add-int/2addr v0, v1

    .line 267
    mul-int/lit8 v0, v0, 0x29

    .line 268
    .line 269
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 270
    .line 271
    add-int/2addr v0, v1

    .line 272
    mul-int/lit8 v0, v0, 0x29

    .line 273
    .line 274
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 275
    .line 276
    if-eqz v1, :cond_13

    .line 277
    .line 278
    move v1, v3

    .line 279
    goto :goto_13

    .line 280
    :cond_13
    move v1, v2

    .line 281
    :goto_13
    add-int/2addr v0, v1

    .line 282
    mul-int/lit8 v0, v0, 0x29

    .line 283
    .line 284
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 285
    .line 286
    if-eqz v1, :cond_14

    .line 287
    .line 288
    move v2, v3

    .line 289
    :cond_14
    add-int/2addr v0, v2

    .line 290
    mul-int/lit8 v0, v0, 0x29

    .line 291
    .line 292
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 293
    .line 294
    if-eqz v1, :cond_15

    .line 295
    .line 296
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    goto :goto_14

    .line 301
    :cond_15
    move v1, v4

    .line 302
    :goto_14
    add-int/2addr v0, v1

    .line 303
    mul-int/lit8 v0, v0, 0x29

    .line 304
    .line 305
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 306
    .line 307
    if-eqz v1, :cond_16

    .line 308
    .line 309
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/Accessory;->hashCode()I

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    :cond_16
    add-int/2addr v0, v4

    .line 314
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 315
    .line 316
    :cond_17
    return v0
.end method

.method public isChildComment()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 2
    .line 3
    const-string v1, "0"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    :cond_1
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isLocal()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "normal"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method public isMe()Z
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public isOtherUser()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1b

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const-string v0, "localCreatedTime"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 24
    .line 25
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 26
    .line 27
    :cond_1
    const-string v0, "localCreatedSession"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 36
    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 38
    .line 39
    :cond_2
    const-string v0, "localInMoment"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 48
    .line 49
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 50
    .line 51
    :cond_3
    const-string v0, "localInConversation"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 60
    .line 61
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 62
    .line 63
    :cond_4
    const-string v0, "createdTime"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 72
    .line 73
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 74
    .line 75
    :cond_5
    const-string v0, "otherUser"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 86
    .line 87
    :cond_6
    const-string v0, "likeOfMoment"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 98
    .line 99
    :cond_7
    const-string v0, "media"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 110
    .line 111
    :cond_8
    const-string v0, "sticker"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 122
    .line 123
    :cond_9
    const-string v0, "reference"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 134
    .line 135
    :cond_a
    const-string v0, "moment"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 146
    .line 147
    :cond_b
    const-string v0, "commentInfo"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 158
    .line 159
    :cond_c
    const-string v0, "parentCommentId"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 170
    .line 171
    :cond_d
    const-string v0, "subCommentIds"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 182
    .line 183
    :cond_e
    const-string v0, "moreSubComments"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 194
    .line 195
    :cond_f
    const-string v0, "isBottom"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 204
    .line 205
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 206
    .line 207
    :cond_10
    const-string v0, "owner"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 218
    .line 219
    :cond_11
    const-string v0, "value"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 228
    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 230
    .line 231
    :cond_12
    const-string v0, "msgType"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_13

    .line 238
    .line 239
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 240
    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 242
    .line 243
    :cond_13
    const-string v0, "settings"

    .line 244
    .line 245
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_14

    .line 250
    .line 251
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 254
    .line 255
    :cond_14
    const-string v0, "recalled"

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_15

    .line 262
    .line 263
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 264
    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 266
    .line 267
    :cond_15
    const-string v0, "likes"

    .line 268
    .line 269
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_16

    .line 274
    .line 275
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 276
    .line 277
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likes:I

    .line 278
    .line 279
    :cond_16
    const-string v0, "liked"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_17

    .line 286
    .line 287
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 288
    .line 289
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->liked:Z

    .line 290
    .line 291
    :cond_17
    const-string v0, "isNewComment"

    .line 292
    .line 293
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_18

    .line 298
    .line 299
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 300
    .line 301
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 302
    .line 303
    :cond_18
    const-string v0, "status"

    .line 304
    .line 305
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-nez v0, :cond_19

    .line 310
    .line 311
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 312
    .line 313
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 314
    .line 315
    :cond_19
    const-string v0, "accessory"

    .line 316
    .line 317
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isFieldParsed(Ljava/lang/String;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_1a

    .line 322
    .line 323
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 324
    .line 325
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 326
    .line 327
    :cond_1a
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parseFieldSet:Ljava/util/HashSet;

    .line 328
    .line 329
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 330
    .line 331
    .line 332
    :cond_1b
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 333
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->mergeData(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->new_()Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 29
    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 33
    .line 34
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 35
    .line 36
    if-nez v0, :cond_4

    .line 37
    .line 38
    new-instance v0, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 44
    .line 45
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 64
    .line 65
    if-nez v0, :cond_8

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->new_()Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 72
    .line 73
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 74
    .line 75
    if-nez v0, :cond_9

    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CommentStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 86
    .line 87
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 88
    .line 89
    if-nez v0, :cond_a

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Accessory;->new_()Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 96
    .line 97
    :cond_a
    return-void
.end method

.method public onApiParseComplete()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 19
    .line 20
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 38
    .line 39
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    iput-wide v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 46
    .line 47
    if-eqz v1, :cond_4

    .line 48
    .line 49
    const-string v2, "message"

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->type:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->type:Ljava/lang/String;

    .line 63
    .line 64
    const-string v2, "moment"

    .line 65
    .line 66
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->action:Lcom/p1/mobile/putong/feed/data/FeedMomentAction;

    .line 75
    .line 76
    const-string v2, "like"

    .line 77
    .line 78
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 83
    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->id:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->id:Ljava/lang/String;

    .line 92
    .line 93
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 94
    .line 95
    :cond_3
    :goto_1
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 96
    .line 97
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 98
    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_5

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 108
    .line 109
    :cond_5
    return-void
.end method

.method public picture()Lcom/p1/mobile/putong/data/Picture;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public putParsedField(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "v2"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parseFieldSet:Ljava/util/HashSet;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public reverseParseComplete()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 6
    .line 7
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->id:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "moment"

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->type:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    const-string v1, "like"

    .line 52
    .line 53
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/data/FeedMomentAction;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/FeedMomentAction;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->action:Lcom/p1/mobile/putong/feed/data/FeedMomentAction;

    .line 58
    .line 59
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_reference:Lcom/p1/mobile/putong/feed/data/MomentMessageReference;

    .line 64
    .line 65
    const-string v0, "comment"

    .line 66
    .line 67
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/data/FeedMomentAction;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/FeedMomentAction;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessageReference;->action:Lcom/p1/mobile/putong/feed/data/FeedMomentAction;

    .line 72
    .line 73
    :cond_2
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public shouldMergeData()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "v2"

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public status()Lcom/p1/mobile/putong/data/LocalStatus;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 2
    .line 3
    const-string v1, "tantan_verify_toast"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "normal"

    .line 10
    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 14
    .line 15
    const-string v2, "live_vip_greet"

    .line 16
    .line 17
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_3

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 24
    .line 25
    const-string v2, "wechat_block_toast"

    .line 26
    .line 27
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    const-string v2, "fake_id_"

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ljava/lang/Integer;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-ne p0, v0, :cond_1

    .line 59
    .line 60
    const-string p0, "sending"

    .line 61
    .line 62
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_1
    const-string p0, "failed"

    .line 68
    .line 69
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_2
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_3
    :goto_0
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public video()Lcom/p1/mobile/putong/data/Video;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method
