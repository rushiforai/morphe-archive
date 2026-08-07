.class public Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveuserknightinfosummary"


# instance fields
.field public createdTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public expireTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public guardScoreIncrement:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public isInRoom:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public isKnight:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public sessionSendCoins:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->nullCheck()V

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

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isInRoom:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isInRoom:Z

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardScoreIncrement:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardScoreIncrement:J

    .line 37
    .line 38
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 20
    .line 21
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 22
    .line 23
    cmp-long v1, v3, v5

    .line 24
    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 28
    .line 29
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 30
    .line 31
    cmp-long v1, v3, v5

    .line 32
    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 46
    .line 47
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 48
    .line 49
    if-ne v1, v3, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isInRoom:Z

    .line 62
    .line 63
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isInRoom:Z

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardScoreIncrement:J

    .line 68
    .line 69
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardScoreIncrement:J

    .line 70
    .line 71
    cmp-long p0, v3, p0

    .line 72
    .line 73
    if-nez p0, :cond_2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveuserknightinfosummary"

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
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isKnight:Z

    .line 8
    .line 9
    const/16 v2, 0x4d5

    .line 10
    .line 11
    const/16 v3, 0x4cf

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move v1, v3

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
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->createdTime:J

    .line 22
    .line 23
    const/16 v1, 0x20

    .line 24
    .line 25
    ushr-long v6, v4, v1

    .line 26
    .line 27
    xor-long/2addr v4, v6

    .line 28
    long-to-int v4, v4

    .line 29
    add-int/2addr v0, v4

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->expireTime:J

    .line 33
    .line 34
    ushr-long v6, v4, v1

    .line 35
    .line 36
    xor-long/2addr v4, v6

    .line 37
    long-to-int v4, v4

    .line 38
    add-int/2addr v0, v4

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    if-eqz v4, :cond_1

    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move v4, v5

    .line 52
    :goto_1
    add-int/2addr v0, v4

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->sessionSendCoins:I

    .line 56
    .line 57
    add-int/2addr v0, v4

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 61
    .line 62
    if-eqz v4, :cond_2

    .line 63
    .line 64
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    :cond_2
    add-int/2addr v0, v5

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-boolean v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->isInRoom:Z

    .line 72
    .line 73
    if-eqz v4, :cond_3

    .line 74
    .line 75
    move v2, v3

    .line 76
    :cond_3
    add-int/2addr v0, v2

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardScoreIncrement:J

    .line 80
    .line 81
    ushr-long v4, v2, v1

    .line 82
    .line 83
    xor-long v1, v2, v4

    .line 84
    .line 85
    long-to-int v1, v1

    .line 86
    add-int/2addr v0, v1

    .line 87
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 88
    .line 89
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->guardType:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
