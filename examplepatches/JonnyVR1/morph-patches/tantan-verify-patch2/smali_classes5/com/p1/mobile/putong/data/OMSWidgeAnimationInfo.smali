.class public Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;
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
            "Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omswidgeanimationinfo"


# instance fields
.field public constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public duration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public startDelay:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->nullCheck()V

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

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->clone()Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->duration:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->duration:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->startDelay:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->startDelay:I

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->clone()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 27
    .line 28
    :cond_0
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->clone()Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->duration:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->duration:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->startDelay:I

    .line 30
    .line 31
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->startDelay:I

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

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
    const-string p0, "omswidgeanimationinfo"

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
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->duration:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->startDelay:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    :cond_1
    add-int/2addr v0, v2

    .line 40
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 41
    .line 42
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->id:Lcom/p1/mobile/putong/data/OMSWidgeAnimationType;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDisplayRule;->new_()Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
