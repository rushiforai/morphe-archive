.class public Lcom/p1/mobile/putong/core/data/HeartbeatMatch;
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
            "Lcom/p1/mobile/putong/core/data/HeartbeatMatch;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/HeartbeatMatch;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "heartbeatmatch"


# instance fields
.field public acceptTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public expireTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public greetEmoji:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public greetText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public guideFakeToGood:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public isPassive:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public lock:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public matchType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public tracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/HeartbeatMatch;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->nullCheck()V

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

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->clone()Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/HeartbeatMatch;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 45
    .line 46
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->clone()Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 16
    .line 17
    cmpl-double v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 22
    .line 23
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 24
    .line 25
    if-ne v1, v3, :cond_2

    .line 26
    .line 27
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 28
    .line 29
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 30
    .line 31
    cmpl-double v1, v3, v5

    .line 32
    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 46
    .line 47
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 48
    .line 49
    if-ne v1, v3, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 62
    .line 63
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 68
    .line 69
    iget v3, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 70
    .line 71
    if-ne v1, v3, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_2

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
    const-string p0, "heartbeatmatch"

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
    if-nez v0, :cond_7

    .line 4
    .line 5
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->expireTime:D

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    mul-int/lit8 v0, v0, 0x29

    .line 12
    .line 13
    const/16 v3, 0x20

    .line 14
    .line 15
    ushr-long v4, v1, v3

    .line 16
    .line 17
    xor-long/2addr v1, v4

    .line 18
    long-to-int v1, v1

    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->isPassive:Z

    .line 23
    .line 24
    const/16 v2, 0x4d5

    .line 25
    .line 26
    const/16 v4, 0x4cf

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    move v1, v4

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v1, v2

    .line 33
    :goto_0
    add-int/2addr v0, v1

    .line 34
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->acceptTime:D

    .line 35
    .line 36
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 37
    .line 38
    .line 39
    move-result-wide v5

    .line 40
    mul-int/lit8 v0, v0, 0x29

    .line 41
    .line 42
    ushr-long v7, v5, v3

    .line 43
    .line 44
    xor-long/2addr v5, v7

    .line 45
    long-to-int v1, v5

    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v1, v3

    .line 60
    :goto_1
    add-int/2addr v0, v1

    .line 61
    mul-int/lit8 v0, v0, 0x29

    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->lock:Z

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    move v1, v4

    .line 68
    goto :goto_2

    .line 69
    :cond_2
    move v1, v2

    .line 70
    :goto_2
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_3

    .line 82
    :cond_3
    move v1, v3

    .line 83
    :goto_3
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 87
    .line 88
    if-eqz v1, :cond_4

    .line 89
    .line 90
    move v2, v4

    .line 91
    :cond_4
    add-int/2addr v0, v2

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->matchType:I

    .line 95
    .line 96
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v1, :cond_5

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    goto :goto_4

    .line 108
    :cond_5
    move v1, v3

    .line 109
    :goto_4
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v1, :cond_6

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    :cond_6
    add-int/2addr v0, v3

    .line 121
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 122
    .line 123
    :cond_7
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->source:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->tracker:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetText:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->greetEmoji:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
