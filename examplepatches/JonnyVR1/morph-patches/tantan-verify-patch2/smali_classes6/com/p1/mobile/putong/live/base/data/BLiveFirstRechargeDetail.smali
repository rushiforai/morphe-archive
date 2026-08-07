.class public Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivefirstrechargedetail"


# instance fields
.field public bonus:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBonus;",
            ">;"
        }
    .end annotation
.end field

.field public bonusEndTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public bonusStartTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public checkoutBanner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public currentTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public decorateCheckout:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public emphasizeCheckout:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public guideNotice:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public hasAdditionalCheckout:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public hasGainedBonus:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public isActive:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public showDialogBonus:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public showGuideNotice:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public trialGiftId:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveBonus;)Lcom/p1/mobile/putong/live/base/data/BLiveBonus;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->nullCheck()V

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

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showGuideNotice:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showGuideNotice:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->guideNotice:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->guideNotice:Ljava/lang/String;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasAdditionalCheckout:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasAdditionalCheckout:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->emphasizeCheckout:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->emphasizeCheckout:Z

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->decorateCheckout:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->decorateCheckout:Z

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->checkoutBanner:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->checkoutBanner:Ljava/lang/String;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->trialGiftId:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->trialGiftId:I

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->isActive:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->isActive:Z

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasGainedBonus:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasGainedBonus:Z

    .line 45
    .line 46
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->currentTime:J

    .line 47
    .line 48
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->currentTime:J

    .line 49
    .line 50
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusStartTime:J

    .line 51
    .line 52
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusStartTime:J

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusEndTime:J

    .line 55
    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusEndTime:J

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 59
    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    new-instance v1, Ll/d02;

    .line 63
    .line 64
    invoke-direct {v1}, Ll/d02;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 72
    .line 73
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

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showGuideNotice:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showGuideNotice:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->guideNotice:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->guideNotice:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasAdditionalCheckout:Z

    .line 36
    .line 37
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasAdditionalCheckout:Z

    .line 38
    .line 39
    if-ne v1, v3, :cond_2

    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->emphasizeCheckout:Z

    .line 42
    .line 43
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->emphasizeCheckout:Z

    .line 44
    .line 45
    if-ne v1, v3, :cond_2

    .line 46
    .line 47
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->decorateCheckout:Z

    .line 48
    .line 49
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->decorateCheckout:Z

    .line 50
    .line 51
    if-ne v1, v3, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->checkoutBanner:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->checkoutBanner:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->trialGiftId:I

    .line 64
    .line 65
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->trialGiftId:I

    .line 66
    .line 67
    if-ne v1, v3, :cond_2

    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->isActive:Z

    .line 70
    .line 71
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->isActive:Z

    .line 72
    .line 73
    if-ne v1, v3, :cond_2

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasGainedBonus:Z

    .line 76
    .line 77
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasGainedBonus:Z

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->currentTime:J

    .line 82
    .line 83
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->currentTime:J

    .line 84
    .line 85
    cmp-long v1, v3, v5

    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusStartTime:J

    .line 90
    .line 91
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusStartTime:J

    .line 92
    .line 93
    cmp-long v1, v3, v5

    .line 94
    .line 95
    if-nez v1, :cond_2

    .line 96
    .line 97
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusEndTime:J

    .line 98
    .line 99
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusEndTime:J

    .line 100
    .line 101
    cmp-long v1, v3, v5

    .line 102
    .line 103
    if-nez v1, :cond_2

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_2

    .line 114
    .line 115
    return v0

    .line 116
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivefirstrechargedetail"

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 8
    .line 9
    const/16 v2, 0x4d5

    .line 10
    .line 11
    const/16 v3, 0x4cf

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move v1, v3

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showGuideNotice:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v1, v2

    .line 28
    :goto_1
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->guideNotice:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    goto :goto_2

    .line 41
    :cond_2
    move v1, v4

    .line 42
    :goto_2
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasAdditionalCheckout:Z

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    move v1, v3

    .line 50
    goto :goto_3

    .line 51
    :cond_3
    move v1, v2

    .line 52
    :goto_3
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->emphasizeCheckout:Z

    .line 56
    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    move v1, v3

    .line 60
    goto :goto_4

    .line 61
    :cond_4
    move v1, v2

    .line 62
    :goto_4
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->decorateCheckout:Z

    .line 66
    .line 67
    if-eqz v1, :cond_5

    .line 68
    .line 69
    move v1, v3

    .line 70
    goto :goto_5

    .line 71
    :cond_5
    move v1, v2

    .line 72
    :goto_5
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->checkoutBanner:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz v1, :cond_6

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    goto :goto_6

    .line 84
    :cond_6
    move v1, v4

    .line 85
    :goto_6
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->trialGiftId:I

    .line 89
    .line 90
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->isActive:Z

    .line 94
    .line 95
    if-eqz v1, :cond_7

    .line 96
    .line 97
    move v1, v3

    .line 98
    goto :goto_7

    .line 99
    :cond_7
    move v1, v2

    .line 100
    :goto_7
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasGainedBonus:Z

    .line 104
    .line 105
    if-eqz v1, :cond_8

    .line 106
    .line 107
    move v2, v3

    .line 108
    :cond_8
    add-int/2addr v0, v2

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->currentTime:J

    .line 112
    .line 113
    const/16 v3, 0x20

    .line 114
    .line 115
    ushr-long v5, v1, v3

    .line 116
    .line 117
    xor-long/2addr v1, v5

    .line 118
    long-to-int v1, v1

    .line 119
    add-int/2addr v0, v1

    .line 120
    mul-int/lit8 v0, v0, 0x29

    .line 121
    .line 122
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusStartTime:J

    .line 123
    .line 124
    ushr-long v5, v1, v3

    .line 125
    .line 126
    xor-long/2addr v1, v5

    .line 127
    long-to-int v1, v1

    .line 128
    add-int/2addr v0, v1

    .line 129
    mul-int/lit8 v0, v0, 0x29

    .line 130
    .line 131
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonusEndTime:J

    .line 132
    .line 133
    ushr-long v5, v1, v3

    .line 134
    .line 135
    xor-long/2addr v1, v5

    .line 136
    long-to-int v1, v1

    .line 137
    add-int/2addr v0, v1

    .line 138
    mul-int/lit8 v0, v0, 0x29

    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 141
    .line 142
    if-eqz v1, :cond_9

    .line 143
    .line 144
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    :cond_9
    add-int/2addr v0, v4

    .line 149
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 150
    .line 151
    :cond_a
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->guideNotice:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->guideNotice:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->checkoutBanner:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->checkoutBanner:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
