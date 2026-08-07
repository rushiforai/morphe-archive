.class public Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveguardanchorrankinfo"


# instance fields
.field public cherishGuardNums:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public currentRank:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public gapGuardScore:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public guardScore:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public heartbeatGuardNums:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public topScoreRewardInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;",
            ">;"
        }
    .end annotation
.end field

.field public topScoreRewardInfosOpen:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;)Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveKnightsPrivilegeItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->nullCheck()V

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

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->currentRank:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->currentRank:J

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->guardScore:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->guardScore:J

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->gapGuardScore:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->gapGuardScore:J

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/k12;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/k12;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->cherishGuardNums:J

    .line 34
    .line 35
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->cherishGuardNums:J

    .line 36
    .line 37
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->heartbeatGuardNums:J

    .line 38
    .line 39
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->heartbeatGuardNums:J

    .line 40
    .line 41
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfosOpen:Z

    .line 42
    .line 43
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfosOpen:Z

    .line 44
    .line 45
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->currentRank:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->currentRank:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->guardScore:J

    .line 22
    .line 23
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->guardScore:J

    .line 24
    .line 25
    cmp-long v1, v3, v5

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->gapGuardScore:J

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->gapGuardScore:J

    .line 32
    .line 33
    cmp-long v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->cherishGuardNums:J

    .line 48
    .line 49
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->cherishGuardNums:J

    .line 50
    .line 51
    cmp-long v1, v3, v5

    .line 52
    .line 53
    if-nez v1, :cond_2

    .line 54
    .line 55
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->heartbeatGuardNums:J

    .line 56
    .line 57
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->heartbeatGuardNums:J

    .line 58
    .line 59
    cmp-long v1, v3, v5

    .line 60
    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfosOpen:Z

    .line 64
    .line 65
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfosOpen:Z

    .line 66
    .line 67
    if-ne p0, p1, :cond_2

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
    const-string p0, "bliveguardanchorrankinfo"

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
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->currentRank:J

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->guardScore:J

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->gapGuardScore:J

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v1, 0x0

    .line 46
    :goto_0
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->cherishGuardNums:J

    .line 50
    .line 51
    ushr-long v4, v1, v3

    .line 52
    .line 53
    xor-long/2addr v1, v4

    .line 54
    long-to-int v1, v1

    .line 55
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->heartbeatGuardNums:J

    .line 59
    .line 60
    ushr-long v3, v1, v3

    .line 61
    .line 62
    xor-long/2addr v1, v3

    .line 63
    long-to-int v1, v1

    .line 64
    add-int/2addr v0, v1

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfosOpen:Z

    .line 68
    .line 69
    if-eqz v1, :cond_1

    .line 70
    .line 71
    const/16 v1, 0x4cf

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    const/16 v1, 0x4d5

    .line 75
    .line 76
    :goto_1
    add-int/2addr v0, v1

    .line 77
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 78
    .line 79
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->topScoreRewardInfos:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
