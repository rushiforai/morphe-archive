.class public Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
.super Lcom/tantanapp/common/data/CopyObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/CopyObject<",
        "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
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
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static LOCAL_ID_INVALID:Ljava/lang/String; = "invalid_moment_id"

.field public static final MOMENT_TYPE:Ljava/lang/String; = "moment"

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "coremomentinfo"


# instance fields
.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public feedTime:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public from:Ljava/lang/String;

.field public haveLiked:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public isLive:Z

.field public isVoiceLive:Z

.field public likes:Lcom/p1/mobile/putong/data/PartialIdList;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public localCreatedSession:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public localInFeed:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public localInUserFeed:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public location:Lcom/p1/mobile/putong/data/MessageLocation;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field private locationName:Ljava/lang/String;

.field public media:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public messages:Lcom/p1/mobile/putong/data/PartialIdList;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public musicId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public owner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
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

.field private requestUrl:Ljava/lang/String;

.field public sourceType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/MomentTag;",
            ">;"
        }
    .end annotation
.end field

.field public topics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TopicMomentIdBox;",
            ">;"
        }
    .end annotation
.end field

.field public value:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public videoBullets:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/VideoBullet;",
            ">;"
        }
    .end annotation
.end field

.field public views:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/VideoBullet;)Lcom/p1/mobile/putong/core/data/VideoBullet;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VideoBullet;->clone()Lcom/p1/mobile/putong/core/data/VideoBullet;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/TopicMomentIdBox;)Lcom/p1/mobile/putong/core/data/TopicMomentIdBox;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TopicMomentIdBox;->clone()Lcom/p1/mobile/putong/core/data/TopicMomentIdBox;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/MomentTag;)Lcom/p1/mobile/putong/core/data/MomentTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MomentTag;->clone()Lcom/p1/mobile/putong/core/data/MomentTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
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

