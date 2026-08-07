.class public Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;
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
            "Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "swiperatelimitconfig"


# instance fields
.field public anchorGrade:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public countPerSecond:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public dimaond:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public enable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public locaInterval:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public svip:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public vip:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->clone()Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->enable:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->enable:Z

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->countPerSecond:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->countPerSecond:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->vip:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->vip:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->svip:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->svip:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->dimaond:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->dimaond:Z

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->anchorGrade:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->anchorGrade:I

    .line 29
    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->locaInterval:I

    .line 31
    .line 32
    iput p0, v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->locaInterval:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->clone()Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->enable:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->enable:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->countPerSecond:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->countPerSecond:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->vip:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->vip:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->svip:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->svip:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->dimaond:Z

    .line 38
    .line 39
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->dimaond:Z

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->anchorGrade:I

    .line 44
    .line 45
    iget v3, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->anchorGrade:I

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->locaInterval:I

    .line 50
    .line 51
    iget p1, p1, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->locaInterval:I

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
    const-string p0, "swiperatelimitconfig"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 4

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->enable:Z

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->countPerSecond:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->vip:Z

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    move v1, v3

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v1, v2

    .line 33
    :goto_1
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->svip:Z

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    move v1, v3

    .line 41
    goto :goto_2

    .line 42
    :cond_2
    move v1, v2

    .line 43
    :goto_2
    add-int/2addr v0, v1

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->dimaond:Z

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    move v2, v3

    .line 51
    :cond_3
    add-int/2addr v0, v2

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->anchorGrade:I

    .line 55
    .line 56
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->locaInterval:I

    .line 60
    .line 61
    add-int/2addr v0, v1

    .line 62
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 63
    .line 64
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeRateLimitConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
