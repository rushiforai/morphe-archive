.class public Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
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
            "Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "coreassetssettings"


# instance fields
.field public anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public autoPayEnable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public autoReadConversation:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public chatGuideExp:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public chatOnlineDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public closeAct2GoodAll:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public counterPollingSeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public enableVoiceCall:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public forcePhoneBind:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public forcePhoneBindTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public inactivateReason:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InactivateReason;",
            ">;"
        }
    .end annotation
.end field

.field public intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public profileBasicHobbyTags:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProfileBasicTag;",
            ">;"
        }
    .end annotation
.end field

.field public profileBasicRecentTags:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProfileBasicTag;",
            ">;"
        }
    .end annotation
.end field

.field public profileBasicTogetherTags:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProfileBasicTag;",
            ">;"
        }
    .end annotation
.end field

.field public profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public profileUpgradeInterest:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;",
            ">;"
        }
    .end annotation
.end field

.field public prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public rateAlertSetting:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/RateAlertSetting;",
            ">;"
        }
    .end annotation
.end field

.field public schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public seeSwipeCountInOneSession:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/InactivateReason;)Lcom/p1/mobile/putong/core/data/InactivateReason;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/InactivateReason;->clone()Lcom/p1/mobile/putong/core/data/InactivateReason;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/ProfileBasicTag;)Lcom/p1/mobile/putong/core/data/ProfileBasicTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->clone()Lcom/p1/mobile/putong/core/data/ProfileBasicTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/ProfileBasicTag;)Lcom/p1/mobile/putong/core/data/ProfileBasicTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->clone()Lcom/p1/mobile/putong/core/data/ProfileBasicTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/ProfileBasicTag;)Lcom/p1/mobile/putong/core/data/ProfileBasicTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->clone()Lcom/p1/mobile/putong/core/data/ProfileBasicTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;)Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;->clone()Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/RateAlertSetting;)Lcom/p1/mobile/putong/core/data/RateAlertSetting;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->clone()Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->nullCheck()V

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

    .line 342
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->clone()Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/hy6;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/hy6;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 22
    .line 23
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PromptLimit;->clone()Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 34
    .line 35
    :cond_1
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 36
    .line 37
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MissMatch;->clone()Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 48
    .line 49
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SpecialCard;->clone()Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 58
    .line 59
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 60
    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatEffect;->clone()Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 68
    .line 69
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 70
    .line 71
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 72
    .line 73
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 74
    .line 75
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->clone()Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 86
    .line 87
    :cond_5
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 88
    .line 89
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->clone()Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 100
    .line 101
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 102
    .line 103
    if-eqz v1, :cond_7

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->clone()Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 110
    .line 111
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 112
    .line 113
    if-eqz v1, :cond_8

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->clone()Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 120
    .line 121
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 122
    .line 123
    if-eqz v1, :cond_9

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GraduateActivity;->clone()Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 130
    .line 131
    :cond_9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 132
    .line 133
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 136
    .line 137
    if-eqz v1, :cond_a

    .line 138
    .line 139
    new-instance v2, Ll/iy6;

    .line 140
    .line 141
    invoke-direct {v2}, Ll/iy6;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 149
    .line 150
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 151
    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 155
    .line 156
    if-eqz v1, :cond_b

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->clone()Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 163
    .line 164
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->clone()Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 173
    .line 174
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 175
    .line 176
    if-eqz v1, :cond_d

    .line 177
    .line 178
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/KeepConnection;->clone()Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 183
    .line 184
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 185
    .line 186
    if-eqz v1, :cond_e

    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->clone()Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 193
    .line 194
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 195
    .line 196
    if-eqz v1, :cond_f

    .line 197
    .line 198
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;->clone()Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 203
    .line 204
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 205
    .line 206
    if-eqz v1, :cond_10

    .line 207
    .line 208
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->clone()Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 213
    .line 214
    :cond_10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 215
    .line 216
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 217
    .line 218
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 219
    .line 220
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 221
    .line 222
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 223
    .line 224
    if-eqz v1, :cond_11

    .line 225
    .line 226
    new-instance v2, Ll/jy6;

    .line 227
    .line 228
    invoke-direct {v2}, Ll/jy6;-><init>()V

    .line 229
    .line 230
    .line 231
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 236
    .line 237
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 238
    .line 239
    if-eqz v1, :cond_12

    .line 240
    .line 241
    new-instance v2, Ll/ky6;

    .line 242
    .line 243
    invoke-direct {v2}, Ll/ky6;-><init>()V

    .line 244
    .line 245
    .line 246
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 251
    .line 252
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 253
    .line 254
    if-eqz v1, :cond_13

    .line 255
    .line 256
    new-instance v2, Ll/ly6;

    .line 257
    .line 258
    invoke-direct {v2}, Ll/ly6;-><init>()V

    .line 259
    .line 260
    .line 261
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 266
    .line 267
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 268
    .line 269
    if-eqz v1, :cond_14

    .line 270
    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AnonymityImg;->clone()Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 276
    .line 277
    :cond_14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 278
    .line 279
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 282
    .line 283
    if-eqz v1, :cond_15

    .line 284
    .line 285
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->clone()Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 290
    .line 291
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 292
    .line 293
    if-eqz v1, :cond_16

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;->clone()Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 300
    .line 301
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 302
    .line 303
    if-eqz v1, :cond_17

    .line 304
    .line 305
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->clone()Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 310
    .line 311
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 312
    .line 313
    if-eqz v1, :cond_18

    .line 314
    .line 315
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->clone()Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 320
    .line 321
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 322
    .line 323
    if-eqz v1, :cond_19

    .line 324
    .line 325
    new-instance v2, Ll/my6;

    .line 326
    .line 327
    invoke-direct {v2}, Ll/my6;-><init>()V

    .line 328
    .line 329
    .line 330
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 335
    .line 336
    :cond_19
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 337
    .line 338
    iput p0, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 339
    .line 340
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 341
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->clone()Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 40
    .line 41
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 42
    .line 43
    cmp-long v1, v3, v5

    .line 44
    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 78
    .line 79
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 80
    .line 81
    if-ne v1, v3, :cond_2

    .line 82
    .line 83
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 84
    .line 85
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 86
    .line 87
    cmpl-double v1, v3, v5

    .line 88
    .line 89
    if-nez v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 94
    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_2

    .line 100
    .line 101
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 102
    .line 103
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 104
    .line 105
    if-ne v1, v3, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 130
    .line 131
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_2

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 140
    .line 141
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 148
    .line 149
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 150
    .line 151
    if-ne v1, v3, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 166
    .line 167
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_2

    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 176
    .line 177
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_2

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 186
    .line 187
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_2

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 194
    .line 195
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 196
    .line 197
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-eqz v1, :cond_2

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 204
    .line 205
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 206
    .line 207
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-eqz v1, :cond_2

    .line 212
    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 214
    .line 215
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 216
    .line 217
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_2

    .line 222
    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 224
    .line 225
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 226
    .line 227
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    if-eqz v1, :cond_2

    .line 232
    .line 233
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 234
    .line 235
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 236
    .line 237
    if-ne v1, v3, :cond_2

    .line 238
    .line 239
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 240
    .line 241
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 242
    .line 243
    if-ne v1, v3, :cond_2

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 246
    .line 247
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 256
    .line 257
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 258
    .line 259
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    if-eqz v1, :cond_2

    .line 264
    .line 265
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 266
    .line 267
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 268
    .line 269
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    if-eqz v1, :cond_2

    .line 274
    .line 275
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 276
    .line 277
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 278
    .line 279
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    if-eqz v1, :cond_2

    .line 284
    .line 285
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 286
    .line 287
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 288
    .line 289
    if-ne v1, v3, :cond_2

    .line 290
    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 292
    .line 293
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 294
    .line 295
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    if-eqz v1, :cond_2

    .line 300
    .line 301
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 302
    .line 303
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 304
    .line 305
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    if-eqz v1, :cond_2

    .line 310
    .line 311
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 312
    .line 313
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 314
    .line 315
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    if-eqz v1, :cond_2

    .line 320
    .line 321
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 322
    .line 323
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 324
    .line 325
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v1

    .line 329
    if-eqz v1, :cond_2

    .line 330
    .line 331
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 332
    .line 333
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 334
    .line 335
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    if-eqz v1, :cond_2

    .line 340
    .line 341
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 342
    .line 343
    iget p1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 344
    .line 345
    if-ne p0, p1, :cond_2

    .line 346
    .line 347
    return v0

    .line 348
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "coreassetssettings"

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
    if-nez v0, :cond_20

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 22
    .line 23
    const/16 v3, 0x4d5

    .line 24
    .line 25
    const/16 v4, 0x4cf

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    move v1, v4

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v1, v3

    .line 32
    :goto_1
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PromptLimit;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v2

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 49
    .line 50
    const/16 v1, 0x20

    .line 51
    .line 52
    ushr-long v7, v5, v1

    .line 53
    .line 54
    xor-long/2addr v5, v7

    .line 55
    long-to-int v5, v5

    .line 56
    add-int/2addr v0, v5

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 60
    .line 61
    if-eqz v5, :cond_3

    .line 62
    .line 63
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/MissMatch;->hashCode()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    goto :goto_3

    .line 68
    :cond_3
    move v5, v2

    .line 69
    :goto_3
    add-int/2addr v0, v5

    .line 70
    mul-int/lit8 v0, v0, 0x29

    .line 71
    .line 72
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 73
    .line 74
    if-eqz v5, :cond_4

    .line 75
    .line 76
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/SpecialCard;->hashCode()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    goto :goto_4

    .line 81
    :cond_4
    move v5, v2

    .line 82
    :goto_4
    add-int/2addr v0, v5

    .line 83
    mul-int/lit8 v0, v0, 0x29

    .line 84
    .line 85
    iget-object v5, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 86
    .line 87
    if-eqz v5, :cond_5

    .line 88
    .line 89
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/ChatEffect;->hashCode()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    goto :goto_5

    .line 94
    :cond_5
    move v5, v2

    .line 95
    :goto_5
    add-int/2addr v0, v5

    .line 96
    mul-int/lit8 v0, v0, 0x29

    .line 97
    .line 98
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 99
    .line 100
    if-eqz v5, :cond_6

    .line 101
    .line 102
    move v5, v4

    .line 103
    goto :goto_6

    .line 104
    :cond_6
    move v5, v3

    .line 105
    :goto_6
    add-int/2addr v0, v5

    .line 106
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 107
    .line 108
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 109
    .line 110
    .line 111
    move-result-wide v5

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    ushr-long v7, v5, v1

    .line 115
    .line 116
    xor-long/2addr v5, v7

    .line 117
    long-to-int v1, v5

    .line 118
    add-int/2addr v0, v1

    .line 119
    mul-int/lit8 v0, v0, 0x29

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 122
    .line 123
    if-eqz v1, :cond_7

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->hashCode()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    goto :goto_7

    .line 130
    :cond_7
    move v1, v2

    .line 131
    :goto_7
    add-int/2addr v0, v1

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 135
    .line 136
    add-int/2addr v0, v1

    .line 137
    mul-int/lit8 v0, v0, 0x29

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 140
    .line 141
    if-eqz v1, :cond_8

    .line 142
    .line 143
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->hashCode()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    goto :goto_8

    .line 148
    :cond_8
    move v1, v2

    .line 149
    :goto_8
    add-int/2addr v0, v1

    .line 150
    mul-int/lit8 v0, v0, 0x29

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 153
    .line 154
    if-eqz v1, :cond_9

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->hashCode()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    goto :goto_9

    .line 161
    :cond_9
    move v1, v2

    .line 162
    :goto_9
    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 166
    .line 167
    if-eqz v1, :cond_a

    .line 168
    .line 169
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    goto :goto_a

    .line 174
    :cond_a
    move v1, v2

    .line 175
    :goto_a
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 179
    .line 180
    if-eqz v1, :cond_b

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GraduateActivity;->hashCode()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    goto :goto_b

    .line 187
    :cond_b
    move v1, v2

    .line 188
    :goto_b
    add-int/2addr v0, v1

    .line 189
    mul-int/lit8 v0, v0, 0x29

    .line 190
    .line 191
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 192
    .line 193
    if-eqz v1, :cond_c

    .line 194
    .line 195
    move v1, v4

    .line 196
    goto :goto_c

    .line 197
    :cond_c
    move v1, v3

    .line 198
    :goto_c
    add-int/2addr v0, v1

    .line 199
    mul-int/lit8 v0, v0, 0x29

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 202
    .line 203
    if-eqz v1, :cond_d

    .line 204
    .line 205
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    goto :goto_d

    .line 210
    :cond_d
    move v1, v2

    .line 211
    :goto_d
    add-int/2addr v0, v1

    .line 212
    mul-int/lit8 v0, v0, 0x29

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 215
    .line 216
    if-eqz v1, :cond_e

    .line 217
    .line 218
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    goto :goto_e

    .line 223
    :cond_e
    move v1, v2

    .line 224
    :goto_e
    add-int/2addr v0, v1

    .line 225
    mul-int/lit8 v0, v0, 0x29

    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 228
    .line 229
    if-eqz v1, :cond_f

    .line 230
    .line 231
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->hashCode()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    goto :goto_f

    .line 236
    :cond_f
    move v1, v2

    .line 237
    :goto_f
    add-int/2addr v0, v1

    .line 238
    mul-int/lit8 v0, v0, 0x29

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 241
    .line 242
    if-eqz v1, :cond_10

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->hashCode()I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    goto :goto_10

    .line 249
    :cond_10
    move v1, v2

    .line 250
    :goto_10
    add-int/2addr v0, v1

    .line 251
    mul-int/lit8 v0, v0, 0x29

    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 254
    .line 255
    if-eqz v1, :cond_11

    .line 256
    .line 257
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/KeepConnection;->hashCode()I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    goto :goto_11

    .line 262
    :cond_11
    move v1, v2

    .line 263
    :goto_11
    add-int/2addr v0, v1

    .line 264
    mul-int/lit8 v0, v0, 0x29

    .line 265
    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 267
    .line 268
    if-eqz v1, :cond_12

    .line 269
    .line 270
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->hashCode()I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    goto :goto_12

    .line 275
    :cond_12
    move v1, v2

    .line 276
    :goto_12
    add-int/2addr v0, v1

    .line 277
    mul-int/lit8 v0, v0, 0x29

    .line 278
    .line 279
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 280
    .line 281
    if-eqz v1, :cond_13

    .line 282
    .line 283
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;->hashCode()I

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    goto :goto_13

    .line 288
    :cond_13
    move v1, v2

    .line 289
    :goto_13
    add-int/2addr v0, v1

    .line 290
    mul-int/lit8 v0, v0, 0x29

    .line 291
    .line 292
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 293
    .line 294
    if-eqz v1, :cond_14

    .line 295
    .line 296
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->hashCode()I

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    goto :goto_14

    .line 301
    :cond_14
    move v1, v2

    .line 302
    :goto_14
    add-int/2addr v0, v1

    .line 303
    mul-int/lit8 v0, v0, 0x29

    .line 304
    .line 305
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 306
    .line 307
    if-eqz v1, :cond_15

    .line 308
    .line 309
    move v1, v4

    .line 310
    goto :goto_15

    .line 311
    :cond_15
    move v1, v3

    .line 312
    :goto_15
    add-int/2addr v0, v1

    .line 313
    mul-int/lit8 v0, v0, 0x29

    .line 314
    .line 315
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 316
    .line 317
    add-int/2addr v0, v1

    .line 318
    mul-int/lit8 v0, v0, 0x29

    .line 319
    .line 320
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 321
    .line 322
    if-eqz v1, :cond_16

    .line 323
    .line 324
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    goto :goto_16

    .line 329
    :cond_16
    move v1, v2

    .line 330
    :goto_16
    add-int/2addr v0, v1

    .line 331
    mul-int/lit8 v0, v0, 0x29

    .line 332
    .line 333
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 334
    .line 335
    if-eqz v1, :cond_17

    .line 336
    .line 337
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    goto :goto_17

    .line 342
    :cond_17
    move v1, v2

    .line 343
    :goto_17
    add-int/2addr v0, v1

    .line 344
    mul-int/lit8 v0, v0, 0x29

    .line 345
    .line 346
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 347
    .line 348
    if-eqz v1, :cond_18

    .line 349
    .line 350
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    goto :goto_18

    .line 355
    :cond_18
    move v1, v2

    .line 356
    :goto_18
    add-int/2addr v0, v1

    .line 357
    mul-int/lit8 v0, v0, 0x29

    .line 358
    .line 359
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 360
    .line 361
    if-eqz v1, :cond_19

    .line 362
    .line 363
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AnonymityImg;->hashCode()I

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    goto :goto_19

    .line 368
    :cond_19
    move v1, v2

    .line 369
    :goto_19
    add-int/2addr v0, v1

    .line 370
    mul-int/lit8 v0, v0, 0x29

    .line 371
    .line 372
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 373
    .line 374
    if-eqz v1, :cond_1a

    .line 375
    .line 376
    move v3, v4

    .line 377
    :cond_1a
    add-int/2addr v0, v3

    .line 378
    mul-int/lit8 v0, v0, 0x29

    .line 379
    .line 380
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 381
    .line 382
    if-eqz v1, :cond_1b

    .line 383
    .line 384
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->hashCode()I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    goto :goto_1a

    .line 389
    :cond_1b
    move v1, v2

    .line 390
    :goto_1a
    add-int/2addr v0, v1

    .line 391
    mul-int/lit8 v0, v0, 0x29

    .line 392
    .line 393
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 394
    .line 395
    if-eqz v1, :cond_1c

    .line 396
    .line 397
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;->hashCode()I

    .line 398
    .line 399
    .line 400
    move-result v1

    .line 401
    goto :goto_1b

    .line 402
    :cond_1c
    move v1, v2

    .line 403
    :goto_1b
    add-int/2addr v0, v1

    .line 404
    mul-int/lit8 v0, v0, 0x29

    .line 405
    .line 406
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 407
    .line 408
    if-eqz v1, :cond_1d

    .line 409
    .line 410
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->hashCode()I

    .line 411
    .line 412
    .line 413
    move-result v1

    .line 414
    goto :goto_1c

    .line 415
    :cond_1d
    move v1, v2

    .line 416
    :goto_1c
    add-int/2addr v0, v1

    .line 417
    mul-int/lit8 v0, v0, 0x29

    .line 418
    .line 419
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 420
    .line 421
    if-eqz v1, :cond_1e

    .line 422
    .line 423
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->hashCode()I

    .line 424
    .line 425
    .line 426
    move-result v1

    .line 427
    goto :goto_1d

    .line 428
    :cond_1e
    move v1, v2

    .line 429
    :goto_1d
    add-int/2addr v0, v1

    .line 430
    mul-int/lit8 v0, v0, 0x29

    .line 431
    .line 432
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 433
    .line 434
    if-eqz v1, :cond_1f

    .line 435
    .line 436
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 437
    .line 438
    .line 439
    move-result v2

    .line 440
    :cond_1f
    add-int/2addr v0, v2

    .line 441
    mul-int/lit8 v0, v0, 0x29

    .line 442
    .line 443
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 444
    .line 445
    add-int/2addr v0, v1

    .line 446
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 447
    .line 448
    :cond_20
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PromptLimit;->new_()Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MissMatch;->new_()Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SpecialCard;->new_()Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->new_()Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->new_()Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->new_()Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 60
    .line 61
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 62
    .line 63
    if-nez v0, :cond_6

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->new_()Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GraduateActivity;->new_()Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 80
    .line 81
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 82
    .line 83
    if-nez v0, :cond_8

    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 94
    .line 95
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 96
    .line 97
    if-nez v0, :cond_9

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->new_()Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 104
    .line 105
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 106
    .line 107
    if-nez v0, :cond_a

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->new_()Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 114
    .line 115
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 116
    .line 117
    if-nez v0, :cond_b

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/data/KeepConnection;->new_()Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 124
    .line 125
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 126
    .line 127
    if-nez v0, :cond_c

    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->new_()Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 134
    .line 135
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 136
    .line 137
    if-nez v0, :cond_d

    .line 138
    .line 139
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->new_()Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 144
    .line 145
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 146
    .line 147
    if-nez v0, :cond_e

    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AnonymityImg;->new_()Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 154
    .line 155
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 156
    .line 157
    if-nez v0, :cond_f

    .line 158
    .line 159
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->new_()Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 164
    .line 165
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 166
    .line 167
    if-nez v0, :cond_10

    .line 168
    .line 169
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 174
    .line 175
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 176
    .line 177
    if-nez v0, :cond_11

    .line 178
    .line 179
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->new_()Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 184
    .line 185
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 186
    .line 187
    if-nez v0, :cond_12

    .line 188
    .line 189
    new-instance v0, Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 195
    .line 196
    :cond_12
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
