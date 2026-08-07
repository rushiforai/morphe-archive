.class public Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivedailytasks"


# instance fields
.field public advancedTasks:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTasks;",
            ">;"
        }
    .end annotation
.end field

.field public campaignEndTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public campaignStartTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public cheerGiftImageUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public ownCheerGiftCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public receivedTurboCouponCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public taskDate:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public tasks:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTasks;",
            ">;"
        }
    .end annotation
.end field

.field public totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public totalTaskCount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public turboCouponGiftId:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public turboCouponGiftImageUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public turboCouponGiftName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public userAvatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveTasks;)Lcom/p1/mobile/putong/live/base/data/BLiveTasks;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTasks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveTasks;)Lcom/p1/mobile/putong/live/base/data/BLiveTasks;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTasks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->nullCheck()V

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

    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignStartTime:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignStartTime:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignEndTime:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignEndTime:J

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->taskDate:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->taskDate:J

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftId:J

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftId:J

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->receivedTurboCouponCount:J

    .line 55
    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->receivedTurboCouponCount:J

    .line 57
    .line 58
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->ownCheerGiftCount:J

    .line 59
    .line 60
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->ownCheerGiftCount:J

    .line 61
    .line 62
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCount:J

    .line 63
    .line 64
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCount:J

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 67
    .line 68
    if-eqz v1, :cond_0

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 75
    .line 76
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 77
    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    new-instance v2, Ll/ct1;

    .line 81
    .line 82
    invoke-direct {v2}, Ll/ct1;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 90
    .line 91
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 92
    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    new-instance v2, Ll/dt1;

    .line 96
    .line 97
    invoke-direct {v2}, Ll/dt1;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 105
    .line 106
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 107
    .line 108
    if-eqz p0, :cond_3

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 115
    .line 116
    :cond_3
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignStartTime:J

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignStartTime:J

    .line 36
    .line 37
    cmp-long v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignEndTime:J

    .line 42
    .line 43
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignEndTime:J

    .line 44
    .line 45
    cmp-long v1, v3, v5

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->taskDate:J

    .line 50
    .line 51
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->taskDate:J

    .line 52
    .line 53
    cmp-long v1, v3, v5

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftId:J

    .line 88
    .line 89
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftId:J

    .line 90
    .line 91
    cmp-long v1, v3, v5

    .line 92
    .line 93
    if-nez v1, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->receivedTurboCouponCount:J

    .line 126
    .line 127
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->receivedTurboCouponCount:J

    .line 128
    .line 129
    cmp-long v1, v3, v5

    .line 130
    .line 131
    if-nez v1, :cond_2

    .line 132
    .line 133
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->ownCheerGiftCount:J

    .line 134
    .line 135
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->ownCheerGiftCount:J

    .line 136
    .line 137
    cmp-long v1, v3, v5

    .line 138
    .line 139
    if-nez v1, :cond_2

    .line 140
    .line 141
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCount:J

    .line 142
    .line 143
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCount:J

    .line 144
    .line 145
    cmp-long v1, v3, v5

    .line 146
    .line 147
    if-nez v1, :cond_2

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 160
    .line 161
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 182
    .line 183
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_2

    .line 188
    .line 189
    return v0

    .line 190
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivedailytasks"

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
    if-nez v0, :cond_c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignStartTime:J

    .line 35
    .line 36
    const/16 v1, 0x20

    .line 37
    .line 38
    ushr-long v5, v3, v1

    .line 39
    .line 40
    xor-long/2addr v3, v5

    .line 41
    long-to-int v3, v3

    .line 42
    add-int/2addr v0, v3

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->campaignEndTime:J

    .line 46
    .line 47
    ushr-long v5, v3, v1

    .line 48
    .line 49
    xor-long/2addr v3, v5

    .line 50
    long-to-int v3, v3

    .line 51
    add-int/2addr v0, v3

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->taskDate:J

    .line 55
    .line 56
    ushr-long v5, v3, v1

    .line 57
    .line 58
    xor-long/2addr v3, v5

    .line 59
    long-to-int v3, v3

    .line 60
    add-int/2addr v0, v3

    .line 61
    mul-int/lit8 v0, v0, 0x29

    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz v3, :cond_2

    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    goto :goto_2

    .line 72
    :cond_2
    move v3, v2

    .line 73
    :goto_2
    add-int/2addr v0, v3

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v3, :cond_3

    .line 79
    .line 80
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    goto :goto_3

    .line 85
    :cond_3
    move v3, v2

    .line 86
    :goto_3
    add-int/2addr v0, v3

    .line 87
    mul-int/lit8 v0, v0, 0x29

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v3, :cond_4

    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    goto :goto_4

    .line 98
    :cond_4
    move v3, v2

    .line 99
    :goto_4
    add-int/2addr v0, v3

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftId:J

    .line 103
    .line 104
    ushr-long v5, v3, v1

    .line 105
    .line 106
    xor-long/2addr v3, v5

    .line 107
    long-to-int v3, v3

    .line 108
    add-int/2addr v0, v3

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 112
    .line 113
    if-eqz v3, :cond_5

    .line 114
    .line 115
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    goto :goto_5

    .line 120
    :cond_5
    move v3, v2

    .line 121
    :goto_5
    add-int/2addr v0, v3

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 125
    .line 126
    if-eqz v3, :cond_6

    .line 127
    .line 128
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    goto :goto_6

    .line 133
    :cond_6
    move v3, v2

    .line 134
    :goto_6
    add-int/2addr v0, v3

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz v3, :cond_7

    .line 140
    .line 141
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    goto :goto_7

    .line 146
    :cond_7
    move v3, v2

    .line 147
    :goto_7
    add-int/2addr v0, v3

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->receivedTurboCouponCount:J

    .line 151
    .line 152
    ushr-long v5, v3, v1

    .line 153
    .line 154
    xor-long/2addr v3, v5

    .line 155
    long-to-int v3, v3

    .line 156
    add-int/2addr v0, v3

    .line 157
    mul-int/lit8 v0, v0, 0x29

    .line 158
    .line 159
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->ownCheerGiftCount:J

    .line 160
    .line 161
    ushr-long v5, v3, v1

    .line 162
    .line 163
    xor-long/2addr v3, v5

    .line 164
    long-to-int v3, v3

    .line 165
    add-int/2addr v0, v3

    .line 166
    mul-int/lit8 v0, v0, 0x29

    .line 167
    .line 168
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCount:J

    .line 169
    .line 170
    ushr-long v5, v3, v1

    .line 171
    .line 172
    xor-long/2addr v3, v5

    .line 173
    long-to-int v1, v3

    .line 174
    add-int/2addr v0, v1

    .line 175
    mul-int/lit8 v0, v0, 0x29

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 178
    .line 179
    if-eqz v1, :cond_8

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    goto :goto_8

    .line 186
    :cond_8
    move v1, v2

    .line 187
    :goto_8
    add-int/2addr v0, v1

    .line 188
    mul-int/lit8 v0, v0, 0x29

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 191
    .line 192
    if-eqz v1, :cond_9

    .line 193
    .line 194
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    goto :goto_9

    .line 199
    :cond_9
    move v1, v2

    .line 200
    :goto_9
    add-int/2addr v0, v1

    .line 201
    mul-int/lit8 v0, v0, 0x29

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 204
    .line 205
    if-eqz v1, :cond_a

    .line 206
    .line 207
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    goto :goto_a

    .line 212
    :cond_a
    move v1, v2

    .line 213
    :goto_a
    add-int/2addr v0, v1

    .line 214
    mul-int/lit8 v0, v0, 0x29

    .line 215
    .line 216
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 217
    .line 218
    if-eqz v1, :cond_b

    .line 219
    .line 220
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;->hashCode()I

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    :cond_b
    add-int/2addr v0, v2

    .line 225
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 226
    .line 227
    :cond_c
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->type:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userName:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->userAvatar:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftName:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->turboCouponGiftImageUrl:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->cheerGiftImageUrl:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->totalTaskCompleteReward:Lcom/p1/mobile/putong/live/base/data/BLiveTotalTaskCompleteReward;

    .line 60
    .line 61
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 62
    .line 63
    if-nez v0, :cond_9

    .line 64
    .line 65
    new-instance v0, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->tasks:Ljava/util/List;

    .line 71
    .line 72
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 73
    .line 74
    if-nez v0, :cond_a

    .line 75
    .line 76
    new-instance v0, Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->advancedTasks:Ljava/util/List;

    .line 82
    .line 83
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 84
    .line 85
    if-nez v0, :cond_b

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->noticePopup:Lcom/p1/mobile/putong/live/base/data/BLiveNoticePopup;

    .line 92
    .line 93
    :cond_b
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
