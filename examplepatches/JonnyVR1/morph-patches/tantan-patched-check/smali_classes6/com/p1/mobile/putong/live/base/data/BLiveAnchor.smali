.class public Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveanchor"


# instance fields
.field public availableTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isPking:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public reward:Lcom/p1/mobile/putong/live/base/data/BLiveReward;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->nullCheck()V

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

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->availableTime:D

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->availableTime:D

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->type:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->type:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveReward;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 41
    .line 42
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 51
    .line 52
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 61
    .line 62
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 63
    .line 64
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 71
    .line 72
    if-eqz p0, :cond_4

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 79
    .line 80
    :cond_4
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->availableTime:D

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->availableTime:D

    .line 36
    .line 37
    cmpl-double v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->type:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->type:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 54
    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 92
    .line 93
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 110
    .line 111
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_2

    .line 116
    .line 117
    return v0

    .line 118
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveanchor"

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
    if-nez v0, :cond_a

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->availableTime:D

    .line 33
    .line 34
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    const/16 v1, 0x20

    .line 41
    .line 42
    ushr-long v5, v3, v1

    .line 43
    .line 44
    xor-long/2addr v3, v5

    .line 45
    long-to-int v1, v3

    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->type:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move v1, v2

    .line 59
    :goto_2
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_3

    .line 71
    :cond_3
    move v1, v2

    .line 72
    :goto_3
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 76
    .line 77
    if-eqz v1, :cond_4

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveReward;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    goto :goto_4

    .line 84
    :cond_4
    move v1, v2

    .line 85
    :goto_4
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 89
    .line 90
    if-eqz v1, :cond_5

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    goto :goto_5

    .line 97
    :cond_5
    move v1, v2

    .line 98
    :goto_5
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 102
    .line 103
    if-eqz v1, :cond_6

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    goto :goto_6

    .line 110
    :cond_6
    move v1, v2

    .line 111
    :goto_6
    add-int/2addr v0, v1

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 115
    .line 116
    if-eqz v1, :cond_7

    .line 117
    .line 118
    const/16 v1, 0x4cf

    .line 119
    .line 120
    goto :goto_7

    .line 121
    :cond_7
    const/16 v1, 0x4d5

    .line 122
    .line 123
    :goto_7
    add-int/2addr v0, v1

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    goto :goto_8

    .line 135
    :cond_8
    move v1, v2

    .line 136
    :goto_8
    add-int/2addr v0, v1

    .line 137
    mul-int/lit8 v0, v0, 0x29

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 140
    .line 141
    if-eqz v1, :cond_9

    .line 142
    .line 143
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->hashCode()I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    :cond_9
    add-int/2addr v0, v2

    .line 148
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 149
    .line 150
    :cond_a
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->type:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->type:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveData:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorData;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveReward;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->reward:Lcom/p1/mobile/putong/live/base/data/BLiveReward;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 58
    .line 59
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 60
    .line 61
    if-nez v0, :cond_6

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 68
    .line 69
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 70
    .line 71
    if-nez v0, :cond_7

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->pkRecommendSource:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 82
    .line 83
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 84
    .line 85
    if-nez v0, :cond_8

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 92
    .line 93
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
