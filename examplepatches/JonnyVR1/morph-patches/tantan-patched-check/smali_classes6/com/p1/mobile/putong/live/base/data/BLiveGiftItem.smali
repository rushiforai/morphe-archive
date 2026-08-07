.class public Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivegiftitem"

.field public static final TYPE_ROTATION:Ljava/lang/String; = "rotation"


# instance fields
.field public animationType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field

.field public combosDuration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public createdTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public discounts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;",
            ">;"
        }
    .end annotation
.end field

.field public dynamicUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x31
    .end annotation
.end field

.field public endRightTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public endTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public expiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public expiredTimeText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public fastGiftNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2d
    .end annotation
.end field

.field public generationDuration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public giftLevel:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public giftSource:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public giftType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public hdUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation
.end field

.field public hidePrice:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2f
    .end annotation
.end field

.field public id:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public interactStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public labels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public liveResourceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public localName:Lcom/p1/mobile/putong/data/LangModel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public localRightTag:Lcom/p1/mobile/putong/data/LangModel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public localSubtitle:Lcom/p1/mobile/putong/data/LangModel;

.field public localTag:Lcom/p1/mobile/putong/data/LangModel;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public longPressGotoHeight:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public longPressGotoLocation:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public longPressGotoUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public longPressGotoWidth:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public longPressText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public luckyPrizeGiftInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;",
            ">;"
        }
    .end annotation
.end field

.field public minWealthHierarchy:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public mobileVibration:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x30
    .end annotation
.end field

.field public needToPlayAnim:Z

.field public nextValidTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public position:I

.field public purchasePrice:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public remain:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public rightTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x32
    .end annotation
.end field

.field public rightTagTextColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public sendGiftExtraInfo:Ll/ine0;

.field public showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation
.end field

.field public showOutside:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation
.end field

.field public startRightTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public startTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public subtitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public tag:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public tagTextColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public title:Ljava/lang/String;

