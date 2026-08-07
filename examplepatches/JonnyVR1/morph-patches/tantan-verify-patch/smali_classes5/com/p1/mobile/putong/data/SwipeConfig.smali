.class public Lcom/p1/mobile/putong/data/SwipeConfig;
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
            "Lcom/p1/mobile/putong/data/SwipeConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/SwipeConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "swipeconfig"


# instance fields
.field public femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public maleRule:Lcom/p1/mobile/putong/data/MaleRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public swipeStimulationOn:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public timestamp:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SwipeConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SwipeConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/SwipeConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/SwipeConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SwipeConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/SwipeConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/SwipeConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SwipeConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/SwipeConfig;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SwipeConfig;->clone()Lcom/p1/mobile/putong/data/SwipeConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/SwipeConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SwipeConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->swipeStimulationOn:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->swipeStimulationOn:Z

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->timestamp:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->timestamp:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FemaleRule;->clone()Lcom/p1/mobile/putong/data/FemaleRule;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/MaleRule;->clone()Lcom/p1/mobile/putong/data/MaleRule;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 33
    .line 34
    :cond_1
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SwipeConfig;->clone()Lcom/p1/mobile/putong/data/SwipeConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/SwipeConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/data/SwipeConfig;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->swipeStimulationOn:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/SwipeConfig;->swipeStimulationOn:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->timestamp:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/data/SwipeConfig;->timestamp:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 28
    .line 29
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 38
    .line 39
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    return v0

    .line 46
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "swipeconfig"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->swipeStimulationOn:Z

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
    iget v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->timestamp:I

    .line 20
    .line 21
    add-int/2addr v0, v1

    .line 22
    mul-int/lit8 v0, v0, 0x29

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FemaleRule;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MaleRule;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    :cond_2
    add-int/2addr v0, v2

    .line 47
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 48
    .line 49
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/FemaleRule;->new_()Lcom/p1/mobile/putong/data/FemaleRule;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->femaleRule:Lcom/p1/mobile/putong/data/FemaleRule;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/MaleRule;->new_()Lcom/p1/mobile/putong/data/MaleRule;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SwipeConfig;->maleRule:Lcom/p1/mobile/putong/data/MaleRule;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/SwipeConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
