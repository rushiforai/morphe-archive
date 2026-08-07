.class public Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;
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
            "Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "picexchangeeditpopwindowconfig"


# instance fields
.field public randomNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public randomTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public switchFunNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public switchFunTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->clone()Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomTime:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomTime:J

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomNum:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomNum:I

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunTime:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunTime:J

    .line 17
    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunNum:I

    .line 19
    .line 20
    iput p0, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunNum:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->clone()Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomTime:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomTime:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomNum:I

    .line 22
    .line 23
    iget v3, p1, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomNum:I

    .line 24
    .line 25
    if-ne v1, v3, :cond_2

    .line 26
    .line 27
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunTime:J

    .line 28
    .line 29
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunTime:J

    .line 30
    .line 31
    cmp-long v1, v3, v5

    .line 32
    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    iget p0, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunNum:I

    .line 36
    .line 37
    iget p1, p1, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunNum:I

    .line 38
    .line 39
    if-ne p0, p1, :cond_2

    .line 40
    .line 41
    return v0

    .line 42
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "picexchangeeditpopwindowconfig"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 6

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomTime:J

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomNum:I

    .line 19
    .line 20
    add-int/2addr v0, v1

    .line 21
    mul-int/lit8 v0, v0, 0x29

    .line 22
    .line 23
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunTime:J

    .line 24
    .line 25
    ushr-long v3, v1, v3

    .line 26
    .line 27
    xor-long/2addr v1, v3

    .line 28
    long-to-int v1, v1

    .line 29
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunNum:I

    .line 33
    .line 34
    add-int/2addr v0, v1

    .line 35
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 36
    .line 37
    :cond_0
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
