.class public Lcom/p1/mobile/putong/core/data/CounterVerification;
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
            "Lcom/p1/mobile/putong/core/data/CounterVerification;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CounterVerification;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "counterverification"


# instance fields
.field public lastVerifyTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public latestUpdatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public needSync:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public nextVerifyTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public syncAll:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public total:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CounterVerification$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CounterVerification$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CounterVerification$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CounterVerification$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/CounterVerification;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CounterVerification;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CounterVerification;->nullCheck()V

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

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CounterVerification;->clone()Lcom/p1/mobile/putong/core/data/CounterVerification;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CounterVerification;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CounterVerification;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->total:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->total:I

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->needSync:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->needSync:Z

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->latestUpdatedTime:D

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->latestUpdatedTime:D

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->lastVerifyTime:D

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->lastVerifyTime:D

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->nextVerifyTime:D

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->nextVerifyTime:D

    .line 25
    .line 26
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->syncAll:Z

    .line 27
    .line 28
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->syncAll:Z

    .line 29
    .line 30
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CounterVerification;->clone()Lcom/p1/mobile/putong/core/data/CounterVerification;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CounterVerification;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->total:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CounterVerification;->total:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->needSync:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CounterVerification;->needSync:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->latestUpdatedTime:D

    .line 26
    .line 27
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CounterVerification;->latestUpdatedTime:D

    .line 28
    .line 29
    cmpl-double v1, v3, v5

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->lastVerifyTime:D

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CounterVerification;->lastVerifyTime:D

    .line 36
    .line 37
    cmpl-double v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->nextVerifyTime:D

    .line 42
    .line 43
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CounterVerification;->nextVerifyTime:D

    .line 44
    .line 45
    cmpl-double v1, v3, v5

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->syncAll:Z

    .line 50
    .line 51
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/CounterVerification;->syncAll:Z

    .line 52
    .line 53
    if-ne p0, p1, :cond_2

    .line 54
    .line 55
    return v0

    .line 56
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "counterverification"

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
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->total:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->needSync:Z

    .line 13
    .line 14
    const/16 v2, 0x4d5

    .line 15
    .line 16
    const/16 v3, 0x4cf

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    move v1, v3

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v1, v2

    .line 23
    :goto_0
    add-int/2addr v0, v1

    .line 24
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->latestUpdatedTime:D

    .line 25
    .line 26
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 27
    .line 28
    .line 29
    move-result-wide v4

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    const/16 v1, 0x20

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
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->lastVerifyTime:D

    .line 40
    .line 41
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 42
    .line 43
    .line 44
    move-result-wide v4

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    ushr-long v6, v4, v1

    .line 48
    .line 49
    xor-long/2addr v4, v6

    .line 50
    long-to-int v4, v4

    .line 51
    add-int/2addr v0, v4

    .line 52
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->nextVerifyTime:D

    .line 53
    .line 54
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    ushr-long v6, v4, v1

    .line 61
    .line 62
    xor-long/2addr v4, v6

    .line 63
    long-to-int v1, v4

    .line 64
    add-int/2addr v0, v1

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CounterVerification;->syncAll:Z

    .line 68
    .line 69
    if-eqz v1, :cond_1

    .line 70
    .line 71
    move v2, v3

    .line 72
    :cond_1
    add-int/2addr v0, v2

    .line 73
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 74
    .line 75
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CounterVerification;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