.field public trayDuration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public unitPrice:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public version:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public videoType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->needToPlayAnim:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;)Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;
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

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->remain:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearEffectInfo;->liveResourceId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLuckyGiftInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nullCheck()V

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

    .line 325
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->clone()Lcom/p1/mobile/putong/data/LangModel;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 31
    .line 32
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 33
    .line 34
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 35
    .line 36
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 37
    .line 38
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->clone()Lcom/p1/mobile/putong/data/LangModel;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 57
    .line 58
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 59
    .line 60
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 61
    .line 62
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 63
    .line 64
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 65
    .line 66
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 67
    .line 68
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 69
    .line 70
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->version:J

    .line 71
    .line 72
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->version:J

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 85
    .line 86
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 87
    .line 88
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 89
    .line 90
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 91
    .line 92
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 93
    .line 94
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 95
    .line 96
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 97
    .line 98
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 99
    .line 100
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 101
    .line 102
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 103
    .line 104
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 105
    .line 106
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 107
    .line 108
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 109
    .line 110
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 111
    .line 112
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 113
    .line 114
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->generationDuration:J

    .line 115
    .line 116
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->generationDuration:J

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 119
    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 123
    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 125
    .line 126
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 127
    .line 128
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 131
    .line 132
    if-eqz v1, :cond_2

    .line 133
    .line 134
    new-instance v2, Ll/r02;

    .line 135
    .line 136
    invoke-direct {v2}, Ll/r02;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 144
    .line 145
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoLocation:I

    .line 146
    .line 147
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoLocation:I

    .line 148
    .line 149
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoHeight:D

    .line 150
    .line 151
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoHeight:D

    .line 152
    .line 153
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoWidth:D

    .line 154
    .line 155
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoWidth:D

    .line 156
    .line 157
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 158
    .line 159
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 162
    .line 163
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 166
    .line 167
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 170
    .line 171
    if-eqz v1, :cond_3

    .line 172
    .line 173
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 178
    .line 179
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 180
    .line 181
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 184
    .line 185
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 188
    .line 189
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 192
    .line 193
    if-eqz v1, :cond_4

    .line 194
    .line 195
    new-instance v2, Ll/s02;

    .line 196
    .line 197
    invoke-direct {v2}, Ll/s02;-><init>()V

    .line 198
    .line 199
    .line 200
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 205
    .line 206
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 207
    .line 208
    if-eqz v1, :cond_5

    .line 209
    .line 210
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 215
    .line 216
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 217
    .line 218
    if-eqz v1, :cond_6

    .line 219
    .line 220
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 225
    .line 226
    :cond_6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->videoType:I

    .line 227
    .line 228
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->videoType:I

    .line 229
    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 231
    .line 232
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 235
    .line 236
    if-eqz v1, :cond_7

    .line 237
    .line 238
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 243
    .line 244
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 245
    .line 246
    if-eqz v1, :cond_8

    .line 247
    .line 248
    new-instance v2, Ll/t02;

    .line 249
    .line 250
    invoke-direct {v2}, Ll/t02;-><init>()V

    .line 251
    .line 252
    .line 253
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 258
    .line 259
    :cond_8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 260
    .line 261
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 262
    .line 263
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 264
    .line 265
    if-eqz v1, :cond_9

    .line 266
    .line 267
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 272
    .line 273
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 274
    .line 275
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 276
    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 278
    .line 279
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 282
    .line 283
    if-eqz v1, :cond_a

    .line 284
    .line 285
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->clone()Lcom/p1/mobile/putong/data/LangModel;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 290
    .line 291
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 292
    .line 293
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 294
    .line 295
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 296
    .line 297
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 298
    .line 299
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 300
    .line 301
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 302
    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 304
    .line 305
    if-eqz v1, :cond_b

    .line 306
    .line 307
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 312
    .line 313
    :cond_b
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 314
    .line 315
    if-eqz p0, :cond_c

    .line 316
    .line 317
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 322
    .line 323
    :cond_c
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 324
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 60
    .line 61
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 62
    .line 63
    cmpl-double v1, v3, v5

    .line 64
    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 68
    .line 69
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 70
    .line 71
    cmp-long v1, v3, v5

    .line 72
    .line 73
    if-nez v1, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 106
    .line 107
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 108
    .line 109
    if-ne v1, v3, :cond_2

    .line 110
    .line 111
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 112
    .line 113
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 114
    .line 115
    cmp-long v1, v3, v5

    .line 116
    .line 117
    if-nez v1, :cond_2

    .line 118
    .line 119
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 120
    .line 121
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 122
    .line 123
    if-ne v1, v3, :cond_2

    .line 124
    .line 125
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->version:J

    .line 126
    .line 127
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->version:J

    .line 128
    .line 129
    cmp-long v1, v3, v5

    .line 130
    .line 131
    if-nez v1, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 164
    .line 165
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 166
    .line 167
    cmp-long v1, v3, v5

    .line 168
    .line 169
    if-nez v1, :cond_2

    .line 170
    .line 171
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 172
    .line 173
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 174
    .line 175
    if-ne v1, v3, :cond_2

    .line 176
    .line 177
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 178
    .line 179
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 180
    .line 181
    if-ne v1, v3, :cond_2

    .line 182
    .line 183
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 184
    .line 185
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 186
    .line 187
    cmp-long v1, v3, v5

    .line 188
    .line 189
    if-nez v1, :cond_2

    .line 190
    .line 191
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 192
    .line 193
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 194
    .line 195
    if-ne v1, v3, :cond_2

    .line 196
    .line 197
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 198
    .line 199
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 200
    .line 201
    cmp-long v1, v3, v5

    .line 202
    .line 203
    if-nez v1, :cond_2

    .line 204
    .line 205
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 206
    .line 207
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 208
    .line 209
    if-ne v1, v3, :cond_2

    .line 210
    .line 211
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->generationDuration:J

    .line 212
    .line 213
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->generationDuration:J

    .line 214
    .line 215
    cmp-long v1, v3, v5

    .line 216
    .line 217
    if-nez v1, :cond_2

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 220
    .line 221
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_2

    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 230
    .line 231
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-eqz v1, :cond_2

    .line 238
    .line 239
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 240
    .line 241
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 242
    .line 243
    if-ne v1, v3, :cond_2

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 246
    .line 247
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 248
    .line 249
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    if-eqz v1, :cond_2

    .line 254
    .line 255
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoLocation:I

    .line 256
    .line 257
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoLocation:I

    .line 258
    .line 259
    if-ne v1, v3, :cond_2

    .line 260
    .line 261
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoHeight:D

    .line 262
    .line 263
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoHeight:D

    .line 264
    .line 265
    cmpl-double v1, v3, v5

    .line 266
    .line 267
    if-nez v1, :cond_2

    .line 268
    .line 269
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoWidth:D

    .line 270
    .line 271
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoWidth:D

    .line 272
    .line 273
    cmpl-double v1, v3, v5

    .line 274
    .line 275
    if-nez v1, :cond_2

    .line 276
    .line 277
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 278
    .line 279
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 280
    .line 281
    cmp-long v1, v3, v5

    .line 282
    .line 283
    if-nez v1, :cond_2

    .line 284
    .line 285
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 286
    .line 287
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 288
    .line 289
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    if-eqz v1, :cond_2

    .line 294
    .line 295
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 296
    .line 297
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 298
    .line 299
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    if-eqz v1, :cond_2

    .line 304
    .line 305
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 306
    .line 307
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 308
    .line 309
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    if-eqz v1, :cond_2

    .line 314
    .line 315
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 316
    .line 317
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 318
    .line 319
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    if-eqz v1, :cond_2

    .line 324
    .line 325
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 326
    .line 327
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 328
    .line 329
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    if-eqz v1, :cond_2

    .line 334
    .line 335
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 336
    .line 337
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 338
    .line 339
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v1

    .line 343
    if-eqz v1, :cond_2

    .line 344
    .line 345
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 346
    .line 347
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 348
    .line 349
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result v1

    .line 353
    if-eqz v1, :cond_2

    .line 354
    .line 355
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 356
    .line 357
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 358
    .line 359
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 360
    .line 361
    .line 362
    move-result v1

    .line 363
    if-eqz v1, :cond_2

    .line 364
    .line 365
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 366
    .line 367
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 368
    .line 369
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    move-result v1

    .line 373
    if-eqz v1, :cond_2

    .line 374
    .line 375
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->videoType:I

    .line 376
    .line 377
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->videoType:I

    .line 378
    .line 379
    if-ne v1, v3, :cond_2

    .line 380
    .line 381
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 382
    .line 383
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 384
    .line 385
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    if-eqz v1, :cond_2

    .line 390
    .line 391
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 392
    .line 393
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 394
    .line 395
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-eqz v1, :cond_2

    .line 400
    .line 401
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 402
    .line 403
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 404
    .line 405
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    if-eqz v1, :cond_2

    .line 410
    .line 411
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 412
    .line 413
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 414
    .line 415
    if-ne v1, v3, :cond_2

    .line 416
    .line 417
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 418
    .line 419
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 420
    .line 421
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    move-result v1

    .line 425
    if-eqz v1, :cond_2

    .line 426
    .line 427
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 428
    .line 429
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 430
    .line 431
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result v1

    .line 435
    if-eqz v1, :cond_2

    .line 436
    .line 437
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 438
    .line 439
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 440
    .line 441
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 442
    .line 443
    .line 444
    move-result v1

    .line 445
    if-eqz v1, :cond_2

    .line 446
    .line 447
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 448
    .line 449
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 450
    .line 451
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 452
    .line 453
    .line 454
    move-result v1

    .line 455
    if-eqz v1, :cond_2

    .line 456
    .line 457
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 458
    .line 459
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 460
    .line 461
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 462
    .line 463
    .line 464
    move-result v1

    .line 465
    if-eqz v1, :cond_2

    .line 466
    .line 467
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 468
    .line 469
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 470
    .line 471
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 472
    .line 473
    .line 474
    move-result v1

    .line 475
    if-eqz v1, :cond_2

    .line 476
    .line 477
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 478
    .line 479
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 480
    .line 481
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 482
    .line 483
    .line 484
    move-result v1

    .line 485
    if-eqz v1, :cond_2

    .line 486
    .line 487
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 488
    .line 489
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 490
    .line 491
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result v1

    .line 495
    if-eqz v1, :cond_2

    .line 496
    .line 497
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 498
    .line 499
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 500
    .line 501
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 502
    .line 503
    .line 504
    move-result p0

    .line 505
    if-eqz p0, :cond_2

    .line 506
    .line 507
    return v0

    .line 508
    :cond_2
    return v2
