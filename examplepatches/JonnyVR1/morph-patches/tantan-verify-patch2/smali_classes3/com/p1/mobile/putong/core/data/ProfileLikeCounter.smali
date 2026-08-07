.class public Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;
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
            "Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "profilelikecounter"


# instance fields
.field public canLike:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public hasNew:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public receive:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public sendTo:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->nullCheck()V

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

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->clone()Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->sendTo:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->sendTo:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->receive:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->receive:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->hasNew:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->hasNew:Z

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->canLike:Z

    .line 19
    .line 20
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->canLike:Z

    .line 21
    .line 22
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->clone()Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->sendTo:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->sendTo:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->receive:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->receive:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->hasNew:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->hasNew:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->canLike:Z

    .line 32
    .line 33
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->canLike:Z

    .line 34
    .line 35
    if-ne p0, p1, :cond_2

    .line 36
    .line 37
    return v0

    .line 38
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "profilelikecounter"

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
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->sendTo:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->receive:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->hasNew:Z

    .line 18
    .line 19
    const/16 v2, 0x4d5

    .line 20
    .line 21
    const/16 v3, 0x4cf

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v1, v2

    .line 28
    :goto_0
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->canLike:Z

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    move v2, v3

    .line 36
    :cond_1
    add-int/2addr v0, v2

    .line 37
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 38
    .line 39
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
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileLikeCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
