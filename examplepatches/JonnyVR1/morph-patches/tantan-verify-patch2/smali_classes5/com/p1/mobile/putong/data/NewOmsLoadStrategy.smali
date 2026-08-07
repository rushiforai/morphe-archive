.class public Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;
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
            "Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "newomsloadstrategy"


# instance fields
.field public adUpdateMode:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public hotIntervalSec:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public pullSec:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public pushBoost:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public strategy:Lcom/p1/mobile/putong/data/LoadStrategy;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public timerIntervalSec:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public waitMilSecAfterRequest:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->clone()Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pullSec:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pullSec:J

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->hotIntervalSec:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->hotIntervalSec:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->waitMilSecAfterRequest:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->waitMilSecAfterRequest:J

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pushBoost:Ljava/lang/Boolean;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pushBoost:Ljava/lang/Boolean;

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->timerIntervalSec:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->timerIntervalSec:J

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->adUpdateMode:J

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->adUpdateMode:J

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->clone()Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

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
    check-cast p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pullSec:J

    .line 24
    .line 25
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pullSec:J

    .line 26
    .line 27
    cmp-long v1, v3, v5

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->hotIntervalSec:J

    .line 32
    .line 33
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->hotIntervalSec:J

    .line 34
    .line 35
    cmp-long v1, v3, v5

    .line 36
    .line 37
    if-nez v1, :cond_2

    .line 38
    .line 39
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->waitMilSecAfterRequest:J

    .line 40
    .line 41
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->waitMilSecAfterRequest:J

    .line 42
    .line 43
    cmp-long v1, v3, v5

    .line 44
    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pushBoost:Ljava/lang/Boolean;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pushBoost:Ljava/lang/Boolean;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->timerIntervalSec:J

    .line 58
    .line 59
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->timerIntervalSec:J

    .line 60
    .line 61
    cmp-long v1, v3, v5

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->adUpdateMode:J

    .line 66
    .line 67
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->adUpdateMode:J

    .line 68
    .line 69
    cmp-long p0, v3, p0

    .line 70
    .line 71
    if-nez p0, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "newomsloadstrategy"

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
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pullSec:J

    .line 22
    .line 23
    const/16 v1, 0x20

    .line 24
    .line 25
    ushr-long v5, v3, v1

    .line 26
    .line 27
    xor-long/2addr v3, v5

    .line 28
    long-to-int v3, v3

    .line 29
    add-int/2addr v0, v3

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->hotIntervalSec:J

    .line 33
    .line 34
    ushr-long v5, v3, v1

    .line 35
    .line 36
    xor-long/2addr v3, v5

    .line 37
    long-to-int v3, v3

    .line 38
    add-int/2addr v0, v3

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->waitMilSecAfterRequest:J

    .line 42
    .line 43
    ushr-long v5, v3, v1

    .line 44
    .line 45
    xor-long/2addr v3, v5

    .line 46
    long-to-int v3, v3

    .line 47
    add-int/2addr v0, v3

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pushBoost:Ljava/lang/Boolean;

    .line 51
    .line 52
    if-eqz v3, :cond_1

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/Boolean;->hashCode()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    :cond_1
    add-int/2addr v0, v2

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->timerIntervalSec:J

    .line 62
    .line 63
    ushr-long v4, v2, v1

    .line 64
    .line 65
    xor-long/2addr v2, v4

    .line 66
    long-to-int v2, v2

    .line 67
    add-int/2addr v0, v2

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->adUpdateMode:J

    .line 71
    .line 72
    ushr-long v4, v2, v1

    .line 73
    .line 74
    xor-long v1, v2, v4

    .line 75
    .line 76
    long-to-int v1, v1

    .line 77
    add-int/2addr v0, v1

    .line 78
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 79
    .line 80
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