.method public static new_()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->nullCheck()V

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

    .line 168
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->clone()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;-><init>()V

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInFeed:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInFeed:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInUserFeed:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInUserFeed:Z

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    new-instance v2, Ll/p0a;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/p0a;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 52
    .line 53
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 54
    .line 55
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 58
    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MessageLocation;->clone()Lcom/p1/mobile/putong/data/MessageLocation;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 66
    .line 67
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 68
    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 72
    .line 73
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 76
    .line 77
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 80
    .line 81
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 84
    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PartialIdList;->clone()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 92
    .line 93
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 94
    .line 95
    if-eqz v1, :cond_3

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PartialIdList;->clone()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 102
    .line 103
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 104
    .line 105
    if-eqz v1, :cond_4

    .line 106
    .line 107
    new-instance v2, Ll/q0a;

    .line 108
    .line 109
    invoke-direct {v2}, Ll/q0a;-><init>()V

    .line 110
    .line 111
    .line 112
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 117
    .line 118
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 119
    .line 120
    if-eqz v1, :cond_5

    .line 121
    .line 122
    new-instance v2, Ll/r0a;

    .line 123
    .line 124
    invoke-direct {v2}, Ll/r0a;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 132
    .line 133
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 134
    .line 135
    if-eqz v1, :cond_6

    .line 136
    .line 137
    new-instance v2, Ll/s0a;

    .line 138
    .line 139
    invoke-direct {v2}, Ll/s0a;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 147
    .line 148
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 149
    .line 150
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 153
    .line 154
    if-eqz v1, :cond_7

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MomentCard;->clone()Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 161
    .line 162
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 163
    .line 164
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 165
    .line 166
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 167
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->clone()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

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
    iget p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 22
    .line 23
    iget v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 24
    .line 25
    if-ne p1, v3, :cond_3

    .line 26
    .line 27
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInFeed:Z

    .line 28
    .line 29
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInFeed:Z

    .line 30
    .line 31
    if-ne p1, v3, :cond_3

    .line 32
    .line 33
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInUserFeed:Z

    .line 34
    .line 35
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInUserFeed:Z

    .line 36
    .line 37
    if-ne p1, v3, :cond_3

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_3

    .line 48
    .line 49
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 50
    .line 51
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 52
    .line 53
    cmpl-double p1, v3, v5

    .line 54
    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 68
    .line 69
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 78
    .line 79
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 80
    .line 81
    if-ne p1, v3, :cond_3

    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 84
    .line 85
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 86
    .line 87
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_3

    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 94
    .line 95
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 96
    .line 97
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_3

    .line 102
    .line 103
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 104
    .line 105
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 106
    .line 107
    if-ne p1, v3, :cond_3

    .line 108
    .line 109
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 110
    .line 111
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 112
    .line 113
    if-ne p1, v3, :cond_3

    .line 114
    .line 115
    iget p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 116
    .line 117
    iget v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 118
    .line 119
    if-ne p1, v3, :cond_3

    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 122
    .line 123
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 132
    .line 133
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 142
    .line 143
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 152
    .line 153
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 154
    .line 155
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_3

    .line 160
    .line 161
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 162
    .line 163
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 164
    .line 165
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-eqz p1, :cond_3

    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 174
    .line 175
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eqz p1, :cond_3

    .line 180
    .line 181
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 182
    .line 183
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 184
    .line 185
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_3

    .line 190
    .line 191
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 192
    .line 193
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-eqz p0, :cond_3

    .line 200
    .line 201
    return v0

    .line 202
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "coremomentinfo"

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocationName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->locationName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_12

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 12
    .line 13
    add-int/2addr v0, v1

    .line 14
    mul-int/lit8 v0, v0, 0x29

    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInFeed:Z

    .line 17
    .line 18
    const/16 v2, 0x4d5

    .line 19
    .line 20
    const/16 v3, 0x4cf

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    move v1, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v1, v2

    .line 27
    :goto_0
    add-int/2addr v0, v1

    .line 28
    mul-int/lit8 v0, v0, 0x29

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localInUserFeed:Z

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    move v1, v3

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v1, v2

    .line 37
    :goto_1
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    goto :goto_2

    .line 50
    :cond_2
    move v1, v4

    .line 51
    :goto_2
    add-int/2addr v0, v1

    .line 52
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 53
    .line 54
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 55
    .line 56
    .line 57
    move-result-wide v5

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    const/16 v1, 0x20

    .line 61
    .line 62
    ushr-long v7, v5, v1

    .line 63
    .line 64
    xor-long/2addr v5, v7

    .line 65
    long-to-int v1, v5

    .line 66
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    goto :goto_3

    .line 78
    :cond_3
    move v1, v4

    .line 79
    :goto_3
    add-int/2addr v0, v1

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 83
    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    goto :goto_4

    .line 91
    :cond_4
    move v1, v4

    .line 92
    :goto_4
    add-int/2addr v0, v1

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 96
    .line 97
    if-eqz v1, :cond_5

    .line 98
    .line 99
    move v1, v3

    .line 100
    goto :goto_5

    .line 101
    :cond_5
    move v1, v2

    .line 102
    :goto_5
    add-int/2addr v0, v1

    .line 103
    mul-int/lit8 v0, v0, 0x29

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 106
    .line 107
    if-eqz v1, :cond_6

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MessageLocation;->hashCode()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    goto :goto_6

    .line 114
    :cond_6
    move v1, v4

    .line 115
    :goto_6
    add-int/2addr v0, v1

    .line 116
    mul-int/lit8 v0, v0, 0x29

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 119
    .line 120
    if-eqz v1, :cond_7

    .line 121
    .line 122
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    goto :goto_7

    .line 127
    :cond_7
    move v1, v4

    .line 128
    :goto_7
    add-int/2addr v0, v1

    .line 129
    mul-int/lit8 v0, v0, 0x29

    .line 130
    .line 131
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 132
    .line 133
    if-eqz v1, :cond_8

    .line 134
    .line 135
    move v1, v3

    .line 136
    goto :goto_8

    .line 137
    :cond_8
    move v1, v2

    .line 138
    :goto_8
    add-int/2addr v0, v1

    .line 139
    mul-int/lit8 v0, v0, 0x29

    .line 140
    .line 141
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 142
    .line 143
    if-eqz v1, :cond_9

    .line 144
    .line 145
    move v2, v3

    .line 146
    :cond_9
    add-int/2addr v0, v2

    .line 147
    mul-int/lit8 v0, v0, 0x29

    .line 148
    .line 149
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 150
    .line 151
    add-int/2addr v0, v1

    .line 152
    mul-int/lit8 v0, v0, 0x29

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 155
    .line 156
    if-eqz v1, :cond_a

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PartialIdList;->hashCode()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    goto :goto_9

    .line 163
    :cond_a
    move v1, v4

    .line 164
    :goto_9
    add-int/2addr v0, v1

    .line 165
    mul-int/lit8 v0, v0, 0x29

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 168
    .line 169
    if-eqz v1, :cond_b

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PartialIdList;->hashCode()I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    goto :goto_a

    .line 176
    :cond_b
    move v1, v4

    .line 177
    :goto_a
    add-int/2addr v0, v1

    .line 178
    mul-int/lit8 v0, v0, 0x29

    .line 179
    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 181
    .line 182
    if-eqz v1, :cond_c

    .line 183
    .line 184
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    goto :goto_b

    .line 189
    :cond_c
    move v1, v4

    .line 190
    :goto_b
    add-int/2addr v0, v1

    .line 191
    mul-int/lit8 v0, v0, 0x29

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 194
    .line 195
    if-eqz v1, :cond_d

    .line 196
    .line 197
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    goto :goto_c

    .line 202
    :cond_d
    move v1, v4

    .line 203
    :goto_c
    add-int/2addr v0, v1

    .line 204
    mul-int/lit8 v0, v0, 0x29

    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 207
    .line 208
    if-eqz v1, :cond_e

    .line 209
    .line 210
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    goto :goto_d

    .line 215
    :cond_e
    move v1, v4

    .line 216
    :goto_d
    add-int/2addr v0, v1

    .line 217
    mul-int/lit8 v0, v0, 0x29

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 220
    .line 221
    if-eqz v1, :cond_f

    .line 222
    .line 223
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    goto :goto_e

    .line 228
    :cond_f
    move v1, v4

    .line 229
    :goto_e
    add-int/2addr v0, v1

    .line 230
    mul-int/lit8 v0, v0, 0x29

    .line 231
    .line 232
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 233
    .line 234
    if-eqz v1, :cond_10

    .line 235
    .line 236
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MomentCard;->hashCode()I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    goto :goto_f

    .line 241
    :cond_10
    move v1, v4

    .line 242
    :goto_f
    add-int/2addr v0, v1

    .line 243
    mul-int/lit8 v0, v0, 0x29

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 246
    .line 247
    if-eqz v1, :cond_11

    .line 248
    .line 249
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 250
    .line 251
    .line 252
    move-result v4

    .line 253
    :cond_11
    add-int/2addr v0, v4

    .line 254
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 255
    .line 256
    :cond_12
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->parseFieldSet:Ljava/util/HashSet;

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

