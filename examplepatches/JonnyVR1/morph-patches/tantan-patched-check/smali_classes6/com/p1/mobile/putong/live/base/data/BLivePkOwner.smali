.class public Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;
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
            "Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivepkowner"


# instance fields
.field public bountyAmount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public contributors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;"
        }
    .end annotation
.end field

.field public imageUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public itemCardList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;",
            ">;"
        }
    .end annotation
.end field

.field public liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public muted:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public pkRankWinTimes:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public point:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public rankAmount:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public rankWinTimesDesc:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public winTimes:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;)Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;)Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePKCardItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->nullCheck()V

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

    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userName:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userName:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->imageUrl:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->imageUrl:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v2, Ll/m42;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/m42;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 40
    .line 41
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winTimes:J

    .line 42
    .line 43
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winTimes:J

    .line 44
    .line 45
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 46
    .line 47
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 58
    .line 59
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 68
    .line 69
    :cond_2
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->muted:Z

    .line 70
    .line 71
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->muted:Z

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 74
    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 82
    .line 83
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->pkRankWinTimes:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->pkRankWinTimes:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->point:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->point:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankAmount:Ljava/lang/String;

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankAmount:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankWinTimesDesc:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankWinTimesDesc:Ljava/lang/String;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 100
    .line 101
    if-eqz p0, :cond_4

    .line 102
    .line 103
    new-instance v1, Ll/n42;

    .line 104
    .line 105
    invoke-direct {v1}, Ll/n42;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 113
    .line 114
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

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userName:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userName:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->imageUrl:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->imageUrl:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winTimes:J

    .line 74
    .line 75
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winTimes:J

    .line 76
    .line 77
    cmp-long v1, v3, v5

    .line 78
    .line 79
    if-nez v1, :cond_2

    .line 80
    .line 81
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 82
    .line 83
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 84
    .line 85
    cmpl-double v1, v3, v5

    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 92
    .line 93
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 102
    .line 103
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_2

    .line 108
    .line 109
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->muted:Z

    .line 110
    .line 111
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->muted:Z

    .line 112
    .line 113
    if-ne v1, v3, :cond_2

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 116
    .line 117
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 118
    .line 119
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->pkRankWinTimes:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->pkRankWinTimes:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->point:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->point:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankAmount:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankAmount:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_2

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankWinTimesDesc:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankWinTimesDesc:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_2

    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 166
    .line 167
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 168
    .line 169
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-eqz p0, :cond_2

    .line 174
    .line 175
    return v0

    .line 176
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivepkowner"

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
    if-nez v0, :cond_f

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userName:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->imageUrl:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winTimes:J

    .line 87
    .line 88
    const/16 v1, 0x20

    .line 89
    .line 90
    ushr-long v5, v3, v1

    .line 91
    .line 92
    xor-long/2addr v3, v5

    .line 93
    long-to-int v3, v3

    .line 94
    add-int/2addr v0, v3

    .line 95
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 96
    .line 97
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 98
    .line 99
    .line 100
    move-result-wide v3

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    ushr-long v5, v3, v1

    .line 104
    .line 105
    xor-long/2addr v3, v5

    .line 106
    long-to-int v1, v3

    .line 107
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 111
    .line 112
    if-eqz v1, :cond_6

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    goto :goto_6

    .line 119
    :cond_6
    move v1, v2

    .line 120
    :goto_6
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 124
    .line 125
    if-eqz v1, :cond_7

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;->hashCode()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    goto :goto_7

    .line 132
    :cond_7
    move v1, v2

    .line 133
    :goto_7
    add-int/2addr v0, v1

    .line 134
    mul-int/lit8 v0, v0, 0x29

    .line 135
    .line 136
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->muted:Z

    .line 137
    .line 138
    if-eqz v1, :cond_8

    .line 139
    .line 140
    const/16 v1, 0x4cf

    .line 141
    .line 142
    goto :goto_8

    .line 143
    :cond_8
    const/16 v1, 0x4d5

    .line 144
    .line 145
    :goto_8
    add-int/2addr v0, v1

    .line 146
    mul-int/lit8 v0, v0, 0x29

    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 149
    .line 150
    if-eqz v1, :cond_9

    .line 151
    .line 152
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;->hashCode()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    goto :goto_9

    .line 157
    :cond_9
    move v1, v2

    .line 158
    :goto_9
    add-int/2addr v0, v1

    .line 159
    mul-int/lit8 v0, v0, 0x29

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->pkRankWinTimes:Ljava/lang/String;

    .line 162
    .line 163
    if-eqz v1, :cond_a

    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    goto :goto_a

    .line 170
    :cond_a
    move v1, v2

    .line 171
    :goto_a
    add-int/2addr v0, v1

    .line 172
    mul-int/lit8 v0, v0, 0x29

    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->point:Ljava/lang/String;

    .line 175
    .line 176
    if-eqz v1, :cond_b

    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    goto :goto_b

    .line 183
    :cond_b
    move v1, v2

    .line 184
    :goto_b
    add-int/2addr v0, v1

    .line 185
    mul-int/lit8 v0, v0, 0x29

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankAmount:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v1, :cond_c

    .line 190
    .line 191
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    goto :goto_c

    .line 196
    :cond_c
    move v1, v2

    .line 197
    :goto_c
    add-int/2addr v0, v1

    .line 198
    mul-int/lit8 v0, v0, 0x29

    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankWinTimesDesc:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz v1, :cond_d

    .line 203
    .line 204
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    goto :goto_d

    .line 209
    :cond_d
    move v1, v2

    .line 210
    :goto_d
    add-int/2addr v0, v1

    .line 211
    mul-int/lit8 v0, v0, 0x29

    .line 212
    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 214
    .line 215
    if-eqz v1, :cond_e

    .line 216
    .line 217
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    :cond_e
    add-int/2addr v0, v2

    .line 222
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 223
    .line 224
    :cond_f
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->roomId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userName:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userName:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->imageUrl:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->imageUrl:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    new-instance v0, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 53
    .line 54
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 55
    .line 56
    if-nez v0, :cond_7

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 63
    .line 64
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 65
    .line 66
    if-nez v0, :cond_8

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 73
    .line 74
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->pkRankWinTimes:Ljava/lang/String;

    .line 75
    .line 76
    if-nez v0, :cond_9

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->pkRankWinTimes:Ljava/lang/String;

    .line 79
    .line 80
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->point:Ljava/lang/String;

    .line 81
    .line 82
    if-nez v0, :cond_a

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->point:Ljava/lang/String;

    .line 85
    .line 86
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankAmount:Ljava/lang/String;

    .line 87
    .line 88
    if-nez v0, :cond_b

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankAmount:Ljava/lang/String;

    .line 91
    .line 92
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankWinTimesDesc:Ljava/lang/String;

    .line 93
    .line 94
    if-nez v0, :cond_c

    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankWinTimesDesc:Ljava/lang/String;

    .line 97
    .line 98
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 99
    .line 100
    if-nez v0, :cond_d

    .line 101
    .line 102
    new-instance v0, Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->itemCardList:Ljava/util/List;

    .line 108
    .line 109
    :cond_d
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
