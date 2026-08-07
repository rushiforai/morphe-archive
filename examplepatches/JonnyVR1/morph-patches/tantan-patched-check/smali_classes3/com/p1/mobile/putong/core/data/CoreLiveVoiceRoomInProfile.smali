.class public Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;
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
            "Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "corelivevoiceroominprofile"


# instance fields
.field public anchorId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public background:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public isPersonal:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public membersText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public needBuild:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public subTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public topicId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public userAvatars:Ljava/util/List;
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

.field public voiceLiveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public voiceRoomId:Ljava/lang/String;
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
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->nullCheck()V

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

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->clone()Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->isPersonal:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->isPersonal:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    new-instance v2, Ll/sl9;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/sl9;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 36
    .line 37
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->needBuild:Z

    .line 38
    .line 39
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->needBuild:Z

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 58
    .line 59
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 60
    .line 61
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->clone()Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->isPersonal:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->isPersonal:Z

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->needBuild:Z

    .line 60
    .line 61
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->needBuild:Z

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_2

    .line 114
    .line 115
    return v0

    .line 116
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "corelivevoiceroominprofile"

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
    if-nez v0, :cond_b

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->isPersonal:Z

    .line 35
    .line 36
    const/16 v3, 0x4d5

    .line 37
    .line 38
    const/16 v4, 0x4cf

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    move v1, v4

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v3

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v1, v2

    .line 58
    :goto_3
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    goto :goto_4

    .line 70
    :cond_4
    move v1, v2

    .line 71
    :goto_4
    add-int/2addr v0, v1

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->needBuild:Z

    .line 75
    .line 76
    if-eqz v1, :cond_5

    .line 77
    .line 78
    move v3, v4

    .line 79
    :cond_5
    add-int/2addr v0, v3

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v1, :cond_6

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    goto :goto_5

    .line 91
    :cond_6
    move v1, v2

    .line 92
    :goto_5
    add-int/2addr v0, v1

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v1, :cond_7

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    goto :goto_6

    .line 104
    :cond_7
    move v1, v2

    .line 105
    :goto_6
    add-int/2addr v0, v1

    .line 106
    mul-int/lit8 v0, v0, 0x29

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 109
    .line 110
    if-eqz v1, :cond_8

    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    goto :goto_7

    .line 117
    :cond_8
    move v1, v2

    .line 118
    :goto_7
    add-int/2addr v0, v1

    .line 119
    mul-int/lit8 v0, v0, 0x29

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 122
    .line 123
    if-eqz v1, :cond_9

    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    goto :goto_8

    .line 130
    :cond_9
    move v1, v2

    .line 131
    :goto_8
    add-int/2addr v0, v1

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz v1, :cond_a

    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    :cond_a
    add-int/2addr v0, v2

    .line 143
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 144
    .line 145
    :cond_b
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 49
    .line 50
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_7

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 55
    .line 56
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_8

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 61
    .line 62
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
