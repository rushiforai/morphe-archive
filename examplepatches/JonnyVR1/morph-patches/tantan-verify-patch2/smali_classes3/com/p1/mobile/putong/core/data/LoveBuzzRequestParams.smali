.class public Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;
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
            "Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "lovebuzzrequestparams"


# instance fields
.field public buzzToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public channelToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public consumeType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public conversationId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public duration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public errorCode:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public expire:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public mcc:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public memojiBuzzToggle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public mode:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public noFace:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public noVocal:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public notBlur:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public otherUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public preferredMcc:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public prolonged:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public scene:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public textBuzzToggle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public videoBuzzToggle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public voiceBuzzToggle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->nullCheck()V

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

    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->clone()Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mcc:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mcc:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->textBuzzToggle:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->textBuzzToggle:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->duration:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->duration:I

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->voiceBuzzToggle:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->voiceBuzzToggle:Z

    .line 45
    .line 46
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->videoBuzzToggle:Z

    .line 47
    .line 48
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->videoBuzzToggle:Z

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->clone()Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 59
    .line 60
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 61
    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;->clone()Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 69
    .line 70
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 73
    .line 74
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->expire:J

    .line 75
    .line 76
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->expire:J

    .line 77
    .line 78
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->prolonged:Z

    .line 79
    .line 80
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->prolonged:Z

    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->notBlur:Z

    .line 83
    .line 84
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->notBlur:Z

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->memojiBuzzToggle:Z

    .line 87
    .line 88
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->memojiBuzzToggle:Z

    .line 89
    .line 90
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->preferredMcc:I

    .line 91
    .line 92
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->preferredMcc:I

    .line 93
    .line 94
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noFace:Z

    .line 95
    .line 96
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noFace:Z

    .line 97
    .line 98
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noVocal:Z

    .line 99
    .line 100
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noVocal:Z

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 103
    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 105
    .line 106
    iget p0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->errorCode:I

    .line 107
    .line 108
    iput p0, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->errorCode:I

    .line 109
    .line 110
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->clone()Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mcc:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mcc:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->textBuzzToggle:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->textBuzzToggle:Z

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->duration:I

    .line 76
    .line 77
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->duration:I

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->voiceBuzzToggle:Z

    .line 92
    .line 93
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->voiceBuzzToggle:Z

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->videoBuzzToggle:Z

    .line 98
    .line 99
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->videoBuzzToggle:Z

    .line 100
    .line 101
    if-ne v1, v3, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 106
    .line 107
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->expire:J

    .line 134
    .line 135
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->expire:J

    .line 136
    .line 137
    cmp-long v1, v3, v5

    .line 138
    .line 139
    if-nez v1, :cond_2

    .line 140
    .line 141
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->prolonged:Z

    .line 142
    .line 143
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->prolonged:Z

    .line 144
    .line 145
    if-ne v1, v3, :cond_2

    .line 146
    .line 147
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->notBlur:Z

    .line 148
    .line 149
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->notBlur:Z

    .line 150
    .line 151
    if-ne v1, v3, :cond_2

    .line 152
    .line 153
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->memojiBuzzToggle:Z

    .line 154
    .line 155
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->memojiBuzzToggle:Z

    .line 156
    .line 157
    if-ne v1, v3, :cond_2

    .line 158
    .line 159
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->preferredMcc:I

    .line 160
    .line 161
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->preferredMcc:I

    .line 162
    .line 163
    if-ne v1, v3, :cond_2

    .line 164
    .line 165
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noFace:Z

    .line 166
    .line 167
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noFace:Z

    .line 168
    .line 169
    if-ne v1, v3, :cond_2

    .line 170
    .line 171
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noVocal:Z

    .line 172
    .line 173
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noVocal:Z

    .line 174
    .line 175
    if-ne v1, v3, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

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
    iget p0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->errorCode:I

    .line 188
    .line 189
    iget p1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->errorCode:I

    .line 190
    .line 191
    if-ne p0, p1, :cond_2

    .line 192
    .line 193
    return v0

    .line 194
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "lovebuzzrequestparams"

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
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mcc:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->textBuzzToggle:Z

    .line 27
    .line 28
    const/16 v3, 0x4d5

    .line 29
    .line 30
    const/16 v4, 0x4cf

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    move v1, v4

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v1, v3

    .line 37
    :goto_1
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move v1, v2

    .line 50
    :goto_2
    add-int/2addr v0, v1

    .line 51
    mul-int/lit8 v0, v0, 0x29

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    goto :goto_3

    .line 62
    :cond_3
    move v1, v2

    .line 63
    :goto_3
    add-int/2addr v0, v1

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    goto :goto_4

    .line 75
    :cond_4
    move v1, v2

    .line 76
    :goto_4
    add-int/2addr v0, v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    goto :goto_5

    .line 88
    :cond_5
    move v1, v2

    .line 89
    :goto_5
    add-int/2addr v0, v1

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->duration:I

    .line 93
    .line 94
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    goto :goto_6

    .line 106
    :cond_6
    move v1, v2

    .line 107
    :goto_6
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->voiceBuzzToggle:Z

    .line 111
    .line 112
    if-eqz v1, :cond_7

    .line 113
    .line 114
    move v1, v4

    .line 115
    goto :goto_7

    .line 116
    :cond_7
    move v1, v3

    .line 117
    :goto_7
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x29

    .line 119
    .line 120
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->videoBuzzToggle:Z

    .line 121
    .line 122
    if-eqz v1, :cond_8

    .line 123
    .line 124
    move v1, v4

    .line 125
    goto :goto_8

    .line 126
    :cond_8
    move v1, v3

    .line 127
    :goto_8
    add-int/2addr v0, v1

    .line 128
    mul-int/lit8 v0, v0, 0x29

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 131
    .line 132
    if-eqz v1, :cond_9

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 144
    .line 145
    if-eqz v1, :cond_a

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz v1, :cond_b

    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->expire:J

    .line 170
    .line 171
    const/16 v1, 0x20

    .line 172
    .line 173
    ushr-long v7, v5, v1

    .line 174
    .line 175
    xor-long/2addr v5, v7

    .line 176
    long-to-int v1, v5

    .line 177
    add-int/2addr v0, v1

    .line 178
    mul-int/lit8 v0, v0, 0x29

    .line 179
    .line 180
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->prolonged:Z

    .line 181
    .line 182
    if-eqz v1, :cond_c

    .line 183
    .line 184
    move v1, v4

    .line 185
    goto :goto_c

    .line 186
    :cond_c
    move v1, v3

    .line 187
    :goto_c
    add-int/2addr v0, v1

    .line 188
    mul-int/lit8 v0, v0, 0x29

    .line 189
    .line 190
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->notBlur:Z

    .line 191
    .line 192
    if-eqz v1, :cond_d

    .line 193
    .line 194
    move v1, v4

    .line 195
    goto :goto_d

    .line 196
    :cond_d
    move v1, v3

    .line 197
    :goto_d
    add-int/2addr v0, v1

    .line 198
    mul-int/lit8 v0, v0, 0x29

    .line 199
    .line 200
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->memojiBuzzToggle:Z

    .line 201
    .line 202
    if-eqz v1, :cond_e

    .line 203
    .line 204
    move v1, v4

    .line 205
    goto :goto_e

    .line 206
    :cond_e
    move v1, v3

    .line 207
    :goto_e
    add-int/2addr v0, v1

    .line 208
    mul-int/lit8 v0, v0, 0x29

    .line 209
    .line 210
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->preferredMcc:I

    .line 211
    .line 212
    add-int/2addr v0, v1

    .line 213
    mul-int/lit8 v0, v0, 0x29

    .line 214
    .line 215
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noFace:Z

    .line 216
    .line 217
    if-eqz v1, :cond_f

    .line 218
    .line 219
    move v1, v4

    .line 220
    goto :goto_f

    .line 221
    :cond_f
    move v1, v3

    .line 222
    :goto_f
    add-int/2addr v0, v1

    .line 223
    mul-int/lit8 v0, v0, 0x29

    .line 224
    .line 225
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->noVocal:Z

    .line 226
    .line 227
    if-eqz v1, :cond_10

    .line 228
    .line 229
    move v3, v4

    .line 230
    :cond_10
    add-int/2addr v0, v3

    .line 231
    mul-int/lit8 v0, v0, 0x29

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 234
    .line 235
    if-eqz v1, :cond_11

    .line 236
    .line 237
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    :cond_11
    add-int/2addr v0, v2

    .line 242
    mul-int/lit8 v0, v0, 0x29

    .line 243
    .line 244
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->errorCode:I

    .line 245
    .line 246
    add-int/2addr v0, v1

    .line 247
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 248
    .line 249
    :cond_12
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->buzzToken:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->otherUserId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->channelToken:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->scene:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->mode:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->new_()Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->userInfo:Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;->new_()Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->deviceInfo:Lcom/p1/mobile/putong/core/data/BuzzDeviceInfo;

    .line 58
    .line 59
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 60
    .line 61
    if-nez v0, :cond_8

    .line 62
    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->conversationId:Ljava/lang/String;

    .line 64
    .line 65
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 66
    .line 67
    if-nez v0, :cond_9

    .line 68
    .line 69
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->consumeType:Ljava/lang/String;

    .line 70
    .line 71
    :cond_9
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveBuzzRequestParams;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
