.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoiceauctionleaderboard"


# instance fields
.field public amount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public auctionId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public isFromLongLink:Z

.field public rank:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public user:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public voiceLiveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public voiceRoomId:Ljava/lang/String;
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->nullCheck()V

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

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->rank:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->rank:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->amount:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->amount:J

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 29
    .line 30
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->rank:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->rank:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->amount:J

    .line 42
    .line 43
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->amount:J

    .line 44
    .line 45
    cmp-long v1, v3, v5

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

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
    const-string p0, "blivevoiceauctionleaderboard"

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserImageUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->user:Ll/nsv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nsv;->g()Ll/pyl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/l6o0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->isFromLongLink:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->user:Ll/nsv;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nsv;->g()Ll/pyl;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/l6o0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    return-object p0
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->rank:J

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v1, v2

    .line 29
    :goto_0
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move v1, v2

    .line 42
    :goto_1
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->amount:J

    .line 46
    .line 47
    ushr-long v6, v4, v3

    .line 48
    .line 49
    xor-long v3, v4, v6

    .line 50
    .line 51
    long-to-int v1, v3

    .line 52
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_2

    .line 64
    :cond_2
    move v1, v2

    .line 65
    :goto_2
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    :cond_3
    add-int/2addr v0, v2

    .line 77
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 78
    .line 79
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->auctionId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->userId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceRoomId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->voiceLiveId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionLeaderboard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
