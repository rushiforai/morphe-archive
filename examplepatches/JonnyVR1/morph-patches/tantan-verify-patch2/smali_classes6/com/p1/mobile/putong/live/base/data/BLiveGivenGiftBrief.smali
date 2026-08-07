.class public Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivegivengiftbrief"


# instance fields
.field public avatarTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation
.end field

.field public briefType:Ljava/lang/String;

.field public canBoomGearPercent:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public canResetGearPercent:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public canShowGearPercent:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public canShowPreviewText:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public canStay:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public comboId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public combos:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public discounts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;",
            ">;"
        }
    .end annotation
.end field

.field public drawParam:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

.field public effectExt:Ljava/lang/String;

.field public enableComboEffect:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public endTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public expiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public expiredTimeText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation
.end field

.field public fpUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public gearPercent:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public gearPercentInfo:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public giftBottomTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation
.end field

.field public giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public giftSource:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public hasVoiceMode:Z

.field public id:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public interactStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public isAnimationWithStarCombo:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public isDailyPaymentExceeded:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public isFirstGivenGift:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public isGear:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public isNamed:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

.field public lotteryGiftId:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation
.end field

.field public luckyPrizeGiftInfoGiftItemId:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public nextGearCnt:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public nextValidTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public num:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public pollFromNetwork:Z

.field public previewText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public previewUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

.field public receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

.field public remain:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public sendGiftBatchOriginalId:Ljava/lang/String;

.field public sendGiftExtraInfo:Ll/ine0;

.field public sendGiftOriginalId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

.field public startTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public step:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public stickFacePositionType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public tag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public threshold:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public tradeNo:Ljava/lang/String;

.field public tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public videoChatId:Ljava/lang/String;

