.class public Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivegiftmessage"


# instance fields
.field public count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public id:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public type:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->nullCheck()V

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

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->type:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->type:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->count:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->count:I

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->id:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->id:J

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->type:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->type:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->count:I

    .line 30
    .line 31
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->count:I

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->id:J

    .line 36
    .line 37
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->id:J

    .line 38
    .line 39
    cmp-long v1, v3, v5

    .line 40
    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    return v0

    .line 54
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivegiftmessage"

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->type:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v1, v2

    .line 23
    :goto_0
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->count:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->id:J

    .line 32
    .line 33
    const/16 v1, 0x20

    .line 34
    .line 35
    ushr-long v5, v3, v1

    .line 36
    .line 37
    xor-long/2addr v3, v5

    .line 38
    long-to-int v1, v3

    .line 39
    add-int/2addr v0, v1

    .line 40
    mul-int/lit8 v0, v0, 0x29

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    :cond_1
    add-int/2addr v0, v2

    .line 51
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 52
    .line 53
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 33
    .line 34
    :cond_1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return-object p0

    .line 47
    :cond_2
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
