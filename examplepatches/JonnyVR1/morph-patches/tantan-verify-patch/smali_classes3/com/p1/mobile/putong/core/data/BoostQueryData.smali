.class public Lcom/p1/mobile/putong/core/data/BoostQueryData;
.super Lcom/tantanapp/common/data/BaseData;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/BoostQueryData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/BoostQueryData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "boostquerydata"


# instance fields
.field public allCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public likeCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/BoostQueryData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/BoostQueryData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/BoostQueryData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/BoostQueryData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/BaseData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/BoostQueryData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/BoostQueryData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/BoostQueryData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/BoostQueryData;->nullCheck()V

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

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BoostQueryData;->clone()Lcom/p1/mobile/putong/core/data/BoostQueryData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/BoostQueryData;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/BoostQueryData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/BoostQueryData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->allCount:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->allCount:I

    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->likeCount:I

    .line 11
    .line 12
    iput p0, v0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->likeCount:I

    .line 13
    .line 14
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BoostQueryData;->clone()Lcom/p1/mobile/putong/core/data/BoostQueryData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/BoostQueryData;

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
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/data/BoostQueryData;

    .line 13
    .line 14
    if-eq p0, p1, :cond_2

    .line 15
    .line 16
    return v2

    .line 17
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->allCount:I

    .line 18
    .line 19
    iget v3, v1, Lcom/p1/mobile/putong/core/data/BoostQueryData;->allCount:I

    .line 20
    .line 21
    if-ne p1, v3, :cond_3

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->likeCount:I

    .line 24
    .line 25
    iget p1, v1, Lcom/p1/mobile/putong/core/data/BoostQueryData;->likeCount:I

    .line 26
    .line 27
    if-ne p0, p1, :cond_3

    .line 28
    .line 29
    return v0

    .line 30
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "boostquerydata"

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
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->allCount:I

    .line 12
    .line 13
    add-int/2addr v0, v1

    .line 14
    mul-int/lit8 v0, v0, 0x29

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->likeCount:I

    .line 17
    .line 18
    add-int/2addr v0, v1

    .line 19
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 20
    .line 21
    :cond_0
    return v0
.end method

.method public nullCheck()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/BoostQueryData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