.field public videoEffectExtras:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftBatchOriginalId:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;)Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;)Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nullCheck()V

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

    .line 237
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 45
    .line 46
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextValidTime:J

    .line 47
    .line 48
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextValidTime:J

    .line 49
    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 51
    .line 52
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSource:I

    .line 55
    .line 56
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSource:I

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 63
    .line 64
    if-eqz v1, :cond_0

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 71
    .line 72
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 73
    .line 74
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 81
    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    new-instance v2, Ll/h12;

    .line 85
    .line 86
    invoke-direct {v2}, Ll/h12;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 94
    .line 95
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 96
    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 104
    .line 105
    :cond_2
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 106
    .line 107
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 108
    .line 109
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 110
    .line 111
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 114
    .line 115
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 116
    .line 117
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercent:F

    .line 118
    .line 119
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercent:F

    .line 120
    .line 121
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowGearPercent:Z

    .line 122
    .line 123
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowGearPercent:Z

    .line 124
    .line 125
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 126
    .line 127
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 128
    .line 129
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 130
    .line 131
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 132
    .line 133
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canBoomGearPercent:Z

    .line 134
    .line 135
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canBoomGearPercent:Z

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 138
    .line 139
    if-eqz v1, :cond_3

    .line 140
    .line 141
    new-instance v2, Ll/i12;

    .line 142
    .line 143
    invoke-direct {v2}, Ll/i12;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 151
    .line 152
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAnimationWithStarCombo:Z

    .line 153
    .line 154
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAnimationWithStarCombo:Z

    .line 155
    .line 156
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canResetGearPercent:Z

    .line 157
    .line 158
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canResetGearPercent:Z

    .line 159
    .line 160
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextGearCnt:I

    .line 161
    .line 162
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextGearCnt:I

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 165
    .line 166
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 169
    .line 170
    if-eqz v1, :cond_4

    .line 171
    .line 172
    new-instance v2, Ll/j12;

    .line 173
    .line 174
    invoke-direct {v2}, Ll/j12;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 182
    .line 183
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 184
    .line 185
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 188
    .line 189
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 190
    .line 191
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canStay:Z

    .line 192
    .line 193
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canStay:Z

    .line 194
    .line 195
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isDailyPaymentExceeded:Z

    .line 196
    .line 197
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isDailyPaymentExceeded:Z

    .line 198
    .line 199
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 200
    .line 201
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 204
    .line 205
    if-eqz v1, :cond_5

    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 212
    .line 213
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 214
    .line 215
    if-eqz v1, :cond_6

    .line 216
    .line 217
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 222
    .line 223
    :cond_6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 224
    .line 225
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 228
    .line 229
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 230
    .line 231
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 232
    .line 233
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 234
    .line 235
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 236
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 56
    .line 57
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 62
    .line 63
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 68
    .line 69
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 70
    .line 71
    if-ne v1, v3, :cond_2

    .line 72
    .line 73
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 74
    .line 75
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 76
    .line 77
    cmp-long v1, v3, v5

    .line 78
    .line 79
    if-nez v1, :cond_2

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 82
    .line 83
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 84
    .line 85
    if-ne v1, v3, :cond_2

    .line 86
    .line 87
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextValidTime:J

    .line 88
    .line 89
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextValidTime:J

    .line 90
    .line 91
    cmp-long v1, v3, v5

    .line 92
    .line 93
    if-nez v1, :cond_2

    .line 94
    .line 95
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 96
    .line 97
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 98
    .line 99
    if-ne v1, v3, :cond_2

    .line 100
    .line 101
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSource:I

    .line 102
    .line 103
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSource:I

    .line 104
    .line 105
    if-ne v1, v3, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 120
    .line 121
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_2

    .line 126
    .line 127
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 128
    .line 129
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 130
    .line 131
    if-ne v1, v3, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 146
    .line 147
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 156
    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_2

    .line 162
    .line 163
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 164
    .line 165
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 166
    .line 167
    if-ne v1, v3, :cond_2

    .line 168
    .line 169
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 170
    .line 171
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 172
    .line 173
    if-ne v1, v3, :cond_2

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 176
    .line 177
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_2

    .line 184
    .line 185
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercent:F

    .line 186
    .line 187
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercent:F

    .line 188
    .line 189
    cmpl-float v1, v1, v3

    .line 190
    .line 191
    if-nez v1, :cond_2

    .line 192
    .line 193
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowGearPercent:Z

    .line 194
    .line 195
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowGearPercent:Z

    .line 196
    .line 197
    if-ne v1, v3, :cond_2

    .line 198
    .line 199
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 200
    .line 201
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 202
    .line 203
    cmp-long v1, v3, v5

    .line 204
    .line 205
    if-nez v1, :cond_2

    .line 206
    .line 207
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 208
    .line 209
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 210
    .line 211
    cmp-long v1, v3, v5

    .line 212
    .line 213
    if-nez v1, :cond_2

    .line 214
    .line 215
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canBoomGearPercent:Z

    .line 216
    .line 217
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canBoomGearPercent:Z

    .line 218
    .line 219
    if-ne v1, v3, :cond_2

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 222
    .line 223
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 224
    .line 225
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    if-eqz v1, :cond_2

    .line 230
    .line 231
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAnimationWithStarCombo:Z

    .line 232
    .line 233
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAnimationWithStarCombo:Z

    .line 234
    .line 235
    if-ne v1, v3, :cond_2

    .line 236
    .line 237
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canResetGearPercent:Z

    .line 238
    .line 239
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canResetGearPercent:Z

    .line 240
    .line 241
    if-ne v1, v3, :cond_2

    .line 242
    .line 243
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextGearCnt:I

    .line 244
    .line 245
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextGearCnt:I

    .line 246
    .line 247
    if-ne v1, v3, :cond_2

    .line 248
    .line 249
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 250
    .line 251
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 252
    .line 253
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-eqz v1, :cond_2

    .line 258
    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 260
    .line 261
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 262
    .line 263
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-eqz v1, :cond_2

    .line 268
    .line 269
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 270
    .line 271
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 272
    .line 273
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    if-eqz v1, :cond_2

    .line 278
    .line 279
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 280
    .line 281
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 282
    .line 283
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    if-eqz v1, :cond_2

    .line 288
    .line 289
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canStay:Z

    .line 290
    .line 291
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canStay:Z

    .line 292
    .line 293
    if-ne v1, v3, :cond_2

    .line 294
    .line 295
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isDailyPaymentExceeded:Z

    .line 296
    .line 297
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isDailyPaymentExceeded:Z

    .line 298
    .line 299
    if-ne v1, v3, :cond_2

    .line 300
    .line 301
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 302
    .line 303
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 304
    .line 305
    if-ne v1, v3, :cond_2

    .line 306
    .line 307
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 308
    .line 309
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 310
    .line 311
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    if-eqz v1, :cond_2

    .line 316
    .line 317
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 318
    .line 319
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 320
    .line 321
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    if-eqz v1, :cond_2

    .line 326
    .line 327
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 328
    .line 329
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 330
    .line 331
    if-ne v1, v3, :cond_2

    .line 332
    .line 333
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 334
    .line 335
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 336
    .line 337
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    if-eqz v1, :cond_2

    .line 342
    .line 343
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 344
    .line 345
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 346
    .line 347
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result p0

    .line 351
    if-eqz p0, :cond_2

    .line 352
    .line 353
    return v0

    .line 354
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivegivengiftbrief"

    .line 2
    .line 3
    return-object p0
