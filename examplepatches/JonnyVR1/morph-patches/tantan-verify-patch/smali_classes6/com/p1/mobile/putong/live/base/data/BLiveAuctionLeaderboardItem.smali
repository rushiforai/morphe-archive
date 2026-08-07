.class public Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveauctionleaderboarditem"


# instance fields
.field public auctionTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public level:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public rank:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public worth:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->nullCheck()V

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

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->level:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->level:I

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->auctionTime:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->auctionTime:J

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->worth:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->worth:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 43
    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 51
    .line 52
    :cond_2
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->level:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->level:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->auctionTime:J

    .line 26
    .line 27
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->auctionTime:J

    .line 28
    .line 29
    cmp-long v1, v3, v5

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->worth:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->worth:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 62
    .line 63
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_2

    .line 68
    .line 69
    return v0

    .line 70
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveauctionleaderboarditem"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->level:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->auctionTime:J

    .line 18
    .line 19
    const/16 v3, 0x20

    .line 20
    .line 21
    ushr-long v3, v1, v3

    .line 22
    .line 23
    xor-long/2addr v1, v3

    .line 24
    long-to-int v1, v1

    .line 25
    add-int/2addr v0, v1

    .line 26
    mul-int/lit8 v0, v0, 0x29

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->worth:I

    .line 29
    .line 30
    add-int/2addr v0, v1

    .line 31
    mul-int/lit8 v0, v0, 0x29

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move v1, v2

    .line 44
    :goto_0
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move v1, v2

    .line 57
    :goto_1
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 61
    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    :cond_2
    add-int/2addr v0, v2

    .line 69
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 70
    .line 71
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
