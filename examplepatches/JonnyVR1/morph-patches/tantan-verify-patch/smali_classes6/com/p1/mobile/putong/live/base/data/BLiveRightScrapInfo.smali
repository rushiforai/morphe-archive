.class public Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliverightscrapinfo"


# instance fields
.field public craftCost:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public itemId:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public jumpUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public remainCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public stockCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->itemId:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->itemId:J

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->stockCount:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->stockCount:J

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->jumpUrl:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->jumpUrl:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->itemId:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->itemId:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 22
    .line 23
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 24
    .line 25
    cmp-long v1, v3, v5

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 32
    .line 33
    cmp-long v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->stockCount:J

    .line 38
    .line 39
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->stockCount:J

    .line 40
    .line 41
    cmp-long v1, v3, v5

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->jumpUrl:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->jumpUrl:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_2

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
    const-string p0, "bliverightscrapinfo"

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
    if-nez v0, :cond_1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->itemId:J

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->remainCount:J

    .line 19
    .line 20
    ushr-long v4, v1, v3

    .line 21
    .line 22
    xor-long/2addr v1, v4

    .line 23
    long-to-int v1, v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->craftCost:J

    .line 28
    .line 29
    ushr-long v4, v1, v3

    .line 30
    .line 31
    xor-long/2addr v1, v4

    .line 32
    long-to-int v1, v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->stockCount:J

    .line 37
    .line 38
    ushr-long v3, v1, v3

    .line 39
    .line 40
    xor-long/2addr v1, v3

    .line 41
    long-to-int v1, v1

    .line 42
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->jumpUrl:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 v1, 0x0

    .line 55
    :goto_0
    add-int/2addr v0, v1

    .line 56
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 57
    .line 58
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->jumpUrl:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->jumpUrl:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