.end method

.method public getClickAction(Z)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->longPress:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 6
    .line 7
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->action:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->click:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 11
    .line 12
    goto :goto_0
.end method

.method public getSendGiftExtraInfo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ine0;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hasActionRule()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->hasSingleClickRule()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->hasLongClickRule()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public hasLongClickRule()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->getClickAction(Z)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    xor-int/2addr p0, v0

    .line 11
    return p0
.end method

.method public hasSingleClickRule()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->getClickAction(Z)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    xor-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    return p0
.end method

.method public hashCode()I
    .locals 10

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_1d

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v1, v2

    .line 28
    :goto_0
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v1, v2

    .line 41
    :goto_1
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move v1, v2

    .line 54
    :goto_2
    add-int/2addr v0, v1

    .line 55
    mul-int/lit8 v0, v0, 0x29

    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 58
    .line 59
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 63
    .line 64
    add-int/2addr v0, v1

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 68
    .line 69
    add-int/2addr v0, v1

    .line 70
    mul-int/lit8 v0, v0, 0x29

    .line 71
    .line 72
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 73
    .line 74
    const/16 v1, 0x20

    .line 75
    .line 76
    ushr-long v5, v3, v1

    .line 77
    .line 78
    xor-long/2addr v3, v5

    .line 79
    long-to-int v3, v3

    .line 80
    add-int/2addr v0, v3

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isFirstGivenGift:Z

    .line 84
    .line 85
    const/16 v4, 0x4d5

    .line 86
    .line 87
    const/16 v5, 0x4cf

    .line 88
    .line 89
    if-eqz v3, :cond_3

    .line 90
    .line 91
    move v3, v5

    .line 92
    goto :goto_3

    .line 93
    :cond_3
    move v3, v4

    .line 94
    :goto_3
    add-int/2addr v0, v3

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextValidTime:J

    .line 98
    .line 99
    ushr-long v8, v6, v1

    .line 100
    .line 101
    xor-long/2addr v6, v8

    .line 102
    long-to-int v3, v6

    .line 103
    add-int/2addr v0, v3

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 107
    .line 108
    add-int/2addr v0, v3

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSource:I

    .line 112
    .line 113
    add-int/2addr v0, v3

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz v3, :cond_4

    .line 119
    .line 120
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    goto :goto_4

    .line 125
    :cond_4
    move v3, v2

    .line 126
    :goto_4
    add-int/2addr v0, v3

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 130
    .line 131
    if-eqz v3, :cond_5

    .line 132
    .line 133
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->hashCode()I

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    goto :goto_5

    .line 138
    :cond_5
    move v3, v2

    .line 139
    :goto_5
    add-int/2addr v0, v3

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 143
    .line 144
    if-eqz v3, :cond_6

    .line 145
    .line 146
    move v3, v5

    .line 147
    goto :goto_6

    .line 148
    :cond_6
    move v3, v4

    .line 149
    :goto_6
    add-int/2addr v0, v3

    .line 150
    mul-int/lit8 v0, v0, 0x29

    .line 151
    .line 152
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 153
    .line 154
    if-eqz v3, :cond_7

    .line 155
    .line 156
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    goto :goto_7

    .line 161
    :cond_7
    move v3, v2

    .line 162
    :goto_7
    add-int/2addr v0, v3

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 166
    .line 167
    if-eqz v3, :cond_8

    .line 168
    .line 169
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    goto :goto_8

    .line 174
    :cond_8
    move v3, v2

    .line 175
    :goto_8
    add-int/2addr v0, v3

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 179
    .line 180
    if-eqz v3, :cond_9

    .line 181
    .line 182
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->hashCode()I

    .line 183
    .line 184
    .line 185
    move-result v3

    .line 186
    goto :goto_9

    .line 187
    :cond_9
    move v3, v2

    .line 188
    :goto_9
    add-int/2addr v0, v3

    .line 189
    mul-int/lit8 v0, v0, 0x29

    .line 190
    .line 191
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 192
    .line 193
    if-eqz v3, :cond_a

    .line 194
    .line 195
    move v3, v5

    .line 196
    goto :goto_a

    .line 197
    :cond_a
    move v3, v4

    .line 198
    :goto_a
    add-int/2addr v0, v3

    .line 199
    mul-int/lit8 v0, v0, 0x29

    .line 200
    .line 201
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowPreviewText:Z

    .line 202
    .line 203
    if-eqz v3, :cond_b

    .line 204
    .line 205
    move v3, v5

    .line 206
    goto :goto_b

    .line 207
    :cond_b
    move v3, v4

    .line 208
    :goto_b
    add-int/2addr v0, v3

    .line 209
    mul-int/lit8 v0, v0, 0x29

    .line 210
    .line 211
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 212
    .line 213
    if-eqz v3, :cond_c

    .line 214
    .line 215
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    goto :goto_c

    .line 220
    :cond_c
    move v3, v2

    .line 221
    :goto_c
    add-int/2addr v0, v3

    .line 222
    mul-int/lit8 v0, v0, 0x29

    .line 223
    .line 224
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercent:F

    .line 225
    .line 226
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    add-int/2addr v0, v3

    .line 231
    mul-int/lit8 v0, v0, 0x29

    .line 232
    .line 233
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canShowGearPercent:Z

    .line 234
    .line 235
    if-eqz v3, :cond_d

    .line 236
    .line 237
    move v3, v5

    .line 238
    goto :goto_d

    .line 239
    :cond_d
    move v3, v4

    .line 240
    :goto_d
    add-int/2addr v0, v3

    .line 241
    mul-int/lit8 v0, v0, 0x29

    .line 242
    .line 243
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 244
    .line 245
    ushr-long v8, v6, v1

    .line 246
    .line 247
    xor-long/2addr v6, v8

    .line 248
    long-to-int v3, v6

    .line 249
    add-int/2addr v0, v3

    .line 250
    mul-int/lit8 v0, v0, 0x29

    .line 251
    .line 252
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 253
    .line 254
    ushr-long v8, v6, v1

    .line 255
    .line 256
    xor-long/2addr v6, v8

    .line 257
    long-to-int v1, v6

    .line 258
    add-int/2addr v0, v1

    .line 259
    mul-int/lit8 v0, v0, 0x29

    .line 260
    .line 261
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canBoomGearPercent:Z

    .line 262
    .line 263
    if-eqz v1, :cond_e

    .line 264
    .line 265
    move v1, v5

    .line 266
    goto :goto_e

    .line 267
    :cond_e
    move v1, v4

    .line 268
    :goto_e
    add-int/2addr v0, v1

    .line 269
    mul-int/lit8 v0, v0, 0x29

    .line 270
    .line 271
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 272
    .line 273
    if-eqz v1, :cond_f

    .line 274
    .line 275
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    goto :goto_f

    .line 280
    :cond_f
    move v1, v2

    .line 281
    :goto_f
    add-int/2addr v0, v1

    .line 282
    mul-int/lit8 v0, v0, 0x29

    .line 283
    .line 284
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isAnimationWithStarCombo:Z

    .line 285
    .line 286
    if-eqz v1, :cond_10

    .line 287
    .line 288
    move v1, v5

    .line 289
    goto :goto_10

    .line 290
    :cond_10
    move v1, v4

    .line 291
    :goto_10
    add-int/2addr v0, v1

    .line 292
    mul-int/lit8 v0, v0, 0x29

    .line 293
    .line 294
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canResetGearPercent:Z

    .line 295
    .line 296
    if-eqz v1, :cond_11

    .line 297
    .line 298
    move v1, v5

    .line 299
    goto :goto_11

    .line 300
    :cond_11
    move v1, v4

    .line 301
    :goto_11
    add-int/2addr v0, v1

    .line 302
    mul-int/lit8 v0, v0, 0x29

    .line 303
    .line 304
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->nextGearCnt:I

    .line 305
    .line 306
    add-int/2addr v0, v1

    .line 307
    mul-int/lit8 v0, v0, 0x29

    .line 308
    .line 309
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 310
    .line 311
    if-eqz v1, :cond_12

    .line 312
    .line 313
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 314
    .line 315
    .line 316
    move-result v1

    .line 317
    goto :goto_12

    .line 318
    :cond_12
    move v1, v2

    .line 319
    :goto_12
    add-int/2addr v0, v1

    .line 320
    mul-int/lit8 v0, v0, 0x29

    .line 321
    .line 322
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 323
    .line 324
    if-eqz v1, :cond_13

    .line 325
    .line 326
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    goto :goto_13

    .line 331
    :cond_13
    move v1, v2

    .line 332
    :goto_13
    add-int/2addr v0, v1

    .line 333
    mul-int/lit8 v0, v0, 0x29

    .line 334
    .line 335
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 336
    .line 337
    if-eqz v1, :cond_14

    .line 338
    .line 339
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 340
    .line 341
    .line 342
    move-result v1

    .line 343
    goto :goto_14

    .line 344
    :cond_14
    move v1, v2

    .line 345
    :goto_14
    add-int/2addr v0, v1

    .line 346
    mul-int/lit8 v0, v0, 0x29

    .line 347
    .line 348
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 349
    .line 350
    if-eqz v1, :cond_15

    .line 351
    .line 352
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 353
    .line 354
    .line 355
    move-result v1

    .line 356
    goto :goto_15

    .line 357
    :cond_15
    move v1, v2

    .line 358
    :goto_15
    add-int/2addr v0, v1

    .line 359
    mul-int/lit8 v0, v0, 0x29

    .line 360
    .line 361
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->canStay:Z

    .line 362
    .line 363
    if-eqz v1, :cond_16

    .line 364
    .line 365
    move v1, v5

    .line 366
    goto :goto_16

    .line 367
    :cond_16
    move v1, v4

    .line 368
    :goto_16
    add-int/2addr v0, v1

    .line 369
    mul-int/lit8 v0, v0, 0x29

    .line 370
    .line 371
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isDailyPaymentExceeded:Z

    .line 372
    .line 373
    if-eqz v1, :cond_17

    .line 374
    .line 375
    move v1, v5

    .line 376
    goto :goto_17

    .line 377
    :cond_17
    move v1, v4

    .line 378
    :goto_17
    add-int/2addr v0, v1

    .line 379
    mul-int/lit8 v0, v0, 0x29

    .line 380
    .line 381
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 382
    .line 383
    if-eqz v1, :cond_18

    .line 384
    .line 385
    move v4, v5

    .line 386
    :cond_18
    add-int/2addr v0, v4

    .line 387
    mul-int/lit8 v0, v0, 0x29

    .line 388
    .line 389
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 390
    .line 391
    if-eqz v1, :cond_19

    .line 392
    .line 393
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->hashCode()I

    .line 394
    .line 395
    .line 396
    move-result v1

    .line 397
    goto :goto_18

    .line 398
    :cond_19
    move v1, v2

    .line 399
    :goto_18
    add-int/2addr v0, v1

    .line 400
    mul-int/lit8 v0, v0, 0x29

    .line 401
    .line 402
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 403
    .line 404
    if-eqz v1, :cond_1a

    .line 405
    .line 406
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->hashCode()I

    .line 407
    .line 408
    .line 409
    move-result v1

    .line 410
    goto :goto_19

    .line 411
    :cond_1a
    move v1, v2

    .line 412
    :goto_19
    add-int/2addr v0, v1

    .line 413
    mul-int/lit8 v0, v0, 0x29

    .line 414
    .line 415
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 416
    .line 417
    add-int/2addr v0, v1

    .line 418
    mul-int/lit8 v0, v0, 0x29

    .line 419
    .line 420
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 421
    .line 422
    if-eqz v1, :cond_1b

    .line 423
    .line 424
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 425
    .line 426
    .line 427
    move-result v1

    .line 428
    goto :goto_1a

    .line 429
    :cond_1b
    move v1, v2

    .line 430
    :goto_1a
    add-int/2addr v0, v1

    .line 431
    mul-int/lit8 v0, v0, 0x29

    .line 432
    .line 433
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 434
    .line 435
    if-eqz v1, :cond_1c

    .line 436
    .line 437
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 438
    .line 439
    .line 440
    move-result v2

    .line 441
    :cond_1c
    add-int/2addr v0, v2

    .line 442
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 443
    .line 444
    :cond_1d
    return v0
