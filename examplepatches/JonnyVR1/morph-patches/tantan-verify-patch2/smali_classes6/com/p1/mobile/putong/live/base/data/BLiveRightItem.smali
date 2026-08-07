.class public Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final ACTION_ACTIVE:Ljava/lang/String; = "activate"

.field public static final ACTION_EQUIP:Ljava/lang/String; = "equip"

.field public static final ACTION_UN_EQUIP:Ljava/lang/String; = "unequip"

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final PERIOD_DECAY:Ljava/lang/String; = "decay"

.field public static final PERIOD_GRAY:Ljava/lang/String; = "grey"

.field public static final PERIOD_VALID:Ljava/lang/String; = "valid"

.field public static final STATUS_ACTIVATED:Ljava/lang/String; = "activated"

.field public static final STATUS_EQUIPPED:Ljava/lang/String; = "equipped"

.field public static final STATUS_NOT_ACQUIRED:Ljava/lang/String; = "notAcquired"

.field public static final TYPE:Ljava/lang/String; = "bliverightitem"


# instance fields
.field public attribute:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public createTimeInSeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public description:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public dynamicUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public fromUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public jumpUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public periodEndTimeInSeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public permanent:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public placeType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public rightId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public rightName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public rightPeriod:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public rightType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public thumbnailUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public todayDisable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public updatedTimeInSeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public userRightId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public canActionRight()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isEquipped()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isActive()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->canActive()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public canActive()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "decay"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightType:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightType:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->permanent:Z

    .line 35
    .line 36
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->permanent:Z

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->periodEndTimeInSeconds:J

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->periodEndTimeInSeconds:J

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 49
    .line 50
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->todayDisable:Z

    .line 51
    .line 52
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->todayDisable:Z

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->createTimeInSeconds:J

    .line 55
    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->createTimeInSeconds:J

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->fromUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 59
    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->fromUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 67
    .line 68
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 77
    .line 78
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->placeType:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->placeType:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->attribute:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 83
    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->attribute:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 91
    .line 92
    :cond_2
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->updatedTimeInSeconds:J

    .line 93
    .line 94
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->updatedTimeInSeconds:J

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 97
    .line 98
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 99
    .line 100
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightType:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->permanent:Z

    .line 84
    .line 85
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->permanent:Z

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->periodEndTimeInSeconds:J

    .line 90
    .line 91
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->periodEndTimeInSeconds:J

    .line 92
    .line 93
    cmp-long v1, v3, v5

    .line 94
    .line 95
    if-nez v1, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->todayDisable:Z

    .line 118
    .line 119
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->todayDisable:Z

    .line 120
    .line 121
    if-ne v1, v3, :cond_2

    .line 122
    .line 123
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->createTimeInSeconds:J

    .line 124
    .line 125
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->createTimeInSeconds:J

    .line 126
    .line 127
    cmp-long v1, v3, v5

    .line 128
    .line 129
    if-nez v1, :cond_2

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->fromUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 132
    .line 133
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->fromUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 134
    .line 135
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_2

    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 142
    .line 143
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 144
    .line 145
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_2

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->placeType:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->placeType:Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->attribute:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 162
    .line 163
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->attribute:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 164
    .line 165
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_2

    .line 170
    .line 171
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->updatedTimeInSeconds:J

    .line 172
    .line 173
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->updatedTimeInSeconds:J

    .line 174
    .line 175
    cmp-long v1, v3, v5

    .line 176
    .line 177
    if-nez v1, :cond_2

    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

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
    const-string p0, "bliverightitem"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDynamicUrl()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbnailUrl()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->permanent:Z

    .line 100
    .line 101
    const/16 v3, 0x4d5

    .line 102
    .line 103
    const/16 v4, 0x4cf

    .line 104
    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    move v1, v4

    .line 108
    goto :goto_7

    .line 109
    :cond_7
    move v1, v3

    .line 110
    :goto_7
    add-int/2addr v0, v1

    .line 111
    mul-int/lit8 v0, v0, 0x29

    .line 112
    .line 113
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->periodEndTimeInSeconds:J

    .line 114
    .line 115
    const/16 v1, 0x20

    .line 116
    .line 117
    ushr-long v7, v5, v1

    .line 118
    .line 119
    xor-long/2addr v5, v7

    .line 120
    long-to-int v5, v5

    .line 121
    add-int/2addr v0, v5

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 125
    .line 126
    if-eqz v5, :cond_8

    .line 127
    .line 128
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    goto :goto_8

    .line 133
    :cond_8
    move v5, v2

    .line 134
    :goto_8
    add-int/2addr v0, v5

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz v5, :cond_9

    .line 140
    .line 141
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    goto :goto_9

    .line 146
    :cond_9
    move v5, v2

    .line 147
    :goto_9
    add-int/2addr v0, v5

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    iget-boolean v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->todayDisable:Z

    .line 151
    .line 152
    if-eqz v5, :cond_a

    .line 153
    .line 154
    move v3, v4

    .line 155
    :cond_a
    add-int/2addr v0, v3

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->createTimeInSeconds:J

    .line 159
    .line 160
    ushr-long v5, v3, v1

    .line 161
    .line 162
    xor-long/2addr v3, v5

    .line 163
    long-to-int v3, v3

    .line 164
    add-int/2addr v0, v3

    .line 165
    mul-int/lit8 v0, v0, 0x29

    .line 166
    .line 167
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->fromUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 168
    .line 169
    if-eqz v3, :cond_b

    .line 170
    .line 171
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;->hashCode()I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    goto :goto_a

    .line 176
    :cond_b
    move v3, v2

    .line 177
    :goto_a
    add-int/2addr v0, v3

    .line 178
    mul-int/lit8 v0, v0, 0x29

    .line 179
    .line 180
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 181
    .line 182
    if-eqz v3, :cond_c

    .line 183
    .line 184
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->hashCode()I

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    goto :goto_b

    .line 189
    :cond_c
    move v3, v2

    .line 190
    :goto_b
    add-int/2addr v0, v3

    .line 191
    mul-int/lit8 v0, v0, 0x29

    .line 192
    .line 193
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->placeType:Ljava/lang/String;

    .line 194
    .line 195
    if-eqz v3, :cond_d

    .line 196
    .line 197
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    goto :goto_c

    .line 202
    :cond_d
    move v3, v2

    .line 203
    :goto_c
    add-int/2addr v0, v3

    .line 204
    mul-int/lit8 v0, v0, 0x29

    .line 205
    .line 206
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->attribute:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 207
    .line 208
    if-eqz v3, :cond_e

    .line 209
    .line 210
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;->hashCode()I

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    goto :goto_d

    .line 215
    :cond_e
    move v3, v2

    .line 216
    :goto_d
    add-int/2addr v0, v3

    .line 217
    mul-int/lit8 v0, v0, 0x29

    .line 218
    .line 219
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->updatedTimeInSeconds:J

    .line 220
    .line 221
    ushr-long v5, v3, v1

    .line 222
    .line 223
    xor-long/2addr v3, v5

    .line 224
    long-to-int v1, v3

    .line 225
    add-int/2addr v0, v1

    .line 226
    mul-int/lit8 v0, v0, 0x29

    .line 227
    .line 228
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 229
    .line 230
    if-eqz v1, :cond_f

    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    :cond_f
    add-int/2addr v0, v2

    .line 237
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 238
    .line 239
    :cond_10
    return v0
.end method

.method public isActive()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "valid"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "activated"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public isEquipped()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "valid"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "equipped"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public isGray()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "grey"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isLocked()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "notAcquired"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightType:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightType:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->thumbnailUrl:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightPeriod:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->jumpUrl:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->fromUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->fromUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightFromUser;

    .line 66
    .line 67
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->placeType:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_a

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->placeType:Ljava/lang/String;

    .line 72
    .line 73
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->attribute:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 74
    .line 75
    if-nez v0, :cond_b

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->attribute:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRightAttribute;

    .line 82
    .line 83
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 84
    .line 85
    if-nez v0, :cond_c

    .line 86
    .line 87
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 88
    .line 89
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
