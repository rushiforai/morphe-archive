.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
.super Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final EMPTY_ROOM:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoiceroom"


# instance fields
.field public announcement:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public backGroundPicId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public backgroundUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public bgPicType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public bgThumbnailUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public classId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public fields:Ljava/lang/String;

.field public freeCall:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public isPersonal:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public maskMode:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public memberCount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public primaryLiveMode:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public roomType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public topicIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public topics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;",
            ">;"
        }
    .end annotation
.end field

.field public useLastTitle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->EMPTY_ROOM:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom$1;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom$1;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->fields:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public addField(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->fields:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->fields:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, ","

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->fields:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->fields:Ljava/lang/String;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->fields:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->fields:Ljava/lang/String;

    .line 61
    .line 62
    return-void
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .locals 0

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->type:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->type:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    new-instance v2, Ll/p92;

    .line 43
    .line 44
    invoke-direct {v2}, Ll/p92;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 52
    .line 53
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    new-instance v2, Ll/q92;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/q92;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 67
    .line 68
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->roomType:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->roomType:Ljava/lang/String;

    .line 71
    .line 72
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 73
    .line 74
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 75
    .line 76
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->memberCount:D

    .line 77
    .line 78
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->memberCount:D

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 81
    .line 82
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 85
    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->announcement:Ljava/lang/String;

    .line 89
    .line 90
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->announcement:Ljava/lang/String;

    .line 91
    .line 92
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->useLastTitle:Z

    .line 93
    .line 94
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->useLastTitle:Z

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 97
    .line 98
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backGroundPicId:Ljava/lang/String;

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backGroundPicId:Ljava/lang/String;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgThumbnailUrl:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgThumbnailUrl:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->classId:Ljava/lang/String;

    .line 109
    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->classId:Ljava/lang/String;

    .line 111
    .line 112
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isPersonal:Z

    .line 113
    .line 114
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isPersonal:Z

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->primaryLiveMode:Ljava/lang/String;

    .line 117
    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->primaryLiveMode:Ljava/lang/String;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 121
    .line 122
    if-eqz p0, :cond_4

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 129
    .line 130
    :cond_4
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

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
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->equals(Ljava/lang/Object;)Z

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->roomType:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->roomType:Ljava/lang/String;

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 52
    .line 53
    iget-boolean v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 54
    .line 55
    if-ne p1, v3, :cond_3

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->memberCount:D

    .line 58
    .line 59
    iget-wide v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->memberCount:D

    .line 60
    .line 61
    cmpl-double p1, v3, v5

    .line 62
    .line 63
    if-nez p1, :cond_3

    .line 64
    .line 65
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 66
    .line 67
    iget-boolean v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 68
    .line 69
    if-ne p1, v3, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->announcement:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->announcement:Ljava/lang/String;

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->useLastTitle:Z

    .line 92
    .line 93
    iget-boolean v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->useLastTitle:Z

    .line 94
    .line 95
    if-ne p1, v3, :cond_3

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_3

    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backGroundPicId:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backGroundPicId:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_3

    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgThumbnailUrl:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgThumbnailUrl:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_3

    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->classId:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->classId:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_3

    .line 136
    .line 137
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isPersonal:Z

    .line 138
    .line 139
    iget-boolean v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isPersonal:Z

    .line 140
    .line 141
    if-ne p1, v3, :cond_3

    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->primaryLiveMode:Ljava/lang/String;

    .line 144
    .line 145
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->primaryLiveMode:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-eqz p1, :cond_3

    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 154
    .line 155
    iget-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 156
    .line 157
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-eqz p0, :cond_3

    .line 162
    .line 163
    return v0

    .line 164
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoiceroom"

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
    if-nez v0, :cond_f

    .line 4
    .line 5
    invoke-super {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->roomType:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->freeCall:Z

    .line 52
    .line 53
    const/16 v3, 0x4d5

    .line 54
    .line 55
    const/16 v4, 0x4cf

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    move v1, v4

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v3

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->memberCount:D

    .line 64
    .line 65
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 66
    .line 67
    .line 68
    move-result-wide v5

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    const/16 v1, 0x20

    .line 72
    .line 73
    ushr-long v7, v5, v1

    .line 74
    .line 75
    xor-long/2addr v5, v7

    .line 76
    long-to-int v1, v5

    .line 77
    add-int/2addr v0, v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    move v1, v4

    .line 85
    goto :goto_4

    .line 86
    :cond_4
    move v1, v3

    .line 87
    :goto_4
    add-int/2addr v0, v1

    .line 88
    mul-int/lit8 v0, v0, 0x29

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    goto :goto_5

    .line 99
    :cond_5
    move v1, v2

    .line 100
    :goto_5
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->announcement:Ljava/lang/String;

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
    move v1, v2

    .line 113
    :goto_6
    add-int/2addr v0, v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->useLastTitle:Z

    .line 117
    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    move v1, v4

    .line 121
    goto :goto_7

    .line 122
    :cond_7
    move v1, v3

    .line 123
    :goto_7
    add-int/2addr v0, v1

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    goto :goto_8

    .line 135
    :cond_8
    move v1, v2

    .line 136
    :goto_8
    add-int/2addr v0, v1

    .line 137
    mul-int/lit8 v0, v0, 0x29

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backGroundPicId:Ljava/lang/String;

    .line 140
    .line 141
    if-eqz v1, :cond_9

    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    goto :goto_9

    .line 148
    :cond_9
    move v1, v2

    .line 149
    :goto_9
    add-int/2addr v0, v1

    .line 150
    mul-int/lit8 v0, v0, 0x29

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgThumbnailUrl:Ljava/lang/String;

    .line 153
    .line 154
    if-eqz v1, :cond_a

    .line 155
    .line 156
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    goto :goto_a

    .line 161
    :cond_a
    move v1, v2

    .line 162
    :goto_a
    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->classId:Ljava/lang/String;

    .line 166
    .line 167
    if-eqz v1, :cond_b

    .line 168
    .line 169
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isPersonal:Z

    .line 179
    .line 180
    if-eqz v1, :cond_c

    .line 181
    .line 182
    move v3, v4

    .line 183
    :cond_c
    add-int/2addr v0, v3

    .line 184
    mul-int/lit8 v0, v0, 0x29

    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->primaryLiveMode:Ljava/lang/String;

    .line 187
    .line 188
    if-eqz v1, :cond_d

    .line 189
    .line 190
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    goto :goto_c

    .line 195
    :cond_d
    move v1, v2

    .line 196
    :goto_c
    add-int/2addr v0, v1

    .line 197
    mul-int/lit8 v0, v0, 0x29

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->callPlaceResource:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;

    .line 200
    .line 201
    if-eqz v1, :cond_e

    .line 202
    .line 203
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomCallPlaceResource;->hashCode()I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    :cond_e
    add-int/2addr v0, v2

    .line 208
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 209
    .line 210
    :cond_f
    return v0
.end method

.method public isMaskMode()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 2
    .line 3
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->roomType:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, ""

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->roomType:Ljava/lang/String;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 39
    .line 40
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->announcement:Ljava/lang/String;

    .line 41
    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->announcement:Ljava/lang/String;

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 51
    .line 52
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backGroundPicId:Ljava/lang/String;

    .line 53
    .line 54
    if-nez v0, :cond_6

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backGroundPicId:Ljava/lang/String;

    .line 57
    .line 58
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgThumbnailUrl:Ljava/lang/String;

    .line 59
    .line 60
    if-nez v0, :cond_7

    .line 61
    .line 62
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgThumbnailUrl:Ljava/lang/String;

    .line 63
    .line 64
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->classId:Ljava/lang/String;

    .line 65
    .line 66
    if-nez v0, :cond_8

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->classId:Ljava/lang/String;

    .line 69
    .line 70
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->primaryLiveMode:Ljava/lang/String;

    .line 71
    .line 72
    if-nez v0, :cond_9

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->primaryLiveMode:Ljava/lang/String;

    .line 75
    .line 76
    :cond_9
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
