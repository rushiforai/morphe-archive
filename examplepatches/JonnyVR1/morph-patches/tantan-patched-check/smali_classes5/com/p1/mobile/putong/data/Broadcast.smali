.class public Lcom/p1/mobile/putong/data/Broadcast;
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
            "Lcom/p1/mobile/putong/data/Broadcast;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Broadcast;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "broadcast"


# instance fields
.field public active:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public checkStartTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public contentID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public customContent:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public duration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public expiresTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/data/BroadcastStatus;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public type:Lcom/p1/mobile/putong/data/BroadcastType;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Broadcast$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Broadcast$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Broadcast;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/Broadcast$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Broadcast$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Broadcast;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/Broadcast;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Broadcast;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Broadcast;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Broadcast;->nullCheck()V

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

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Broadcast;->clone()Lcom/p1/mobile/putong/data/Broadcast;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Broadcast;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Broadcast;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Broadcast;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->active:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->active:Z

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->duration:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->duration:J

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->contentID:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->contentID:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->customContent:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->customContent:Ljava/lang/String;

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->checkStartTime:D

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Broadcast;->checkStartTime:D

    .line 41
    .line 42
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Broadcast;->clone()Lcom/p1/mobile/putong/data/Broadcast;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Broadcast;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Broadcast;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Broadcast;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->active:Z

    .line 44
    .line 45
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Broadcast;->active:Z

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 50
    .line 51
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 52
    .line 53
    cmpl-double v1, v3, v5

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->duration:J

    .line 58
    .line 59
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Broadcast;->duration:J

    .line 60
    .line 61
    cmp-long v1, v3, v5

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->contentID:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Broadcast;->contentID:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->customContent:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Broadcast;->customContent:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->checkStartTime:D

    .line 86
    .line 87
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->checkStartTime:D

    .line 88
    .line 89
    cmpl-double p0, v3, p0

    .line 90
    .line 91
    if-nez p0, :cond_2

    .line 92
    .line 93
    return v0

    .line 94
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "broadcast"

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
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Broadcast;->active:Z

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    const/16 v1, 0x4cf

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_3
    const/16 v1, 0x4d5

    .line 55
    .line 56
    :goto_3
    add-int/2addr v0, v1

    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 58
    .line 59
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 60
    .line 61
    .line 62
    move-result-wide v3

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    const/16 v1, 0x20

    .line 66
    .line 67
    ushr-long v5, v3, v1

    .line 68
    .line 69
    xor-long/2addr v3, v5

    .line 70
    long-to-int v3, v3

    .line 71
    add-int/2addr v0, v3

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->duration:J

    .line 75
    .line 76
    ushr-long v5, v3, v1

    .line 77
    .line 78
    xor-long/2addr v3, v5

    .line 79
    long-to-int v3, v3

    .line 80
    add-int/2addr v0, v3

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->contentID:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v3, :cond_4

    .line 86
    .line 87
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    goto :goto_4

    .line 92
    :cond_4
    move v3, v2

    .line 93
    :goto_4
    add-int/2addr v0, v3

    .line 94
    mul-int/lit8 v0, v0, 0x29

    .line 95
    .line 96
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->customContent:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz v3, :cond_5

    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    :cond_5
    add-int/2addr v0, v2

    .line 105
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/Broadcast;->checkStartTime:D

    .line 106
    .line 107
    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 108
    .line 109
    .line 110
    move-result-wide v2

    .line 111
    mul-int/lit8 v0, v0, 0x29

    .line 112
    .line 113
    ushr-long v4, v2, v1

    .line 114
    .line 115
    xor-long v1, v2, v4

    .line 116
    .line 117
    long-to-int v1, v1

    .line 118
    add-int/2addr v0, v1

    .line 119
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 120
    .line 121
    :cond_6
    return v0
.end method

.method public isInUse()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 2
    .line 3
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    long-to-double v2, v2

    .line 10
    cmpl-double p0, v0, v2

    .line 11
    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Broadcast;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
