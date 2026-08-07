.class public Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;
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
            "Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "convadditionalmatchinfo"


# instance fields
.field public likeTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public likedByTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public matchTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public otherState:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public sourceEn:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public sourceUserID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public state:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public verifyInviteOwner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public verifyInviteTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->clone()Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->matchTime:D

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->matchTime:D

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceUserID:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceUserID:Ljava/lang/String;

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceEn:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceEn:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->clone()Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 16
    .line 17
    cmpl-double v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 22
    .line 23
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 24
    .line 25
    cmpl-double v1, v3, v5

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->matchTime:D

    .line 60
    .line 61
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->matchTime:D

    .line 62
    .line 63
    cmpl-double v1, v3, v5

    .line 64
    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceUserID:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceUserID:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 78
    .line 79
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 80
    .line 81
    cmpl-double v1, v3, v5

    .line 82
    .line 83
    if-nez v1, :cond_2

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceEn:Ljava/lang/String;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceEn:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_2

    .line 104
    .line 105
    return v0

    .line 106
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "convadditionalmatchinfo"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 21
    .line 22
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    mul-int/lit8 v0, v0, 0x29

    .line 27
    .line 28
    ushr-long v4, v1, v3

    .line 29
    .line 30
    xor-long/2addr v1, v4

    .line 31
    long-to-int v1, v1

    .line 32
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move v1, v2

    .line 46
    :goto_0
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    move v1, v2

    .line 59
    :goto_1
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_2

    .line 71
    :cond_2
    move v1, v2

    .line 72
    :goto_2
    add-int/2addr v0, v1

    .line 73
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->matchTime:D

    .line 74
    .line 75
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 76
    .line 77
    .line 78
    move-result-wide v4

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    ushr-long v6, v4, v3

    .line 82
    .line 83
    xor-long/2addr v4, v6

    .line 84
    long-to-int v1, v4

    .line 85
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceUserID:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    goto :goto_3

    .line 97
    :cond_3
    move v1, v2

    .line 98
    :goto_3
    add-int/2addr v0, v1

    .line 99
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 100
    .line 101
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 102
    .line 103
    .line 104
    move-result-wide v4

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    ushr-long v6, v4, v3

    .line 108
    .line 109
    xor-long v3, v4, v6

    .line 110
    .line 111
    long-to-int v1, v3

    .line 112
    add-int/2addr v0, v1

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v1, :cond_4

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    goto :goto_4

    .line 124
    :cond_4
    move v1, v2

    .line 125
    :goto_4
    add-int/2addr v0, v1

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceEn:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz v1, :cond_5

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    :cond_5
    add-int/2addr v0, v2

    .line 137
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 138
    .line 139
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceUserID:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceUserID:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceEn:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->sourceEn:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
