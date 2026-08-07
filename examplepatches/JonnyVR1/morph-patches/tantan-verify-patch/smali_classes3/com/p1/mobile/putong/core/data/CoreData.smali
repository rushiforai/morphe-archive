.class public Lcom/p1/mobile/putong/core/data/CoreData;
.super Lcom/tantanapp/common/data/BaseData;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
            ">;"
        }
    .end annotation
.end field

.field public static PA_VERSION:I = 0x3c

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CoreData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "coredata"


# instance fields
.field public acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbc
    .end annotation
.end field

.field public accountRecords:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AccountRecord;",
            ">;"
        }
    .end annotation
.end field

.field public action:Lcom/p1/mobile/putong/core/data/ActionData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x81
    .end annotation
.end field

.field public actives:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x79
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Active;",
            ">;"
        }
    .end annotation
.end field

.field public advancedSettings:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
            ">;"
        }
    .end annotation
.end field

.field public aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10d
    .end annotation
.end field

.field public aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10e
    .end annotation
.end field

.field public aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xba
    .end annotation
.end field

.field public analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x118
    .end annotation
.end field

.field public anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x89
    .end annotation
.end field

.field public appealInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AppealInfo;",
            ">;"
        }
    .end annotation
.end field

.field public audioTexts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x47
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AudioText;",
            ">;"
        }
    .end annotation
.end field

.field public auditPictureTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AuditPictureTag;",
            ">;"
        }
    .end annotation
.end field

.field public autoDeducts:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AutoDeducts;",
            ">;"
        }
    .end annotation
.end field

.field public avatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7f
    .end annotation
.end field

.field public barLoverCities:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BarLoverCitys;",
            ">;"
        }
    .end annotation
.end field

.field public barLoverPlaces:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe0
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BarLoverplaces;",
            ">;"
        }
    .end annotation
.end field

.field public bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x61
    .end annotation
.end field

.field public blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc1
    .end annotation
.end field

.field public boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb8
    .end annotation
.end field

.field public boostStatus:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BoostStatus;",
            ">;"
        }
    .end annotation
.end field

.field public bundles:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/StickerBundle;",
            ">;"
        }
    .end annotation
.end field

.field public buzzUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BuzzUser;",
            ">;"
        }
    .end annotation
.end field

.field public campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbe
    .end annotation
.end field

.field public camping:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xaa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SamesCardData;",
            ">;"
        }
    .end annotation
.end field

.field public canChange:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x112
    .end annotation
.end field

.field public cardCornerMarks:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardCornerMark;",
            ">;"
        }
    .end annotation
.end field

.field public cardExtraInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x53
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardExtraInfo;",
            ">;"
        }
    .end annotation
.end field

.field public cardInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardInfos;",
            ">;"
        }
    .end annotation
.end field

.field public cardModels:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x73
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardModel;",
            ">;"
        }
    .end annotation
.end field

.field public cardStyles:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x46
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardStyle;",
            ">;"
        }
    .end annotation
.end field

.field public cardsIcons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardsIcons;",
            ">;"
        }
    .end annotation
.end field

.field public chatAssistantQuestions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa9
    .end annotation
.end field

.field public chatGroupMembers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
            ">;"
        }
    .end annotation
.end field

.field public chatGroups:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public chatHeatPermissions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x97
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PermissionsItem;",
            ">;"
        }
    .end annotation
.end field

.field public chatHeats:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x96
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatHeat;",
            ">;"
        }
    .end annotation
.end field

.field public chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x101
    .end annotation
.end field

.field public chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc4
    .end annotation
.end field

.field public chatPartnersSignals:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;",
            ">;"
        }
    .end annotation
.end field

.field public chatProfiles:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatProfile;",
            ">;"
        }
    .end annotation
.end field

.field public cipherId:Lcom/p1/mobile/putong/core/data/CipherId;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x91
    .end annotation
.end field

.field public cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc3
    .end annotation
.end field

.field public cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xcb
    .end annotation
.end field

.field public cityCData:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc0
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CityCData;",
            ">;"
        }
    .end annotation
.end field

.field public coins:Lcom/p1/mobile/putong/core/data/Coin;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public comStatusAwards:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x45
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ComStatusAward;",
            ">;"
        }
    .end annotation
.end field

.field public complain:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Complain;",
            ">;"
        }
    .end annotation
.end field

.field public compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12a
    .end annotation
.end field

.field public complimentTexts:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x129
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ComplimentText;",
            ">;"
        }
    .end annotation
.end field

.field public compliments:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;",
            ">;"
        }
    .end annotation
.end field

.field public contacts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Contact;",
            ">;"
        }
    .end annotation
.end field

.field public contract:Lcom/p1/mobile/putong/data/Contract;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public contractInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            ">;"
        }
    .end annotation
.end field

.field public conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public conversations:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation
.end field

.field public count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb0
    .end annotation
.end field

.field public countdownLikes:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CountdownItem;",
            ">;"
        }
    .end annotation
.end field

.field public counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public coupons:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public creditScores:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x116
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CreditScoreData;",
            ">;"
        }
    .end annotation
.end field

.field public descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xde
    .end annotation
.end field

.field public details:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DetectText;",
            ">;"
        }
    .end annotation
.end field

.field public diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x111
    .end annotation
.end field

.field public dislikedUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x117
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/DislikedUsers;",
            ">;"
        }
    .end annotation
.end field

.field public dynamicLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/DynamicLable;",
            ">;"
        }
    .end annotation
.end field

.field public evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6f
    .end annotation
.end field

.field public evaluationReports:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/EvaluationReport;",
            ">;"
        }
    .end annotation
.end field

.field public evaluations:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Evaluation;",
            ">;"
        }
    .end annotation
.end field

.field public explore:Lcom/p1/mobile/putong/core/data/Explore;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe7
    .end annotation
.end field

.field public exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa5
    .end annotation
.end field

.field public extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8d
    .end annotation
.end field

.field public extremePickByList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ExtremePickItem;",
            ">;"
        }
    .end annotation
.end field

.field public extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb5
    .end annotation
.end field

.field public faceidTokens:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FaceidToken;",
            ">;"
        }
    .end annotation
.end field

.field public fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xea
    .end annotation
.end field

.field public fakePhotoFeedback:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xef
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;",
            ">;"
        }
    .end annotation
.end field

.field public fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xdc
    .end annotation
.end field

.field public fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe2
    .end annotation
.end field

.field public features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xed
    .end annotation
.end field

.field public feedbackQuestions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FeedbackQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public feedbackRemainedNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10b
    .end annotation
.end field

.field public figures:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Figure;",
            ">;"
        }
    .end annotation
.end field

.field public floats:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa0
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FloatsCardData;",
            ">;"
        }
    .end annotation
.end field

.field public freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x67
    .end annotation
.end field

.field public freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x68
    .end annotation
.end field

.field public friends:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/FriendInfo;",
            ">;"
        }
    .end annotation
.end field

.field public giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x48
    .end annotation
.end field

.field public giftInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;"
        }
    .end annotation
.end field

.field public giftPanel:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x49
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftPanel;",
            ">;"
        }
    .end annotation
.end field

.field public giftWallRankInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;",
            ">;"
        }
    .end annotation
.end field

.field public giftWallSocials:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GiftWallSocial;",
            ">;"
        }
    .end annotation
.end field

.field public giftWallTitles:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GiftWallTitle;",
            ">;"
        }
    .end annotation
.end field

.field public greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4f
    .end annotation
.end field

.field public greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7d
    .end annotation
.end field

.field public greetingNewPeople:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserIdType;",
            ">;"
        }
    .end annotation
.end field

.field public greetingNewPeopleMessage:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;",
            ">;"
        }
    .end annotation
.end field

.field public greetingPermissions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x50
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GreetingPermission;",
            ">;"
        }
    .end annotation
.end field

.field public greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x99
    .end annotation
.end field

.field public greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5b
    .end annotation
.end field

.field public greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x51
    .end annotation
.end field

.field public greetings:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;"
        }
    .end annotation
.end field

.field public greets:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x72
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserGreetInfo;",
            ">;"
        }
    .end annotation
.end field

.field public groupApplies:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupApply;",
            ">;"
        }
    .end annotation
.end field

.field public groupAttributes:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupAttribute;",
            ">;"
        }
    .end annotation
.end field

.field public groupNotifications:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupNotification;",
            ">;"
        }
    .end annotation
.end field

.field public groupSettings:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x31
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupSetting;",
            ">;"
        }
    .end annotation
.end field

.field public groupTabs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupTab;",
            ">;"
        }
    .end annotation
.end field

.field public growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbb
    .end annotation
.end field

.field public heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x74
    .end annotation
.end field

.field public heartbeats:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/HeartBeat;",
            ">;"
        }
    .end annotation
.end field

.field public hint:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x52
    .end annotation
.end field

.field public iapAffiliatePromotions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;"
        }
    .end annotation
.end field

.field public iceBreakQuestions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public iceBreakings:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;"
        }
    .end annotation
.end field

.field public idealDetails:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;"
        }
    .end annotation
.end field

.field public idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf4
    .end annotation
.end field

.field public idealInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IdealInfo;",
            ">;"
        }
    .end annotation
.end field

.field public instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10c
    .end annotation
.end field

.field public instantMatchGiveCountInfo:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x115
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;",
            ">;"
        }
    .end annotation
.end field

.field public instantMatchUserInfo:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;",
            ">;"
        }
    .end annotation
.end field

.field public interestedGroups:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11d
    .end annotation
.end field

.field public intlInsertCardSets:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x78
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InsertCard;",
            ">;"
        }
    .end annotation
.end field

.field public intlVisitorInfo:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xaf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IntlVisitor;",
            ">;"
        }
    .end annotation
.end field

.field public invalidCardList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbd
    .end annotation
.end field

.field public invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10f
    .end annotation
.end field

.field public ipRegion:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IPRegion;",
            ">;"
        }
    .end annotation
.end field

.field public isHit:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x62
    .end annotation
.end field

.field public isRecallUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb4
    .end annotation
.end field

.field public jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9b
    .end annotation
.end field

.field public keywords:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x30
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public latestMoments:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;",
            ">;"
        }
    .end annotation
.end field

.field public layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd6
    .end annotation
.end field

.field public likeUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;"
        }
    .end annotation
.end field

.field public likedByToday:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x109
    .end annotation
.end field

.field public likedMes:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CardStyle;",
            ">;"
        }
    .end annotation
.end field

.field public likedUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LikedUser;",
            ">;"
        }
    .end annotation
.end field

.field public link:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa2
    .end annotation
.end field

.field public links:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Link;",
            ">;"
        }
    .end annotation
.end field

.field public literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x88
    .end annotation
.end field

.field public literatures:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x65
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;"
        }
    .end annotation
.end field

.field public literaturesComments:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x64
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation
.end field

.field public liveActivities:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xac
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;",
            ">;"
        }
    .end annotation
.end field

.field public liveLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/UserLiveLabel;",
            ">;"
        }
    .end annotation
.end field

.field public liveSchemas:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiveSchema;",
            ">;"
        }
    .end annotation
.end field

.field public lives:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;"
        }
    .end annotation
.end field

.field public love520:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SamesCardData;",
            ">;"
        }
    .end annotation
.end field

.field public loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfe
    .end annotation
.end field

.field public loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x100
    .end annotation
.end field

.field public loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xff
    .end annotation
.end field

.field public lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc9
    .end annotation
.end field

.field public marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd0
    .end annotation
.end field

.field public membershipRecommendUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x66
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;",
            ">;"
        }
    .end annotation
.end field

.field public membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11e
    .end annotation
.end field

.field public menus:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;",
            ">;"
        }
    .end annotation
.end field

.field public merchandises:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public messages:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public mkt_activity_flash:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xca
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SamesCardData;",
            ">;"
        }
    .end annotation
.end field

.field public mkt_activity_quiz:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SamesCardData;",
            ">;"
        }
    .end annotation
.end field

.field public mkt_activity_regular:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xad
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SamesCardData;",
            ">;"
        }
    .end annotation
.end field

.field public moments:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xae
    .end annotation
.end field

.field public monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa1
    .end annotation
.end field

.field public monetizationPromotions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/MonetizationPromotion;",
            ">;"
        }
    .end annotation
.end field

.field public msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6e
    .end annotation
.end field

.field public myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5e
    .end annotation
.end field

.field public myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x77
    .end annotation
.end field

.field public myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x76
    .end annotation
.end field

.field public myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd8
    .end annotation
.end field

.field public myTabTasks:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x106
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/MyTabTask;",
            ">;"
        }
    .end annotation
.end field

.field public netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf1
    .end annotation
.end field

.field public newGiftWalls:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewGiftWall;",
            ">;"
        }
    .end annotation
.end field

.field public next:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x90
    .end annotation
.end field

.field public nextTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x104
    .end annotation
.end field

.field public notificationCounters:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NotificationCounter;",
            ">;"
        }
    .end annotation
.end field

.field public odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9d
    .end annotation
.end field

.field public officialAccounts:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/OfficialAccount;",
            ">;"
        }
    .end annotation
.end field

.field public oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x75
    .end annotation
.end field

.field public onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5c
    .end annotation
.end field

.field public orderInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x56
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            ">;"
        }
    .end annotation
.end field

.field public orders:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PaymentOrder;",
            ">;"
        }
    .end annotation
.end field

.field public packages:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ">;"
        }
    .end annotation
.end field

.field public partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbf
    .end annotation
.end field

.field public payWill:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa7
    .end annotation
.end field

.field public payWillInfo:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x121
    .end annotation
.end field

.field public payWillScore:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x123
    .end annotation
.end field

.field public payWillScoreThreshold:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x124
    .end annotation
.end field

.field public pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x103
    .end annotation
.end field

.field public picks:Lcom/p1/mobile/putong/core/data/Picks;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x59
    .end annotation
.end field

.field public picksInfo:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x126
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;",
            ">;"
        }
    .end annotation
.end field

.field public picksUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x58
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PicksUser;",
            ">;"
        }
    .end annotation
.end field

.field public pictureTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xdb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x110
    .end annotation
.end field

.field public popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9e
    .end annotation
.end field

.field public priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public privacySettings:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;",
            ">;"
        }
    .end annotation
.end field

.field public privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf8
    .end annotation
.end field

.field public privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xcd
    .end annotation
.end field

.field public privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xcc
    .end annotation
.end field

.field public privateQuestions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PrivateQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public privilegeGifts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x70
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PrivilegeGift;",
            ">;"
        }
    .end annotation
.end field

.field public profileCounts:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProfileCountInfo;",
            ">;"
        }
    .end annotation
.end field

.field public profileGuide:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd9
    .end annotation
.end field

.field public profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe3
    .end annotation
.end field

.field public profileLikesComments:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProfileLikeComment;",
            ">;"
        }
    .end annotation
.end field

.field public prologues:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x114
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Prologue;",
            ">;"
        }
    .end annotation
.end field

.field public purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11f
    .end annotation
.end field

.field public questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xec
    .end annotation
.end field

.field public questions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            ">;"
        }
    .end annotation
.end field

.field public quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x57
    .end annotation
.end field

.field public readMessages:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x54
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ReadMessage;",
            ">;"
        }
    .end annotation
.end field

.field public realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfd
    .end annotation
.end field

.field public realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfa
    .end annotation
.end field

.field public realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfb
    .end annotation
.end field

.field public recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xab
    .end annotation
.end field

.field public recentConversations:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x55
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/RecentConversation;",
            ">;"
        }
    .end annotation
.end field

.field public recommendList:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubset;",
            ">;"
        }
    .end annotation
.end field

.field public recommendMessages:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x71
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;"
        }
    .end annotation
.end field

.field public recommended:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x95
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Recommended;",
            ">;"
        }
    .end annotation
.end field

.field public redPackets:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/RedPacket;",
            ">;"
        }
    .end annotation
.end field

.field public refundDetails:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/RefundDetail;",
            ">;"
        }
    .end annotation
.end field

.field public relationships:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation
.end field

.field public reminders:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Reminder;",
            ">;"
        }
    .end annotation
.end field

.field public repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf0
    .end annotation
.end field

.field public resources:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x98
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ResourceTriggers;",
            ">;"
        }
    .end annotation
.end field

.field public risks:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xdf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/RiskSelfData;",
            ">;"
        }
    .end annotation
.end field

.field public sames:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x87
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SamesCardData;",
            ">;"
        }
    .end annotation
.end field

.field public schools:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/School;",
            ">;"
        }
    .end annotation
.end field

.field public scoreThresholdOther:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x125
    .end annotation
.end field

.field public seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa4
    .end annotation
.end field

.field public seeInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SeeInfos;",
            ">;"
        }
    .end annotation
.end field

.field public seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x94
    .end annotation
.end field

.field public seePortraits:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SeePortrait;",
            ">;"
        }
    .end annotation
.end field

.field public seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x107
    .end annotation
.end field

.field public seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x108
    .end annotation
.end field

.field public selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8e
    .end annotation
.end field

.field public selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd2
    .end annotation
.end field

.field public selectionUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SelectionUser;",
            ">;"
        }
    .end annotation
.end field

.field public settingGroups:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x32
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
            ">;"
        }
    .end annotation
.end field

.field public shareId:Lcom/p1/mobile/putong/core/data/ShareId;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x92
    .end annotation
.end field

.field public showOnlineForWhoIMeet:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x102
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;",
            ">;"
        }
    .end annotation
.end field

.field public speedUpCard:Lcom/p1/mobile/putong/core/data/Note;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x69
    .end annotation
.end field

.field public stateEmotion:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x93
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StateEmotion;",
            ">;"
        }
    .end annotation
.end field

.field public states:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public stickers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public suggestUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x80
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;",
            ">;"
        }
    .end annotation
.end field

.field public summarizedPrivilegePrices:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;",
            ">;"
        }
    .end annotation
.end field

.field public summarizedPrivileges:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public superLikeCount:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SuperLikeCount;",
            ">;"
        }
    .end annotation
.end field

.field public superlikeByCounts:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x127
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SuperlikeByCount;",
            ">;"
        }
    .end annotation
.end field

.field public surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc6
    .end annotation
.end field

.field public surpriseGiftExpirationTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc7
    .end annotation
.end field

.field public surveys:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Surveys;",
            ">;"
        }
    .end annotation
.end field

.field public svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe6
    .end annotation
.end field

.field public swipeUpperLimit:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x120
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;",
            ">;"
        }
    .end annotation
.end field

.field public systemQuestions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa3
    .end annotation
.end field

.field public tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7b
    .end annotation
.end field

.field public tagCategories:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x85
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TagCategories;",
            ">;"
        }
    .end annotation
.end field

.field public tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x84
    .end annotation
.end field

.field public tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x82
    .end annotation
.end field

.field public tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xda
    .end annotation
.end field

.field public tagUserCounts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x86
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TagUserCounts;",
            ">;"
        }
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x83
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6b
    .end annotation
.end field

.field public tickles:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TickleSettingInfo;",
            ">;"
        }
    .end annotation
.end field

.field public todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb9
    .end annotation
.end field

.field public ttcToDiamondRate:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x113
    .end annotation
.end field

.field public ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x128
    .end annotation
.end field

.field public unReadUserIds:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public urlTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UrlTag;",
            ">;"
        }
    .end annotation
.end field

.field public user:Lcom/p1/mobile/putong/data/User;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x63
    .end annotation
.end field

.field public userActivityInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xeb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/UserActivityInfo;",
            ">;"
        }
    .end annotation
.end field

.field public userAudits:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserAudits;",
            ">;"
        }
    .end annotation
.end field

.field public userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf2
    .end annotation
.end field

.field public userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xdd
    .end annotation
.end field

.field public userStickers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserSticker;",
            ">;"
        }
    .end annotation
.end field

.field public userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xee
    .end annotation
.end field

.field public verificationCenter:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public verificationLowLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x105
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public verificationTokens:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VerificationToken;",
            ">;"
        }
    .end annotation
.end field

.field public videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf9
    .end annotation
.end field

.field public vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe8
    .end annotation
.end field

.field public visitorAllCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x122
    .end annotation
.end field

.field public visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x119
    .end annotation
.end field

.field public visitorHiddens:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xcf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/VisitorHidden;",
            ">;"
        }
    .end annotation
.end field

.field public visitorInfo:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/VisitorInfo;",
            ">;"
        }
    .end annotation
.end field

.field public visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xce
    .end annotation
.end field

.field public voiceCall:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/VoiceCall;",
            ">;"
        }
    .end annotation
.end field

.field public voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x60
    .end annotation
.end field

.field public voices:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Voice;",
            ">;"
        }
    .end annotation
.end field

.field public wallet:Lcom/p1/mobile/putong/core/data/Wallet;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public walletAccounts:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/WalletAccount;",
            ">;"
        }
    .end annotation
.end field