.end method

.method public getActionNotice(Z)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->longPress:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 6
    .line 7
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->notice:Ljava/lang/String;

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

.method public getActionScheme(Z)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->longPress:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 6
    .line 7
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->scheme:Ljava/lang/String;

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

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivegiftitem"

    .line 2
    .line 3
    return-object p0
.end method

.method public getClickAction(Z)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

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

.method public getCoinPrice()J
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/v02;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/v02;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 27
    .line 28
    return-wide v0

    .line 29
    :cond_0
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 35
    .line 36
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->discount:I

    .line 37
    .line 38
    int-to-double v0, v0

    .line 39
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 40
    .line 41
    div-double/2addr v0, v2

    .line 42
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 43
    .line 44
    long-to-double v2, v2

    .line 45
    mul-double/2addr v2, v0

    .line 46
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    double-to-long v0, v0

    .line 51
    return-wide v0

    .line 52
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 53
    .line 54
    return-wide v0
.end method

.method public getDiamondPrice()J
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/q02;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/q02;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 27
    .line 28
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->purchasePrice:J

    .line 29
    .line 30
    return-wide v0

    .line 31
    :cond_0
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 37
    .line 38
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->discount:I

    .line 39
    .line 40
    int-to-double v0, v0

    .line 41
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 42
    .line 43
    div-double/2addr v0, v2

    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 45
    .line 46
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->purchasePrice:J

    .line 47
    .line 48
    long-to-double v2, v2

    .line 49
    mul-double/2addr v2, v0

    .line 50
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    double-to-long v0, v0

    .line 55
    return-wide v0

    .line 56
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 57
    .line 58
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->purchasePrice:J

    .line 59
    .line 60
    return-wide v0