.method public mergeData(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_13

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->equals(Ljava/lang/Object;)Z

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
    const-string v0, "value"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    const-string v0, "createdTime"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 36
    .line 37
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 38
    .line 39
    :cond_2
    const-string v0, "owner"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 50
    .line 51
    :cond_3
    const-string v0, "media"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 62
    .line 63
    :cond_4
    const-string v0, "haveLiked"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 72
    .line 73
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 74
    .line 75
    :cond_5
    const-string v0, "location"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 86
    .line 87
    :cond_6
    const-string v0, "momentType"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 98
    .line 99
    :cond_7
    const-string v0, "isVoiceLive"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 108
    .line 109
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 110
    .line 111
    :cond_8
    const-string v0, "isLive"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 120
    .line 121
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 122
    .line 123
    :cond_9
    const-string v0, "views"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 132
    .line 133
    iput v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 134
    .line 135
    :cond_a
    const-string v0, "likes"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 146
    .line 147
    :cond_b
    const-string v0, "messages"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 158
    .line 159
    :cond_c
    const-string v0, "topics"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 170
    .line 171
    :cond_d
    const-string v0, "tags"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 182
    .line 183
    :cond_e
    const-string v0, "videoBullets"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 194
    .line 195
    :cond_f
    const-string v0, "musicId"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 206
    .line 207
    :cond_10
    const-string v0, "momentCard"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 218
    .line 219
    :cond_11
    const-string v0, "sourceType"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 228
    .line 229
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 230
    .line 231
    :cond_12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->parseFieldSet:Ljava/util/HashSet;

    .line 232
    .line 233
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 234
    .line 235
    .line 236
    :cond_13
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 237
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->mergeData(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 59
    .line 60
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 61
    .line 62
    if-nez v0, :cond_6

    .line 63
    .line 64
    new-instance v0, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    new-instance v0, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 81
    .line 82
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 83
    .line 84
    if-nez v0, :cond_8

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 87
    .line 88
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 89
    .line 90
    if-nez v0, :cond_9

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MomentCard;->new_()Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 97
    .line 98
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 99
    .line 100
    if-nez v0, :cond_a

    .line 101
    .line 102
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 103
    .line 104
    :cond_a
    return-void
.end method

.method public setLocationName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->locationName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public status()Lcom/p1/mobile/putong/data/LocalStatus;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "fake_id_"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->localCreatedSession:I

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-ne p0, v0, :cond_0

    .line 26
    .line 27
    const-string p0, "sending"

    .line 28
    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    const-string p0, "failed"

    .line 35
    .line 36
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    const-string p0, "normal"

    .line 42
    .line 43
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