.field public wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CoreData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/BaseData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/data/RiskSelfData;)Lcom/p1/mobile/putong/core/data/RiskSelfData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RiskSelfData;->clone()Lcom/p1/mobile/putong/core/data/RiskSelfData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/core/data/Greeting;)Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Greeting;->clone()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic A1(Lcom/p1/mobile/putong/core/data/OrderInfo;)Lcom/p1/mobile/putong/core/data/OrderInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/OrderInfo;->clone()Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/core/data/Sticker;)Lcom/p1/mobile/putong/core/data/Sticker;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Sticker;->clone()Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic B0(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic B1(Lcom/p1/mobile/putong/core/data/EvaluationReport;)Lcom/p1/mobile/putong/core/data/EvaluationReport;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/EvaluationReport;->clone()Lcom/p1/mobile/putong/core/data/EvaluationReport;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/data/Contact;)Lcom/p1/mobile/putong/data/Contact;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Contact;->clone()Lcom/p1/mobile/putong/data/Contact;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/data/UserActivityInfo;)Lcom/p1/mobile/putong/data/UserActivityInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserActivityInfo;->clone()Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic C1(Lcom/p1/mobile/putong/core/data/SeePortrait;)Lcom/p1/mobile/putong/core/data/SeePortrait;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SeePortrait;->clone()Lcom/p1/mobile/putong/core/data/SeePortrait;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/data/IdealInfo;)Lcom/p1/mobile/putong/core/data/IdealInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IdealInfo;->clone()Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;)Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;->clone()Lcom/p1/mobile/putong/core/data/InstantMatchGiveCountInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic D1(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;->clone()Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Lcom/p1/mobile/putong/core/data/UserPrivilege;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->clone()Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->clone()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic E1(Lcom/p1/mobile/putong/core/data/AppealInfo;)Lcom/p1/mobile/putong/core/data/AppealInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AppealInfo;->clone()Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/core/data/UserAudits;)Lcom/p1/mobile/putong/core/data/UserAudits;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserAudits;->clone()Lcom/p1/mobile/putong/core/data/UserAudits;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic F1(Lcom/p1/mobile/putong/core/data/IceBreakQuestion;)Lcom/p1/mobile/putong/core/data/IceBreakQuestion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->clone()Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/data/School;)Lcom/p1/mobile/putong/core/data/School;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/School;->clone()Lcom/p1/mobile/putong/core/data/School;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/core/data/ExtremePickItem;)Lcom/p1/mobile/putong/core/data/ExtremePickItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ExtremePickItem;->clone()Lcom/p1/mobile/putong/core/data/ExtremePickItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic G1(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->clone()Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/core/data/GroupTab;)Lcom/p1/mobile/putong/core/data/GroupTab;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GroupTab;->clone()Lcom/p1/mobile/putong/core/data/GroupTab;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic H1(Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;)Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;->clone()Lcom/p1/mobile/putong/core/data/SpecialSuggestUsers;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/core/data/Recommended;)Lcom/p1/mobile/putong/core/data/Recommended;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Recommended;->clone()Lcom/p1/mobile/putong/core/data/Recommended;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic I1(Lcom/p1/mobile/putong/core/data/FeedbackQuestion;)Lcom/p1/mobile/putong/core/data/FeedbackQuestion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;->clone()Lcom/p1/mobile/putong/core/data/FeedbackQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/core/data/ResourceTriggers;)Lcom/p1/mobile/putong/core/data/ResourceTriggers;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ResourceTriggers;->clone()Lcom/p1/mobile/putong/core/data/ResourceTriggers;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic J1(Lcom/p1/mobile/putong/core/data/Voice;)Lcom/p1/mobile/putong/core/data/Voice;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Voice;->clone()Lcom/p1/mobile/putong/core/data/Voice;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/data/NewTags;)Lcom/p1/mobile/putong/core/data/NewTags;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NewTags;->clone()Lcom/p1/mobile/putong/core/data/NewTags;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K0(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->clone()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K1(Lcom/p1/mobile/putong/core/data/SamesCardData;)Lcom/p1/mobile/putong/core/data/SamesCardData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SamesCardData;->clone()Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/data/CardStyle;)Lcom/p1/mobile/putong/core/data/CardStyle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardStyle;->clone()Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/core/data/ReadMessage;)Lcom/p1/mobile/putong/core/data/ReadMessage;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ReadMessage;->clone()Lcom/p1/mobile/putong/core/data/ReadMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L1(Lcom/p1/mobile/putong/core/data/StickerBundle;)Lcom/p1/mobile/putong/core/data/StickerBundle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/StickerBundle;->clone()Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/data/Figure;)Lcom/p1/mobile/putong/core/data/Figure;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Figure;->clone()Lcom/p1/mobile/putong/core/data/Figure;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M0(Lcom/p1/mobile/putong/core/data/Literatures;)Lcom/p1/mobile/putong/core/data/Literatures;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Literatures;->clone()Lcom/p1/mobile/putong/core/data/Literatures;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M1(Lcom/p1/mobile/putong/core/data/PicksUser;)Lcom/p1/mobile/putong/core/data/PicksUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PicksUser;->clone()Lcom/p1/mobile/putong/core/data/PicksUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/core/data/CityCData;)Lcom/p1/mobile/putong/core/data/CityCData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CityCData;->clone()Lcom/p1/mobile/putong/core/data/CityCData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic N1(Lcom/p1/mobile/putong/core/data/VisitorInfo;)Lcom/p1/mobile/putong/core/data/VisitorInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VisitorInfo;->clone()Lcom/p1/mobile/putong/core/data/VisitorInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/data/RecentConversation;)Lcom/p1/mobile/putong/core/data/RecentConversation;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RecentConversation;->clone()Lcom/p1/mobile/putong/core/data/RecentConversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic O0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic O1(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->clone()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/data/MyTabTask;)Lcom/p1/mobile/putong/core/data/MyTabTask;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyTabTask;->clone()Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P0(Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;)Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;->clone()Lcom/p1/mobile/putong/core/data/OfficialAccountsMenu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P1(Lcom/p1/mobile/putong/data/Relationship;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Relationship;->clone()Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/data/BreakIce;)Lcom/p1/mobile/putong/core/data/BreakIce;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BreakIce;->clone()Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q0(Lcom/p1/mobile/putong/core/data/BoostStatus;)Lcom/p1/mobile/putong/core/data/BoostStatus;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BoostStatus;->clone()Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q1(Lcom/p1/mobile/putong/core/data/SamesCardData;)Lcom/p1/mobile/putong/core/data/SamesCardData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SamesCardData;->clone()Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/data/AccountRecord;)Lcom/p1/mobile/putong/core/data/AccountRecord;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AccountRecord;->clone()Lcom/p1/mobile/putong/core/data/AccountRecord;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->clone()Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R1(Lcom/p1/mobile/putong/core/data/CardsIcons;)Lcom/p1/mobile/putong/core/data/CardsIcons;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardsIcons;->clone()Lcom/p1/mobile/putong/core/data/CardsIcons;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/data/CardCornerMark;)Lcom/p1/mobile/putong/core/data/CardCornerMark;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardCornerMark;->clone()Lcom/p1/mobile/putong/core/data/CardCornerMark;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;)Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->clone()Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S1(Lcom/p1/mobile/putong/core/data/NewGiftWall;)Lcom/p1/mobile/putong/core/data/NewGiftWall;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NewGiftWall;->clone()Lcom/p1/mobile/putong/core/data/NewGiftWall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/data/ComplimentText;)Lcom/p1/mobile/putong/core/data/ComplimentText;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ComplimentText;->clone()Lcom/p1/mobile/putong/core/data/ComplimentText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic T0(Lcom/p1/mobile/putong/core/data/Coupon;)Lcom/p1/mobile/putong/core/data/Coupon;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Coupon;->clone()Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic T1(Lcom/p1/mobile/putong/core/data/RedPacket;)Lcom/p1/mobile/putong/core/data/RedPacket;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RedPacket;->clone()Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;)Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;->clone()Lcom/p1/mobile/putong/core/data/FakePhotoFeedback;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;)Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;->clone()Lcom/p1/mobile/putong/core/data/ShowOnlineForWhoIMeet;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U1(Lcom/p1/mobile/putong/core/data/IntlVisitor;)Lcom/p1/mobile/putong/core/data/IntlVisitor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IntlVisitor;->clone()Lcom/p1/mobile/putong/core/data/IntlVisitor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/data/AutoDeducts;)Lcom/p1/mobile/putong/core/data/AutoDeducts;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AutoDeducts;->clone()Lcom/p1/mobile/putong/core/data/AutoDeducts;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic V0(Lcom/p1/mobile/putong/core/data/LikeUser;)Lcom/p1/mobile/putong/core/data/LikeUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LikeUser;->clone()Lcom/p1/mobile/putong/core/data/LikeUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic V1(Lcom/p1/mobile/putong/core/data/FloatsCardData;)Lcom/p1/mobile/putong/core/data/FloatsCardData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/FloatsCardData;->clone()Lcom/p1/mobile/putong/core/data/FloatsCardData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/data/AuditPictureTag;)Lcom/p1/mobile/putong/core/data/AuditPictureTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AuditPictureTag;->clone()Lcom/p1/mobile/putong/core/data/AuditPictureTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W0(Lcom/p1/mobile/putong/core/data/GiftWallTitle;)Lcom/p1/mobile/putong/core/data/GiftWallTitle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GiftWallTitle;->clone()Lcom/p1/mobile/putong/core/data/GiftWallTitle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W1(Lcom/p1/mobile/putong/core/data/TickleSettingInfo;)Lcom/p1/mobile/putong/core/data/TickleSettingInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TickleSettingInfo;->clone()Lcom/p1/mobile/putong/core/data/TickleSettingInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/data/InsertCard;)Lcom/p1/mobile/putong/core/data/InsertCard;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/InsertCard;->clone()Lcom/p1/mobile/putong/core/data/InsertCard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic X0(Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;)Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->clone()Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/data/StickerPackage;)Lcom/p1/mobile/putong/core/data/StickerPackage;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/StickerPackage;->clone()Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/data/SuperlikeByCount;)Lcom/p1/mobile/putong/core/data/SuperlikeByCount;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SuperlikeByCount;->clone()Lcom/p1/mobile/putong/core/data/SuperlikeByCount;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/core/data/WalletAccount;)Lcom/p1/mobile/putong/core/data/WalletAccount;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/WalletAccount;->clone()Lcom/p1/mobile/putong/core/data/WalletAccount;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;)Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->clone()Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;)Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;->clone()Lcom/p1/mobile/putong/core/data/InstantMatchUserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Z0(Lcom/p1/mobile/putong/core/data/DynamicLable;)Lcom/p1/mobile/putong/core/data/DynamicLable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/DynamicLable;->clone()Lcom/p1/mobile/putong/core/data/DynamicLable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;)Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;->clone()Lcom/p1/mobile/putong/core/data/GreetingNewPeopleMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/TagUserCounts;)Lcom/p1/mobile/putong/core/data/TagUserCounts;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TagUserCounts;->clone()Lcom/p1/mobile/putong/core/data/TagUserCounts;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic a1(Lcom/p1/mobile/putong/core/data/Complain;)Lcom/p1/mobile/putong/core/data/Complain;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Complain;->clone()Lcom/p1/mobile/putong/core/data/Complain;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/data/CoreGiftPanel;)Lcom/p1/mobile/putong/core/data/CoreGiftPanel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreGiftPanel;->clone()Lcom/p1/mobile/putong/core/data/CoreGiftPanel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/ChatGroup;)Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->clone()Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/data/VoiceCall;)Lcom/p1/mobile/putong/core/data/VoiceCall;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VoiceCall;->clone()Lcom/p1/mobile/putong/core/data/VoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b1(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lcom/p1/mobile/putong/core/data/VerificationCenter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VerificationCenter;->clone()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/UserGreetInfo;)Lcom/p1/mobile/putong/core/data/UserGreetInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserGreetInfo;->clone()Lcom/p1/mobile/putong/core/data/UserGreetInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/data/SamesCardData;)Lcom/p1/mobile/putong/core/data/SamesCardData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SamesCardData;->clone()Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/core/data/UserIdType;)Lcom/p1/mobile/putong/core/data/UserIdType;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserIdType;->clone()Lcom/p1/mobile/putong/core/data/UserIdType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/data/BarLoverplaces;)Lcom/p1/mobile/putong/core/data/BarLoverplaces;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BarLoverplaces;->clone()Lcom/p1/mobile/putong/core/data/BarLoverplaces;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/DetectText;)Lcom/p1/mobile/putong/data/DetectText;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DetectText;->clone()Lcom/p1/mobile/putong/data/DetectText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/data/StateEmotion;)Lcom/p1/mobile/putong/data/StateEmotion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/StateEmotion;->clone()Lcom/p1/mobile/putong/data/StateEmotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d1(Lcom/p1/mobile/putong/core/data/TribeSubset;)Lcom/p1/mobile/putong/core/data/TribeSubset;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TribeSubset;->clone()Lcom/p1/mobile/putong/core/data/TribeSubset;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/data/LikedUser;)Lcom/p1/mobile/putong/core/data/LikedUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LikedUser;->clone()Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/PermissionsItem;)Lcom/p1/mobile/putong/core/data/PermissionsItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PermissionsItem;->clone()Lcom/p1/mobile/putong/core/data/PermissionsItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e1(Lcom/p1/mobile/putong/core/data/Question;)Lcom/p1/mobile/putong/core/data/Question;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Question;->clone()Lcom/p1/mobile/putong/core/data/Question;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/core/data/BuzzUser;)Lcom/p1/mobile/putong/core/data/BuzzUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BuzzUser;->clone()Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/IPRegion;)Lcom/p1/mobile/putong/core/data/IPRegion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IPRegion;->clone()Lcom/p1/mobile/putong/core/data/IPRegion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/data/Message;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->clone()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f1(Lcom/p1/mobile/putong/core/data/AudioText;)Lcom/p1/mobile/putong/core/data/AudioText;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AudioText;->clone()Lcom/p1/mobile/putong/core/data/AudioText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f2(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/data/Live;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Live;->clone()Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/Link;)Lcom/p1/mobile/putong/data/Link;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Link;->clone()Lcom/p1/mobile/putong/data/Link;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g1(Lcom/p1/mobile/putong/data/UserLiveLabel;)Lcom/p1/mobile/putong/data/UserLiveLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserLiveLabel;->clone()Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/data/RecommendMessage;)Lcom/p1/mobile/putong/data/RecommendMessage;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/RecommendMessage;->clone()Lcom/p1/mobile/putong/data/RecommendMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/data/CardInfos;)Lcom/p1/mobile/putong/core/data/CardInfos;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardInfos;->clone()Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic h1(Lcom/p1/mobile/putong/core/data/TagCategories;)Lcom/p1/mobile/putong/core/data/TagCategories;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TagCategories;->clone()Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/core/data/GroupApply;)Lcom/p1/mobile/putong/core/data/GroupApply;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GroupApply;->clone()Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/data/SelectionUser;)Lcom/p1/mobile/putong/core/data/SelectionUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SelectionUser;->clone()Lcom/p1/mobile/putong/core/data/SelectionUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i1(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Lcom/p1/mobile/putong/core/data/LiteraturesComments;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->clone()Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/core/data/SamesCardData;)Lcom/p1/mobile/putong/core/data/SamesCardData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SamesCardData;->clone()Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/PrivateQuestion;)Lcom/p1/mobile/putong/core/data/PrivateQuestion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->clone()Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j1(Lcom/p1/mobile/putong/core/data/PrivilegeGift;)Lcom/p1/mobile/putong/core/data/PrivilegeGift;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PrivilegeGift;->clone()Lcom/p1/mobile/putong/core/data/PrivilegeGift;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j2(Lcom/p1/mobile/putong/core/data/Merchandise;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->clone()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/data/GroupAttribute;)Lcom/p1/mobile/putong/core/data/GroupAttribute;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GroupAttribute;->clone()Lcom/p1/mobile/putong/core/data/GroupAttribute;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/data/Surveys;)Lcom/p1/mobile/putong/core/data/Surveys;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Surveys;->clone()Lcom/p1/mobile/putong/core/data/Surveys;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k1(Lcom/p1/mobile/putong/core/data/Active;)Lcom/p1/mobile/putong/core/data/Active;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Active;->clone()Lcom/p1/mobile/putong/core/data/Active;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k2(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/data/UserSticker;)Lcom/p1/mobile/putong/core/data/UserSticker;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserSticker;->clone()Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/data/SamesCardData;)Lcom/p1/mobile/putong/core/data/SamesCardData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SamesCardData;->clone()Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l1(Lcom/p1/mobile/putong/core/data/SamesCardData;)Lcom/p1/mobile/putong/core/data/SamesCardData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SamesCardData;->clone()Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/core/data/ComStatusAward;)Lcom/p1/mobile/putong/core/data/ComStatusAward;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ComStatusAward;->clone()Lcom/p1/mobile/putong/core/data/ComStatusAward;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/data/Reminder;)Lcom/p1/mobile/putong/core/data/Reminder;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Reminder;->clone()Lcom/p1/mobile/putong/core/data/Reminder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/data/SuperLikeCount;)Lcom/p1/mobile/putong/core/data/SuperLikeCount;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SuperLikeCount;->clone()Lcom/p1/mobile/putong/core/data/SuperLikeCount;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m1(Lcom/p1/mobile/putong/data/VerificationToken;)Lcom/p1/mobile/putong/data/VerificationToken;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationToken;->clone()Lcom/p1/mobile/putong/data/VerificationToken;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/core/data/Evaluation;)Lcom/p1/mobile/putong/core/data/Evaluation;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Evaluation;->clone()Lcom/p1/mobile/putong/core/data/Evaluation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;)Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->clone()Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/data/VisitorHidden;)Lcom/p1/mobile/putong/core/data/VisitorHidden;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VisitorHidden;->clone()Lcom/p1/mobile/putong/core/data/VisitorHidden;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n1(Lcom/p1/mobile/putong/core/data/PaymentOrder;)Lcom/p1/mobile/putong/core/data/PaymentOrder;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PaymentOrder;->clone()Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/core/data/RefundDetail;)Lcom/p1/mobile/putong/core/data/RefundDetail;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RefundDetail;->clone()Lcom/p1/mobile/putong/core/data/RefundDetail;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/CoreData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CoreData;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/data/ChatProfile;)Lcom/p1/mobile/putong/core/data/ChatProfile;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatProfile;->clone()Lcom/p1/mobile/putong/core/data/ChatProfile;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/data/GroupNotification;)Lcom/p1/mobile/putong/core/data/GroupNotification;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GroupNotification;->clone()Lcom/p1/mobile/putong/core/data/GroupNotification;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o1(Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;)Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;->clone()Lcom/p1/mobile/putong/core/data/ChatPartnersHistoryItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/core/data/GreetingPermission;)Lcom/p1/mobile/putong/core/data/GreetingPermission;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GreetingPermission;->clone()Lcom/p1/mobile/putong/core/data/GreetingPermission;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/GiftWallSocial;)Lcom/p1/mobile/putong/core/data/GiftWallSocial;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GiftWallSocial;->clone()Lcom/p1/mobile/putong/core/data/GiftWallSocial;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/data/CardStyle;)Lcom/p1/mobile/putong/core/data/CardStyle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardStyle;->clone()Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p1(Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;)Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;->clone()Lcom/p1/mobile/putong/core/data/ConversationLatestMoment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;)Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;->clone()Lcom/p1/mobile/putong/core/data/SwipeUpperLimit;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/data/GroupSetting;)Lcom/p1/mobile/putong/core/data/GroupSetting;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GroupSetting;->clone()Lcom/p1/mobile/putong/core/data/GroupSetting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;)Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;->clone()Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q1(Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;)Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->clone()Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/core/data/CardModel;)Lcom/p1/mobile/putong/core/data/CardModel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardModel;->clone()Lcom/p1/mobile/putong/core/data/CardModel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/data/FaceidToken;)Lcom/p1/mobile/putong/core/data/FaceidToken;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/FaceidToken;->clone()Lcom/p1/mobile/putong/core/data/FaceidToken;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/IdealTag;->clone()Lcom/p1/mobile/putong/data/IdealTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r1(Lcom/p1/mobile/putong/core/data/HeartBeat;)Lcom/p1/mobile/putong/core/data/HeartBeat;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/HeartBeat;->clone()Lcom/p1/mobile/putong/core/data/HeartBeat;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/data/ContractInfo;)Lcom/p1/mobile/putong/core/data/ContractInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ContractInfo;->clone()Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/data/CardExtraInfo;)Lcom/p1/mobile/putong/core/data/CardExtraInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardExtraInfo;->clone()Lcom/p1/mobile/putong/core/data/CardExtraInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s1(Lcom/p1/mobile/putong/core/data/LiveSchema;)Lcom/p1/mobile/putong/core/data/LiveSchema;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LiveSchema;->clone()Lcom/p1/mobile/putong/core/data/LiveSchema;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/data/FriendInfo;)Lcom/p1/mobile/putong/core/data/FriendInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/FriendInfo;->clone()Lcom/p1/mobile/putong/core/data/FriendInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/core/data/ProfileCountInfo;)Lcom/p1/mobile/putong/core/data/ProfileCountInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileCountInfo;->clone()Lcom/p1/mobile/putong/core/data/ProfileCountInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic t1(Lcom/p1/mobile/putong/core/data/NotificationCounter;)Lcom/p1/mobile/putong/core/data/NotificationCounter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NotificationCounter;->clone()Lcom/p1/mobile/putong/core/data/NotificationCounter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic u(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/core/data/MonetizationPromotion;)Lcom/p1/mobile/putong/core/data/MonetizationPromotion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MonetizationPromotion;->clone()Lcom/p1/mobile/putong/core/data/MonetizationPromotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic u1(Lcom/p1/mobile/putong/core/data/ChatGroup;)Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->clone()Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v0(Lcom/p1/mobile/putong/core/data/CountdownItem;)Lcom/p1/mobile/putong/core/data/CountdownItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CountdownItem;->clone()Lcom/p1/mobile/putong/core/data/CountdownItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v1(Lcom/p1/mobile/putong/core/data/BarLoverCitys;)Lcom/p1/mobile/putong/core/data/BarLoverCitys;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BarLoverCitys;->clone()Lcom/p1/mobile/putong/core/data/BarLoverCitys;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/data/SeeInfos;)Lcom/p1/mobile/putong/core/data/SeeInfos;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SeeInfos;->clone()Lcom/p1/mobile/putong/core/data/SeeInfos;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w0(Lcom/p1/mobile/putong/core/data/ChatHeat;)Lcom/p1/mobile/putong/core/data/ChatHeat;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatHeat;->clone()Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w1(Lcom/p1/mobile/putong/data/BubbleInfo;)Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/BubbleInfo;->clone()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/data/CreditScoreData;)Lcom/p1/mobile/putong/core/data/CreditScoreData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CreditScoreData;->clone()Lcom/p1/mobile/putong/core/data/CreditScoreData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/core/data/Prologue;)Lcom/p1/mobile/putong/core/data/Prologue;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Prologue;->clone()Lcom/p1/mobile/putong/core/data/Prologue;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x1(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->clone()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/data/OfficialAccount;)Lcom/p1/mobile/putong/core/data/OfficialAccount;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/OfficialAccount;->clone()Lcom/p1/mobile/putong/core/data/OfficialAccount;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/core/data/NewTags;)Lcom/p1/mobile/putong/core/data/NewTags;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NewTags;->clone()Lcom/p1/mobile/putong/core/data/NewTags;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic y1(Lcom/p1/mobile/putong/core/data/DislikedUsers;)Lcom/p1/mobile/putong/core/data/DislikedUsers;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/DislikedUsers;->clone()Lcom/p1/mobile/putong/core/data/DislikedUsers;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/data/UrlTag;)Lcom/p1/mobile/putong/core/data/UrlTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UrlTag;->clone()Lcom/p1/mobile/putong/core/data/UrlTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/core/data/ProfileLikeComment;)Lcom/p1/mobile/putong/core/data/ProfileLikeComment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->clone()Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic z1(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SettingGroups;->clone()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public addAll(Lcom/tantanapp/common/data/BaseData;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/BaseData;->addAll(Lcom/tantanapp/common/data/BaseData;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 53
    .line 54
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 74
    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 354
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreData;->clone()Lcom/p1/mobile/putong/core/data/CoreData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CoreData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CoreData;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    if-eqz v1, :cond_0

    new-instance v2, Ll/ud8;

    invoke-direct {v2}, Ll/ud8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 3
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    if-eqz v1, :cond_1

    new-instance v2, Ll/wi8;

    invoke-direct {v2}, Ll/wi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 4
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    if-eqz v1, :cond_2

    new-instance v2, Ll/ij8;

    invoke-direct {v2}, Ll/ij8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 5
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    if-eqz v1, :cond_3

    new-instance v2, Ll/uj8;

    invoke-direct {v2}, Ll/uj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 6
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    if-eqz v1, :cond_4

    new-instance v2, Ll/be8;

    invoke-direct {v2}, Ll/be8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 7
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    if-eqz v1, :cond_5

    new-instance v2, Ll/ne8;

    invoke-direct {v2}, Ll/ne8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 8
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    if-eqz v1, :cond_6

    new-instance v2, Ll/ze8;

    invoke-direct {v2}, Ll/ze8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 9
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    if-eqz v1, :cond_7

    new-instance v2, Ll/lf8;

    invoke-direct {v2}, Ll/lf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 10
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    if-eqz v1, :cond_8

    new-instance v2, Ll/yf8;

    invoke-direct {v2}, Ll/yf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 11
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    if-eqz v1, :cond_9

    new-instance v2, Ll/kg8;

    invoke-direct {v2}, Ll/kg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 12
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    if-eqz v1, :cond_a

    new-instance v2, Ll/qe8;

    invoke-direct {v2}, Ll/qe8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 13
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    if-eqz v1, :cond_b

    .line 14
    new-instance v2, Ll/sg8;

    invoke-direct {v2}, Ll/sg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 15
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Wallet;->clone()Lcom/p1/mobile/putong/core/data/Wallet;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 16
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    if-eqz v1, :cond_d

    .line 17
    new-instance v2, Ll/eh8;

    invoke-direct {v2}, Ll/eh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    .line 18
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    if-eqz v1, :cond_e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Coin;->clone()Lcom/p1/mobile/putong/core/data/Coin;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    .line 19
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    if-eqz v1, :cond_f

    .line 20
    new-instance v2, Ll/qh8;

    invoke-direct {v2}, Ll/qh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    .line 21
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    if-eqz v1, :cond_10

    new-instance v2, Ll/ci8;

    invoke-direct {v2}, Ll/ci8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    .line 22
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    if-eqz v1, :cond_11

    new-instance v2, Ll/oi8;

    invoke-direct {v2}, Ll/oi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 23
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    if-eqz v1, :cond_12

    new-instance v2, Ll/ri8;

    invoke-direct {v2}, Ll/ri8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    .line 24
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    if-eqz v1, :cond_13

    new-instance v2, Ll/ti8;

    invoke-direct {v2}, Ll/ti8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    .line 25
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    if-eqz v1, :cond_14

    new-instance v2, Ll/ui8;

    invoke-direct {v2}, Ll/ui8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 26
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    if-eqz v1, :cond_15

    new-instance v2, Ll/vi8;

    invoke-direct {v2}, Ll/vi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    .line 27
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    if-eqz v1, :cond_16

    .line 28
    new-instance v2, Ll/xi8;

    invoke-direct {v2}, Ll/xi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 29
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    if-eqz v1, :cond_17

    .line 30
    new-instance v2, Ll/yi8;

    invoke-direct {v2}, Ll/yi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    .line 31
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    if-eqz v1, :cond_18

    new-instance v2, Ll/zi8;

    invoke-direct {v2}, Ll/zi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    .line 32
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    if-eqz v1, :cond_19

    new-instance v2, Ll/aj8;

    invoke-direct {v2}, Ll/aj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    .line 33
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    if-eqz v1, :cond_1a

    new-instance v2, Ll/bj8;

    invoke-direct {v2}, Ll/bj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    .line 34
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    if-eqz v1, :cond_1b

    new-instance v2, Ll/cj8;

    invoke-direct {v2}, Ll/cj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 35
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    if-eqz v1, :cond_1c

    new-instance v2, Ll/ej8;

    invoke-direct {v2}, Ll/ej8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    .line 36
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    if-eqz v1, :cond_1d

    new-instance v2, Ll/fj8;

    invoke-direct {v2}, Ll/fj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    .line 37
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    if-eqz v1, :cond_1e

    new-instance v2, Ll/gj8;

    invoke-direct {v2}, Ll/gj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 38
    :cond_1e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    if-eqz v1, :cond_1f

    new-instance v2, Ll/hj8;

    invoke-direct {v2}, Ll/hj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    .line 39
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    if-eqz v1, :cond_20

    new-instance v2, Ll/jj8;

    invoke-direct {v2}, Ll/jj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    .line 40
    :cond_20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    if-eqz v1, :cond_21

    new-instance v2, Ll/kj8;

    invoke-direct {v2}, Ll/kj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    .line 41
    :cond_21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    if-eqz v1, :cond_22

    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->clone()Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 43
    :cond_22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    if-eqz v1, :cond_23

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Contract;->clone()Lcom/p1/mobile/putong/data/Contract;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 44
    :cond_23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    if-eqz v1, :cond_24

    .line 45
    new-instance v2, Ll/lj8;

    invoke-direct {v2}, Ll/lj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    .line 46
    :cond_24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    if-eqz v1, :cond_25

    new-instance v2, Ll/mj8;

    invoke-direct {v2}, Ll/mj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    .line 47
    :cond_25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    if-eqz v1, :cond_26

    new-instance v2, Ll/nj8;

    invoke-direct {v2}, Ll/nj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    .line 48
    :cond_26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    if-eqz v1, :cond_27

    new-instance v2, Ll/pj8;

    invoke-direct {v2}, Ll/pj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 49
    :cond_27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    if-eqz v1, :cond_28

    .line 50
    new-instance v2, Ll/qj8;

    invoke-direct {v2}, Ll/qj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 51
    :cond_28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    if-eqz v1, :cond_29

    new-instance v2, Ll/rj8;

    invoke-direct {v2}, Ll/rj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 52
    :cond_29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    if-eqz v1, :cond_2a

    .line 53
    new-instance v2, Ll/sj8;

    invoke-direct {v2}, Ll/sj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    .line 54
    :cond_2a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    if-eqz v1, :cond_2b

    .line 55
    new-instance v2, Ll/tj8;

    invoke-direct {v2}, Ll/tj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    .line 56
    :cond_2b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    if-eqz v1, :cond_2c

    new-instance v2, Ll/vj8;

    invoke-direct {v2}, Ll/vj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    .line 57
    :cond_2c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    if-eqz v1, :cond_2d

    .line 58
    new-instance v2, Ll/wj8;

    invoke-direct {v2}, Ll/wj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 59
    :cond_2d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    if-eqz v1, :cond_2e

    new-instance v2, Ll/xj8;

    invoke-direct {v2}, Ll/xj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    .line 60
    :cond_2e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    if-eqz v1, :cond_2f

    new-instance v2, Ll/yj8;

    invoke-direct {v2}, Ll/yj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    .line 61
    :cond_2f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    if-eqz v1, :cond_30

    new-instance v2, Ll/vd8;

    invoke-direct {v2}, Ll/vd8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    .line 62
    :cond_30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    if-eqz v1, :cond_31

    new-instance v2, Ll/wd8;

    invoke-direct {v2}, Ll/wd8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    .line 63
    :cond_31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    if-eqz v1, :cond_32

    new-instance v2, Ll/xd8;

    invoke-direct {v2}, Ll/xd8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    .line 64
    :cond_32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    if-eqz v1, :cond_33

    .line 65
    new-instance v2, Ll/yd8;

    invoke-direct {v2}, Ll/yd8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    .line 66
    :cond_33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    if-eqz v1, :cond_34

    new-instance v2, Ll/zd8;

    invoke-direct {v2}, Ll/zd8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    .line 67
    :cond_34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    if-eqz v1, :cond_35

    new-instance v2, Ll/ae8;

    invoke-direct {v2}, Ll/ae8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    .line 68
    :cond_35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    if-eqz v1, :cond_36

    .line 69
    new-instance v2, Ll/ce8;

    invoke-direct {v2}, Ll/ce8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    .line 70
    :cond_36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    if-eqz v1, :cond_37

    new-instance v2, Ll/de8;

    invoke-direct {v2}, Ll/de8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    .line 71
    :cond_37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    if-eqz v1, :cond_38

    new-instance v2, Ll/ee8;

    invoke-direct {v2}, Ll/ee8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    .line 72
    :cond_38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    if-eqz v1, :cond_39

    new-instance v2, Ll/ge8;

    invoke-direct {v2}, Ll/ge8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    .line 73
    :cond_39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    if-eqz v1, :cond_3a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PriorityLike;->clone()Lcom/p1/mobile/putong/core/data/PriorityLike;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    .line 74
    :cond_3a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    if-eqz v1, :cond_3b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Couponbag;->clone()Lcom/p1/mobile/putong/core/data/Couponbag;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    .line 75
    :cond_3b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    if-eqz v1, :cond_3c

    new-instance v2, Ll/he8;

    invoke-direct {v2}, Ll/he8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 76
    :cond_3c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    if-eqz v1, :cond_3d

    new-instance v2, Ll/ie8;

    invoke-direct {v2}, Ll/ie8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    .line 77
    :cond_3d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    if-eqz v1, :cond_3e

    new-instance v2, Ll/je8;

    invoke-direct {v2}, Ll/je8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    .line 78
    :cond_3e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    if-eqz v1, :cond_3f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CounterVerification;->clone()Lcom/p1/mobile/putong/core/data/CounterVerification;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 79
    :cond_3f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    if-eqz v1, :cond_40

    new-instance v2, Ll/ke8;

    invoke-direct {v2}, Ll/ke8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 80
    :cond_40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    if-eqz v1, :cond_41

    new-instance v2, Ll/le8;

    invoke-direct {v2}, Ll/le8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    .line 81
    :cond_41
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    if-eqz v1, :cond_42

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationDiff;->clone()Lcom/p1/mobile/putong/core/data/ConversationDiff;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    .line 83
    :cond_42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    if-eqz v1, :cond_43

    new-instance v2, Ll/me8;

    invoke-direct {v2}, Ll/me8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    .line 84
    :cond_43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    if-eqz v1, :cond_44

    new-instance v2, Ll/oe8;

    invoke-direct {v2}, Ll/oe8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    .line 85
    :cond_44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    if-eqz v1, :cond_45

    new-instance v2, Ll/pe8;

    invoke-direct {v2}, Ll/pe8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    .line 86
    :cond_45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    if-eqz v1, :cond_46

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;->clone()Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    .line 87
    :cond_46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    if-eqz v1, :cond_47

    new-instance v2, Ll/re8;

    invoke-direct {v2}, Ll/re8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    .line 88
    :cond_47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    if-eqz v1, :cond_48

    new-instance v2, Ll/se8;

    invoke-direct {v2}, Ll/se8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    .line 89
    :cond_48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    if-eqz v1, :cond_49

    .line 90
    new-instance v2, Ll/te8;

    invoke-direct {v2}, Ll/te8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    .line 91
    :cond_49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    if-eqz v1, :cond_4a

    new-instance v2, Ll/ue8;

    invoke-direct {v2}, Ll/ue8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    .line 92
    :cond_4a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    if-eqz v1, :cond_4b

    new-instance v2, Ll/ve8;

    invoke-direct {v2}, Ll/ve8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    .line 93
    :cond_4b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    if-eqz v1, :cond_4c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->clone()Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 94
    :cond_4c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    if-eqz v1, :cond_4d

    new-instance v2, Ll/we8;

    invoke-direct {v2}, Ll/we8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    .line 95
    :cond_4d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    if-eqz v1, :cond_4e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingCounter;->clone()Lcom/p1/mobile/putong/core/data/GreetingCounter;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    .line 96
    :cond_4e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    if-eqz v1, :cond_4f

    .line 97
    new-instance v2, Ll/xe8;

    invoke-direct {v2}, Ll/xe8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    .line 98
    :cond_4f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    if-eqz v1, :cond_50

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingSummary;->clone()Lcom/p1/mobile/putong/core/data/GreetingSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 99
    :cond_50
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    if-eqz v1, :cond_51

    new-instance v2, Ll/ye8;

    invoke-direct {v2}, Ll/ye8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    .line 101
    :cond_51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    if-eqz v1, :cond_52

    new-instance v2, Ll/af8;

    invoke-direct {v2}, Ll/af8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    .line 102
    :cond_52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    if-eqz v1, :cond_53

    .line 103
    new-instance v2, Ll/cf8;

    invoke-direct {v2}, Ll/cf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    .line 104
    :cond_53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    if-eqz v1, :cond_54

    new-instance v2, Ll/df8;

    invoke-direct {v2}, Ll/df8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    .line 105
    :cond_54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    if-eqz v1, :cond_55

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->clone()Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 106
    :cond_55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    if-eqz v1, :cond_56

    new-instance v2, Ll/ef8;

    invoke-direct {v2}, Ll/ef8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    .line 107
    :cond_56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    if-eqz v1, :cond_57

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Picks;->clone()Lcom/p1/mobile/putong/core/data/Picks;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 108
    :cond_57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    if-eqz v1, :cond_58

    new-instance v2, Ll/ff8;

    invoke-direct {v2}, Ll/ff8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    .line 109
    :cond_58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    if-eqz v1, :cond_59

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingSetting;->clone()Lcom/p1/mobile/putong/core/data/GreetingSetting;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    .line 110
    :cond_59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    if-eqz v1, :cond_5a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->clone()Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    .line 111
    :cond_5a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    if-eqz v1, :cond_5b

    new-instance v2, Ll/gf8;

    invoke-direct {v2}, Ll/gf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 112
    :cond_5b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    if-eqz v1, :cond_5c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->clone()Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    .line 113
    :cond_5c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    if-eqz v1, :cond_5d

    new-instance v2, Ll/hf8;

    invoke-direct {v2}, Ll/hf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 114
    :cond_5d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    if-eqz v1, :cond_5e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;->clone()Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    .line 115
    :cond_5e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    if-eqz v1, :cond_5f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuickChatBellData;->clone()Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    .line 116
    :cond_5f
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    if-eqz v1, :cond_60

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    .line 118
    :cond_60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    if-eqz v1, :cond_61

    .line 119
    new-instance v2, Ll/if8;

    invoke-direct {v2}, Ll/if8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    .line 120
    :cond_61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    if-eqz v1, :cond_62

    new-instance v2, Ll/jf8;

    invoke-direct {v2}, Ll/jf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 121
    :cond_62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    if-eqz v1, :cond_63

    .line 122
    new-instance v2, Ll/kf8;

    invoke-direct {v2}, Ll/kf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    .line 123
    :cond_63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    if-eqz v1, :cond_64

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->clone()Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    .line 124
    :cond_64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    if-eqz v1, :cond_65

    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->clone()Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    .line 126
    :cond_65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    if-eqz v1, :cond_66

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Note;->clone()Lcom/p1/mobile/putong/core/data/Note;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    .line 127
    :cond_66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    if-eqz v1, :cond_67

    new-instance v2, Ll/nf8;

    invoke-direct {v2}, Ll/nf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 128
    :cond_67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    if-eqz v1, :cond_68

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->clone()Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    .line 129
    :cond_68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    if-eqz v1, :cond_69

    new-instance v2, Ll/of8;

    invoke-direct {v2}, Ll/of8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    .line 130
    :cond_69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    if-eqz v1, :cond_6a

    .line 131
    new-instance v2, Ll/pf8;

    invoke-direct {v2}, Ll/pf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    .line 132
    :cond_6a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    if-eqz v1, :cond_6b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->clone()Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 133
    :cond_6b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    if-eqz v1, :cond_6c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Evaluation;->clone()Lcom/p1/mobile/putong/core/data/Evaluation;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    .line 134
    :cond_6c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    if-eqz v1, :cond_6d

    new-instance v2, Ll/qf8;

    invoke-direct {v2}, Ll/qf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    .line 135
    :cond_6d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    if-eqz v1, :cond_6e

    .line 136
    new-instance v2, Ll/rf8;

    invoke-direct {v2}, Ll/rf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    .line 137
    :cond_6e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    if-eqz v1, :cond_6f

    new-instance v2, Ll/sf8;

    invoke-direct {v2}, Ll/sf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    .line 138
    :cond_6f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    if-eqz v1, :cond_70

    new-instance v2, Ll/tf8;

    invoke-direct {v2}, Ll/tf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    .line 139
    :cond_70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    if-eqz v1, :cond_71

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->clone()Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 140
    :cond_71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    if-eqz v1, :cond_72

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->clone()Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    .line 141
    :cond_72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    if-eqz v1, :cond_73

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetListV3;->clone()Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    .line 142
    :cond_73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    if-eqz v1, :cond_74

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    .line 143
    :cond_74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    if-eqz v1, :cond_75

    .line 144
    new-instance v2, Ll/uf8;

    invoke-direct {v2}, Ll/uf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    .line 145
    :cond_75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    if-eqz v1, :cond_76

    new-instance v2, Ll/vf8;

    invoke-direct {v2}, Ll/vf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    .line 146
    :cond_76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    if-eqz v1, :cond_77

    new-instance v2, Ll/wf8;

    invoke-direct {v2}, Ll/wf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    .line 147
    :cond_77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    if-eqz v1, :cond_78

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->clone()Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 148
    :cond_78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    if-eqz v1, :cond_79

    new-instance v2, Ll/zf8;

    invoke-direct {v2}, Ll/zf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 149
    :cond_79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    if-eqz v1, :cond_7a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->clone()Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    .line 150
    :cond_7a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    if-eqz v1, :cond_7b

    new-instance v2, Ll/ag8;

    invoke-direct {v2}, Ll/ag8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    .line 151
    :cond_7b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    if-eqz v1, :cond_7c

    new-instance v2, Ll/bg8;

    invoke-direct {v2}, Ll/bg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    .line 153
    :cond_7c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    if-eqz v1, :cond_7d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ActionData;->clone()Lcom/p1/mobile/putong/core/data/ActionData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 154
    :cond_7d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v1, :cond_7e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TagStrategy;->clone()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 155
    :cond_7e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    if-eqz v1, :cond_7f

    new-instance v2, Ll/cg8;

    invoke-direct {v2}, Ll/cg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    .line 156
    :cond_7f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v1, :cond_80

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TagStrategy;->clone()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 157
    :cond_80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    if-eqz v1, :cond_81

    new-instance v2, Ll/dg8;

    invoke-direct {v2}, Ll/dg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    .line 158
    :cond_81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    if-eqz v1, :cond_82

    new-instance v2, Ll/eg8;

    invoke-direct {v2}, Ll/eg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    .line 159
    :cond_82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    if-eqz v1, :cond_83

    new-instance v2, Ll/fg8;

    invoke-direct {v2}, Ll/fg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    .line 160
    :cond_83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    if-eqz v1, :cond_84

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->clone()Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 161
    :cond_84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    if-eqz v1, :cond_85

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingSummary;->clone()Lcom/p1/mobile/putong/core/data/GreetingSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 162
    :cond_85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    if-eqz v1, :cond_86

    new-instance v2, Ll/gg8;

    invoke-direct {v2}, Ll/gg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 163
    :cond_86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    if-eqz v1, :cond_87

    new-instance v2, Ll/hg8;

    invoke-direct {v2}, Ll/hg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    .line 164
    :cond_87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    if-eqz v1, :cond_88

    new-instance v2, Ll/jg8;

    invoke-direct {v2}, Ll/jg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    .line 165
    :cond_88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    if-eqz v1, :cond_89

    .line 166
    new-instance v2, Ll/pg8;

    invoke-direct {v2}, Ll/pg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    .line 167
    :cond_89
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    if-eqz v1, :cond_8a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->clone()Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 168
    :cond_8a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    if-eqz v1, :cond_8b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->clone()Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 169
    :cond_8b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    if-eqz v1, :cond_8c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->clone()Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 170
    :cond_8c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    if-eqz v1, :cond_8d

    new-instance v2, Ll/ah8;

    invoke-direct {v2}, Ll/ah8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    .line 171
    :cond_8d
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    if-eqz v1, :cond_8e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CipherId;->clone()Lcom/p1/mobile/putong/core/data/CipherId;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    .line 173
    :cond_8e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    if-eqz v1, :cond_8f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ShareId;->clone()Lcom/p1/mobile/putong/core/data/ShareId;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    .line 174
    :cond_8f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    if-eqz v1, :cond_90

    new-instance v2, Ll/lh8;

    invoke-direct {v2}, Ll/lh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 175
    :cond_90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    if-eqz v1, :cond_91

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->clone()Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    .line 176
    :cond_91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    if-eqz v1, :cond_92

    new-instance v2, Ll/wh8;

    invoke-direct {v2}, Ll/wh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    .line 177
    :cond_92
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    if-eqz v1, :cond_93

    new-instance v2, Ll/hi8;

    invoke-direct {v2}, Ll/hi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    .line 178
    :cond_93
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    if-eqz v1, :cond_94

    .line 179
    new-instance v2, Ll/si8;

    invoke-direct {v2}, Ll/si8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    .line 180
    :cond_94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    if-eqz v1, :cond_95

    new-instance v2, Ll/dj8;

    invoke-direct {v2}, Ll/dj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    .line 181
    :cond_95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    if-eqz v1, :cond_96

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingResult;->clone()Lcom/p1/mobile/putong/core/data/GreetingResult;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    .line 182
    :cond_96
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    if-eqz v1, :cond_97

    new-instance v2, Ll/oj8;

    invoke-direct {v2}, Ll/oj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    .line 183
    :cond_97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    if-eqz v1, :cond_98

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/JmpTarget;->clone()Lcom/p1/mobile/putong/core/data/JmpTarget;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    .line 184
    :cond_98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    if-eqz v1, :cond_99

    new-instance v2, Ll/zj8;

    invoke-direct {v2}, Ll/zj8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    .line 185
    :cond_99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    if-eqz v1, :cond_9a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->clone()Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    .line 186
    :cond_9a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    if-eqz v1, :cond_9b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PopGuide;->clone()Lcom/p1/mobile/putong/core/data/PopGuide;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 187
    :cond_9b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    if-eqz v1, :cond_9c

    new-instance v2, Ll/fe8;

    invoke-direct {v2}, Ll/fe8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    .line 188
    :cond_9c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    if-eqz v1, :cond_9d

    new-instance v2, Ll/bf8;

    invoke-direct {v2}, Ll/bf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    .line 189
    :cond_9d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    if-eqz v1, :cond_9e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->clone()Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 190
    :cond_9e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    if-eqz v1, :cond_9f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->clone()Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    .line 192
    :cond_9f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    if-eqz v1, :cond_a0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->clone()Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 193
    :cond_a0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    if-eqz v1, :cond_a1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->clone()Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    .line 194
    :cond_a1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    if-eqz v1, :cond_a2

    new-instance v2, Ll/mf8;

    invoke-direct {v2}, Ll/mf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    .line 195
    :cond_a2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    if-eqz v1, :cond_a3

    .line 197
    new-instance v2, Ll/xf8;

    invoke-direct {v2}, Ll/xf8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    .line 198
    :cond_a3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    if-eqz v1, :cond_a4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->clone()Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 199
    :cond_a4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    if-eqz v1, :cond_a5

    new-instance v2, Ll/ig8;

    invoke-direct {v2}, Ll/ig8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    .line 200
    :cond_a5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    if-eqz v1, :cond_a6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RecallMatch;->clone()Lcom/p1/mobile/putong/core/data/RecallMatch;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 201
    :cond_a6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    if-eqz v1, :cond_a7

    new-instance v2, Ll/lg8;

    invoke-direct {v2}, Ll/lg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    .line 202
    :cond_a7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    if-eqz v1, :cond_a8

    .line 203
    new-instance v2, Ll/mg8;

    invoke-direct {v2}, Ll/mg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    .line 204
    :cond_a8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    if-eqz v1, :cond_a9

    .line 205
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->clone()Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    .line 206
    :cond_a9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    if-eqz v1, :cond_aa

    new-instance v2, Ll/ng8;

    invoke-direct {v2}, Ll/ng8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    .line 207
    :cond_aa
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    .line 208
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    if-eqz v1, :cond_ab

    new-instance v2, Ll/og8;

    invoke-direct {v2}, Ll/og8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    .line 209
    :cond_ab
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    if-eqz v1, :cond_ac

    .line 210
    new-instance v2, Ll/qg8;

    invoke-direct {v2}, Ll/qg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    .line 211
    :cond_ac
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    if-eqz v1, :cond_ad

    .line 212
    new-instance v2, Ll/rg8;

    invoke-direct {v2}, Ll/rg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    .line 213
    :cond_ad
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    if-eqz v1, :cond_ae

    .line 215
    new-instance v2, Ll/tg8;

    invoke-direct {v2}, Ll/tg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    .line 216
    :cond_ae
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    if-eqz v1, :cond_af

    .line 217
    new-instance v2, Ll/ug8;

    invoke-direct {v2}, Ll/ug8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    .line 218
    :cond_af
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    if-eqz v1, :cond_b0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->clone()Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    .line 219
    :cond_b0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    if-eqz v1, :cond_b1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->clone()Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    .line 220
    :cond_b1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    if-eqz v1, :cond_b2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MatchInfo;->clone()Lcom/p1/mobile/putong/core/data/MatchInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    .line 221
    :cond_b2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    if-eqz v1, :cond_b3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->clone()Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 222
    :cond_b3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    if-eqz v1, :cond_b4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->clone()Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    .line 223
    :cond_b4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    if-eqz v1, :cond_b5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;->clone()Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    .line 224
    :cond_b5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    if-eqz v1, :cond_b6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->clone()Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 225
    :cond_b6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    if-eqz v1, :cond_b7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->clone()Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 226
    :cond_b7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    if-eqz v1, :cond_b8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GrowthPartner;->clone()Lcom/p1/mobile/putong/core/data/GrowthPartner;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    .line 227
    :cond_b8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    if-eqz v1, :cond_b9

    new-instance v2, Ll/vg8;

    invoke-direct {v2}, Ll/vg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 228
    :cond_b9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    if-eqz v1, :cond_ba

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;->clone()Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    .line 229
    :cond_ba
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    if-eqz v1, :cond_bb

    new-instance v2, Ll/wg8;

    invoke-direct {v2}, Ll/wg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    .line 230
    :cond_bb
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    if-eqz v1, :cond_bc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CityCBanner;->clone()Lcom/p1/mobile/putong/core/data/CityCBanner;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 231
    :cond_bc
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    if-eqz v1, :cond_bd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatPartners;->clone()Lcom/p1/mobile/putong/core/data/ChatPartners;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 232
    :cond_bd
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    if-eqz v1, :cond_be

    .line 233
    new-instance v2, Ll/xg8;

    invoke-direct {v2}, Ll/xg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    .line 234
    :cond_be
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    if-eqz v1, :cond_bf

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SurpriseGift;->clone()Lcom/p1/mobile/putong/core/data/SurpriseGift;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    .line 235
    :cond_bf
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    .line 236
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    if-eqz v1, :cond_c0

    new-instance v2, Ll/yg8;

    invoke-direct {v2}, Ll/yg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    .line 237
    :cond_c0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v1, :cond_c1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->clone()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 238
    :cond_c1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    if-eqz v1, :cond_c2

    .line 239
    new-instance v2, Ll/zg8;

    invoke-direct {v2}, Ll/zg8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    .line 240
    :cond_c2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    if-eqz v1, :cond_c3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CityCConfig;->clone()Lcom/p1/mobile/putong/core/data/CityCConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    .line 241
    :cond_c3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    if-eqz v1, :cond_c4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->clone()Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    .line 242
    :cond_c4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    if-eqz v1, :cond_c5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->clone()Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    .line 243
    :cond_c5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    if-eqz v1, :cond_c6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VisitorSetting;->clone()Lcom/p1/mobile/putong/core/data/VisitorSetting;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    .line 244
    :cond_c6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    if-eqz v1, :cond_c7

    new-instance v2, Ll/bh8;

    invoke-direct {v2}, Ll/bh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    .line 245
    :cond_c7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    if-eqz v1, :cond_c8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MarriageGuide;->clone()Lcom/p1/mobile/putong/core/data/MarriageGuide;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    .line 246
    :cond_c8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    if-eqz v1, :cond_c9

    new-instance v2, Ll/ch8;

    invoke-direct {v2}, Ll/ch8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    .line 247
    :cond_c9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    if-eqz v1, :cond_ca

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;->clone()Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    .line 248
    :cond_ca
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    if-eqz v1, :cond_cb

    new-instance v2, Ll/dh8;

    invoke-direct {v2}, Ll/dh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    .line 249
    :cond_cb
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    if-eqz v1, :cond_cc

    new-instance v2, Ll/fh8;

    invoke-direct {v2}, Ll/fh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    .line 250
    :cond_cc
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    if-eqz v1, :cond_cd

    new-instance v2, Ll/gh8;

    invoke-direct {v2}, Ll/gh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    .line 251
    :cond_cd
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    if-eqz v1, :cond_ce

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ColdStartLayer;->clone()Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    .line 252
    :cond_ce
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    if-eqz v1, :cond_cf

    .line 253
    new-instance v2, Ll/hh8;

    invoke-direct {v2}, Ll/hh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    .line 254
    :cond_cf
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    if-eqz v1, :cond_d0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/DatingGuideData;->clone()Lcom/p1/mobile/putong/core/data/DatingGuideData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 255
    :cond_d0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    .line 256
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v1, :cond_d1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TagStrategy;->clone()Lcom/p1/mobile/putong/core/data/TagStrategy;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 257
    :cond_d1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    if-eqz v1, :cond_d2

    new-instance v2, Ll/ih8;

    invoke-direct {v2}, Ll/ih8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    .line 258
    :cond_d2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    if-eqz v1, :cond_d3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;->clone()Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    .line 259
    :cond_d3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    if-eqz v1, :cond_d4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RiskOtherData;->clone()Lcom/p1/mobile/putong/core/data/RiskOtherData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 260
    :cond_d4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    if-eqz v1, :cond_d5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RiskOtherData;->clone()Lcom/p1/mobile/putong/core/data/RiskOtherData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 261
    :cond_d5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    if-eqz v1, :cond_d6

    new-instance v2, Ll/jh8;

    invoke-direct {v2}, Ll/jh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    .line 262
    :cond_d6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    if-eqz v1, :cond_d7

    new-instance v2, Ll/kh8;

    invoke-direct {v2}, Ll/kh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    .line 263
    :cond_d7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    if-eqz v1, :cond_d8

    new-instance v2, Ll/mh8;

    invoke-direct {v2}, Ll/mh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    .line 264
    :cond_d8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    if-eqz v1, :cond_d9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/FateRadar;->clone()Lcom/p1/mobile/putong/core/data/FateRadar;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 265
    :cond_d9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    if-eqz v1, :cond_da

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->clone()Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    .line 266
    :cond_da
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    if-eqz v1, :cond_db

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Explore;->clone()Lcom/p1/mobile/putong/core/data/Explore;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 267
    :cond_db
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    if-eqz v1, :cond_dc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->clone()Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 268
    :cond_dc
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    if-eqz v1, :cond_dd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VipSetting;->clone()Lcom/p1/mobile/putong/core/data/VipSetting;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    .line 269
    :cond_dd
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    if-eqz v1, :cond_de

    .line 270
    new-instance v2, Ll/nh8;

    invoke-direct {v2}, Ll/nh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    .line 271
    :cond_de
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    if-eqz v1, :cond_df

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/FakeGuideData;->clone()Lcom/p1/mobile/putong/core/data/FakeGuideData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    .line 272
    :cond_df
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    if-eqz v1, :cond_e0

    .line 273
    new-instance v2, Ll/oh8;

    invoke-direct {v2}, Ll/oh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    .line 274
    :cond_e0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    if-eqz v1, :cond_e1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Questionnaire;->clone()Lcom/p1/mobile/putong/core/data/Questionnaire;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 275
    :cond_e1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    if-eqz v1, :cond_e2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;->clone()Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    .line 276
    :cond_e2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    if-eqz v1, :cond_e3

    .line 277
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->clone()Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    .line 278
    :cond_e3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    if-eqz v1, :cond_e4

    .line 279
    new-instance v2, Ll/ph8;

    invoke-direct {v2}, Ll/ph8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    .line 280
    :cond_e4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v1, :cond_e5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->clone()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 281
    :cond_e5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v1, :cond_e6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->clone()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 282
    :cond_e6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    if-eqz v1, :cond_e7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->clone()Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 283
    :cond_e7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    if-eqz v1, :cond_e8

    new-instance v2, Ll/rh8;

    invoke-direct {v2}, Ll/rh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    .line 284
    :cond_e8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    if-eqz v1, :cond_e9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IdealInfo;->clone()Lcom/p1/mobile/putong/core/data/IdealInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 285
    :cond_e9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    if-eqz v1, :cond_ea

    new-instance v2, Ll/sh8;

    invoke-direct {v2}, Ll/sh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    .line 286
    :cond_ea
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    if-eqz v1, :cond_eb

    new-instance v2, Ll/th8;

    invoke-direct {v2}, Ll/th8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    .line 287
    :cond_eb
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    if-eqz v1, :cond_ec

    new-instance v2, Ll/uh8;

    invoke-direct {v2}, Ll/uh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    .line 288
    :cond_ec
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    if-eqz v1, :cond_ed

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->clone()Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    .line 289
    :cond_ed
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    if-eqz v1, :cond_ee

    .line 290
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;->clone()Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    .line 291
    :cond_ee
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    if-eqz v1, :cond_ef

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->clone()Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    .line 292
    :cond_ef
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    if-eqz v1, :cond_f0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->clone()Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 293
    :cond_f0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    if-eqz v1, :cond_f1

    new-instance v2, Ll/vh8;

    invoke-direct {v2}, Ll/vh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    .line 294
    :cond_f1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    if-eqz v1, :cond_f2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RealFeelInfo;->clone()Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    .line 295
    :cond_f2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    if-eqz v1, :cond_f3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 296
    :cond_f3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    if-eqz v1, :cond_f4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    .line 297
    :cond_f4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    if-eqz v1, :cond_f5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 298
    :cond_f5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    if-eqz v1, :cond_f6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatPage;->clone()Lcom/p1/mobile/putong/core/data/ChatPage;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    .line 299
    :cond_f6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    if-eqz v1, :cond_f7

    .line 300
    new-instance v2, Ll/xh8;

    invoke-direct {v2}, Ll/xh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    .line 301
    :cond_f7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v1, :cond_f8

    .line 302
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->clone()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 303
    :cond_f8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    if-eqz v1, :cond_f9

    .line 304
    new-instance v2, Ll/yh8;

    invoke-direct {v2}, Ll/yh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 305
    :cond_f9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    if-eqz v1, :cond_fa

    new-instance v2, Ll/zh8;

    invoke-direct {v2}, Ll/zh8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    .line 306
    :cond_fa
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    if-eqz v1, :cond_fb

    .line 307
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->clone()Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 308
    :cond_fb
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    if-eqz v1, :cond_fc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->clone()Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    .line 309
    :cond_fc
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    if-eqz v1, :cond_fd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->clone()Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    .line 310
    :cond_fd
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    .line 311
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    if-eqz v1, :cond_fe

    .line 312
    new-instance v2, Ll/ai8;

    invoke-direct {v2}, Ll/ai8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    .line 313
    :cond_fe
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    .line 314
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    if-eqz v1, :cond_ff

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;->clone()Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    .line 315
    :cond_ff
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    if-eqz v1, :cond_100

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->clone()Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    .line 316
    :cond_100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    if-eqz v1, :cond_101

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->clone()Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 317
    :cond_101
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    if-eqz v1, :cond_102

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/InvitationInfo;->clone()Lcom/p1/mobile/putong/core/data/InvitationInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    .line 318
    :cond_102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    if-eqz v1, :cond_103

    .line 319
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->clone()Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    .line 320
    :cond_103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    if-eqz v1, :cond_104

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->clone()Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 321
    :cond_104
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    .line 322
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    .line 323
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    if-eqz v1, :cond_105

    new-instance v2, Ll/bi8;

    invoke-direct {v2}, Ll/bi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    .line 324
    :cond_105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    if-eqz v1, :cond_106

    .line 325
    new-instance v2, Ll/di8;

    invoke-direct {v2}, Ll/di8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    .line 326
    :cond_106
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    if-eqz v1, :cond_107

    new-instance v2, Ll/ei8;

    invoke-direct {v2}, Ll/ei8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    .line 327
    :cond_107
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    if-eqz v1, :cond_108

    new-instance v2, Ll/fi8;

    invoke-direct {v2}, Ll/fi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    .line 328
    :cond_108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    if-eqz v1, :cond_109

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->clone()Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    .line 329
    :cond_109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    if-eqz v1, :cond_10a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->clone()Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    .line 330
    :cond_10a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    if-eqz v1, :cond_10b

    new-instance v2, Ll/gi8;

    invoke-direct {v2}, Ll/gi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    .line 331
    :cond_10b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    if-eqz v1, :cond_10c

    .line 332
    new-instance v2, Ll/ii8;

    invoke-direct {v2}, Ll/ii8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    .line 333
    :cond_10c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    if-eqz v1, :cond_10d

    new-instance v2, Ll/ji8;

    invoke-direct {v2}, Ll/ji8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    .line 334
    :cond_10d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    if-eqz v1, :cond_10e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->clone()Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    .line 335
    :cond_10e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    if-eqz v1, :cond_10f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;->clone()Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    .line 336
    :cond_10f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    if-eqz v1, :cond_110

    .line 337
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;->clone()Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    .line 338
    :cond_110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    if-eqz v1, :cond_111

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->clone()Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    .line 339
    :cond_111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    if-eqz v1, :cond_112

    new-instance v2, Ll/ki8;

    invoke-direct {v2}, Ll/ki8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    .line 340
    :cond_112
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    .line 341
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    iput v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    .line 342
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    .line 343
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    .line 344
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    .line 345
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    if-eqz v1, :cond_113

    new-instance v2, Ll/li8;

    invoke-direct {v2}, Ll/li8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    .line 346
    :cond_113
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    if-eqz v1, :cond_114

    .line 347
    new-instance v2, Ll/mi8;

    invoke-direct {v2}, Ll/mi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    .line 348
    :cond_114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    if-eqz v1, :cond_115

    new-instance v2, Ll/ni8;

    invoke-direct {v2}, Ll/ni8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    .line 349
    :cond_115
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    if-eqz v1, :cond_116

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->clone()Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 350
    :cond_116
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    if-eqz v1, :cond_117

    new-instance v2, Ll/pi8;

    invoke-direct {v2}, Ll/pi8;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    .line 351
    :cond_117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    if-eqz p0, :cond_118

    .line 352
    new-instance v1, Ll/qi8;

    invoke-direct {v1}, Ll/qi8;-><init>()V

    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    :cond_118
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 353
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreData;->clone()Lcom/p1/mobile/putong/core/data/CoreData;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CoreData;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    if-eq p0, p1, :cond_2

    return v2

    .line 3
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 4
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 5
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 6
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 7
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 8
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 9
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 10
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 11
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 12
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 13
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 14
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 15
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    .line 16
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    .line 17
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    .line 18
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    .line 19
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    .line 20
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    .line 21
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    .line 22
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    .line 23
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    .line 24
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    .line 26
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    .line 27
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    .line 28
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    .line 29
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 30
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    .line 31
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    .line 32
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    .line 33
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    .line 34
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    .line 36
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 37
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 38
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    .line 39
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    .line 40
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    .line 41
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 42
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 43
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 44
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    .line 45
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    .line 46
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    .line 47
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 48
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    .line 49
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    .line 50
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    .line 51
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    .line 52
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    .line 53
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    .line 54
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    .line 55
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    .line 56
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    .line 57
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    .line 58
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    .line 59
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    .line 60
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    .line 61
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    .line 62
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 63
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    .line 64
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    .line 65
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 66
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 67
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    .line 68
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    cmpl-double p1, v3, v5

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    .line 69
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    .line 70
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    .line 71
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    .line 72
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    .line 73
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    .line 74
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    .line 75
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    .line 76
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    .line 77
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    .line 78
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    .line 79
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    .line 80
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    .line 81
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    .line 82
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 83
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    .line 84
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    .line 85
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    .line 86
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    .line 87
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 88
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    .line 89
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 90
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    .line 91
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    .line 92
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    .line 93
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 94
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    .line 95
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 96
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    .line 97
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    .line 98
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    .line 99
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    .line 100
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 101
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    .line 102
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    .line 103
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    .line 104
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    .line 105
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 106
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    .line 107
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    .line 108
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    .line 109
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    .line 110
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    .line 111
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    .line 112
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    .line 113
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    .line 114
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    .line 115
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 116
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    .line 117
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    .line 118
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    .line 119
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    .line 120
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    .line 121
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    .line 122
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 123
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 124
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    .line 125
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    .line 126
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    .line 127
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    .line 128
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 129
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 130
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    .line 131
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 132
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    .line 133
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    .line 134
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    .line 135
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 136
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 137
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 138
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    .line 139
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    .line 140
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    .line 141
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 142
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 143
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 144
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    .line 145
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    .line 146
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    .line 147
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 148
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    .line 149
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    .line 150
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    .line 151
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    .line 152
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    .line 153
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    .line 154
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    .line 155
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    .line 156
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    .line 157
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    .line 158
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 159
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    .line 160
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    .line 161
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 162
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    .line 163
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    .line 164
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 165
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    .line 166
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    .line 167
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    .line 168
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    .line 169
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 170
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    .line 171
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 172
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    .line 173
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    .line 174
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    .line 175
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    .line 176
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    iget v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    .line 177
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    .line 178
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    .line 179
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    .line 180
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    .line 181
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    .line 182
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    .line 183
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    .line 184
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 185
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    .line 186
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    .line 187
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 188
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 189
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    .line 190
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 191
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    .line 192
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    .line 193
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 194
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 195
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    .line 196
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    .line 197
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    cmp-long p1, v3, v5

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    .line 198
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 199
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    .line 200
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    .line 201
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    .line 202
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    .line 203
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    .line 204
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    .line 205
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    .line 206
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    .line 207
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    .line 208
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    .line 209
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    .line 210
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    .line 211
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    .line 212
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    .line 213
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    .line 214
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 215
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    .line 216
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    .line 217
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 218
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    .line 219
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    .line 220
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    .line 221
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    .line 222
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 223
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    .line 224
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 225
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    .line 226
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    .line 227
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    .line 228
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    .line 229
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    .line 230
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 231
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    .line 232
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    .line 233
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    .line 234
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 235
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 236
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 237
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    .line 238
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 239
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    .line 240
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    .line 241
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    .line 242
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    .line 243
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    .line 244
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    .line 245
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    .line 246
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    .line 247
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    .line 248
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 249
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    .line 250
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    .line 251
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    .line 252
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    .line 253
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 254
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 255
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    .line 256
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    .line 257
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    .line 258
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    .line 259
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    iget v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    .line 260
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    iget v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    .line 261
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    .line 262
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 263
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    .line 264
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    .line 265
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 266
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    if-ne p1, v3, :cond_3

    iget p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    iget v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    if-ne p1, v3, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    .line 267
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    .line 268
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    .line 269
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    .line 270
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    .line 271
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    .line 272
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    .line 273
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    .line 274
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    .line 275
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    .line 276
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    .line 277
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    .line 278
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    .line 279
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    .line 280
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    iget v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    if-ne p1, v3, :cond_3

    iget p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    iget v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    if-ne p1, v3, :cond_3

    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    cmpl-double p1, v3, v5

    if-nez p1, :cond_3

    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    cmpl-double p1, v3, v5

    if-nez p1, :cond_3

    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    cmpl-double p1, v3, v5

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    .line 281
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    .line 282
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    .line 283
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 284
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    .line 285
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    .line 286
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    return v0

    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "coredata"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 10

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    if-nez v0, :cond_122

    .line 2
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x29

    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_3

    :cond_3
    move v1, v2

    :goto_3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    if-eqz v1, :cond_4

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_4

    :cond_4
    move v1, v2

    :goto_4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    if-eqz v1, :cond_5

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_5

    :cond_5
    move v1, v2

    :goto_5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    if-eqz v1, :cond_6

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_6

    :cond_6
    move v1, v2

    :goto_6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    if-eqz v1, :cond_7

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_7

    :cond_7
    move v1, v2

    :goto_7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    if-eqz v1, :cond_8

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_8

    :cond_8
    move v1, v2

    :goto_8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    if-eqz v1, :cond_9

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_9

    :cond_9
    move v1, v2

    :goto_9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    if-eqz v1, :cond_a

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_a

    :cond_a
    move v1, v2

    :goto_a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    if-eqz v1, :cond_b

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_b

    :cond_b
    move v1, v2

    :goto_b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Wallet;->hashCode()I

    move-result v1

    goto :goto_c

    :cond_c
    move v1, v2

    :goto_c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    if-eqz v1, :cond_d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_d

    :cond_d
    move v1, v2

    :goto_d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->coins:Lcom/p1/mobile/putong/core/data/Coin;

    if-eqz v1, :cond_e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Coin;->hashCode()I

    move-result v1

    goto :goto_e

    :cond_e
    move v1, v2

    :goto_e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    if-eqz v1, :cond_f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_f

    :cond_f
    move v1, v2

    :goto_f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->faceidTokens:Ljava/util/List;

    if-eqz v1, :cond_10

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_10

    :cond_10
    move v1, v2

    :goto_10
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->merchandises:Ljava/util/List;

    if-eqz v1, :cond_11

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_11

    :cond_11
    move v1, v2

    :goto_11
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privacySettings:Ljava/util/List;

    if-eqz v1, :cond_12

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_12

    :cond_12
    move v1, v2

    :goto_12
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->figures:Ljava/util/List;

    if-eqz v1, :cond_13

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_13

    :cond_13
    move v1, v2

    :goto_13
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orders:Ljava/util/List;

    if-eqz v1, :cond_14

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_14

    :cond_14
    move v1, v2

    :goto_14
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    if-eqz v1, :cond_15

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_15

    :cond_15
    move v1, v2

    :goto_15
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivilegePrices:Ljava/util/List;

    if-eqz v1, :cond_16

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_16

    :cond_16
    move v1, v2

    :goto_16
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    if-eqz v1, :cond_17

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_17

    :cond_17
    move v1, v2

    :goto_17
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surveys:Ljava/util/List;

    if-eqz v1, :cond_18

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_18

    :cond_18
    move v1, v2

    :goto_18
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->appealInfos:Ljava/util/List;

    if-eqz v1, :cond_19

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_19

    :cond_19
    move v1, v2

    :goto_19
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->autoDeducts:Ljava/util/List;

    if-eqz v1, :cond_1a

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1a

    :cond_1a
    move v1, v2

    :goto_1a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    if-eqz v1, :cond_1b

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1b

    :cond_1b
    move v1, v2

    :goto_1b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->complain:Ljava/util/List;

    if-eqz v1, :cond_1c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1c

    :cond_1c
    move v1, v2

    :goto_1c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveLabels:Ljava/util/List;

    if-eqz v1, :cond_1d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1d

    :cond_1d
    move v1, v2

    :goto_1d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedUsers:Ljava/util/List;

    if-eqz v1, :cond_1e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1e

    :cond_1e
    move v1, v2

    :goto_1e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->refundDetails:Ljava/util/List;

    if-eqz v1, :cond_1f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1f

    :cond_1f
    move v1, v2

    :goto_1f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->walletAccounts:Ljava/util/List;

    if-eqz v1, :cond_20

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_20

    :cond_20
    move v1, v2

    :goto_20
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->accountRecords:Ljava/util/List;

    if-eqz v1, :cond_21

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_21

    :cond_21
    move v1, v2

    :goto_21
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationConfiguration:Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    if-eqz v1, :cond_22

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->hashCode()I

    move-result v1

    goto :goto_22

    :cond_22
    move v1, v2

    :goto_22
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    if-eqz v1, :cond_23

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Contract;->hashCode()I

    move-result v1

    goto :goto_23

    :cond_23
    move v1, v2

    :goto_23
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationTokens:Ljava/util/List;

    if-eqz v1, :cond_24

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_24

    :cond_24
    move v1, v2

    :goto_24
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeats:Ljava/util/List;

    if-eqz v1, :cond_25

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_25

    :cond_25
    move v1, v2

    :goto_25
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contractInfos:Ljava/util/List;

    if-eqz v1, :cond_26

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_26

    :cond_26
    move v1, v2

    :goto_26
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    if-eqz v1, :cond_27

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_27

    :cond_27
    move v1, v2

    :goto_27
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    if-eqz v1, :cond_28

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_28

    :cond_28
    move v1, v2

    :goto_28
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    if-eqz v1, :cond_29

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_29

    :cond_29
    move v1, v2

    :goto_29
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notificationCounters:Ljava/util/List;

    if-eqz v1, :cond_2a

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2a

    :cond_2a
    move v1, v2

    :goto_2a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupNotifications:Ljava/util/List;

    if-eqz v1, :cond_2b

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2b

    :cond_2b
    move v1, v2

    :goto_2b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupAttributes:Ljava/util/List;

    if-eqz v1, :cond_2c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2c

    :cond_2c
    move v1, v2

    :goto_2c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    if-eqz v1, :cond_2d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2d

    :cond_2d
    move v1, v2

    :goto_2d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    if-eqz v1, :cond_2e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2e

    :cond_2e
    move v1, v2

    :goto_2e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    if-eqz v1, :cond_2f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2f

    :cond_2f
    move v1, v2

    :goto_2f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupSettings:Ljava/util/List;

    if-eqz v1, :cond_30

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_30

    :cond_30
    move v1, v2

    :goto_30
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    if-eqz v1, :cond_31

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_31

    :cond_31
    move v1, v2

    :goto_31
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lives:Ljava/util/List;

    if-eqz v1, :cond_32

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_32

    :cond_32
    move v1, v2

    :goto_32
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->officialAccounts:Ljava/util/List;

    if-eqz v1, :cond_33

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_33

    :cond_33
    move v1, v2

    :goto_33
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->menus:Ljava/util/List;

    if-eqz v1, :cond_34

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_34

    :cond_34
    move v1, v2

    :goto_34
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tickles:Ljava/util/List;

    if-eqz v1, :cond_35

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_35

    :cond_35
    move v1, v2

    :goto_35
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationPromotions:Ljava/util/List;

    if-eqz v1, :cond_36

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_36

    :cond_36
    move v1, v2

    :goto_36
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->coupons:Ljava/util/List;

    if-eqz v1, :cond_37

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_37

    :cond_37
    move v1, v2

    :goto_37
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatProfiles:Ljava/util/List;

    if-eqz v1, :cond_38

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_38

    :cond_38
    move v1, v2

    :goto_38
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->systemQuestions:Ljava/util/List;

    if-eqz v1, :cond_39

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_39

    :cond_39
    move v1, v2

    :goto_39
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->priorityLike:Lcom/p1/mobile/putong/core/data/PriorityLike;

    if-eqz v1, :cond_3a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PriorityLike;->hashCode()I

    move-result v1

    goto :goto_3a

    :cond_3a
    move v1, v2

    :goto_3a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->couponBag:Lcom/p1/mobile/putong/core/data/Couponbag;

    if-eqz v1, :cond_3b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Couponbag;->hashCode()I

    move-result v1

    goto :goto_3b

    :cond_3b
    move v1, v2

    :goto_3b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    if-eqz v1, :cond_3c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_3c

    :cond_3c
    move v1, v2

    :goto_3c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    if-eqz v1, :cond_3d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_3d

    :cond_3d
    move v1, v2

    :goto_3d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftInfos:Ljava/util/List;

    if-eqz v1, :cond_3e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_3e

    :cond_3e
    move v1, v2

    :goto_3e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    if-eqz v1, :cond_3f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CounterVerification;->hashCode()I

    move-result v1

    goto :goto_3f

    :cond_3f
    move v1, v2

    :goto_3f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    if-eqz v1, :cond_40

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_40

    :cond_40
    move v1, v2

    :goto_40
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    if-eqz v1, :cond_41

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_41

    :cond_41
    move v1, v2

    :goto_41
    add-int/2addr v0, v1

    .line 69
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->nextTime:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    mul-int/lit8 v0, v0, 0x29

    const/16 v1, 0x20

    ushr-long v5, v3, v1

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 70
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    if-eqz v3, :cond_42

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ConversationDiff;->hashCode()I

    move-result v3

    goto :goto_42

    :cond_42
    move v3, v2

    :goto_42
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->comStatusAwards:Ljava/util/List;

    if-eqz v3, :cond_43

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_43

    :cond_43
    move v3, v2

    :goto_43
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 72
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    if-eqz v3, :cond_44

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_44

    :cond_44
    move v3, v2

    :goto_44
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 73
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    if-eqz v3, :cond_45

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_45

    :cond_45
    move v3, v2

    :goto_45
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftGuide:Lcom/p1/mobile/putong/core/data/CoreGiftGuide;

    if-eqz v3, :cond_46

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/CoreGiftGuide;->hashCode()I

    move-result v3

    goto :goto_46

    :cond_46
    move v3, v2

    :goto_46
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 75
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftPanel:Ljava/util/List;

    if-eqz v3, :cond_47

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_47

    :cond_47
    move v3, v2

    :goto_47
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallSocials:Ljava/util/List;

    if-eqz v3, :cond_48

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_48

    :cond_48
    move v3, v2

    :goto_48
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallRankInfos:Ljava/util/List;

    if-eqz v3, :cond_49

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_49

    :cond_49
    move v3, v2

    :goto_49
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 78
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->giftWallTitles:Ljava/util/List;

    if-eqz v3, :cond_4a

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_4a

    :cond_4a
    move v3, v2

    :goto_4a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 79
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->newGiftWalls:Ljava/util/List;

    if-eqz v3, :cond_4b

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_4b

    :cond_4b
    move v3, v2

    :goto_4b
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseDialogConfigs:Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;

    if-eqz v3, :cond_4c

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PurchaseDialogConfigs;->hashCode()I

    move-result v3

    goto :goto_4c

    :cond_4c
    move v3, v2

    :goto_4c
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 81
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    if-eqz v3, :cond_4d

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_4d

    :cond_4d
    move v3, v2

    :goto_4d
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 82
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingCounter:Lcom/p1/mobile/putong/core/data/GreetingCounter;

    if-eqz v3, :cond_4e

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GreetingCounter;->hashCode()I

    move-result v3

    goto :goto_4e

    :cond_4e
    move v3, v2

    :goto_4e
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingPermissions:Ljava/util/List;

    if-eqz v3, :cond_4f

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_4f

    :cond_4f
    move v3, v2

    :goto_4f
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 84
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    if-eqz v3, :cond_50

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GreetingSummary;->hashCode()I

    move-result v3

    goto :goto_50

    :cond_50
    move v3, v2

    :goto_50
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 85
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->hint:Z

    const/16 v4, 0x4d5

    const/16 v5, 0x4cf

    if-eqz v3, :cond_51

    move v3, v5

    goto :goto_51

    :cond_51
    move v3, v4

    :goto_51
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 86
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardExtraInfos:Ljava/util/List;

    if-eqz v3, :cond_52

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_52

    :cond_52
    move v3, v2

    :goto_52
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 87
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->readMessages:Ljava/util/List;

    if-eqz v3, :cond_53

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_53

    :cond_53
    move v3, v2

    :goto_53
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    if-eqz v3, :cond_54

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_54

    :cond_54
    move v3, v2

    :goto_54
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->orderInfos:Ljava/util/List;

    if-eqz v3, :cond_55

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_55

    :cond_55
    move v3, v2

    :goto_55
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 90
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->quickchatCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    if-eqz v3, :cond_56

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->hashCode()I

    move-result v3

    goto :goto_56

    :cond_56
    move v3, v2

    :goto_56
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 91
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picksUsers:Ljava/util/List;

    if-eqz v3, :cond_57

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_57

    :cond_57
    move v3, v2

    :goto_57
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 92
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    if-eqz v3, :cond_58

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Picks;->hashCode()I

    move-result v3

    goto :goto_58

    :cond_58
    move v3, v2

    :goto_58
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->countdownLikes:Ljava/util/List;

    if-eqz v3, :cond_59

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_59

    :cond_59
    move v3, v2

    :goto_59
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 94
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingSetting:Lcom/p1/mobile/putong/core/data/GreetingSetting;

    if-eqz v3, :cond_5a

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GreetingSetting;->hashCode()I

    move-result v3

    goto :goto_5a

    :cond_5a
    move v3, v2

    :goto_5a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 95
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->onlineLiveChatPair:Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;

    if-eqz v3, :cond_5b

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/OnlineLiveChatPair;->hashCode()I

    move-result v3

    goto :goto_5b

    :cond_5b
    move v3, v2

    :goto_5b
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 96
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    if-eqz v3, :cond_5c

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_5c

    :cond_5c
    move v3, v2

    :goto_5c
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeet:Lcom/p1/mobile/putong/core/data/MyMeetExtra;

    if-eqz v3, :cond_5d

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MyMeetExtra;->hashCode()I

    move-result v3

    goto :goto_5d

    :cond_5d
    move v3, v2

    :goto_5d
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 98
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    if-eqz v3, :cond_5e

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_5e

    :cond_5e
    move v3, v2

    :goto_5e
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voicechat:Lcom/p1/mobile/putong/core/data/VoiceChatInfo;

    if-eqz v3, :cond_5f

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/VoiceChatInfo;->hashCode()I

    move-result v3

    goto :goto_5f

    :cond_5f
    move v3, v2

    :goto_5f
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 100
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBellData;

    if-eqz v3, :cond_60

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/QuickChatBellData;->hashCode()I

    move-result v3

    goto :goto_60

    :cond_60
    move v3, v2

    :goto_60
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 101
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isHit:Z

    if-eqz v3, :cond_61

    move v3, v5

    goto :goto_61

    :cond_61
    move v3, v4

    :goto_61
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 102
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->user:Lcom/p1/mobile/putong/data/User;

    if-eqz v3, :cond_62

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->hashCode()I

    move-result v3

    goto :goto_62

    :cond_62
    move v3, v2

    :goto_62
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 103
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    if-eqz v3, :cond_63

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_63

    :cond_63
    move v3, v2

    :goto_63
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 104
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    if-eqz v3, :cond_64

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_64

    :cond_64
    move v3, v2

    :goto_64
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 105
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipRecommendUsers:Ljava/util/List;

    if-eqz v3, :cond_65

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_65

    :cond_65
    move v3, v2

    :goto_65
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    if-eqz v3, :cond_66

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->hashCode()I

    move-result v3

    goto :goto_66

    :cond_66
    move v3, v2

    :goto_66
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 107
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    if-eqz v3, :cond_67

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->hashCode()I

    move-result v3

    goto :goto_67

    :cond_67
    move v3, v2

    :goto_67
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 108
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->speedUpCard:Lcom/p1/mobile/putong/core/data/Note;

    if-eqz v3, :cond_68

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Note;->hashCode()I

    move-result v3

    goto :goto_68

    :cond_68
    move v3, v2

    :goto_68
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 109
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    if-eqz v3, :cond_69

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_69

    :cond_69
    move v3, v2

    :goto_69
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 110
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    if-eqz v3, :cond_6a

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->hashCode()I

    move-result v3

    goto :goto_6a

    :cond_6a
    move v3, v2

    :goto_6a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 111
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluations:Ljava/util/List;

    if-eqz v3, :cond_6b

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_6b

    :cond_6b
    move v3, v2

    :goto_6b
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 112
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluationReports:Ljava/util/List;

    if-eqz v3, :cond_6c

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_6c

    :cond_6c
    move v3, v2

    :goto_6c
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 113
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->msgData:Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;

    if-eqz v3, :cond_6d

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MessageFeedbackStatus;->hashCode()I

    move-result v3

    goto :goto_6d

    :cond_6d
    move v3, v2

    :goto_6d
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->evaluation:Lcom/p1/mobile/putong/core/data/Evaluation;

    if-eqz v3, :cond_6e

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Evaluation;->hashCode()I

    move-result v3

    goto :goto_6e

    :cond_6e
    move v3, v2

    :goto_6e
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    if-eqz v3, :cond_6f

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_6f

    :cond_6f
    move v3, v2

    :goto_6f
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 116
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    if-eqz v3, :cond_70

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_70

    :cond_70
    move v3, v2

    :goto_70
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 117
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    if-eqz v3, :cond_71

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_71

    :cond_71
    move v3, v2

    :goto_71
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 118
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardModels:Ljava/util/List;

    if-eqz v3, :cond_72

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_72

    :cond_72
    move v3, v2

    :goto_72
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 119
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    if-eqz v3, :cond_73

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->hashCode()I

    move-result v3

    goto :goto_73

    :cond_73
    move v3, v2

    :goto_73
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 120
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->oneside:Lcom/p1/mobile/putong/core/data/QuickChatOneside;

    if-eqz v3, :cond_74

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->hashCode()I

    move-result v3

    goto :goto_74

    :cond_74
    move v3, v2

    :goto_74
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 121
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetListV3:Lcom/p1/mobile/putong/core/data/MyMeetListV3;

    if-eqz v3, :cond_75

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MyMeetListV3;->hashCode()I

    move-result v3

    goto :goto_75

    :cond_75
    move v3, v2

    :goto_75
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 122
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myMeetEntryV3:Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    if-eqz v3, :cond_76

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->hashCode()I

    move-result v3

    goto :goto_76

    :cond_76
    move v3, v2

    :goto_76
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 123
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    if-eqz v3, :cond_77

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_77

    :cond_77
    move v3, v2

    :goto_77
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 124
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    if-eqz v3, :cond_78

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_78

    :cond_78
    move v3, v2

    :goto_78
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 125
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    if-eqz v3, :cond_79

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_79

    :cond_79
    move v3, v2

    :goto_79
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 126
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    if-eqz v3, :cond_7a

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->hashCode()I

    move-result v3

    goto :goto_7a

    :cond_7a
    move v3, v2

    :goto_7a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 127
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    if-eqz v3, :cond_7b

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_7b

    :cond_7b
    move v3, v2

    :goto_7b
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 128
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingHotLevelInfo:Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    if-eqz v3, :cond_7c

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->hashCode()I

    move-result v3

    goto :goto_7c

    :cond_7c
    move v3, v2

    :goto_7c
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 129
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voices:Ljava/util/List;

    if-eqz v3, :cond_7d

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_7d

    :cond_7d
    move v3, v2

    :goto_7d
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 130
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    if-eqz v3, :cond_7e

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_7e

    :cond_7e
    move v3, v2

    :goto_7e
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 131
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->suggestUsers:Ljava/util/List;

    if-eqz v3, :cond_7f

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_7f

    :cond_7f
    move v3, v2

    :goto_7f
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 132
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->action:Lcom/p1/mobile/putong/core/data/ActionData;

    if-eqz v3, :cond_80

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ActionData;->hashCode()I

    move-result v3

    goto :goto_80

    :cond_80
    move v3, v2

    :goto_80
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 133
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v3, :cond_81

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/TagStrategy;->hashCode()I

    move-result v3

    goto :goto_81

    :cond_81
    move v3, v2

    :goto_81
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 134
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    if-eqz v3, :cond_82

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_82

    :cond_82
    move v3, v2

    :goto_82
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 135
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v3, :cond_83

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/TagStrategy;->hashCode()I

    move-result v3

    goto :goto_83

    :cond_83
    move v3, v2

    :goto_83
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 136
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    if-eqz v3, :cond_84

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_84

    :cond_84
    move v3, v2

    :goto_84
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 137
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    if-eqz v3, :cond_85

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_85

    :cond_85
    move v3, v2

    :goto_85
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 138
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    if-eqz v3, :cond_86

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_86

    :cond_86
    move v3, v2

    :goto_86
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 139
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    if-eqz v3, :cond_87

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->hashCode()I

    move-result v3

    goto :goto_87

    :cond_87
    move v3, v2

    :goto_87
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->anonymousSummary:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    if-eqz v3, :cond_88

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GreetingSummary;->hashCode()I

    move-result v3

    goto :goto_88

    :cond_88
    move v3, v2

    :goto_88
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 141
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    if-eqz v3, :cond_89

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_89

    :cond_89
    move v3, v2

    :goto_89
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 142
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    if-eqz v3, :cond_8a

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_8a

    :cond_8a
    move v3, v2

    :goto_8a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 143
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    if-eqz v3, :cond_8b

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_8b

    :cond_8b
    move v3, v2

    :goto_8b
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 144
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    if-eqz v3, :cond_8c

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_8c

    :cond_8c
    move v3, v2

    :goto_8c
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 145
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    if-eqz v3, :cond_8d

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->hashCode()I

    move-result v3

    goto :goto_8d

    :cond_8d
    move v3, v2

    :goto_8d
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 146
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    if-eqz v3, :cond_8e

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->hashCode()I

    move-result v3

    goto :goto_8e

    :cond_8e
    move v3, v2

    :goto_8e
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 147
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    if-eqz v3, :cond_8f

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->hashCode()I

    move-result v3

    goto :goto_8f

    :cond_8f
    move v3, v2

    :goto_8f
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 148
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    if-eqz v3, :cond_90

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_90

    :cond_90
    move v3, v2

    :goto_90
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 149
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->next:Z

    if-eqz v3, :cond_91

    move v3, v5

    goto :goto_91

    :cond_91
    move v3, v4

    :goto_91
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 150
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    if-eqz v3, :cond_92

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/CipherId;->hashCode()I

    move-result v3

    goto :goto_92

    :cond_92
    move v3, v2

    :goto_92
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 151
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    if-eqz v3, :cond_93

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ShareId;->hashCode()I

    move-result v3

    goto :goto_93

    :cond_93
    move v3, v2

    :goto_93
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 152
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    if-eqz v3, :cond_94

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_94

    :cond_94
    move v3, v2

    :goto_94
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 153
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    if-eqz v3, :cond_95

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->hashCode()I

    move-result v3

    goto :goto_95

    :cond_95
    move v3, v2

    :goto_95
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 154
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    if-eqz v3, :cond_96

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_96

    :cond_96
    move v3, v2

    :goto_96
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 155
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    if-eqz v3, :cond_97

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_97

    :cond_97
    move v3, v2

    :goto_97
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 156
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    if-eqz v3, :cond_98

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_98

    :cond_98
    move v3, v2

    :goto_98
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 157
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    if-eqz v3, :cond_99

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_99

    :cond_99
    move v3, v2

    :goto_99
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 158
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    if-eqz v3, :cond_9a

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GreetingResult;->hashCode()I

    move-result v3

    goto :goto_9a

    :cond_9a
    move v3, v2

    :goto_9a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 159
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    if-eqz v3, :cond_9b

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_9b

    :cond_9b
    move v3, v2

    :goto_9b
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 160
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    if-eqz v3, :cond_9c

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/JmpTarget;->hashCode()I

    move-result v3

    goto :goto_9c

    :cond_9c
    move v3, v2

    :goto_9c
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 161
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    if-eqz v3, :cond_9d

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_9d

    :cond_9d
    move v3, v2

    :goto_9d
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 162
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    if-eqz v3, :cond_9e

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->hashCode()I

    move-result v3

    goto :goto_9e

    :cond_9e
    move v3, v2

    :goto_9e
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 163
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    if-eqz v3, :cond_9f

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PopGuide;->hashCode()I

    move-result v3

    goto :goto_9f

    :cond_9f
    move v3, v2

    :goto_9f
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 164
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->superLikeCount:Ljava/util/List;

    if-eqz v3, :cond_a0

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_a0

    :cond_a0
    move v3, v2

    :goto_a0
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 165
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    if-eqz v3, :cond_a1

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_a1

    :cond_a1
    move v3, v2

    :goto_a1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 166
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    if-eqz v3, :cond_a2

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->hashCode()I

    move-result v3

    goto :goto_a2

    :cond_a2
    move v3, v2

    :goto_a2
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 167
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->link:Ljava/lang/String;

    if-eqz v3, :cond_a3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_a3

    :cond_a3
    move v3, v2

    :goto_a3
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 168
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    if-eqz v3, :cond_a4

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->hashCode()I

    move-result v3

    goto :goto_a4

    :cond_a4
    move v3, v2

    :goto_a4
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 169
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    if-eqz v3, :cond_a5

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->hashCode()I

    move-result v3

    goto :goto_a5

    :cond_a5
    move v3, v2

    :goto_a5
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 170
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    if-eqz v3, :cond_a6

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->hashCode()I

    move-result v3

    goto :goto_a6

    :cond_a6
    move v3, v2

    :goto_a6
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 171
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    if-eqz v3, :cond_a7

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_a7

    :cond_a7
    move v3, v2

    :goto_a7
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 172
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    if-eqz v3, :cond_a8

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_a8

    :cond_a8
    move v3, v2

    :goto_a8
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 173
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    if-eqz v3, :cond_a9

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_a9

    :cond_a9
    move v3, v2

    :goto_a9
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 174
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    if-eqz v3, :cond_aa

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->hashCode()I

    move-result v3

    goto :goto_aa

    :cond_aa
    move v3, v2

    :goto_aa
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 175
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    if-eqz v3, :cond_ab

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_ab

    :cond_ab
    move v3, v2

    :goto_ab
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 176
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    if-eqz v3, :cond_ac

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/RecallMatch;->hashCode()I

    move-result v3

    goto :goto_ac

    :cond_ac
    move v3, v2

    :goto_ac
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 177
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveActivities:Ljava/util/List;

    if-eqz v3, :cond_ad

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_ad

    :cond_ad
    move v3, v2

    :goto_ad
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 178
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    if-eqz v3, :cond_ae

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_ae

    :cond_ae
    move v3, v2

    :goto_ae
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 179
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationChatSeeUser:Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;

    if-eqz v3, :cond_af

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MonetizationChatSeeUser;->hashCode()I

    move-result v3

    goto :goto_af

    :cond_af
    move v3, v2

    :goto_af
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 180
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    if-eqz v3, :cond_b0

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_b0

    :cond_b0
    move v3, v2

    :goto_b0
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 181
    iget v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->count:I

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 182
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    if-eqz v3, :cond_b1

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_b1

    :cond_b1
    move v3, v2

    :goto_b1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 183
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    if-eqz v3, :cond_b2

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_b2

    :cond_b2
    move v3, v2

    :goto_b2
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 184
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    if-eqz v3, :cond_b3

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_b3

    :cond_b3
    move v3, v2

    :goto_b3
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 185
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->isRecallUser:Z

    if-eqz v3, :cond_b4

    move v3, v5

    goto :goto_b4

    :cond_b4
    move v3, v4

    :goto_b4
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 186
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeople:Ljava/util/List;

    if-eqz v3, :cond_b5

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_b5

    :cond_b5
    move v3, v2

    :goto_b5
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 187
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingNewPeopleMessage:Ljava/util/List;

    if-eqz v3, :cond_b6

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_b6

    :cond_b6
    move v3, v2

    :goto_b6
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 188
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    if-eqz v3, :cond_b7

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->hashCode()I

    move-result v3

    goto :goto_b7

    :cond_b7
    move v3, v2

    :goto_b7
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 189
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    if-eqz v3, :cond_b8

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->hashCode()I

    move-result v3

    goto :goto_b8

    :cond_b8
    move v3, v2

    :goto_b8
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 190
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    if-eqz v3, :cond_b9

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MatchInfo;->hashCode()I

    move-result v3

    goto :goto_b9

    :cond_b9
    move v3, v2

    :goto_b9
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 191
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    if-eqz v3, :cond_ba

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->hashCode()I

    move-result v3

    goto :goto_ba

    :cond_ba
    move v3, v2

    :goto_ba
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 192
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    if-eqz v3, :cond_bb

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->hashCode()I

    move-result v3

    goto :goto_bb

    :cond_bb
    move v3, v2

    :goto_bb
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 193
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->acceleratePairing:Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    if-eqz v3, :cond_bc

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;->hashCode()I

    move-result v3

    goto :goto_bc

    :cond_bc
    move v3, v2

    :goto_bc
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 194
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    if-eqz v3, :cond_bd

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;->hashCode()I

    move-result v3

    goto :goto_bd

    :cond_bd
    move v3, v2

    :goto_bd
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 195
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    if-eqz v3, :cond_be

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->hashCode()I

    move-result v3

    goto :goto_be

    :cond_be
    move v3, v2

    :goto_be
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 196
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    if-eqz v3, :cond_bf

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GrowthPartner;->hashCode()I

    move-result v3

    goto :goto_bf

    :cond_bf
    move v3, v2

    :goto_bf
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 197
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    if-eqz v3, :cond_c0

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_c0

    :cond_c0
    move v3, v2

    :goto_c0
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 198
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthBlindBox;

    if-eqz v3, :cond_c1

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GrowthBlindBox;->hashCode()I

    move-result v3

    goto :goto_c1

    :cond_c1
    move v3, v2

    :goto_c1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 199
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->unReadUserIds:Ljava/util/List;

    if-eqz v3, :cond_c2

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_c2

    :cond_c2
    move v3, v2

    :goto_c2
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 200
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    if-eqz v3, :cond_c3

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/CityCBanner;->hashCode()I

    move-result v3

    goto :goto_c3

    :cond_c3
    move v3, v2

    :goto_c3
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 201
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    if-eqz v3, :cond_c4

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ChatPartners;->hashCode()I

    move-result v3

    goto :goto_c4

    :cond_c4
    move v3, v2

    :goto_c4
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 202
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    if-eqz v3, :cond_c5

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_c5

    :cond_c5
    move v3, v2

    :goto_c5
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 203
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGift:Lcom/p1/mobile/putong/core/data/SurpriseGift;

    if-eqz v3, :cond_c6

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SurpriseGift;->hashCode()I

    move-result v3

    goto :goto_c6

    :cond_c6
    move v3, v2

    :goto_c6
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 204
    iget-wide v6, p0, Lcom/p1/mobile/putong/core/data/CoreData;->surpriseGiftExpirationTime:J

    ushr-long v8, v6, v1

    xor-long/2addr v6, v8

    long-to-int v3, v6

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 205
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardCornerMarks:Ljava/util/List;

    if-eqz v3, :cond_c7

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_c7

    :cond_c7
    move v3, v2

    :goto_c7
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 206
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v3, :cond_c8

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->hashCode()I

    move-result v3

    goto :goto_c8

    :cond_c8
    move v3, v2

    :goto_c8
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 207
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    if-eqz v3, :cond_c9

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_c9

    :cond_c9
    move v3, v2

    :goto_c9
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 208
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCConfig:Lcom/p1/mobile/putong/core/data/CityCConfig;

    if-eqz v3, :cond_ca

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/CityCConfig;->hashCode()I

    move-result v3

    goto :goto_ca

    :cond_ca
    move v3, v2

    :goto_ca
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 209
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomSetting:Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    if-eqz v3, :cond_cb

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->hashCode()I

    move-result v3

    goto :goto_cb

    :cond_cb
    move v3, v2

    :goto_cb
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 210
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResults:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    if-eqz v3, :cond_cc

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->hashCode()I

    move-result v3

    goto :goto_cc

    :cond_cc
    move v3, v2

    :goto_cc
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 211
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorSetting:Lcom/p1/mobile/putong/core/data/VisitorSetting;

    if-eqz v3, :cond_cd

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/VisitorSetting;->hashCode()I

    move-result v3

    goto :goto_cd

    :cond_cd
    move v3, v2

    :goto_cd
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 212
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorHiddens:Ljava/util/List;

    if-eqz v3, :cond_ce

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_ce

    :cond_ce
    move v3, v2

    :goto_ce
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 213
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->marriageGuide:Lcom/p1/mobile/putong/core/data/MarriageGuide;

    if-eqz v3, :cond_cf

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MarriageGuide;->hashCode()I

    move-result v3

    goto :goto_cf

    :cond_cf
    move v3, v2

    :goto_cf
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 214
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUsers:Ljava/util/List;

    if-eqz v3, :cond_d0

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_d0

    :cond_d0
    move v3, v2

    :goto_d0
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 215
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectionUserInfo:Lcom/p1/mobile/putong/core/data/SelectionUserInfo;

    if-eqz v3, :cond_d1

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SelectionUserInfo;->hashCode()I

    move-result v3

    goto :goto_d1

    :cond_d1
    move v3, v2

    :goto_d1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 216
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userAudits:Ljava/util/List;

    if-eqz v3, :cond_d2

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_d2

    :cond_d2
    move v3, v2

    :goto_d2
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 217
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dynamicLabels:Ljava/util/List;

    if-eqz v3, :cond_d3

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_d3

    :cond_d3
    move v3, v2

    :goto_d3
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 218
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->details:Ljava/util/List;

    if-eqz v3, :cond_d4

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_d4

    :cond_d4
    move v3, v2

    :goto_d4
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 219
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->layer:Lcom/p1/mobile/putong/core/data/ColdStartLayer;

    if-eqz v3, :cond_d5

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ColdStartLayer;->hashCode()I

    move-result v3

    goto :goto_d5

    :cond_d5
    move v3, v2

    :goto_d5
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 220
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    if-eqz v3, :cond_d6

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_d6

    :cond_d6
    move v3, v2

    :goto_d6
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 221
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabGuide:Lcom/p1/mobile/putong/core/data/DatingGuideData;

    if-eqz v3, :cond_d7

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/DatingGuideData;->hashCode()I

    move-result v3

    goto :goto_d7

    :cond_d7
    move v3, v2

    :goto_d7
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 222
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileGuide:Z

    if-eqz v3, :cond_d8

    move v3, v5

    goto :goto_d8

    :cond_d8
    move v3, v4

    :goto_d8
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 223
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    if-eqz v3, :cond_d9

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/TagStrategy;->hashCode()I

    move-result v3

    goto :goto_d9

    :cond_d9
    move v3, v2

    :goto_d9
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 224
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    if-eqz v3, :cond_da

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_da

    :cond_da
    move v3, v2

    :goto_da
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 225
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeSuggest:Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;

    if-eqz v3, :cond_db

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/FakeQuickChatSuggestStatus;->hashCode()I

    move-result v3

    goto :goto_db

    :cond_db
    move v3, v2

    :goto_db
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 226
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    if-eqz v3, :cond_dc

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/RiskOtherData;->hashCode()I

    move-result v3

    goto :goto_dc

    :cond_dc
    move v3, v2

    :goto_dc
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 227
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->descriptionRisk:Lcom/p1/mobile/putong/core/data/RiskOtherData;

    if-eqz v3, :cond_dd

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/RiskOtherData;->hashCode()I

    move-result v3

    goto :goto_dd

    :cond_dd
    move v3, v2

    :goto_dd
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 228
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->risks:Ljava/util/List;

    if-eqz v3, :cond_de

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_de

    :cond_de
    move v3, v2

    :goto_de
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 229
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    if-eqz v3, :cond_df

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_df

    :cond_df
    move v3, v2

    :goto_df
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 230
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    if-eqz v3, :cond_e0

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_e0

    :cond_e0
    move v3, v2

    :goto_e0
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 231
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    if-eqz v3, :cond_e1

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/FateRadar;->hashCode()I

    move-result v3

    goto :goto_e1

    :cond_e1
    move v3, v2

    :goto_e1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 232
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->svipWeeklyReport:Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    if-eqz v3, :cond_e2

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->hashCode()I

    move-result v3

    goto :goto_e2

    :cond_e2
    move v3, v2

    :goto_e2
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 233
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    if-eqz v3, :cond_e3

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Explore;->hashCode()I

    move-result v3

    goto :goto_e3

    :cond_e3
    move v3, v2

    :goto_e3
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 234
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wechat:Lcom/p1/mobile/putong/core/data/WechatNotifySetting;

    if-eqz v3, :cond_e4

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/WechatNotifySetting;->hashCode()I

    move-result v3

    goto :goto_e4

    :cond_e4
    move v3, v2

    :goto_e4
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 235
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->vipSettings:Lcom/p1/mobile/putong/core/data/VipSetting;

    if-eqz v3, :cond_e5

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/VipSetting;->hashCode()I

    move-result v3

    goto :goto_e5

    :cond_e5
    move v3, v2

    :goto_e5
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 236
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakQuestions:Ljava/util/List;

    if-eqz v3, :cond_e6

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_e6

    :cond_e6
    move v3, v2

    :goto_e6
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 237
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakeGuideData:Lcom/p1/mobile/putong/core/data/FakeGuideData;

    if-eqz v3, :cond_e7

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/FakeGuideData;->hashCode()I

    move-result v3

    goto :goto_e7

    :cond_e7
    move v3, v2

    :goto_e7
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 238
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userActivityInfos:Ljava/util/List;

    if-eqz v3, :cond_e8

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_e8

    :cond_e8
    move v3, v2

    :goto_e8
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 239
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    if-eqz v3, :cond_e9

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Questionnaire;->hashCode()I

    move-result v3

    goto :goto_e9

    :cond_e9
    move v3, v2

    :goto_e9
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 240
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->features:Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;

    if-eqz v3, :cond_ea

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/QuestionnaireFeature;->hashCode()I

    move-result v3

    goto :goto_ea

    :cond_ea
    move v3, v2

    :goto_ea
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 241
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userStrategyConfiguration:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    if-eqz v3, :cond_eb

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->hashCode()I

    move-result v3

    goto :goto_eb

    :cond_eb
    move v3, v2

    :goto_eb
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 242
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fakePhotoFeedback:Ljava/util/List;

    if-eqz v3, :cond_ec

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_ec

    :cond_ec
    move v3, v2

    :goto_ec
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 243
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v3, :cond_ed

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->hashCode()I

    move-result v3

    goto :goto_ed

    :cond_ed
    move v3, v2

    :goto_ed
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 244
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v3, :cond_ee

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->hashCode()I

    move-result v3

    goto :goto_ee

    :cond_ee
    move v3, v2

    :goto_ee
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 245
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    if-eqz v3, :cond_ef

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->hashCode()I

    move-result v3

    goto :goto_ef

    :cond_ef
    move v3, v2

    :goto_ef
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 246
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealDetails:Ljava/util/List;

    if-eqz v3, :cond_f0

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_f0

    :cond_f0
    move v3, v2

    :goto_f0
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 247
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    if-eqz v3, :cond_f1

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/IdealInfo;->hashCode()I

    move-result v3

    goto :goto_f1

    :cond_f1
    move v3, v2

    :goto_f1
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 248
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->idealInfos:Ljava/util/List;

    if-eqz v3, :cond_f2

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_f2

    :cond_f2
    move v3, v2

    :goto_f2
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 249
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    if-eqz v3, :cond_f3

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_f3

    :cond_f3
    move v3, v2

    :goto_f3
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 250
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileCounts:Ljava/util/List;

    if-eqz v3, :cond_f4

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_f4

    :cond_f4
    move v3, v2

    :goto_f4
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 251
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateCustomResult:Lcom/p1/mobile/putong/core/data/PrivateCustomResult;

    if-eqz v3, :cond_f5

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PrivateCustomResult;->hashCode()I

    move-result v3

    goto :goto_f5

    :cond_f5
    move v3, v2

    :goto_f5
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 252
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->videoChatSecondFloorSummary:Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;

    if-eqz v3, :cond_f6

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/VideoChatSecondFloorSummary;->hashCode()I

    move-result v3

    goto :goto_f6

    :cond_f6
    move v3, v2

    :goto_f6
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 253
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesBanner:Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    if-eqz v3, :cond_f7

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->hashCode()I

    move-result v3

    goto :goto_f7

    :cond_f7
    move v3, v2

    :goto_f7
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 254
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realPicturesInfo:Lcom/p1/mobile/putong/core/data/RealPicturesInfo;

    if-eqz v3, :cond_f8

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/RealPicturesInfo;->hashCode()I

    move-result v3

    goto :goto_f8

    :cond_f8
    move v3, v2

    :goto_f8
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 255
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ipRegion:Ljava/util/List;

    if-eqz v3, :cond_f9

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_f9

    :cond_f9
    move v3, v2

    :goto_f9
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 256
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->realFeelInfo:Lcom/p1/mobile/putong/core/data/RealFeelInfo;

    if-eqz v3, :cond_fa

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/RealFeelInfo;->hashCode()I

    move-result v3

    goto :goto_fa

    :cond_fa
    move v3, v2

    :goto_fa
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 257
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetter:Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    if-eqz v3, :cond_fb

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->hashCode()I

    move-result v3

    goto :goto_fb

    :cond_fb
    move v3, v2

    :goto_fb
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 258
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterGroup:Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;

    if-eqz v3, :cond_fc

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/LoveLetterGroupInfo;->hashCode()I

    move-result v3

    goto :goto_fc

    :cond_fc
    move v3, v2

    :goto_fc
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 259
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->loveLetterContent:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    if-eqz v3, :cond_fd

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->hashCode()I

    move-result v3

    goto :goto_fd

    :cond_fd
    move v3, v2

    :goto_fd
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 260
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    if-eqz v3, :cond_fe

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ChatPage;->hashCode()I

    move-result v3

    goto :goto_fe

    :cond_fe
    move v3, v2

    :goto_fe
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 261
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    if-eqz v3, :cond_ff

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_ff

    :cond_ff
    move v3, v2

    :goto_ff
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 262
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    if-eqz v3, :cond_100

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->hashCode()I

    move-result v3

    goto :goto_100

    :cond_100
    move v3, v2

    :goto_100
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 263
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    if-eqz v3, :cond_101

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_101

    :cond_101
    move v3, v2

    :goto_101
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 264
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->myTabTasks:Ljava/util/List;

    if-eqz v3, :cond_102

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_102

    :cond_102
    move v3, v2

    :goto_102
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 265
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pendingPaymentGuidance:Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    if-eqz v3, :cond_103

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;->hashCode()I

    move-result v3

    goto :goto_103

    :cond_103
    move v3, v2

    :goto_103
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 266
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    if-eqz v3, :cond_104

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->hashCode()I

    move-result v3

    goto :goto_104

    :cond_104
    move v3, v2

    :goto_104
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 267
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    if-eqz v3, :cond_105

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->hashCode()I

    move-result v3

    goto :goto_105

    :cond_105
    move v3, v2

    :goto_105
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 268
    iget v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedByToday:I

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 269
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackQuestions:Ljava/util/List;

    if-eqz v3, :cond_106

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_106

    :cond_106
    move v3, v2

    :goto_106
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 270
    iget v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->feedbackRemainedNum:I

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 271
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantChat:Lcom/p1/mobile/putong/core/data/ConversationInstantChat;

    if-eqz v3, :cond_107

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ConversationInstantChat;->hashCode()I

    move-result v3

    goto :goto_107

    :cond_107
    move v3, v2

    :goto_107
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 272
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    if-eqz v3, :cond_108

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->hashCode()I

    move-result v3

    goto :goto_108

    :cond_108
    move v3, v2

    :goto_108
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 273
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    if-eqz v3, :cond_109

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->hashCode()I

    move-result v3

    goto :goto_109

    :cond_109
    move v3, v2

    :goto_109
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 274
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invitationInfo:Lcom/p1/mobile/putong/core/data/InvitationInfo;

    if-eqz v3, :cond_10a

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/InvitationInfo;->hashCode()I

    move-result v3

    goto :goto_10a

    :cond_10a
    move v3, v2

    :goto_10a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 275
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureVerifyRightedInfo:Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;

    if-eqz v3, :cond_10b

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PictureVerifyRightedInfo;->hashCode()I

    move-result v3

    goto :goto_10b

    :cond_10b
    move v3, v2

    :goto_10b
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 276
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    if-eqz v3, :cond_10c

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->hashCode()I

    move-result v3

    goto :goto_10c

    :cond_10c
    move v3, v2

    :goto_10c
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 277
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->canChange:Z

    if-eqz v3, :cond_10d

    move v4, v5

    :cond_10d
    add-int/2addr v0, v4

    mul-int/lit8 v0, v0, 0x29

    .line 278
    iget v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ttcToDiamondRate:I

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 279
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->prologues:Ljava/util/List;

    if-eqz v3, :cond_10e

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_10d

    :cond_10e
    move v3, v2

    :goto_10d
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 280
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchGiveCountInfo:Ljava/util/List;

    if-eqz v3, :cond_10f

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_10e

    :cond_10f
    move v3, v2

    :goto_10e
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 281
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->creditScores:Ljava/util/List;

    if-eqz v3, :cond_110

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_10f

    :cond_110
    move v3, v2

    :goto_10f
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 282
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    if-eqz v3, :cond_111

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_110

    :cond_111
    move v3, v2

    :goto_110
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 283
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->analysisGuide:Lcom/p1/mobile/putong/core/data/AnalysisGuide;

    if-eqz v3, :cond_112

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/AnalysisGuide;->hashCode()I

    move-result v3

    goto :goto_111

    :cond_112
    move v3, v2

    :goto_111
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 284
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorDoorInfo:Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    if-eqz v3, :cond_113

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->hashCode()I

    move-result v3

    goto :goto_112

    :cond_113
    move v3, v2

    :goto_112
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 285
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorInfo:Ljava/util/List;

    if-eqz v3, :cond_114

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_113

    :cond_114
    move v3, v2

    :goto_113
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 286
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->instantMatchUserInfo:Ljava/util/List;

    if-eqz v3, :cond_115

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_114

    :cond_115
    move v3, v2

    :goto_114
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 287
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendList:Ljava/util/List;

    if-eqz v3, :cond_116

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_115

    :cond_116
    move v3, v2

    :goto_115
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 288
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlBubble:Lcom/p1/mobile/putong/core/data/IntlTribeBubble;

    if-eqz v3, :cond_117

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/IntlTribeBubble;->hashCode()I

    move-result v3

    goto :goto_116

    :cond_117
    move v3, v2

    :goto_116
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 289
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->membershipUpgradeInfo:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    if-eqz v3, :cond_118

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;->hashCode()I

    move-result v3

    goto :goto_117

    :cond_118
    move v3, v2

    :goto_117
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 290
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->ultraRightsUpgradeInfo:Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;

    if-eqz v3, :cond_119

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/UltraRightsUpgradeInfo;->hashCode()I

    move-result v3

    goto :goto_118

    :cond_119
    move v3, v2

    :goto_118
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 291
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->purchaseSavePop:Lcom/p1/mobile/putong/core/data/PurchaseSavePop;

    if-eqz v3, :cond_11a

    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PurchaseSavePop;->hashCode()I

    move-result v3

    goto :goto_119

    :cond_11a
    move v3, v2

    :goto_119
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 292
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->swipeUpperLimit:Ljava/util/List;

    if-eqz v3, :cond_11b

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    goto :goto_11a

    :cond_11b
    move v3, v2

    :goto_11a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 293
    iget v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillInfo:I

    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 294
    iget v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->visitorAllCount:I

    add-int/2addr v0, v3

    .line 295
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScore:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    mul-int/lit8 v0, v0, 0x29

    ushr-long v5, v3, v1

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int/2addr v0, v3

    .line 296
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWillScoreThreshold:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    mul-int/lit8 v0, v0, 0x29

    ushr-long v5, v3, v1

    xor-long/2addr v3, v5

    long-to-int v3, v3

    add-int/2addr v0, v3

    .line 297
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreData;->scoreThresholdOther:D

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    mul-int/lit8 v0, v0, 0x29

    ushr-long v5, v3, v1

    xor-long/2addr v3, v5

    long-to-int v1, v3

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 298
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picksInfo:Ljava/util/List;

    if-eqz v1, :cond_11c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_11b

    :cond_11c
    move v1, v2

    :goto_11b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 299
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->superlikeByCounts:Ljava/util/List;

    if-eqz v1, :cond_11d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_11c

    :cond_11d
    move v1, v2

    :goto_11c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 300
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->complimentTexts:Ljava/util/List;

    if-eqz v1, :cond_11e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_11d

    :cond_11e
    move v1, v2

    :goto_11d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 301
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    if-eqz v1, :cond_11f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;->hashCode()I

    move-result v1

    goto :goto_11e

    :cond_11f
    move v1, v2

    :goto_11e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 302
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    if-eqz v1, :cond_120

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_11f

    :cond_120
    move v1, v2

    :goto_11f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iapAffiliatePromotions:Ljava/util/List;

    if-eqz v1, :cond_121

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v2

    :cond_121
    add-int/2addr v0, v2

    .line 304
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    :cond_122
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    new-instance v0, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contacts:Ljava/util/List;

    .line 47
    .line 48
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 49
    .line 50
    if-nez v0, :cond_4

    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->questions:Ljava/util/List;

    .line 58
    .line 59
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 60
    .line 61
    if-nez v0, :cond_5

    .line 62
    .line 63
    new-instance v0, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stickers:Ljava/util/List;

    .line 69
    .line 70
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 71
    .line 72
    if-nez v0, :cond_6

    .line 73
    .line 74
    new-instance v0, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->packages:Ljava/util/List;

    .line 80
    .line 81
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 82
    .line 83
    if-nez v0, :cond_7

    .line 84
    .line 85
    new-instance v0, Ljava/util/ArrayList;

    .line 86
    .line 87
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->bundles:Ljava/util/List;

    .line 91
    .line 92
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 93
    .line 94
    if-nez v0, :cond_8

    .line 95
    .line 96
    new-instance v0, Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->links:Ljava/util/List;

    .line 102
    .line 103
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 104
    .line 105
    if-nez v0, :cond_9

    .line 106
    .line 107
    new-instance v0, Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 113
    .line 114
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 115
    .line 116
    if-nez v0, :cond_a

    .line 117
    .line 118
    new-instance v0, Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->reminders:Ljava/util/List;

    .line 124
    .line 125
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 126
    .line 127
    if-nez v0, :cond_b

    .line 128
    .line 129
    new-instance v0, Ljava/util/ArrayList;

    .line 130
    .line 131
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .line 133
    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationCenter:Ljava/util/List;

    .line 135
    .line 136
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 137
    .line 138
    if-nez v0, :cond_c

    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Wallet;->new_()Lcom/p1/mobile/putong/core/data/Wallet;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->wallet:Lcom/p1/mobile/putong/core/data/Wallet;

    .line 145
    .line 146
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    .line 147
    .line 148
    if-nez v0, :cond_d

    .line 149
    .line 150
    new-instance v0, Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .line 154
    .line 155
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privateQuestions:Ljava/util/List;

    .line 156
    .line 157
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    .line 158
    .line 159
    if-nez v0, :cond_e

    .line 160
    .line 161
    new-instance v0, Ljava/util/ArrayList;

    .line 162
    .line 163
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 164
    .line 165
    .line 166
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->summarizedPrivileges:Ljava/util/List;

    .line 167
    .line 168
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 169
    .line 170
    if-nez v0, :cond_f

    .line 171
    .line 172
    new-instance v0, Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .line 176
    .line 177
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 178
    .line 179
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 180
    .line 181
    if-nez v0, :cond_10

    .line 182
    .line 183
    invoke-static {}, Lcom/p1/mobile/putong/data/Contract;->new_()Lcom/p1/mobile/putong/data/Contract;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->contract:Lcom/p1/mobile/putong/data/Contract;

    .line 188
    .line 189
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 190
    .line 191
    if-nez v0, :cond_11

    .line 192
    .line 193
    new-instance v0, Ljava/util/ArrayList;

    .line 194
    .line 195
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .line 197
    .line 198
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroups:Ljava/util/List;

    .line 199
    .line 200
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 201
    .line 202
    if-nez v0, :cond_12

    .line 203
    .line 204
    new-instance v0, Ljava/util/ArrayList;

    .line 205
    .line 206
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 207
    .line 208
    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGroupMembers:Ljava/util/List;

    .line 210
    .line 211
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 212
    .line 213
    if-nez v0, :cond_13

    .line 214
    .line 215
    new-instance v0, Ljava/util/ArrayList;

    .line 216
    .line 217
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .line 219
    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupApplies:Ljava/util/List;

    .line 221
    .line 222
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 223
    .line 224
    if-nez v0, :cond_14

    .line 225
    .line 226
    new-instance v0, Ljava/util/ArrayList;

    .line 227
    .line 228
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 229
    .line 230
    .line 231
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->interestedGroups:Ljava/util/List;

    .line 232
    .line 233
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    .line 234
    .line 235
    if-nez v0, :cond_15

    .line 236
    .line 237
    new-instance v0, Ljava/util/ArrayList;

    .line 238
    .line 239
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 240
    .line 241
    .line 242
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->groupTabs:Ljava/util/List;

    .line 243
    .line 244
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    .line 245
    .line 246
    if-nez v0, :cond_16

    .line 247
    .line 248
    new-instance v0, Ljava/util/ArrayList;

    .line 249
    .line 250
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 251
    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->keywords:Ljava/util/List;

    .line 254
    .line 255
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    .line 256
    .line 257
    if-nez v0, :cond_17

    .line 258
    .line 259
    new-instance v0, Ljava/util/ArrayList;

    .line 260
    .line 261
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 262
    .line 263
    .line 264
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->settingGroups:Ljava/util/List;

    .line 265
    .line 266
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    .line 267
    .line 268
    if-nez v0, :cond_18

    .line 269
    .line 270
    new-instance v0, Ljava/util/ArrayList;

    .line 271
    .line 272
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 273
    .line 274
    .line 275
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->redPackets:Ljava/util/List;

    .line 276
    .line 277
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 278
    .line 279
    if-nez v0, :cond_19

    .line 280
    .line 281
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CounterVerification;->new_()Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->counterVerification:Lcom/p1/mobile/putong/core/data/CounterVerification;

    .line 286
    .line 287
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    .line 288
    .line 289
    if-nez v0, :cond_1a

    .line 290
    .line 291
    new-instance v0, Ljava/util/ArrayList;

    .line 292
    .line 293
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .line 295
    .line 296
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->friends:Ljava/util/List;

    .line 297
    .line 298
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    .line 299
    .line 300
    if-nez v0, :cond_1b

    .line 301
    .line 302
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationDiff;->new_()Lcom/p1/mobile/putong/core/data/ConversationDiff;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversationDiff:Lcom/p1/mobile/putong/core/data/ConversationDiff;

    .line 307
    .line 308
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    .line 309
    .line 310
    if-nez v0, :cond_1c

    .line 311
    .line 312
    new-instance v0, Ljava/util/ArrayList;

    .line 313
    .line 314
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 315
    .line 316
    .line 317
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardStyles:Ljava/util/List;

    .line 318
    .line 319
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    .line 320
    .line 321
    if-nez v0, :cond_1d

    .line 322
    .line 323
    new-instance v0, Ljava/util/ArrayList;

    .line 324
    .line 325
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 326
    .line 327
    .line 328
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->audioTexts:Ljava/util/List;

    .line 329
    .line 330
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    .line 331
    .line 332
    if-nez v0, :cond_1e

    .line 333
    .line 334
    new-instance v0, Ljava/util/ArrayList;

    .line 335
    .line 336
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 337
    .line 338
    .line 339
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetings:Ljava/util/List;

    .line 340
    .line 341
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    .line 342
    .line 343
    if-nez v0, :cond_1f

    .line 344
    .line 345
    new-instance v0, Ljava/util/ArrayList;

    .line 346
    .line 347
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 348
    .line 349
    .line 350
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recentConversations:Ljava/util/List;

    .line 351
    .line 352
    :cond_1f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 353
    .line 354
    if-nez v0, :cond_20

    .line 355
    .line 356
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Picks;->new_()Lcom/p1/mobile/putong/core/data/Picks;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->picks:Lcom/p1/mobile/putong/core/data/Picks;

    .line 361
    .line 362
    :cond_20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 363
    .line 364
    if-nez v0, :cond_21

    .line 365
    .line 366
    new-instance v0, Ljava/util/ArrayList;

    .line 367
    .line 368
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 369
    .line 370
    .line 371
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 372
    .line 373
    :cond_21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    .line 374
    .line 375
    if-nez v0, :cond_22

    .line 376
    .line 377
    new-instance v0, Ljava/util/ArrayList;

    .line 378
    .line 379
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 380
    .line 381
    .line 382
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literaturesComments:Ljava/util/List;

    .line 383
    .line 384
    :cond_22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 385
    .line 386
    if-nez v0, :cond_23

    .line 387
    .line 388
    new-instance v0, Ljava/util/ArrayList;

    .line 389
    .line 390
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 391
    .line 392
    .line 393
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatures:Ljava/util/List;

    .line 394
    .line 395
    :cond_23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    .line 396
    .line 397
    if-nez v0, :cond_24

    .line 398
    .line 399
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FreeTrialInfo;->new_()Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialInfo:Lcom/p1/mobile/putong/core/data/FreeTrialInfo;

    .line 404
    .line 405
    :cond_24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    .line 406
    .line 407
    if-nez v0, :cond_25

    .line 408
    .line 409
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;->new_()Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->freeTrialOperateResult:Lcom/p1/mobile/putong/core/data/FreeTrialOperateResult;

    .line 414
    .line 415
    :cond_25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 416
    .line 417
    if-nez v0, :cond_26

    .line 418
    .line 419
    new-instance v0, Ljava/util/ArrayList;

    .line 420
    .line 421
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 422
    .line 423
    .line 424
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->states:Ljava/util/List;

    .line 425
    .line 426
    :cond_26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    .line 427
    .line 428
    if-nez v0, :cond_27

    .line 429
    .line 430
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;->new_()Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->thirdPartyInfo:Lcom/p1/mobile/putong/core/data/ThirdPartyInfo;

    .line 435
    .line 436
    :cond_27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    .line 437
    .line 438
    if-nez v0, :cond_28

    .line 439
    .line 440
    new-instance v0, Ljava/util/ArrayList;

    .line 441
    .line 442
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 443
    .line 444
    .line 445
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->privilegeGifts:Ljava/util/List;

    .line 446
    .line 447
    :cond_28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    .line 448
    .line 449
    if-nez v0, :cond_29

    .line 450
    .line 451
    new-instance v0, Ljava/util/ArrayList;

    .line 452
    .line 453
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 454
    .line 455
    .line 456
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommendMessages:Ljava/util/List;

    .line 457
    .line 458
    :cond_29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    .line 459
    .line 460
    if-nez v0, :cond_2a

    .line 461
    .line 462
    new-instance v0, Ljava/util/ArrayList;

    .line 463
    .line 464
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 465
    .line 466
    .line 467
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greets:Ljava/util/List;

    .line 468
    .line 469
    :cond_2a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 470
    .line 471
    if-nez v0, :cond_2b

    .line 472
    .line 473
    invoke-static {}, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->new_()Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 474
    .line 475
    .line 476
    move-result-object v0

    .line 477
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 478
    .line 479
    :cond_2b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    .line 480
    .line 481
    if-nez v0, :cond_2c

    .line 482
    .line 483
    new-instance v0, Ljava/util/ArrayList;

    .line 484
    .line 485
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 486
    .line 487
    .line 488
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlInsertCardSets:Ljava/util/List;

    .line 489
    .line 490
    :cond_2c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    .line 491
    .line 492
    if-nez v0, :cond_2d

    .line 493
    .line 494
    new-instance v0, Ljava/util/ArrayList;

    .line 495
    .line 496
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 497
    .line 498
    .line 499
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->actives:Ljava/util/List;

    .line 500
    .line 501
    :cond_2d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    .line 502
    .line 503
    if-nez v0, :cond_2e

    .line 504
    .line 505
    new-instance v0, Ljava/util/ArrayList;

    .line 506
    .line 507
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 508
    .line 509
    .line 510
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardsIcons:Ljava/util/List;

    .line 511
    .line 512
    :cond_2e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 513
    .line 514
    if-nez v0, :cond_2f

    .line 515
    .line 516
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;->new_()Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 517
    .line 518
    .line 519
    move-result-object v0

    .line 520
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tacitTest:Lcom/p1/mobile/putong/core/data/TacitTestProfileCard;

    .line 521
    .line 522
    :cond_2f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 523
    .line 524
    if-nez v0, :cond_30

    .line 525
    .line 526
    new-instance v0, Ljava/util/ArrayList;

    .line 527
    .line 528
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 529
    .line 530
    .line 531
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->iceBreakings:Ljava/util/List;

    .line 532
    .line 533
    :cond_30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    .line 534
    .line 535
    const-string v1, ""

    .line 536
    .line 537
    if-nez v0, :cond_31

    .line 538
    .line 539
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->avatar:Ljava/lang/String;

    .line 540
    .line 541
    :cond_31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 542
    .line 543
    if-nez v0, :cond_32

    .line 544
    .line 545
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 546
    .line 547
    .line 548
    move-result-object v0

    .line 549
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagLoadStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 550
    .line 551
    :cond_32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    .line 552
    .line 553
    if-nez v0, :cond_33

    .line 554
    .line 555
    new-instance v0, Ljava/util/ArrayList;

    .line 556
    .line 557
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 558
    .line 559
    .line 560
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tags:Ljava/util/List;

    .line 561
    .line 562
    :cond_33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 563
    .line 564
    if-nez v0, :cond_34

    .line 565
    .line 566
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 567
    .line 568
    .line 569
    move-result-object v0

    .line 570
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategoryStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 571
    .line 572
    :cond_34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    .line 573
    .line 574
    if-nez v0, :cond_35

    .line 575
    .line 576
    new-instance v0, Ljava/util/ArrayList;

    .line 577
    .line 578
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 579
    .line 580
    .line 581
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagCategories:Ljava/util/List;

    .line 582
    .line 583
    :cond_35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    .line 584
    .line 585
    if-nez v0, :cond_36

    .line 586
    .line 587
    new-instance v0, Ljava/util/ArrayList;

    .line 588
    .line 589
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 590
    .line 591
    .line 592
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagUserCounts:Ljava/util/List;

    .line 593
    .line 594
    :cond_36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    .line 595
    .line 596
    if-nez v0, :cond_37

    .line 597
    .line 598
    new-instance v0, Ljava/util/ArrayList;

    .line 599
    .line 600
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 601
    .line 602
    .line 603
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->sames:Ljava/util/List;

    .line 604
    .line 605
    :cond_37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 606
    .line 607
    if-nez v0, :cond_38

    .line 608
    .line 609
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;->new_()Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 610
    .line 611
    .line 612
    move-result-object v0

    .line 613
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->literatureConfigInfo:Lcom/p1/mobile/putong/core/data/LiteratureConfigInfo;

    .line 614
    .line 615
    :cond_38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 616
    .line 617
    if-nez v0, :cond_39

    .line 618
    .line 619
    new-instance v0, Ljava/util/ArrayList;

    .line 620
    .line 621
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 622
    .line 623
    .line 624
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 625
    .line 626
    :cond_39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    .line 627
    .line 628
    if-nez v0, :cond_3a

    .line 629
    .line 630
    new-instance v0, Ljava/util/ArrayList;

    .line 631
    .line 632
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 633
    .line 634
    .line 635
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeInfos:Ljava/util/List;

    .line 636
    .line 637
    :cond_3a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    .line 638
    .line 639
    if-nez v0, :cond_3b

    .line 640
    .line 641
    new-instance v0, Ljava/util/ArrayList;

    .line 642
    .line 643
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 644
    .line 645
    .line 646
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraits:Ljava/util/List;

    .line 647
    .line 648
    :cond_3b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    .line 649
    .line 650
    if-nez v0, :cond_3c

    .line 651
    .line 652
    new-instance v0, Ljava/util/ArrayList;

    .line 653
    .line 654
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 655
    .line 656
    .line 657
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikesComments:Ljava/util/List;

    .line 658
    .line 659
    :cond_3c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 660
    .line 661
    if-nez v0, :cond_3d

    .line 662
    .line 663
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;->new_()Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 664
    .line 665
    .line 666
    move-result-object v0

    .line 667
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->profileLikeCounter:Lcom/p1/mobile/putong/core/data/ExpandedProfileLikeCounter;

    .line 668
    .line 669
    :cond_3d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 670
    .line 671
    if-nez v0, :cond_3e

    .line 672
    .line 673
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->new_()Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 674
    .line 675
    .line 676
    move-result-object v0

    .line 677
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 678
    .line 679
    :cond_3e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 680
    .line 681
    if-nez v0, :cond_3f

    .line 682
    .line 683
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;->new_()Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 684
    .line 685
    .line 686
    move-result-object v0

    .line 687
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->selectedQuestion:Lcom/p1/mobile/putong/core/data/ProfileSelectedQue;

    .line 688
    .line 689
    :cond_3f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    .line 690
    .line 691
    if-nez v0, :cond_40

    .line 692
    .line 693
    new-instance v0, Ljava/util/ArrayList;

    .line 694
    .line 695
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 696
    .line 697
    .line 698
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->likeUsers:Ljava/util/List;

    .line 699
    .line 700
    :cond_40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    .line 701
    .line 702
    if-nez v0, :cond_41

    .line 703
    .line 704
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CipherId;->new_()Lcom/p1/mobile/putong/core/data/CipherId;

    .line 705
    .line 706
    .line 707
    move-result-object v0

    .line 708
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cipherId:Lcom/p1/mobile/putong/core/data/CipherId;

    .line 709
    .line 710
    :cond_41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    .line 711
    .line 712
    if-nez v0, :cond_42

    .line 713
    .line 714
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ShareId;->new_()Lcom/p1/mobile/putong/core/data/ShareId;

    .line 715
    .line 716
    .line 717
    move-result-object v0

    .line 718
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->shareId:Lcom/p1/mobile/putong/core/data/ShareId;

    .line 719
    .line 720
    :cond_42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 721
    .line 722
    if-nez v0, :cond_43

    .line 723
    .line 724
    new-instance v0, Ljava/util/ArrayList;

    .line 725
    .line 726
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 727
    .line 728
    .line 729
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->stateEmotion:Ljava/util/List;

    .line 730
    .line 731
    :cond_43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    .line 732
    .line 733
    if-nez v0, :cond_44

    .line 734
    .line 735
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeePortraitCounter;->new_()Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    .line 736
    .line 737
    .line 738
    move-result-object v0

    .line 739
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seePortraitCounter:Lcom/p1/mobile/putong/core/data/SeePortraitCounter;

    .line 740
    .line 741
    :cond_44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    .line 742
    .line 743
    if-nez v0, :cond_45

    .line 744
    .line 745
    new-instance v0, Ljava/util/ArrayList;

    .line 746
    .line 747
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 748
    .line 749
    .line 750
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recommended:Ljava/util/List;

    .line 751
    .line 752
    :cond_45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    .line 753
    .line 754
    if-nez v0, :cond_46

    .line 755
    .line 756
    new-instance v0, Ljava/util/ArrayList;

    .line 757
    .line 758
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 759
    .line 760
    .line 761
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeats:Ljava/util/List;

    .line 762
    .line 763
    :cond_46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    .line 764
    .line 765
    if-nez v0, :cond_47

    .line 766
    .line 767
    new-instance v0, Ljava/util/ArrayList;

    .line 768
    .line 769
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 770
    .line 771
    .line 772
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatHeatPermissions:Ljava/util/List;

    .line 773
    .line 774
    :cond_47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    .line 775
    .line 776
    if-nez v0, :cond_48

    .line 777
    .line 778
    new-instance v0, Ljava/util/ArrayList;

    .line 779
    .line 780
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 781
    .line 782
    .line 783
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->resources:Ljava/util/List;

    .line 784
    .line 785
    :cond_48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    .line 786
    .line 787
    if-nez v0, :cond_49

    .line 788
    .line 789
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingResult;->new_()Lcom/p1/mobile/putong/core/data/GreetingResult;

    .line 790
    .line 791
    .line 792
    move-result-object v0

    .line 793
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->greetingResult:Lcom/p1/mobile/putong/core/data/GreetingResult;

    .line 794
    .line 795
    :cond_49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    .line 796
    .line 797
    if-nez v0, :cond_4a

    .line 798
    .line 799
    new-instance v0, Ljava/util/ArrayList;

    .line 800
    .line 801
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 802
    .line 803
    .line 804
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->latestMoments:Ljava/util/List;

    .line 805
    .line 806
    :cond_4a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    .line 807
    .line 808
    if-nez v0, :cond_4b

    .line 809
    .line 810
    invoke-static {}, Lcom/p1/mobile/putong/core/data/JmpTarget;->new_()Lcom/p1/mobile/putong/core/data/JmpTarget;

    .line 811
    .line 812
    .line 813
    move-result-object v0

    .line 814
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->jmpTarget:Lcom/p1/mobile/putong/core/data/JmpTarget;

    .line 815
    .line 816
    :cond_4b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    .line 817
    .line 818
    if-nez v0, :cond_4c

    .line 819
    .line 820
    new-instance v0, Ljava/util/ArrayList;

    .line 821
    .line 822
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 823
    .line 824
    .line 825
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->buzzUsers:Ljava/util/List;

    .line 826
    .line 827
    :cond_4c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    .line 828
    .line 829
    if-nez v0, :cond_4d

    .line 830
    .line 831
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ODiamondListItem;->new_()Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    .line 832
    .line 833
    .line 834
    move-result-object v0

    .line 835
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->odiamondList:Lcom/p1/mobile/putong/core/data/ODiamondListItem;

    .line 836
    .line 837
    :cond_4d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 838
    .line 839
    if-nez v0, :cond_4e

    .line 840
    .line 841
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PopGuide;->new_()Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 842
    .line 843
    .line 844
    move-result-object v0

    .line 845
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->popGuide:Lcom/p1/mobile/putong/core/data/PopGuide;

    .line 846
    .line 847
    :cond_4e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    .line 848
    .line 849
    if-nez v0, :cond_4f

    .line 850
    .line 851
    new-instance v0, Ljava/util/ArrayList;

    .line 852
    .line 853
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 854
    .line 855
    .line 856
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->floats:Ljava/util/List;

    .line 857
    .line 858
    :cond_4f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 859
    .line 860
    if-nez v0, :cond_50

    .line 861
    .line 862
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MonetizationMsg;->new_()Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 863
    .line 864
    .line 865
    move-result-object v0

    .line 866
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->monetizationMsg:Lcom/p1/mobile/putong/core/data/MonetizationMsg;

    .line 867
    .line 868
    :cond_50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    .line 869
    .line 870
    if-nez v0, :cond_51

    .line 871
    .line 872
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    .line 873
    .line 874
    .line 875
    move-result-object v0

    .line 876
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tab:Lcom/p1/mobile/putong/core/data/GrowthMomentThemeCardInfo;

    .line 877
    .line 878
    :cond_51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 879
    .line 880
    if-nez v0, :cond_52

    .line 881
    .line 882
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeExposedUser;->new_()Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 883
    .line 884
    .line 885
    move-result-object v0

    .line 886
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeExposedUser:Lcom/p1/mobile/putong/core/data/SeeExposedUser;

    .line 887
    .line 888
    :cond_52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    .line 889
    .line 890
    if-nez v0, :cond_53

    .line 891
    .line 892
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    .line 893
    .line 894
    .line 895
    move-result-object v0

    .line 896
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->exposureInfo:Lcom/p1/mobile/putong/core/data/GrowthExposureInfo;

    .line 897
    .line 898
    :cond_53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    .line 899
    .line 900
    if-nez v0, :cond_54

    .line 901
    .line 902
    new-instance v0, Ljava/util/ArrayList;

    .line 903
    .line 904
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 905
    .line 906
    .line 907
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->love520:Ljava/util/List;

    .line 908
    .line 909
    :cond_54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    .line 910
    .line 911
    if-nez v0, :cond_55

    .line 912
    .line 913
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreData;->payWill:Ljava/lang/String;

    .line 914
    .line 915
    :cond_55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    .line 916
    .line 917
    if-nez v0, :cond_56

    .line 918
    .line 919
    new-instance v0, Ljava/util/ArrayList;

    .line 920
    .line 921
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 922
    .line 923
    .line 924
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremePickByList:Ljava/util/List;

    .line 925
    .line 926
    :cond_56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 927
    .line 928
    if-nez v0, :cond_57

    .line 929
    .line 930
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGameInfo;->new_()Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 931
    .line 932
    .line 933
    move-result-object v0

    .line 934
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatGameInfo:Lcom/p1/mobile/putong/core/data/ChatGameInfo;

    .line 935
    .line 936
    :cond_57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    .line 937
    .line 938
    if-nez v0, :cond_58

    .line 939
    .line 940
    new-instance v0, Ljava/util/ArrayList;

    .line 941
    .line 942
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 943
    .line 944
    .line 945
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->camping:Ljava/util/List;

    .line 946
    .line 947
    :cond_58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 948
    .line 949
    if-nez v0, :cond_59

    .line 950
    .line 951
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RecallMatch;->new_()Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 952
    .line 953
    .line 954
    move-result-object v0

    .line 955
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->recallMatch:Lcom/p1/mobile/putong/core/data/RecallMatch;

    .line 956
    .line 957
    :cond_59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    .line 958
    .line 959
    if-nez v0, :cond_5a

    .line 960
    .line 961
    new-instance v0, Ljava/util/ArrayList;

    .line 962
    .line 963
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 964
    .line 965
    .line 966
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_regular:Ljava/util/List;

    .line 967
    .line 968
    :cond_5a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    .line 969
    .line 970
    if-nez v0, :cond_5b

    .line 971
    .line 972
    new-instance v0, Ljava/util/ArrayList;

    .line 973
    .line 974
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 975
    .line 976
    .line 977
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->intlVisitorInfo:Ljava/util/List;

    .line 978
    .line 979
    :cond_5b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    .line 980
    .line 981
    if-nez v0, :cond_5c

    .line 982
    .line 983
    new-instance v0, Ljava/util/ArrayList;

    .line 984
    .line 985
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 986
    .line 987
    .line 988
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->invalidCardList:Ljava/util/List;

    .line 989
    .line 990
    :cond_5c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    .line 991
    .line 992
    if-nez v0, :cond_5d

    .line 993
    .line 994
    new-instance v0, Ljava/util/ArrayList;

    .line 995
    .line 996
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 997
    .line 998
    .line 999
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatAssistantQuestions:Ljava/util/List;

    .line 1000
    .line 1001
    :cond_5d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    .line 1002
    .line 1003
    if-nez v0, :cond_5e

    .line 1004
    .line 1005
    new-instance v0, Ljava/util/ArrayList;

    .line 1006
    .line 1007
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1008
    .line 1009
    .line 1010
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_quiz:Ljava/util/List;

    .line 1011
    .line 1012
    :cond_5e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    .line 1013
    .line 1014
    if-nez v0, :cond_5f

    .line 1015
    .line 1016
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExtremeQuestions;->new_()Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    .line 1017
    .line 1018
    .line 1019
    move-result-object v0

    .line 1020
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->extremeQuestions:Lcom/p1/mobile/putong/core/data/ExtremeQuestions;

    .line 1021
    .line 1022
    :cond_5f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    .line 1023
    .line 1024
    if-nez v0, :cond_60

    .line 1025
    .line 1026
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BoostResultEntry;->new_()Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    .line 1027
    .line 1028
    .line 1029
    move-result-object v0

    .line 1030
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->boostResultEntry:Lcom/p1/mobile/putong/core/data/BoostResultEntry;

    .line 1031
    .line 1032
    :cond_60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    .line 1033
    .line 1034
    if-nez v0, :cond_61

    .line 1035
    .line 1036
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MatchInfo;->new_()Lcom/p1/mobile/putong/core/data/MatchInfo;

    .line 1037
    .line 1038
    .line 1039
    move-result-object v0

    .line 1040
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->todayMatchInfo:Lcom/p1/mobile/putong/core/data/MatchInfo;

    .line 1041
    .line 1042
    :cond_61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 1043
    .line 1044
    if-nez v0, :cond_62

    .line 1045
    .line 1046
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthMesInfo;->new_()Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 1047
    .line 1048
    .line 1049
    move-result-object v0

    .line 1050
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->growthMesInfo:Lcom/p1/mobile/putong/core/data/GrowthMesInfo;

    .line 1051
    .line 1052
    :cond_62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    .line 1053
    .line 1054
    if-nez v0, :cond_63

    .line 1055
    .line 1056
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiPictureAuth;->new_()Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v0

    .line 1060
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiPictureAuth:Lcom/p1/mobile/putong/core/data/AiPictureAuth;

    .line 1061
    .line 1062
    :cond_63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 1063
    .line 1064
    if-nez v0, :cond_64

    .line 1065
    .line 1066
    invoke-static {}, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->new_()Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 1067
    .line 1068
    .line 1069
    move-result-object v0

    .line 1070
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 1071
    .line 1072
    :cond_64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    .line 1073
    .line 1074
    if-nez v0, :cond_65

    .line 1075
    .line 1076
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GrowthPartner;->new_()Lcom/p1/mobile/putong/core/data/GrowthPartner;

    .line 1077
    .line 1078
    .line 1079
    move-result-object v0

    .line 1080
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->partner:Lcom/p1/mobile/putong/core/data/GrowthPartner;

    .line 1081
    .line 1082
    :cond_65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 1083
    .line 1084
    if-nez v0, :cond_66

    .line 1085
    .line 1086
    new-instance v0, Ljava/util/ArrayList;

    .line 1087
    .line 1088
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1089
    .line 1090
    .line 1091
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCData:Ljava/util/List;

    .line 1092
    .line 1093
    :cond_66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 1094
    .line 1095
    if-nez v0, :cond_67

    .line 1096
    .line 1097
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CityCBanner;->new_()Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 1098
    .line 1099
    .line 1100
    move-result-object v0

    .line 1101
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->cityCBanner:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 1102
    .line 1103
    :cond_67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 1104
    .line 1105
    if-nez v0, :cond_68

    .line 1106
    .line 1107
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartners;->new_()Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 1108
    .line 1109
    .line 1110
    move-result-object v0

    .line 1111
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 1112
    .line 1113
    :cond_68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    .line 1114
    .line 1115
    if-nez v0, :cond_69

    .line 1116
    .line 1117
    new-instance v0, Ljava/util/ArrayList;

    .line 1118
    .line 1119
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1120
    .line 1121
    .line 1122
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartnersSignals:Ljava/util/List;

    .line 1123
    .line 1124
    :cond_69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1125
    .line 1126
    if-nez v0, :cond_6a

    .line 1127
    .line 1128
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1129
    .line 1130
    .line 1131
    move-result-object v0

    .line 1132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1133
    .line 1134
    :cond_6a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    .line 1135
    .line 1136
    if-nez v0, :cond_6b

    .line 1137
    .line 1138
    new-instance v0, Ljava/util/ArrayList;

    .line 1139
    .line 1140
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1141
    .line 1142
    .line 1143
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->mkt_activity_flash:Ljava/util/List;

    .line 1144
    .line 1145
    :cond_6b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    .line 1146
    .line 1147
    if-nez v0, :cond_6c

    .line 1148
    .line 1149
    new-instance v0, Ljava/util/ArrayList;

    .line 1150
    .line 1151
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1152
    .line 1153
    .line 1154
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->auditPictureTags:Ljava/util/List;

    .line 1155
    .line 1156
    :cond_6c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 1157
    .line 1158
    if-nez v0, :cond_6d

    .line 1159
    .line 1160
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TagStrategy;->new_()Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 1161
    .line 1162
    .line 1163
    move-result-object v0

    .line 1164
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->tagPictureStrategy:Lcom/p1/mobile/putong/core/data/TagStrategy;

    .line 1165
    .line 1166
    :cond_6d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    .line 1167
    .line 1168
    if-nez v0, :cond_6e

    .line 1169
    .line 1170
    new-instance v0, Ljava/util/ArrayList;

    .line 1171
    .line 1172
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1173
    .line 1174
    .line 1175
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->pictureTags:Ljava/util/List;

    .line 1176
    .line 1177
    :cond_6e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    .line 1178
    .line 1179
    if-nez v0, :cond_6f

    .line 1180
    .line 1181
    new-instance v0, Ljava/util/ArrayList;

    .line 1182
    .line 1183
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1184
    .line 1185
    .line 1186
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverPlaces:Ljava/util/List;

    .line 1187
    .line 1188
    :cond_6f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    .line 1189
    .line 1190
    if-nez v0, :cond_70

    .line 1191
    .line 1192
    new-instance v0, Ljava/util/ArrayList;

    .line 1193
    .line 1194
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1195
    .line 1196
    .line 1197
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->barLoverCities:Ljava/util/List;

    .line 1198
    .line 1199
    :cond_70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 1200
    .line 1201
    if-nez v0, :cond_71

    .line 1202
    .line 1203
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FateRadar;->new_()Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 1204
    .line 1205
    .line 1206
    move-result-object v0

    .line 1207
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->fateRadar:Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 1208
    .line 1209
    :cond_71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 1210
    .line 1211
    if-nez v0, :cond_72

    .line 1212
    .line 1213
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Explore;->new_()Lcom/p1/mobile/putong/core/data/Explore;

    .line 1214
    .line 1215
    .line 1216
    move-result-object v0

    .line 1217
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->explore:Lcom/p1/mobile/putong/core/data/Explore;

    .line 1218
    .line 1219
    :cond_72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1220
    .line 1221
    if-nez v0, :cond_73

    .line 1222
    .line 1223
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1224
    .line 1225
    .line 1226
    move-result-object v0

    .line 1227
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1228
    .line 1229
    :cond_73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1230
    .line 1231
    if-nez v0, :cond_74

    .line 1232
    .line 1233
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1234
    .line 1235
    .line 1236
    move-result-object v0

    .line 1237
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1238
    .line 1239
    :cond_74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 1240
    .line 1241
    if-nez v0, :cond_75

    .line 1242
    .line 1243
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;->new_()Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 1244
    .line 1245
    .line 1246
    move-result-object v0

    .line 1247
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->userFeedbackInfo:Lcom/p1/mobile/putong/core/data/UserFeedbackInfo;

    .line 1248
    .line 1249
    :cond_75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    .line 1250
    .line 1251
    if-nez v0, :cond_76

    .line 1252
    .line 1253
    new-instance v0, Ljava/util/ArrayList;

    .line 1254
    .line 1255
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1256
    .line 1257
    .line 1258
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->urlTags:Ljava/util/List;

    .line 1259
    .line 1260
    :cond_76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    .line 1261
    .line 1262
    if-nez v0, :cond_77

    .line 1263
    .line 1264
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPage;->new_()Lcom/p1/mobile/putong/core/data/ChatPage;

    .line 1265
    .line 1266
    .line 1267
    move-result-object v0

    .line 1268
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPage:Lcom/p1/mobile/putong/core/data/ChatPage;

    .line 1269
    .line 1270
    :cond_77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    .line 1271
    .line 1272
    if-nez v0, :cond_78

    .line 1273
    .line 1274
    new-instance v0, Ljava/util/ArrayList;

    .line 1275
    .line 1276
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1277
    .line 1278
    .line 1279
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->showOnlineForWhoIMeet:Ljava/util/List;

    .line 1280
    .line 1281
    :cond_78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1282
    .line 1283
    if-nez v0, :cond_79

    .line 1284
    .line 1285
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->new_()Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1286
    .line 1287
    .line 1288
    move-result-object v0

    .line 1289
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->notVerificationResultData:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 1290
    .line 1291
    :cond_79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 1292
    .line 1293
    if-nez v0, :cond_7a

    .line 1294
    .line 1295
    new-instance v0, Ljava/util/ArrayList;

    .line 1296
    .line 1297
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1298
    .line 1299
    .line 1300
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->verificationLowLabels:Ljava/util/List;

    .line 1301
    .line 1302
    :cond_7a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    .line 1303
    .line 1304
    if-nez v0, :cond_7b

    .line 1305
    .line 1306
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeTrialEligible;->new_()Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    .line 1307
    .line 1308
    .line 1309
    move-result-object v0

    .line 1310
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialEligible:Lcom/p1/mobile/putong/core/data/SeeTrialEligible;

    .line 1311
    .line 1312
    :cond_7b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    .line 1313
    .line 1314
    if-nez v0, :cond_7c

    .line 1315
    .line 1316
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeTrialStatus;->new_()Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    .line 1317
    .line 1318
    .line 1319
    move-result-object v0

    .line 1320
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->seeTrialStatus:Lcom/p1/mobile/putong/core/data/SeeTrialStatus;

    .line 1321
    .line 1322
    :cond_7c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    .line 1323
    .line 1324
    if-nez v0, :cond_7d

    .line 1325
    .line 1326
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AIChatAdvice;->new_()Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    .line 1327
    .line 1328
    .line 1329
    move-result-object v0

    .line 1330
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAdvice:Lcom/p1/mobile/putong/core/data/AIChatAdvice;

    .line 1331
    .line 1332
    :cond_7d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 1333
    .line 1334
    if-nez v0, :cond_7e

    .line 1335
    .line 1336
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AIChatAnalysis;->new_()Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 1337
    .line 1338
    .line 1339
    move-result-object v0

    .line 1340
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->aiChatAnalysis:Lcom/p1/mobile/putong/core/data/AIChatAnalysis;

    .line 1341
    .line 1342
    :cond_7e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 1343
    .line 1344
    if-nez v0, :cond_7f

    .line 1345
    .line 1346
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->new_()Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 1347
    .line 1348
    .line 1349
    move-result-object v0

    .line 1350
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->diamond:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    .line 1351
    .line 1352
    :cond_7f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    .line 1353
    .line 1354
    if-nez v0, :cond_80

    .line 1355
    .line 1356
    new-instance v0, Ljava/util/ArrayList;

    .line 1357
    .line 1358
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1359
    .line 1360
    .line 1361
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->dislikedUsers:Ljava/util/List;

    .line 1362
    .line 1363
    :cond_80
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
