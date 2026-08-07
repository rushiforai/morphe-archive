.class public Lcom/p1/mobile/putong/data/SliderData;
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
            "Lcom/p1/mobile/putong/data/SliderData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/SliderData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "sliderdata"


# instance fields
.field public allowClose:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public delayClose:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public retryClose:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public supplier:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public uuid:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SliderData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SliderData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/SliderData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/SliderData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SliderData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/SliderData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/SliderData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SliderData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SliderData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/SliderData;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static parse(Ljava/lang/String;Lcom/p1/mobile/putong/data/SliderData;)Lcom/p1/mobile/putong/data/SliderData;
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/data/SliderData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/SliderData;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SliderData;->clone()Lcom/p1/mobile/putong/data/SliderData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/SliderData;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SliderData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SliderData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->supplier:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->supplier:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->allowClose:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->allowClose:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->retryClose:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->retryClose:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->delayClose:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/data/SliderData;->delayClose:I

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 25
    .line 26
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SliderData;->clone()Lcom/p1/mobile/putong/data/SliderData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/SliderData;

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
    check-cast p1, Lcom/p1/mobile/putong/data/SliderData;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->supplier:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/SliderData;->supplier:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->allowClose:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/data/SliderData;->allowClose:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->retryClose:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/data/SliderData;->retryClose:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->delayClose:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/data/SliderData;->delayClose:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    return v0

    .line 48
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "sliderdata"

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
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->supplier:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->allowClose:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->retryClose:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/data/SliderData;->delayClose:I

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    :goto_0
    add-int/2addr v0, v1

    .line 38
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 39
    .line 40
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SliderData;->uuid:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/SliderData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