.end method

.method public getGearsEffectIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isGearsGift()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/u02;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/u02;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 22
    .line 23
    return-object p0
.end method

.method public getJumpGiftName()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isJumpGift()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->title:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->title:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public getLocalName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getLocalRightTagName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getLocalSubtitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localSubtitle:Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getLocalTagName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public getPrice()J
    .locals 2

    .line 1
    invoke-static {}, Ll/u8n;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getDiamondPrice()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getCoinPrice()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    return-wide v0
.end method

.method public hasEffectRes()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

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

.method public hasRotationAnim()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->showAction:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRuleAction;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRuleAction;->type:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "rotation"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public hashCode()I
    .locals 10

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_25

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v1, v2

    .line 23
    :goto_0
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v2

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 64
    .line 65
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 66
    .line 67
    .line 68
    move-result-wide v3

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    const/16 v1, 0x20

    .line 72
    .line 73
    ushr-long v5, v3, v1

    .line 74
    .line 75
    xor-long/2addr v3, v5

    .line 76
    long-to-int v3, v3

    .line 77
    add-int/2addr v0, v3

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 81
    .line 82
    ushr-long v5, v3, v1

    .line 83
    .line 84
    xor-long/2addr v3, v5

    .line 85
    long-to-int v3, v3

    .line 86
    add-int/2addr v0, v3

    .line 87
    mul-int/lit8 v0, v0, 0x29

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v3, :cond_5

    .line 105
    .line 106
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    goto :goto_5

    .line 111
    :cond_5
    move v3, v2

    .line 112
    :goto_5
    add-int/2addr v0, v3

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 116
    .line 117
    if-eqz v3, :cond_6

    .line 118
    .line 119
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/LangModel;->hashCode()I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    goto :goto_6

    .line 124
    :cond_6
    move v3, v2

    .line 125
    :goto_6
    add-int/2addr v0, v3

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 129
    .line 130
    add-int/2addr v0, v3

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->combosDuration:J

    .line 134
    .line 135
    ushr-long v5, v3, v1

    .line 136
    .line 137
    xor-long/2addr v3, v5

    .line 138
    long-to-int v3, v3

    .line 139
    add-int/2addr v0, v3

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 143
    .line 144
    add-int/2addr v0, v3

    .line 145
    mul-int/lit8 v0, v0, 0x29

    .line 146
    .line 147
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->version:J

    .line 148
    .line 149
    ushr-long v5, v3, v1

    .line 150
    .line 151
    xor-long/2addr v3, v5

    .line 152
    long-to-int v3, v3

    .line 153
    add-int/2addr v0, v3

    .line 154
    mul-int/lit8 v0, v0, 0x29

    .line 155
    .line 156
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz v3, :cond_7

    .line 159
    .line 160
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    goto :goto_7

    .line 165
    :cond_7
    move v3, v2

    .line 166
    :goto_7
    add-int/2addr v0, v3

    .line 167
    mul-int/lit8 v0, v0, 0x29

    .line 168
    .line 169
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 170
    .line 171
    if-eqz v3, :cond_8

    .line 172
    .line 173
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    goto :goto_8

    .line 178
    :cond_8
    move v3, v2

    .line 179
    :goto_8
    add-int/2addr v0, v3

    .line 180
    mul-int/lit8 v0, v0, 0x29

    .line 181
    .line 182
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 183
    .line 184
    if-eqz v3, :cond_9

    .line 185
    .line 186
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    goto :goto_9

    .line 191
    :cond_9
    move v3, v2

    .line 192
    :goto_9
    add-int/2addr v0, v3

    .line 193
    mul-int/lit8 v0, v0, 0x29

    .line 194
    .line 195
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->trayDuration:J

    .line 196
    .line 197
    ushr-long v5, v3, v1

    .line 198
    .line 199
    xor-long/2addr v3, v5

    .line 200
    long-to-int v3, v3

    .line 201
    add-int/2addr v0, v3

    .line 202
    mul-int/lit8 v0, v0, 0x29

    .line 203
    .line 204
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 205
    .line 206
    add-int/2addr v0, v3

    .line 207
    mul-int/lit8 v0, v0, 0x29

    .line 208
    .line 209
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 210
    .line 211
    add-int/2addr v0, v3

    .line 212
    mul-int/lit8 v0, v0, 0x29

    .line 213
    .line 214
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 215
    .line 216
    ushr-long v5, v3, v1

    .line 217
    .line 218
    xor-long/2addr v3, v5

    .line 219
    long-to-int v3, v3

    .line 220
    add-int/2addr v0, v3

    .line 221
    mul-int/lit8 v0, v0, 0x29

    .line 222
    .line 223
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 224
    .line 225
    const/16 v4, 0x4d5

    .line 226
    .line 227
    const/16 v5, 0x4cf

    .line 228
    .line 229
    if-eqz v3, :cond_a

    .line 230
    .line 231
    move v3, v5

    .line 232
    goto :goto_a

    .line 233
    :cond_a
    move v3, v4

    .line 234
    :goto_a
    add-int/2addr v0, v3

    .line 235
    mul-int/lit8 v0, v0, 0x29

    .line 236
    .line 237
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 238
    .line 239
    ushr-long v8, v6, v1

    .line 240
    .line 241
    xor-long/2addr v6, v8

    .line 242
    long-to-int v3, v6

    .line 243
    add-int/2addr v0, v3

    .line 244
    mul-int/lit8 v0, v0, 0x29

    .line 245
    .line 246
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 247
    .line 248
    if-eqz v3, :cond_b

    .line 249
    .line 250
    move v3, v5

    .line 251
    goto :goto_b

    .line 252
    :cond_b
    move v3, v4

    .line 253
    :goto_b
    add-int/2addr v0, v3

    .line 254
    mul-int/lit8 v0, v0, 0x29

    .line 255
    .line 256
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->generationDuration:J

    .line 257
    .line 258
    ushr-long v8, v6, v1

    .line 259
    .line 260
    xor-long/2addr v6, v8

    .line 261
    long-to-int v3, v6

    .line 262
    add-int/2addr v0, v3

    .line 263
    mul-int/lit8 v0, v0, 0x29

    .line 264
    .line 265
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 266
    .line 267
    if-eqz v3, :cond_c

    .line 268
    .line 269
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    goto :goto_c

    .line 274
    :cond_c
    move v3, v2

    .line 275
    :goto_c
    add-int/2addr v0, v3

    .line 276
    mul-int/lit8 v0, v0, 0x29

    .line 277
    .line 278
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 279
    .line 280
    if-eqz v3, :cond_d

    .line 281
    .line 282
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    goto :goto_d

    .line 287
    :cond_d
    move v3, v2

    .line 288
    :goto_d
    add-int/2addr v0, v3

    .line 289
    mul-int/lit8 v0, v0, 0x29

    .line 290
    .line 291
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 292
    .line 293
    add-int/2addr v0, v3

    .line 294
    mul-int/lit8 v0, v0, 0x29

    .line 295
    .line 296
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 297
    .line 298
    if-eqz v3, :cond_e

    .line 299
    .line 300
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 301
    .line 302
    .line 303
    move-result v3

    .line 304
    goto :goto_e

    .line 305
    :cond_e
    move v3, v2

    .line 306
    :goto_e
    add-int/2addr v0, v3

    .line 307
    mul-int/lit8 v0, v0, 0x29

    .line 308
    .line 309
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoLocation:I

    .line 310
    .line 311
    add-int/2addr v0, v3

    .line 312
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoHeight:D

    .line 313
    .line 314
    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 315
    .line 316
    .line 317
    move-result-wide v6

    .line 318
    mul-int/lit8 v0, v0, 0x29

    .line 319
    .line 320
    ushr-long v8, v6, v1

    .line 321
    .line 322
    xor-long/2addr v6, v8

    .line 323
    long-to-int v3, v6

    .line 324
    add-int/2addr v0, v3

    .line 325
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoWidth:D

    .line 326
    .line 327
    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 328
    .line 329
    .line 330
    move-result-wide v6

    .line 331
    mul-int/lit8 v0, v0, 0x29

    .line 332
    .line 333
    ushr-long v8, v6, v1

    .line 334
    .line 335
    xor-long/2addr v6, v8

    .line 336
    long-to-int v3, v6

    .line 337
    add-int/2addr v0, v3

    .line 338
    mul-int/lit8 v0, v0, 0x29

    .line 339
    .line 340
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 341
    .line 342
    ushr-long v8, v6, v1

    .line 343
    .line 344
    xor-long/2addr v6, v8

    .line 345
    long-to-int v1, v6

    .line 346
    add-int/2addr v0, v1

    .line 347
    mul-int/lit8 v0, v0, 0x29

    .line 348
    .line 349
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 350
    .line 351
    if-eqz v1, :cond_f

    .line 352
    .line 353
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 354
    .line 355
    .line 356
    move-result v1

    .line 357
    goto :goto_f

    .line 358
    :cond_f
    move v1, v2

    .line 359
    :goto_f
    add-int/2addr v0, v1

    .line 360
    mul-int/lit8 v0, v0, 0x29

    .line 361
    .line 362
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 363
    .line 364
    if-eqz v1, :cond_10

    .line 365
    .line 366
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 367
    .line 368
    .line 369
    move-result v1

    .line 370
    goto :goto_10

    .line 371
    :cond_10
    move v1, v2

    .line 372
    :goto_10
    add-int/2addr v0, v1

    .line 373
    mul-int/lit8 v0, v0, 0x29

    .line 374
    .line 375
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 376
    .line 377
    if-eqz v1, :cond_11

    .line 378
    .line 379
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->hashCode()I

    .line 380
    .line 381
    .line 382
    move-result v1

    .line 383
    goto :goto_11

    .line 384
    :cond_11
    move v1, v2

    .line 385
    :goto_11
    add-int/2addr v0, v1

    .line 386
    mul-int/lit8 v0, v0, 0x29

    .line 387
    .line 388
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 389
    .line 390
    if-eqz v1, :cond_12

    .line 391
    .line 392
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    goto :goto_12

    .line 397
    :cond_12
    move v1, v2

    .line 398
    :goto_12
    add-int/2addr v0, v1

    .line 399
    mul-int/lit8 v0, v0, 0x29

    .line 400
    .line 401
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 402
    .line 403
    if-eqz v1, :cond_13

    .line 404
    .line 405
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    goto :goto_13

    .line 410
    :cond_13
    move v1, v2

    .line 411
    :goto_13
    add-int/2addr v0, v1

    .line 412
    mul-int/lit8 v0, v0, 0x29

    .line 413
    .line 414
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 415
    .line 416
    if-eqz v1, :cond_14

    .line 417
    .line 418
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    goto :goto_14

    .line 423
    :cond_14
    move v1, v2

    .line 424
    :goto_14
    add-int/2addr v0, v1

    .line 425
    mul-int/lit8 v0, v0, 0x29

    .line 426
    .line 427
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 428
    .line 429
    if-eqz v1, :cond_15

    .line 430
    .line 431
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 432
    .line 433
    .line 434
    move-result v1

    .line 435
    goto :goto_15

    .line 436
    :cond_15
    move v1, v2

    .line 437
    :goto_15
    add-int/2addr v0, v1

    .line 438
    mul-int/lit8 v0, v0, 0x29

    .line 439
    .line 440
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 441
    .line 442
    if-eqz v1, :cond_16

    .line 443
    .line 444
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->hashCode()I

    .line 445
    .line 446
    .line 447
    move-result v1

    .line 448
    goto :goto_16

    .line 449
    :cond_16
    move v1, v2

    .line 450
    :goto_16
    add-int/2addr v0, v1

    .line 451
    mul-int/lit8 v0, v0, 0x29

    .line 452
    .line 453
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 454
    .line 455
    if-eqz v1, :cond_17

    .line 456
    .line 457
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->hashCode()I

    .line 458
    .line 459
    .line 460
    move-result v1

    .line 461
    goto :goto_17

    .line 462
    :cond_17
    move v1, v2

    .line 463
    :goto_17
    add-int/2addr v0, v1

    .line 464
    mul-int/lit8 v0, v0, 0x29

    .line 465
    .line 466
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->videoType:I

    .line 467
    .line 468
    add-int/2addr v0, v1

    .line 469
    mul-int/lit8 v0, v0, 0x29

    .line 470
    .line 471
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 472
    .line 473
    if-eqz v1, :cond_18

    .line 474
    .line 475
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 476
    .line 477
    .line 478
    move-result v1

    .line 479
    goto :goto_18

    .line 480
    :cond_18
    move v1, v2

    .line 481
    :goto_18
    add-int/2addr v0, v1

    .line 482
    mul-int/lit8 v0, v0, 0x29

    .line 483
    .line 484
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 485
    .line 486
    if-eqz v1, :cond_19

    .line 487
    .line 488
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->hashCode()I

    .line 489
    .line 490
    .line 491
    move-result v1

    .line 492
    goto :goto_19

    .line 493
    :cond_19
    move v1, v2

    .line 494
    :goto_19
    add-int/2addr v0, v1

    .line 495
    mul-int/lit8 v0, v0, 0x29

    .line 496
    .line 497
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 498
    .line 499
    if-eqz v1, :cond_1a

    .line 500
    .line 501
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 502
    .line 503
    .line 504
    move-result v1

    .line 505
    goto :goto_1a

    .line 506
    :cond_1a
    move v1, v2

    .line 507
    :goto_1a
    add-int/2addr v0, v1

    .line 508
    mul-int/lit8 v0, v0, 0x29

    .line 509
    .line 510
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 511
    .line 512
    if-eqz v1, :cond_1b

    .line 513
    .line 514
    move v4, v5

    .line 515
    :cond_1b
    add-int/2addr v0, v4

    .line 516
    mul-int/lit8 v0, v0, 0x29

    .line 517
    .line 518
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 519
    .line 520
    if-eqz v1, :cond_1c

    .line 521
    .line 522
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->hashCode()I

    .line 523
    .line 524
    .line 525
    move-result v1

    .line 526
    goto :goto_1b

    .line 527
    :cond_1c
    move v1, v2

    .line 528
    :goto_1b
    add-int/2addr v0, v1

    .line 529
    mul-int/lit8 v0, v0, 0x29

    .line 530
    .line 531
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 532
    .line 533
    if-eqz v1, :cond_1d

    .line 534
    .line 535
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 536
    .line 537
    .line 538
    move-result v1

    .line 539
    goto :goto_1c

    .line 540
    :cond_1d
    move v1, v2

    .line 541
    :goto_1c
    add-int/2addr v0, v1

    .line 542
    mul-int/lit8 v0, v0, 0x29

    .line 543
    .line 544
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 545
    .line 546
    if-eqz v1, :cond_1e

    .line 547
    .line 548
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 549
    .line 550
    .line 551
    move-result v1

    .line 552
    goto :goto_1d

    .line 553
    :cond_1e
    move v1, v2

    .line 554
    :goto_1d
    add-int/2addr v0, v1

    .line 555
    mul-int/lit8 v0, v0, 0x29

    .line 556
    .line 557
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 558
    .line 559
    if-eqz v1, :cond_1f

    .line 560
    .line 561
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->hashCode()I

    .line 562
    .line 563
    .line 564
    move-result v1

    .line 565
    goto :goto_1e

    .line 566
    :cond_1f
    move v1, v2

    .line 567
    :goto_1e
    add-int/2addr v0, v1

    .line 568
    mul-int/lit8 v0, v0, 0x29

    .line 569
    .line 570
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 571
    .line 572
    if-eqz v1, :cond_20

    .line 573
    .line 574
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 575
    .line 576
    .line 577
    move-result v1

    .line 578
    goto :goto_1f

    .line 579
    :cond_20
    move v1, v2

    .line 580
    :goto_1f
    add-int/2addr v0, v1

    .line 581
    mul-int/lit8 v0, v0, 0x29

    .line 582
    .line 583
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 584
    .line 585
    if-eqz v1, :cond_21

    .line 586
    .line 587
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 588
    .line 589
    .line 590
    move-result v1

    .line 591
    goto :goto_20

    .line 592
    :cond_21
    move v1, v2

    .line 593
    :goto_20
    add-int/2addr v0, v1

    .line 594
    mul-int/lit8 v0, v0, 0x29

    .line 595
    .line 596
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 597
    .line 598
    if-eqz v1, :cond_22

    .line 599
    .line 600
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 601
    .line 602
    .line 603
    move-result v1

    .line 604
    goto :goto_21

    .line 605
    :cond_22
    move v1, v2

    .line 606
    :goto_21
    add-int/2addr v0, v1

    .line 607
    mul-int/lit8 v0, v0, 0x29

    .line 608
    .line 609
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 610
    .line 611
    if-eqz v1, :cond_23

    .line 612
    .line 613
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->hashCode()I

    .line 614
    .line 615
    .line 616
    move-result v1

    .line 617
    goto :goto_22

    .line 618
    :cond_23
    move v1, v2

    .line 619
    :goto_22
    add-int/2addr v0, v1

    .line 620
    mul-int/lit8 v0, v0, 0x29

    .line 621
    .line 622
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 623
    .line 624
    if-eqz v1, :cond_24

    .line 625
    .line 626
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->hashCode()I

    .line 627
    .line 628
    .line 629
    move-result v2

    .line 630
    :cond_24
    add-int/2addr v0, v2

    .line 631
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 632
    .line 633
    :cond_25
    return v0
