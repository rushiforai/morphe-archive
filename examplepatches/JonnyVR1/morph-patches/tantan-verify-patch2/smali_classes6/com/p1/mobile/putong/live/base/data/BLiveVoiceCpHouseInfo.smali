.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoicecphouseinfo"


# instance fields
.field public cpId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public cpLuxuryValue:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public cpUserAvatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public giftId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public houseBackground:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public houseId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public houseImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public houseLuxuryValue:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public houseName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public houseRank:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public houseUnlockLuxuryValue:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public isUnLock:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public luxuryGap:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public meUserAvatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public medalId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public medalImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public otherUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public otherUserName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public profileEffect:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public rank:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->nullCheck()V

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

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseUnlockLuxuryValue:D

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseUnlockLuxuryValue:D

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalId:Ljava/lang/String;

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseRank:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseRank:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseName:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseName:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->giftId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->giftId:Ljava/lang/String;

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalImage:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalImage:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseBackground:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseBackground:Ljava/lang/String;

    .line 41
    .line 42
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpLuxuryValue:D

    .line 43
    .line 44
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpLuxuryValue:D

    .line 45
    .line 46
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseLuxuryValue:D

    .line 47
    .line 48
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseLuxuryValue:D

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpId:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpId:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userName:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userName:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserName:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserName:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->luxuryGap:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->luxuryGap:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->rank:I

    .line 87
    .line 88
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->rank:I

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 93
    .line 94
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseUnlockLuxuryValue:D

    .line 24
    .line 25
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseUnlockLuxuryValue:D

    .line 26
    .line 27
    cmpl-double v1, v3, v5

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalId:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseRank:I

    .line 42
    .line 43
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseRank:I

    .line 44
    .line 45
    if-ne v1, v3, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseName:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseName:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->giftId:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->giftId:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 68
    .line 69
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 70
    .line 71
    if-ne v1, v3, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalImage:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalImage:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseBackground:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseBackground:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpLuxuryValue:D

    .line 94
    .line 95
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpLuxuryValue:D

    .line 96
    .line 97
    cmpl-double v1, v3, v5

    .line 98
    .line 99
    if-nez v1, :cond_2

    .line 100
    .line 101
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseLuxuryValue:D

    .line 102
    .line 103
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseLuxuryValue:D

    .line 104
    .line 105
    cmpl-double v1, v3, v5

    .line 106
    .line 107
    if-nez v1, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpId:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpId:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_2

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_2

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userName:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userName:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_2

    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserName:Ljava/lang/String;

    .line 160
    .line 161
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserName:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_2

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->luxuryGap:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->luxuryGap:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_2

    .line 178
    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 180
    .line 181
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_2

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 192
    .line 193
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_2

    .line 198
    .line 199
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->rank:I

    .line 200
    .line 201
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->rank:I

    .line 202
    .line 203
    if-ne v1, v3, :cond_2

    .line 204
    .line 205
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    if-eqz p0, :cond_2

    .line 214
    .line 215
    return v0

    .line 216
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoicecphouseinfo"

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
    if-nez v0, :cond_11

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseUnlockLuxuryValue:D

    .line 20
    .line 21
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    const/16 v1, 0x20

    .line 28
    .line 29
    ushr-long v5, v3, v1

    .line 30
    .line 31
    xor-long/2addr v3, v5

    .line 32
    long-to-int v3, v3

    .line 33
    add-int/2addr v0, v3

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalId:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v3, v2

    .line 46
    :goto_1
    add-int/2addr v0, v3

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseRank:I

    .line 50
    .line 51
    add-int/2addr v0, v3

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseName:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    move v3, v2

    .line 64
    :goto_2
    add-int/2addr v0, v3

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->giftId:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz v3, :cond_3

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    move v3, v2

    .line 77
    :goto_3
    add-int/2addr v0, v3

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->isUnLock:Z

    .line 81
    .line 82
    if-eqz v3, :cond_4

    .line 83
    .line 84
    const/16 v3, 0x4cf

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_4
    const/16 v3, 0x4d5

    .line 88
    .line 89
    :goto_4
    add-int/2addr v0, v3

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalImage:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz v3, :cond_5

    .line 95
    .line 96
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    goto :goto_5

    .line 101
    :cond_5
    move v3, v2

    .line 102
    :goto_5
    add-int/2addr v0, v3

    .line 103
    mul-int/lit8 v0, v0, 0x29

    .line 104
    .line 105
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseBackground:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz v3, :cond_6

    .line 108
    .line 109
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    goto :goto_6

    .line 114
    :cond_6
    move v3, v2

    .line 115
    :goto_6
    add-int/2addr v0, v3

    .line 116
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpLuxuryValue:D

    .line 117
    .line 118
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 119
    .line 120
    .line 121
    move-result-wide v3

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    ushr-long v5, v3, v1

    .line 125
    .line 126
    xor-long/2addr v3, v5

    .line 127
    long-to-int v3, v3

    .line 128
    add-int/2addr v0, v3

    .line 129
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseLuxuryValue:D

    .line 130
    .line 131
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 132
    .line 133
    .line 134
    move-result-wide v3

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    ushr-long v5, v3, v1

    .line 138
    .line 139
    xor-long/2addr v3, v5

    .line 140
    long-to-int v1, v3

    .line 141
    add-int/2addr v0, v1

    .line 142
    mul-int/lit8 v0, v0, 0x29

    .line 143
    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 145
    .line 146
    if-eqz v1, :cond_7

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    goto :goto_7

    .line 153
    :cond_7
    move v1, v2

    .line 154
    :goto_7
    add-int/2addr v0, v1

    .line 155
    mul-int/lit8 v0, v0, 0x29

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpId:Ljava/lang/String;

    .line 158
    .line 159
    if-eqz v1, :cond_8

    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    goto :goto_8

    .line 166
    :cond_8
    move v1, v2

    .line 167
    :goto_8
    add-int/2addr v0, v1

    .line 168
    mul-int/lit8 v0, v0, 0x29

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 171
    .line 172
    if-eqz v1, :cond_9

    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    goto :goto_9

    .line 179
    :cond_9
    move v1, v2

    .line 180
    :goto_9
    add-int/2addr v0, v1

    .line 181
    mul-int/lit8 v0, v0, 0x29

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz v1, :cond_a

    .line 186
    .line 187
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    goto :goto_a

    .line 192
    :cond_a
    move v1, v2

    .line 193
    :goto_a
    add-int/2addr v0, v1

    .line 194
    mul-int/lit8 v0, v0, 0x29

    .line 195
    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userName:Ljava/lang/String;

    .line 197
    .line 198
    if-eqz v1, :cond_b

    .line 199
    .line 200
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    goto :goto_b

    .line 205
    :cond_b
    move v1, v2

    .line 206
    :goto_b
    add-int/2addr v0, v1

    .line 207
    mul-int/lit8 v0, v0, 0x29

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserName:Ljava/lang/String;

    .line 210
    .line 211
    if-eqz v1, :cond_c

    .line 212
    .line 213
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    goto :goto_c

    .line 218
    :cond_c
    move v1, v2

    .line 219
    :goto_c
    add-int/2addr v0, v1

    .line 220
    mul-int/lit8 v0, v0, 0x29

    .line 221
    .line 222
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->luxuryGap:Ljava/lang/String;

    .line 223
    .line 224
    if-eqz v1, :cond_d

    .line 225
    .line 226
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    goto :goto_d

    .line 231
    :cond_d
    move v1, v2

    .line 232
    :goto_d
    add-int/2addr v0, v1

    .line 233
    mul-int/lit8 v0, v0, 0x29

    .line 234
    .line 235
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 236
    .line 237
    if-eqz v1, :cond_e

    .line 238
    .line 239
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    goto :goto_e

    .line 244
    :cond_e
    move v1, v2

    .line 245
    :goto_e
    add-int/2addr v0, v1

    .line 246
    mul-int/lit8 v0, v0, 0x29

    .line 247
    .line 248
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 249
    .line 250
    if-eqz v1, :cond_f

    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    goto :goto_f

    .line 257
    :cond_f
    move v1, v2

    .line 258
    :goto_f
    add-int/2addr v0, v1

    .line 259
    mul-int/lit8 v0, v0, 0x29

    .line 260
    .line 261
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->rank:I

    .line 262
    .line 263
    add-int/2addr v0, v1

    .line 264
    mul-int/lit8 v0, v0, 0x29

    .line 265
    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 267
    .line 268
    if-eqz v1, :cond_10

    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    :cond_10
    add-int/2addr v0, v2

    .line 275
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 276
    .line 277
    :cond_11
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseName:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseName:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->giftId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->giftId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalImage:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->medalImage:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseBackground:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseBackground:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 62
    .line 63
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userName:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_a

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userName:Ljava/lang/String;

    .line 68
    .line 69
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserName:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserName:Ljava/lang/String;

    .line 74
    .line 75
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->luxuryGap:Ljava/lang/String;

    .line 76
    .line 77
    if-nez v0, :cond_c

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->luxuryGap:Ljava/lang/String;

    .line 80
    .line 81
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 82
    .line 83
    if-nez v0, :cond_d

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 88
    .line 89
    if-nez v0, :cond_e

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 92
    .line 93
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v0, :cond_f

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 98
    .line 99
    :cond_f
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