.end method

.method public isAuctionBrief()Z
    .locals 1

    .line 1
    const-string v0, "extra_type_voice_auction"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isAudienceBrief()Z
    .locals 1

    .line 1
    const-string v0, "extra_type_audience"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isEnterRoomBrief()Z
    .locals 1

    .line 1
    const-string v0, "extra_type_enter_room"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isGiftBrief()Z
    .locals 1

    .line 1
    const-string v0, "extra_type_normal"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isGuildCall()Z
    .locals 2

    .line 1
    const-string v0, "extra_type_guild_live"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public isLianMaiBrief()Z
    .locals 1

    .line 1
    const-string v0, "extra_type_lian_mai"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isMultiCall()Z
    .locals 2

    .line 1
    const-string v0, "extra_type_multi_call"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public isSendGiftFromBatch()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftBatchOriginalId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 53
    .line 54
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 55
    .line 56
    if-nez v0, :cond_7

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewText:Ljava/lang/String;

    .line 59
    .line 60
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 61
    .line 62
    if-nez v0, :cond_8

    .line 63
    .line 64
    new-instance v0, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->gearPercentInfo:Ljava/util/List;

    .line 70
    .line 71
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 72
    .line 73
    if-nez v0, :cond_9

    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 76
    .line 77
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 78
    .line 79
    if-nez v0, :cond_a

    .line 80
    .line 81
    new-instance v0, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->discounts:Ljava/util/List;

    .line 87
    .line 88
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 89
    .line 90
    if-nez v0, :cond_b

    .line 91
    .line 92
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 93
    .line 94
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 95
    .line 96
    if-nez v0, :cond_c

    .line 97
    .line 98
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 99
    .line 100
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 101
    .line 102
    if-nez v0, :cond_d

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 109
    .line 110
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 111
    .line 112
    if-nez v0, :cond_e

    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 115
    .line 116
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 117
    .line 118
    if-nez v0, :cond_f

    .line 119
    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 121
    .line 122
    :cond_f
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