.end method

.method public isCountTimeGift()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 2
    .line 3
    const/4 v0, -0x6

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isDiscountCard()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "discountCard"

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

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

.method public isFaceGift()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "stickFace"

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

.method public isGearsGift()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->gearEffects:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public isHighRankGift()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 2
    .line 3
    const/16 v0, 0xc8

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0x12c

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public isJumpGift()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 2
    .line 3
    const/4 v0, -0x4

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isLuckyGift()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isNormalGift()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isNotPacketGift()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public isPacketGift()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isPaidGift()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isNormalGift()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isLuckyGift()Z

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

.method public isScrapGift()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isSupportDiscountGift()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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

.method public isSupportDraw()Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getClickAction(Z)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const-string v2, "Draw"

    .line 7
    .line 8
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getClickAction(Z)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return v1

    .line 27
    :cond_1
    :goto_0
    return v0
.end method

.method public isValidGiftType()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isNormalGift()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isLuckyGift()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isJumpGift()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isScrapGift()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isCountTimeGift()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public isValidPacketGift(Ljava/util/Date;)Z
    .locals 3
    .param p1    # Ljava/util/Date;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/Date;

    .line 12
    .line 13
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/LangModel;->new_()Lcom/p1/mobile/putong/data/LangModel;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->status:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 54
    .line 55
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_8

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 60
    .line 61
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_9

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressGotoUrl:Ljava/lang/String;

    .line 66
    .line 67
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 68
    .line 69
    if-nez v0, :cond_a

    .line 70
    .line 71
    new-instance v0, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->luckyPrizeGiftInfos:Ljava/util/List;

    .line 77
    .line 78
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 79
    .line 80
    if-nez v0, :cond_b

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 83
    .line 84
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 85
    .line 86
    if-nez v0, :cond_c

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 89
    .line 90
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 91
    .line 92
    if-nez v0, :cond_d

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 99
    .line 100
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 101
    .line 102
    if-nez v0, :cond_e

    .line 103
    .line 104
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->subtitle:Ljava/lang/String;

    .line 105
    .line 106
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 107
    .line 108
    if-nez v0, :cond_f

    .line 109
    .line 110
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 111
    .line 112
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 113
    .line 114
    if-nez v0, :cond_10

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->animationType:Ljava/lang/String;

    .line 117
    .line 118
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 119
    .line 120
    if-nez v0, :cond_11

    .line 121
    .line 122
    new-instance v0, Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .line 126
    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 128
    .line 129
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 130
    .line 131
    if-nez v0, :cond_12

    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 138
    .line 139
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 140
    .line 141
    if-nez v0, :cond_13

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 148
    .line 149
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 150
    .line 151
    if-nez v0, :cond_14

    .line 152
    .line 153
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hdUrl:Ljava/lang/String;

    .line 154
    .line 155
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 156
    .line 157
    if-nez v0, :cond_15

    .line 158
    .line 159
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->gear:Lcom/p1/mobile/putong/live/base/data/BLiveGiftGearInfo;

    .line 164
    .line 165
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 166
    .line 167
    if-nez v0, :cond_16

    .line 168
    .line 169
    new-instance v0, Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .line 173
    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 175
    .line 176
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 177
    .line 178
    if-nez v0, :cond_17

    .line 179
    .line 180
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 181
    .line 182
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 183
    .line 184
    if-nez v0, :cond_18

    .line 185
    .line 186
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 187
    .line 188
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 189
    .line 190
    if-nez v0, :cond_19

    .line 191
    .line 192
    invoke-static {}, Lcom/p1/mobile/putong/data/LangModel;->new_()Lcom/p1/mobile/putong/data/LangModel;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 197
    .line 198
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 199
    .line 200
    if-nez v0, :cond_1a

    .line 201
    .line 202
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 203
    .line 204
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 205
    .line 206
    if-nez v0, :cond_1b

    .line 207
    .line 208
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 209
    .line 210
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 211
    .line 212
    if-nez v0, :cond_1c

    .line 213
    .line 214
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTagTextColor:Ljava/lang/String;

    .line 215
    .line 216
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 217
    .line 218
    if-nez v0, :cond_1d

    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->diamondPrice:Lcom/p1/mobile/putong/live/base/data/BLiveGiftDiamondPrice;

    .line 225
    .line 226
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 227
    .line 228
    if-nez v0, :cond_1e

    .line 229
    .line 230
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 235
    .line 236
    :cond_1e
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public updateTagColorFromBrief(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->startTagColor:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->endTagColor:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 24
    .line 25
    :cond_1
    return-void
.end method
