.class public Lcom/p1/mobile/putong/core/data/MessageChatHeat;
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
            "Lcom/p1/mobile/putong/core/data/MessageChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MessageChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "messagechatheat"


# instance fields
.field public actorID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public exclusiveChatDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public exclusiveChatEndTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public exclusiveChatInviteExpireTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public exclusiveChatInviteTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public exclusiveChatStartTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageChatHeat$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageChatHeat$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/MessageChatHeat;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageChatHeat;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->nullCheck()V

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

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->clone()Lcom/p1/mobile/putong/core/data/MessageChatHeat;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MessageChatHeat;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageChatHeat;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->actorID:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->actorID:Ljava/lang/String;

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteTime:D

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteTime:D

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatEndTime:D

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatEndTime:D

    .line 29
    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 31
    .line 32
    iput p0, v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 33
    .line 34
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->clone()Lcom/p1/mobile/putong/core/data/MessageChatHeat;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->actorID:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->actorID:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteTime:D

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteTime:D

    .line 36
    .line 37
    cmpl-double v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 42
    .line 43
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 44
    .line 45
    cmpl-double v1, v3, v5

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 50
    .line 51
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 52
    .line 53
    cmpl-double v1, v3, v5

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatEndTime:D

    .line 58
    .line 59
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatEndTime:D

    .line 60
    .line 61
    cmpl-double v1, v3, v5

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    iget p0, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 66
    .line 67
    iget p1, p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 68
    .line 69
    if-ne p0, p1, :cond_2

    .line 70
    .line 71
    return v0

    .line 72
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "messagechatheat"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 6

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->actorID:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    :cond_1
    add-int/2addr v0, v2

    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteTime:D

    .line 31
    .line 32
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    const/16 v3, 0x20

    .line 39
    .line 40
    ushr-long v4, v1, v3

    .line 41
    .line 42
    xor-long/2addr v1, v4

    .line 43
    long-to-int v1, v1

    .line 44
    add-int/2addr v0, v1

    .line 45
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 46
    .line 47
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    mul-int/lit8 v0, v0, 0x29

    .line 52
    .line 53
    ushr-long v4, v1, v3

    .line 54
    .line 55
    xor-long/2addr v1, v4

    .line 56
    long-to-int v1, v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 59
    .line 60
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 61
    .line 62
    .line 63
    move-result-wide v1

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    ushr-long v4, v1, v3

    .line 67
    .line 68
    xor-long/2addr v1, v4

    .line 69
    long-to-int v1, v1

    .line 70
    add-int/2addr v0, v1

    .line 71
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatEndTime:D

    .line 72
    .line 73
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 74
    .line 75
    .line 76
    move-result-wide v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    ushr-long v3, v1, v3

    .line 80
    .line 81
    xor-long/2addr v1, v3

    .line 82
    long-to-int v1, v1

    .line 83
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatDuration:I

    .line 87
    .line 88
    add-int/2addr v0, v1

    .line 89
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 90
    .line 91
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->actorID:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->actorID:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
