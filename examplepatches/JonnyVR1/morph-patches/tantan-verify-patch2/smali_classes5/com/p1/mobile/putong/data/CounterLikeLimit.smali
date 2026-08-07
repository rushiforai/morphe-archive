.class public Lcom/p1/mobile/putong/data/CounterLikeLimit;
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
            "Lcom/p1/mobile/putong/data/CounterLikeLimit;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/CounterLikeLimit;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "counterlikelimit"


# instance fields
.field public count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public remaining:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public reset:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public serverTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public total:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public tribeRemaining:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public tribeTotalCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CounterLikeLimit$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/CounterLikeLimit$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/CounterLikeLimit;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->clone()Lcom/p1/mobile/putong/data/CounterLikeLimit;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/CounterLikeLimit;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->reset:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->reset:I

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->count:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->count:I

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeTotalCount:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeTotalCount:I

    .line 29
    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeRemaining:I

    .line 31
    .line 32
    iput p0, v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeRemaining:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->clone()Lcom/p1/mobile/putong/data/CounterLikeLimit;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;

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
    check-cast p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->reset:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->reset:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 32
    .line 33
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 34
    .line 35
    cmp-long v1, v3, v5

    .line 36
    .line 37
    if-nez v1, :cond_2

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->count:I

    .line 40
    .line 41
    iget v3, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->count:I

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeTotalCount:I

    .line 46
    .line 47
    iget v3, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeTotalCount:I

    .line 48
    .line 49
    if-ne v1, v3, :cond_2

    .line 50
    .line 51
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeRemaining:I

    .line 52
    .line 53
    iget p1, p1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeRemaining:I

    .line 54
    .line 55
    if-ne p0, p1, :cond_2

    .line 56
    .line 57
    return v0

    .line 58
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "counterlikelimit"

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
    if-nez v0, :cond_0

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->remaining:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->reset:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 23
    .line 24
    const/16 v3, 0x20

    .line 25
    .line 26
    ushr-long v3, v1, v3

    .line 27
    .line 28
    xor-long/2addr v1, v3

    .line 29
    long-to-int v1, v1

    .line 30
    add-int/2addr v0, v1

    .line 31
    mul-int/lit8 v0, v0, 0x29

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->count:I

    .line 34
    .line 35
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeTotalCount:I

    .line 39
    .line 40
    add-int/2addr v0, v1

    .line 41
    mul-int/lit8 v0, v0, 0x29

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->tribeRemaining:I

    .line 44
    .line 45
    add-int/2addr v0, v1

    .line 46
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 47
    .line 48
    :cond_0
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public onApiParseComplete()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 8
    .line 9
    return-void
.end method

.method public resetNowMillis()J
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->reset:I

    .line 2
    .line 3
    mul-int/lit16 v0, v0, 0x3e8

    .line 4
    .line 5
    int-to-long v0, v0

    .line 6
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->serverTime:J

    .line 7
    .line 8
    add-long/2addr v0, v2

    .line 9
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    sub-long/2addr v0, v2

    .line 16
    return-wide v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
