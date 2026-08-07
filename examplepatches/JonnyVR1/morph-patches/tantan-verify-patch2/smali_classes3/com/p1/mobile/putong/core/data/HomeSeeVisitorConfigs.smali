.class public Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;
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
            "Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "homeseevisitorconfigs"


# instance fields
.field public basicMatchNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public basicSwipeNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public homeShow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public pullSwipeRandMaxNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public showNewDurationSecond:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public showNewTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->clone()Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->homeShow:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->homeShow:Z

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewTimes:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewTimes:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewDurationSecond:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewDurationSecond:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicSwipeNum:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicSwipeNum:I

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicMatchNum:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicMatchNum:I

    .line 25
    .line 26
    iget p0, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->pullSwipeRandMaxNum:I

    .line 27
    .line 28
    iput p0, v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->pullSwipeRandMaxNum:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->clone()Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->homeShow:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->homeShow:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewTimes:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewTimes:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewDurationSecond:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewDurationSecond:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicSwipeNum:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicSwipeNum:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicMatchNum:I

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicMatchNum:I

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget p0, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->pullSwipeRandMaxNum:I

    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->pullSwipeRandMaxNum:I

    .line 46
    .line 47
    if-ne p0, p1, :cond_2

    .line 48
    .line 49
    return v0

    .line 50
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "homeseevisitorconfigs"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->homeShow:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0x4cf

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 v1, 0x4d5

    .line 15
    .line 16
    :goto_0
    add-int/2addr v0, v1

    .line 17
    mul-int/lit8 v0, v0, 0x29

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewTimes:I

    .line 20
    .line 21
    add-int/2addr v0, v1

    .line 22
    mul-int/lit8 v0, v0, 0x29

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->showNewDurationSecond:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x29

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicSwipeNum:I

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->basicMatchNum:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->pullSwipeRandMaxNum:I

    .line 40
    .line 41
    add-int/2addr v0, v1

    .line 42
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 43
    .line 44
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
