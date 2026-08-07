.class public Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveauctionleader"


# instance fields
.field public amount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public amountBackgroundId:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public background:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public rank:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->nullCheck()V

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

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->rank:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->rank:I

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amount:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amount:J

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->background:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->background:Ljava/lang/String;

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amountBackgroundId:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amountBackgroundId:I

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 31
    .line 32
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

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->rank:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->rank:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amount:J

    .line 20
    .line 21
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amount:J

    .line 22
    .line 23
    cmp-long v1, v3, v5

    .line 24
    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->background:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->background:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amountBackgroundId:I

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amountBackgroundId:I

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

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
    const-string p0, "bliveauctionleader"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->rank:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amount:J

    .line 13
    .line 14
    const/16 v3, 0x20

    .line 15
    .line 16
    ushr-long v3, v1, v3

    .line 17
    .line 18
    xor-long/2addr v1, v3

    .line 19
    long-to-int v1, v1

    .line 20
    add-int/2addr v0, v1

    .line 21
    mul-int/lit8 v0, v0, 0x29

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->background:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v1, v2

    .line 34
    :goto_0
    add-int/2addr v0, v1

    .line 35
    mul-int/lit8 v0, v0, 0x29

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->amountBackgroundId:I

    .line 38
    .line 39
    add-int/2addr v0, v1

    .line 40
    mul-int/lit8 v0, v0, 0x29

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->hashCode()I

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->background:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->background:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeader;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
