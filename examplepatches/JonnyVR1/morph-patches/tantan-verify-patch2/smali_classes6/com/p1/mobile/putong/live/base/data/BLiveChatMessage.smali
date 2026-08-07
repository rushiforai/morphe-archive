.class public Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivechatmessage"


# instance fields
.field public chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public createdTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public h5:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public preSeq:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public preTimestamp:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public seq:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public userIdentity:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public username:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public value:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->nullCheck()V

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

    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->seq:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->seq:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 35
    .line 36
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 45
    .line 46
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 63
    .line 64
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 65
    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 73
    .line 74
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 75
    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 83
    .line 84
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 85
    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 93
    .line 94
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 95
    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 99
    .line 100
    if-eqz v1, :cond_6

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 107
    .line 108
    :cond_6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preSeq:I

    .line 109
    .line 110
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preSeq:I

    .line 111
    .line 112
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 113
    .line 114
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 115
    .line 116
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->createdTime:J

    .line 117
    .line 118
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->createdTime:J

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 121
    .line 122
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 125
    .line 126
    if-eqz p0, :cond_7

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 133
    .line 134
    :cond_7
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->seq:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->seq:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 62
    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preSeq:I

    .line 160
    .line 161
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preSeq:I

    .line 162
    .line 163
    if-ne v1, v3, :cond_2

    .line 164
    .line 165
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 166
    .line 167
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 168
    .line 169
    cmp-long v1, v3, v5

    .line 170
    .line 171
    if-nez v1, :cond_2

    .line 172
    .line 173
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->createdTime:J

    .line 174
    .line 175
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->createdTime:J

    .line 176
    .line 177
    cmp-long v1, v3, v5

    .line 178
    .line 179
    if-nez v1, :cond_2

    .line 180
    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 182
    .line 183
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 192
    .line 193
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 194
    .line 195
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-eqz p0, :cond_2

    .line 200
    .line 201
    return v0

    .line 202
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivechatmessage"

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
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->seq:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v2

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    goto :goto_4

    .line 74
    :cond_4
    move v1, v2

    .line 75
    :goto_4
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 79
    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;->hashCode()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    goto :goto_5

    .line 87
    :cond_5
    move v1, v2

    .line 88
    :goto_5
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 118
    .line 119
    if-eqz v1, :cond_8

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 131
    .line 132
    if-eqz v1, :cond_9

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 144
    .line 145
    if-eqz v1, :cond_a

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 157
    .line 158
    if-eqz v1, :cond_b

    .line 159
    .line 160
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->hashCode()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    goto :goto_b

    .line 165
    :cond_b
    move v1, v2

    .line 166
    :goto_b
    add-int/2addr v0, v1

    .line 167
    mul-int/lit8 v0, v0, 0x29

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 170
    .line 171
    if-eqz v1, :cond_c

    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    goto :goto_c

    .line 178
    :cond_c
    move v1, v2

    .line 179
    :goto_c
    add-int/2addr v0, v1

    .line 180
    mul-int/lit8 v0, v0, 0x29

    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 183
    .line 184
    if-eqz v1, :cond_d

    .line 185
    .line 186
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->hashCode()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    goto :goto_d

    .line 191
    :cond_d
    move v1, v2

    .line 192
    :goto_d
    add-int/2addr v0, v1

    .line 193
    mul-int/lit8 v0, v0, 0x29

    .line 194
    .line 195
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preSeq:I

    .line 196
    .line 197
    add-int/2addr v0, v1

    .line 198
    mul-int/lit8 v0, v0, 0x29

    .line 199
    .line 200
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 201
    .line 202
    const/16 v1, 0x20

    .line 203
    .line 204
    ushr-long v5, v3, v1

    .line 205
    .line 206
    xor-long/2addr v3, v5

    .line 207
    long-to-int v3, v3

    .line 208
    add-int/2addr v0, v3

    .line 209
    mul-int/lit8 v0, v0, 0x29

    .line 210
    .line 211
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->createdTime:J

    .line 212
    .line 213
    ushr-long v5, v3, v1

    .line 214
    .line 215
    xor-long/2addr v3, v5

    .line 216
    long-to-int v1, v3

    .line 217
    add-int/2addr v0, v1

    .line 218
    mul-int/lit8 v0, v0, 0x29

    .line 219
    .line 220
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 221
    .line 222
    if-eqz v1, :cond_e

    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    goto :goto_e

    .line 229
    :cond_e
    move v1, v2

    .line 230
    :goto_e
    add-int/2addr v0, v1

    .line 231
    mul-int/lit8 v0, v0, 0x29

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 234
    .line 235
    if-eqz v1, :cond_f

    .line 236
    .line 237
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->hashCode()I

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    :cond_f
    add-int/2addr v0, v2

    .line 242
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 243
    .line 244
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 46
    .line 47
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 48
    .line 49
    if-nez v0, :cond_6

    .line 50
    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 52
    .line 53
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 54
    .line 55
    if-nez v0, :cond_7

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 58
    .line 59
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 60
    .line 61
    if-nez v0, :cond_8

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 68
    .line 69
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 70
    .line 71
    if-nez v0, :cond_9

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 78
    .line 79
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 80
    .line 81
    if-nez v0, :cond_a

    .line 82
    .line 83
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 88
    .line 89
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 90
    .line 91
    if-nez v0, :cond_b

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 98
    .line 99
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 100
    .line 101
    if-nez v0, :cond_c

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 104
    .line 105
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 106
    .line 107
    if-nez v0, :cond_d

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 114
    .line 115
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 116
    .line 117
    if-nez v0, :cond_e

    .line 118
    .line 119
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 120
    .line 121
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 122
    .line 123
    if-nez v0, :cond_f

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 130
    .line 131
    :cond_f
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->subtract(Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 73
    .line 74
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 75
    .line 76
    if-eqz v1, :cond_5

    .line 77
    .line 78
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;->subtract(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;)Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 85
    .line 86
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_6

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 97
    .line 98
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 99
    .line 100
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-nez v1, :cond_7

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 111
    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->liveId:Ljava/lang/String;

    .line 113
    .line 114
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 115
    .line 116
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 117
    .line 118
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_8

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 125
    .line 126
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 127
    .line 128
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 129
    .line 130
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 131
    .line 132
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_9

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 139
    .line 140
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 141
    .line 142
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 143
    .line 144
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 145
    .line 146
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-nez v1, :cond_a

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 153
    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 155
    .line 156
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 157
    .line 158
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 159
    .line 160
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-nez v1, :cond_b

    .line 165
    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 167
    .line 168
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 169
    .line 170
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 171
    .line 172
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-nez v1, :cond_c

    .line 179
    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 181
    .line 182
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 183
    .line 184
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 185
    .line 186
    if-eqz v1, :cond_d

    .line 187
    .line 188
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 189
    .line 190
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->subtract(Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 195
    .line 196
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 197
    .line 198
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 199
    .line 200
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-nez v1, :cond_e

    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 207
    .line 208
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 209
    .line 210
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 211
    .line 212
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 213
    .line 214
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    if-nez p1, :cond_f

    .line 219
    .line 220
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 221
    .line 222
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 223
    .line 224
    :cond_f
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 225
    .line 226
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;-><init>()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result p0

    .line 233
    if-eqz p0, :cond_10

    .line 234
    .line 235
    const/4 p0, 0x0

    .line 236
    return-object p0

    .line 237
    :cond_10
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
