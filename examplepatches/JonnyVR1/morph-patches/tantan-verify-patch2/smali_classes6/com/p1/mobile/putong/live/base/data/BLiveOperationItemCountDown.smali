.class public Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveoperationitemcountdown"


# instance fields
.field public actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public actionType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public currentTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public endText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public endTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public jumpScheme:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public randomDelaySeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public startTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 39
    .line 40
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 22
    .line 23
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 24
    .line 25
    cmp-long v1, v3, v5

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 32
    .line 33
    cmp-long v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 58
    .line 59
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 60
    .line 61
    cmp-long v1, v3, v5

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 88
    .line 89
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    return v0

    .line 96
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveoperationitemcountdown"

    .line 2
    .line 3
    return-object p0
.end method

.method public getTheRemainingTime()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    long-to-int p0, v0

    .line 9
    return p0
.end method

.method public getTotalTime()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    return-wide v0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 8
    .line 9
    const/16 v3, 0x20

    .line 10
    .line 11
    ushr-long v4, v1, v3

    .line 12
    .line 13
    xor-long/2addr v1, v4

    .line 14
    long-to-int v1, v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x29

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->startTime:J

    .line 19
    .line 20
    ushr-long v4, v1, v3

    .line 21
    .line 22
    xor-long/2addr v1, v4

    .line 23
    long-to-int v1, v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 28
    .line 29
    ushr-long v4, v1, v3

    .line 30
    .line 31
    xor-long/2addr v1, v4

    .line 32
    long-to-int v1, v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v1, v2

    .line 47
    :goto_0
    add-int/2addr v0, v1

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 51
    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move v1, v2

    .line 60
    :goto_1
    add-int/2addr v0, v1

    .line 61
    mul-int/lit8 v0, v0, 0x29

    .line 62
    .line 63
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 64
    .line 65
    ushr-long v6, v4, v3

    .line 66
    .line 67
    xor-long v3, v4, v6

    .line 68
    .line 69
    long-to-int v1, v3

    .line 70
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_2

    .line 82
    :cond_2
    move v1, v2

    .line 83
    :goto_2
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_3

    .line 95
    :cond_3
    move v1, v2

    .line 96
    :goto_3
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 100
    .line 101
    if-eqz v1, :cond_4

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    :cond_4
    add-int/2addr v0, v2

    .line 108
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 109
    .line 110
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionAfterCountdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterCountdown;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->jumpScheme:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->type:Lcom/p1/mobile/putong/live/base/data/BLiveOperationCountDownType;

    .line 48
    .line 49
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
