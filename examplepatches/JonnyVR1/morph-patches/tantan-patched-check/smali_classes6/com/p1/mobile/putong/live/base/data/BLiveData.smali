.class public Lcom/p1/mobile/putong/live/base/data/BLiveData;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivedata"


# instance fields
.field public accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x68
    .end annotation
.end field

.field public accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x66
    .end annotation
.end field

.field public accompanyTasks:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x67
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;",
            ">;"
        }
    .end annotation
.end field

.field public accompanyUserRanking:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;",
            ">;"
        }
    .end annotation
.end field

.field public activitySuggests:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;",
            ">;"
        }
    .end annotation
.end field

.field public advancedTasks:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x50
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;",
            ">;"
        }
    .end annotation
.end field

.field public anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10d
    .end annotation
.end field

.field public anchorDailyTasks:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x79
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;",
            ">;"
        }
    .end annotation
.end field

.field public anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x102
    .end annotation
.end field

.field public anchorHierarchyGrades:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;",
            ">;"
        }
    .end annotation
.end field

.field public anchorKnightInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x54
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;",
            ">;"
        }
    .end annotation
.end field

.field public anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xdb
    .end annotation
.end field

.field public anchors:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            ">;"
        }
    .end annotation
.end field

.field public auctionApplies:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe0
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;",
            ">;"
        }
    .end annotation
.end field

.field public auctionCandidates:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xdf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;",
            ">;"
        }
    .end annotation
.end field

.field public auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf6
    .end annotation
.end field

.field public auctionInvites:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;",
            ">;"
        }
    .end annotation
.end field

.field public auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf3
    .end annotation
.end field

.field public auctionRelationCards:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;",
            ">;"
        }
    .end annotation
.end field

.field public backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xaa
    .end annotation
.end field

.field public bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf7
    .end annotation
.end field

.field public bigTVLives:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;"
        }
    .end annotation
.end field

.field public bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12d
    .end annotation
.end field

.field public bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12e
    .end annotation
.end field

.field public bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public callInvites:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;",
            ">;"
        }
    .end annotation
.end field

.field public callSummaries:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;",
            ">;"
        }
    .end annotation
.end field

.field public calls:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCall;",
            ">;"
        }
    .end annotation
.end field

.field public canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x123
    .end annotation
.end field

.field public cells:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;",
            ">;"
        }
    .end annotation
.end field

.field public chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb5
    .end annotation
.end field

.field public chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x58
    .end annotation
.end field

.field public chatTips:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;",
            ">;"
        }
    .end annotation
.end field

.field public chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd5
    .end annotation
.end field

.field public chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd4
    .end annotation
.end field

.field public chestRewardInfo:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;",
            ">;"
        }
    .end annotation
.end field

.field public code:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x113
    .end annotation
.end field

.field public complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb9
    .end annotation
.end field

.field public complexCardList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xad
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;",
            ">;"
        }
    .end annotation
.end field

.field public connector:Lcom/p1/mobile/putong/data/Connector;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public cpInviteRecords:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x103
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;",
            ">;"
        }
    .end annotation
.end field

.field public cpRecommendUserList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;",
            ">;"
        }
    .end annotation
.end field

.field public dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xab
    .end annotation
.end field

.field public dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf4
    .end annotation
.end field

.field public emojiPlayMenu:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x100
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;",
            ">;"
        }
    .end annotation
.end field

.field public equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x56
    .end annotation
.end field

.field public exchangeTTCRedpoint:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xea
    .end annotation
.end field

.field public fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5c
    .end annotation
.end field

.field public fakeUserProfiles:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;",
            ">;"
        }
    .end annotation
.end field

.field public family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xec
    .end annotation
.end field

.field public familyMedals:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xba
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;",
            ">;"
        }
    .end annotation
.end field

.field public familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xed
    .end annotation
.end field

.field public fanbaseDetails:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;",
            ">;"
        }
    .end annotation
.end field

.field public fanbaseHierarchies:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x32
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;",
            ">;"
        }
    .end annotation
.end field

.field public fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2e
    .end annotation
.end field

.field public fanbaseMedals:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;",
            ">;"
        }
    .end annotation
.end field

.field public fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8e
    .end annotation
.end field

.field public fanbaseRedPacketEventCounters:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;",
            ">;"
        }
    .end annotation
.end field

.field public fanbaseRelations:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x31
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRelationShip;",
            ">;"
        }
    .end annotation
.end field

.field public fanbases:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;",
            ">;"
        }
    .end annotation
.end field

.field public firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7e
    .end annotation
.end field

.field public firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7d
    .end annotation
.end field

.field public flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb3
    .end annotation
.end field

.field public followships:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation
.end field

.field public funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x116
    .end annotation
.end field

.field public game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x122
    .end annotation
.end field

.field public gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x121
    .end annotation
.end field

.field public gameInfoResponse:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x74
    .end annotation
.end field

.field public gameOperationPositions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x105
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;",
            ">;"
        }
    .end annotation
.end field

.field public gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x115
    .end annotation
.end field

.field public giftDetails:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;",
            ">;"
        }
    .end annotation
.end field

.field public giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe5
    .end annotation
.end field

.field public giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x69
    .end annotation
.end field

.field public giftShowcaseItems:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x65
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;",
            ">;"
        }
    .end annotation
.end field

.field public giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xff
    .end annotation
.end field

.field public giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4f
    .end annotation
.end field

.field public giftWallV3Briefs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;",
            ">;"
        }
    .end annotation
.end field

.field public givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6b
    .end annotation
.end field

.field public givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public grabHatCps:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
            ">;"
        }
    .end annotation
.end field

.field public grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa1
    .end annotation
.end field

.field public grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2f
    .end annotation
.end field

.field public guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12c
    .end annotation
.end field

.field public guardAnchorRankInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x76
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;",
            ">;"
        }
    .end annotation
.end field

.field public guardRecords:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x77
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;",
            ">;"
        }
    .end annotation
.end field

.field public heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12a
    .end annotation
.end field

.field public heatVoiceRoomTasks:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;",
            ">;"
        }
    .end annotation
.end field

.field public hierarchies:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;",
            ">;"
        }
    .end annotation
.end field

.field public hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11e
    .end annotation
.end field

.field public intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf9
    .end annotation
.end field

.field public intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x120
    .end annotation
.end field

.field public intlVoiceLiveCampaigns:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xac
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;",
            ">;"
        }
    .end annotation
.end field

.field public isAnchor:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x109
    .end annotation
.end field

.field public knightsInfosSummary:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x51
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;",
            ">;"
        }
    .end annotation
.end field

.field public knightsRuleInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x53
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;",
            ">;"
        }
    .end annotation
.end field

.field public leaderboardUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;",
            ">;"
        }
    .end annotation
.end field

.field public leaderboards:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation
.end field

.field public liveActivities:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveActivity;",
            ">;"
        }
    .end annotation
.end field

.field public liveActivitySummaries:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;",
            ">;"
        }
    .end annotation
.end field

.field public liveAnchors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;",
            ">;"
        }
    .end annotation
.end field

.field public liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x70
    .end annotation
.end field

.field public liveCampaigns:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;",
            ">;"
        }
    .end annotation
.end field

.field public liveChatMessages:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;",
            ">;"
        }
    .end annotation
.end field

.field public liveClarityLevelInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveClarity;",
            ">;"
        }
    .end annotation
.end field

.field public liveHierarchyGrades:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;",
            ">;"
        }
    .end annotation
.end field

.field public liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xdd
    .end annotation
.end field

.field public liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4c
    .end annotation
.end field

.field public livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfd
    .end annotation
.end field

.field public livePushes:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePush;",
            ">;"
        }
    .end annotation
.end field

.field public liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe9
    .end annotation
.end field

.field public liveResources:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEffect;",
            ">;"
        }
    .end annotation
.end field

.field public liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7b
    .end annotation
.end field

.field public liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc5
    .end annotation
.end field

.field public liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public liveSchemas:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x91
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/LiveMultiCallLiveSchema;",
            ">;"
        }
    .end annotation
.end field

.field public liveSquareSummaries:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;",
            ">;"
        }
    .end annotation
.end field

.field public liveStickerTemplates:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;"
        }
    .end annotation
.end field

.field public liveStickerTemplatesGifts:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public liveStickers:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;",
            ">;"
        }
    .end annotation
.end field

.field public liveSummaries:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSummary;",
            ">;"
        }
    .end annotation
.end field

.field public liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9b
    .end annotation
.end field

.field public lives:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;"
        }
    .end annotation
.end field

.field public lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfb
    .end annotation
.end field

.field public luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf8
    .end annotation
.end field

.field public managers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation
.end field

.field public masks:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x57
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;"
        }
    .end annotation
.end field

.field public medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11f
    .end annotation
.end field

.field public medals:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;",
            ">;"
        }
    .end annotation
.end field

.field public media:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;",
            ">;"
        }
    .end annotation
.end field

.field public memberActivityList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x99
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;",
            ">;"
        }
    .end annotation
.end field

.field public memberLbs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x126
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;",
            ">;"
        }
    .end annotation
.end field

.field public members:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation
.end field

.field public menuItems:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field public missedCallCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10c
    .end annotation
.end field

.field public missedCalls:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;",
            ">;"
        }
    .end annotation
.end field

.field public modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd7
    .end annotation
.end field

.field public momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x88
    .end annotation
.end field

.field public multiCallExtends:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x95
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;",
            ">;"
        }
    .end annotation
.end field

.field public multiCallInvites:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x89
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;",
            ">;"
        }
    .end annotation
.end field

.field public multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8a
    .end annotation
.end field

.field public multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x94
    .end annotation
.end field

.field public multiCalls:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x87
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;"
        }
    .end annotation
.end field

.field public multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xcf
    .end annotation
.end field

.field public multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd1
    .end annotation
.end field

.field public multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd2
    .end annotation
.end field

.field public multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd0
    .end annotation
.end field

.field public mutexMode:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;",
            ">;"
        }
    .end annotation
.end field

.field public myJoins:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x128
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;",
            ">;"
        }
    .end annotation
.end field

.field public mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5d
    .end annotation
.end field

.field public needTitle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x97
    .end annotation
.end field

.field public nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc2
    .end annotation
.end field

.field public nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc3
    .end annotation
.end field

.field public octopusUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11d
    .end annotation
.end field

.field public officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xef
    .end annotation
.end field

.field public officialShowList:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf0
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;",
            ">;"
        }
    .end annotation
.end field

.field public officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf1
    .end annotation
.end field

.field public pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5a
    .end annotation
.end field

.field public pkInvites:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;",
            ">;"
        }
    .end annotation
.end field

.field public pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11c
    .end annotation
.end field

.field public pkSeeks:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;",
            ">;"
        }
    .end annotation
.end field

.field public pkSuggestedAnchors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;",
            ">;"
        }
    .end annotation
.end field

.field public pkSummaries:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;",
            ">;"
        }
    .end annotation
.end field

.field public pks:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePk;",
            ">;"
        }
    .end annotation
.end field

.field public previews:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x60
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;"
        }
    .end annotation
.end field

.field public privacyPrivilege:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserPrivacyPrivilege;",
            ">;"
        }
    .end annotation
.end field

.field public randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x111
    .end annotation
.end field

.field public records:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;",
            ">;"
        }
    .end annotation
.end field

.field public redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x30
    .end annotation
.end field

.field public relationships:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation
.end field

.field public right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4a
    .end annotation
.end field

.field public rightBindAnchors:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;",
            ">;"
        }
    .end annotation
.end field

.field public rights:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;",
            ">;"
        }
    .end annotation
.end field

.field public roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9e
    .end annotation
.end field

.field public rooms:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoom;",
            ">;"
        }
    .end annotation
.end field

.field public rtcTokens:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;"
        }
    .end annotation
.end field

.field public schema:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbb
    .end annotation
.end field

.field public scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x96
    .end annotation
.end field

.field public scrapTabs:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveScrapTabData;",
            ">;"
        }
    .end annotation
.end field

.field public shareItems:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x80
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareItems;",
            ">;"
        }
    .end annotation
.end field

.field public shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc1
    .end annotation
.end field

.field public showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xcd
    .end annotation
.end field

.field public signInAchievementMedals:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x75
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;",
            ">;"
        }
    .end annotation
.end field

.field public signInDetails:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;",
            ">;"
        }
    .end annotation
.end field

.field public signInPrizes:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;",
            ">;"
        }
    .end annotation
.end field

.field public siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x104
    .end annotation
.end field

.field public skinList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;",
            ">;"
        }
    .end annotation
.end field

.field public skins:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x82
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;",
            ">;"
        }
    .end annotation
.end field

.field public slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x55
    .end annotation
.end field

.field public sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8d
    .end annotation
.end field

.field public squareEntranceSummary:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x98
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;",
            ">;"
        }
    .end annotation
.end field

.field public starRedPackets:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xcc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceStarRedPacket;",
            ">;"
        }
    .end annotation
.end field

.field public starlightHierarchies:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;",
            ">;"
        }
    .end annotation
.end field

.field public startLivePageCampaigns:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;",
            ">;"
        }
    .end annotation
.end field

.field public storeBackgroundPics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;",
            ">;"
        }
    .end annotation
.end field

.field public stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7a
    .end annotation
.end field

.field public suggestedLives:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x90
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;"
        }
    .end annotation
.end field

.field public superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x117
    .end annotation
.end field

.field public superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10a
    .end annotation
.end field

.field public taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation
.end field

.field public tasks:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTask;",
            ">;"
        }
    .end annotation
.end field

.field public teenagerLives:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x73
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;",
            ">;"
        }
    .end annotation
.end field

.field public topics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x48
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;",
            ">;"
        }
    .end annotation
.end field

.field public touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x93
    .end annotation
.end field

.field public treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x114
    .end annotation
.end field

.field public userDailyTasks:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x78
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;",
            ">;"
        }
    .end annotation
.end field

.field public userEnterRoomEffects:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;",
            ">;"
        }
    .end annotation
.end field

.field public userKnightInfosSummary:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x52
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;",
            ">;"
        }
    .end annotation
.end field

.field public userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xda
    .end annotation
.end field

.field public userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6c
    .end annotation
.end field

.field public userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x72
    .end annotation
.end field

.field public userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x92
    .end annotation
.end field

.field public userLiveRightResources:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x63
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;",
            ">;"
        }
    .end annotation
.end field

.field public userProfileConfig:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;",
            ">;"
        }
    .end annotation
.end field

.field public userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xee
    .end annotation
.end field

.field public userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd9
    .end annotation
.end field

.field public userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xde
    .end annotation
.end field

.field public users:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public verificationCenter:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;",
            ">;"
        }
    .end annotation
.end field

.field public version:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2d
    .end annotation
.end field

.field public videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x107
    .end annotation
.end field

.field public videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10e
    .end annotation
.end field

.field public videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x110
    .end annotation
.end field

.field public videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x106
    .end annotation
.end field

.field public videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x112
    .end annotation
.end field

.field public videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10f
    .end annotation
.end field

.field public videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x108
    .end annotation
.end field

.field public videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x62
    .end annotation
.end field

.field public videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x61
    .end annotation
.end field

.field public videoQualities:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;",
            ">;"
        }
    .end annotation
.end field

.field public virtualVoiceCard:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;",
            ">;"
        }
    .end annotation
.end field

.field public voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbf
    .end annotation
.end field

.field public voiceCallInvites:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;",
            ">;"
        }
    .end annotation
.end field

.field public voiceCallSummaries:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x45
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;",
            ">;"
        }
    .end annotation
.end field

.field public voiceCalls:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;"
        }
    .end annotation
.end field

.field public voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x83
    .end annotation
.end field

.field public voiceChatGroupApplies:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x84
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;",
            ">;"
        }
    .end annotation
.end field

.field public voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa7
    .end annotation
.end field

.field public voiceCpHouseList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;",
            ">;"
        }
    .end annotation
.end field

.field public voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa6
    .end annotation
.end field

.field public voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa5
    .end annotation
.end field

.field public voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x124
    .end annotation
.end field

.field public voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x125
    .end annotation
.end field

.field public voiceFanbaseLbs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x127
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;",
            ">;"
        }
    .end annotation
.end field

.field public voiceFanbaseMedals:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x129
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;",
            ">;"
        }
    .end annotation
.end field

.field public voiceFollowships:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;",
            ">;"
        }
    .end annotation
.end field

.field public voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc7
    .end annotation
.end field

.field public voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb0
    .end annotation
.end field

.field public voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xaf
    .end annotation
.end field

.field public voiceGiftWallList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xae
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;"
        }
    .end annotation
.end field

.field public voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa9
    .end annotation
.end field

.field public voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb6
    .end annotation
.end field

.field public voiceKTVOrders:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;",
            ">;"
        }
    .end annotation
.end field

.field public voiceKTVSongs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLeaderboardEntrances:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x119
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9a
    .end annotation
.end field

.field public voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7c
    .end annotation
.end field

.field public voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe2
    .end annotation
.end field

.field public voiceLiveAuctions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveBanners:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xce
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedBanners;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x131
    .end annotation
.end field

.field public voiceLiveBulletCommentTypes:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x130
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveGames:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x59
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VoiceLiveGame;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9d
    .end annotation
.end field

.field public voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xfe
    .end annotation
.end field

.field public voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa0
    .end annotation
.end field

.field public voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbe
    .end annotation
.end field

.field public voiceLiveSummaries:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x49
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSummary;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveUserFeedList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9c
    .end annotation
.end field

.field public voiceLives:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x47
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLivesSummary:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;",
            ">;"
        }
    .end annotation
.end field

.field public voiceManagerInvites:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x85
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;",
            ">;"
        }
    .end annotation
.end field

.field public voiceManagers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x86
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;",
            ">;"
        }
    .end annotation
.end field

.field public voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc8
    .end annotation
.end field

.field public voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x101
    .end annotation
.end field

.field public voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12b
    .end annotation
.end field

.field public voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xeb
    .end annotation
.end field

.field public voiceRoomClasses:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;",
            ">;"
        }
    .end annotation
.end field

.field public voiceRoomFeeds:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x81
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
            ">;"
        }
    .end annotation
.end field

.field public voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc6
    .end annotation
.end field

.field public voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xca
    .end annotation
.end field

.field public voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xcb
    .end annotation
.end field

.field public voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4e
    .end annotation
.end field

.field public voiceRooms:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x46
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ">;"
        }
    .end annotation
.end field

.field public voiceSettles:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;",
            ">;"
        }
    .end annotation
.end field

.field public voiceSquareButtons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x118
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;"
        }
    .end annotation
.end field

.field public voiceTabs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;",
            ">;"
        }
    .end annotation
.end field

.field public voiceUserFeedInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x71
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;",
            ">;"
        }
    .end annotation
.end field

.field public voiceUserGiftItems:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe7
    .end annotation
.end field

.field public voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc0
    .end annotation
.end field

.field public voiceUserProfileConfigs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x64
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;",
            ">;"
        }
    .end annotation
.end field

.field public voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc9
    .end annotation
.end field

.field public weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xdc
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic A(Lcom/p1/mobile/putong/data/Followship;)Lcom/p1/mobile/putong/data/Followship;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Followship;->clone()Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic A0(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic A1(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic B0(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic B1(Lcom/p1/mobile/putong/live/base/data/BLiveClarity;)Lcom/p1/mobile/putong/live/base/data/BLiveClarity;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveClarity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedBanners;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedBanners;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedBanners;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedBanners;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic C1(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;)Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic D1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceStarRedPacket;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceStarRedPacket;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceStarRedPacket;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceStarRedPacket;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic E1(Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;)Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStickerTemplatesGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroupApply;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic F1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;)Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBoardHierarchy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic G0(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic G1(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;)Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSignInAchievementMedals;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic H1(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic I0(Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic I1(Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;)Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHeatVoiceRoomTask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic J1(Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;)Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K1(Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;)Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L0(Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;)Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;)Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;)Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M1(Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;)Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic N0(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;)Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic N1(Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;)Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveKnightsRuleInfoItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic O0(Lcom/p1/mobile/putong/live/base/data/BLiveMember;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic O1(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)Lcom/p1/mobile/putong/live/base/data/BLiveTask;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->clone()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P0(Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;)Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P1(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;)Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q1(Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveKnightsInfosSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardEntranceItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R1(Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;)Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;)Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic T0(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic T1(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCampaign;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;)Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;->clone()Lcom/p1/mobile/putong/live/base/data/ActivitySuggests;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic V0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuction;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic V1(Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;)Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/live/base/data/BLiveScrapTabData;)Lcom/p1/mobile/putong/live/base/data/BLiveScrapTabData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveScrapTabData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveScrapTabData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W0(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Lcom/p1/mobile/putong/live/base/data/BLiveVoice;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic W1(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlMlnMedia;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic X0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSkin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserGiftItem;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserGiftItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserGiftItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberLb;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRelationShip;)Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRelationShip;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRelationShip;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRelationShip;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetLimitHouse;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Z0(Lcom/p1/mobile/putong/live/base/data/LiveMultiCallLiveSchema;)Lcom/p1/mobile/putong/live/base/data/LiveMultiCallLiveSchema;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/LiveMultiCallLiveSchema;->clone()Lcom/p1/mobile/putong/live/base/data/LiveMultiCallLiveSchema;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;)Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic a1(Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveUserPrivacyPrivilege;)Lcom/p1/mobile/putong/live/base/data/BLiveUserPrivacyPrivilege;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserPrivacyPrivilege;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserPrivacyPrivilege;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/live/base/data/BLivePk;)Lcom/p1/mobile/putong/live/base/data/BLivePk;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePk;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b1(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFansMyJoin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d1(Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;)Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSignPrizes;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpRecommendUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e1(Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;)Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLive;)Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftDetail;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f1(Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserKnightInfoSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionQueueInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g1(Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;)Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;)Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic h1(Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;)Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;)Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGuardAnchorRankInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j1(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;)Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/base/data/BLivePush;)Lcom/p1/mobile/putong/live/base/data/BLivePush;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePush;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePush;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/data/Relationship;)Lcom/p1/mobile/putong/data/Relationship;
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

.method public static synthetic k1(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l1(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;)Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeAnchorItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Lcom/p1/mobile/putong/live/base/data/BLiveActivity;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m1(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareItems;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareItems;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareItems;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareItems;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n1(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;)Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManagerInvite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o1(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpInviteRecord;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;)Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDailyTasks;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p1(Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorKnightInfos;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;)Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic q1(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/data/VoiceLiveGame;)Lcom/p1/mobile/putong/data/VoiceLiveGame;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VoiceLiveGame;->clone()Lcom/p1/mobile/putong/data/VoiceLiveGame;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;)Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareDetailCounters;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMutexMode;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;)Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic t1(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic u0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatMissedCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic u1(Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlVoiceMedal;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v0(Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v1(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w0(Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;)Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTeenagerLive;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w1(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x1(Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;)Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic y0(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic y1(Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;)Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic z1(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 398
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveData;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    if-eqz v1, :cond_0

    new-instance v2, Ll/it1;

    invoke-direct {v2}, Ll/it1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 3
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    if-eqz v1, :cond_1

    new-instance v2, Ll/cx1;

    invoke-direct {v2}, Ll/cx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    .line 4
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    if-eqz v1, :cond_2

    .line 5
    new-instance v2, Ll/ox1;

    invoke-direct {v2}, Ll/ox1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    .line 6
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    .line 7
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    if-eqz v1, :cond_4

    new-instance v2, Ll/ay1;

    invoke-direct {v2}, Ll/ay1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    .line 8
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    if-eqz v1, :cond_5

    new-instance v2, Ll/ny1;

    invoke-direct {v2}, Ll/ny1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    .line 9
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    if-eqz v1, :cond_6

    new-instance v2, Ll/kt1;

    invoke-direct {v2}, Ll/kt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    .line 10
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    if-eqz v1, :cond_7

    new-instance v2, Ll/wt1;

    invoke-direct {v2}, Ll/wt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 11
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    if-eqz v1, :cond_8

    new-instance v2, Ll/iu1;

    invoke-direct {v2}, Ll/iu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    .line 12
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    if-eqz v1, :cond_9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 13
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    if-eqz v1, :cond_a

    .line 14
    new-instance v2, Ll/uu1;

    invoke-direct {v2}, Ll/uu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 15
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSquareSummaries:Ljava/util/List;

    if-eqz v1, :cond_b

    .line 16
    new-instance v2, Ll/gv1;

    invoke-direct {v2}, Ll/gv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSquareSummaries:Ljava/util/List;

    .line 17
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    if-eqz v1, :cond_c

    .line 18
    new-instance v2, Ll/eu1;

    invoke-direct {v2}, Ll/eu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    .line 19
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    if-eqz v1, :cond_d

    new-instance v2, Ll/qv1;

    invoke-direct {v2}, Ll/qv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    .line 20
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    if-eqz v1, :cond_e

    new-instance v2, Ll/cw1;

    invoke-direct {v2}, Ll/cw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    .line 21
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    if-eqz v1, :cond_f

    new-instance v2, Ll/ow1;

    invoke-direct {v2}, Ll/ow1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    .line 22
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveCampaigns:Ljava/util/List;

    if-eqz v1, :cond_10

    new-instance v2, Ll/ww1;

    invoke-direct {v2}, Ll/ww1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveCampaigns:Ljava/util/List;

    .line 23
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveHierarchyGrades:Ljava/util/List;

    if-eqz v1, :cond_11

    .line 24
    new-instance v2, Ll/xw1;

    invoke-direct {v2}, Ll/xw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveHierarchyGrades:Ljava/util/List;

    .line 25
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTips:Ljava/util/List;

    if-eqz v1, :cond_12

    new-instance v2, Ll/yw1;

    invoke-direct {v2}, Ll/yw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTips:Ljava/util/List;

    .line 26
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    if-eqz v1, :cond_13

    new-instance v2, Ll/zw1;

    invoke-direct {v2}, Ll/zw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    .line 27
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    if-eqz v1, :cond_14

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    .line 28
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    if-eqz v1, :cond_15

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    .line 29
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    if-eqz v1, :cond_16

    new-instance v2, Ll/ax1;

    invoke-direct {v2}, Ll/ax1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 30
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    if-eqz v1, :cond_17

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    .line 31
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    if-eqz v1, :cond_18

    new-instance v2, Ll/bx1;

    invoke-direct {v2}, Ll/bx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    .line 32
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    if-eqz v1, :cond_19

    .line 33
    new-instance v2, Ll/dx1;

    invoke-direct {v2}, Ll/dx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    .line 34
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    if-eqz v1, :cond_1a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 35
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    if-eqz v1, :cond_1b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    .line 36
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    .line 37
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoQualities:Ljava/util/List;

    if-eqz v1, :cond_1d

    new-instance v2, Ll/ex1;

    invoke-direct {v2}, Ll/ex1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoQualities:Ljava/util/List;

    .line 38
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 39
    :cond_1e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorHierarchyGrades:Ljava/util/List;

    if-eqz v1, :cond_1f

    .line 40
    new-instance v2, Ll/gx1;

    invoke-direct {v2}, Ll/gx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorHierarchyGrades:Ljava/util/List;

    .line 41
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    if-eqz v1, :cond_20

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 42
    :cond_20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    if-eqz v1, :cond_21

    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    .line 44
    :cond_21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplates:Ljava/util/List;

    if-eqz v1, :cond_22

    .line 45
    new-instance v2, Ll/hx1;

    invoke-direct {v2}, Ll/hx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplates:Ljava/util/List;

    .line 46
    :cond_22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickers:Ljava/util/List;

    if-eqz v1, :cond_23

    new-instance v2, Ll/ix1;

    invoke-direct {v2}, Ll/ix1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickers:Ljava/util/List;

    .line 47
    :cond_23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSeeks:Ljava/util/List;

    if-eqz v1, :cond_24

    new-instance v2, Ll/jx1;

    invoke-direct {v2}, Ll/jx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSeeks:Ljava/util/List;

    .line 48
    :cond_24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkInvites:Ljava/util/List;

    if-eqz v1, :cond_25

    new-instance v2, Ll/kx1;

    invoke-direct {v2}, Ll/kx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkInvites:Ljava/util/List;

    .line 49
    :cond_25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pks:Ljava/util/List;

    if-eqz v1, :cond_26

    new-instance v2, Ll/lx1;

    invoke-direct {v2}, Ll/lx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pks:Ljava/util/List;

    .line 50
    :cond_26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResources:Ljava/util/List;

    if-eqz v1, :cond_27

    new-instance v2, Ll/mx1;

    invoke-direct {v2}, Ll/mx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResources:Ljava/util/List;

    .line 51
    :cond_27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    if-eqz v1, :cond_28

    new-instance v2, Ll/nx1;

    invoke-direct {v2}, Ll/nx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    .line 52
    :cond_28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

    if-eqz v1, :cond_29

    new-instance v2, Ll/px1;

    invoke-direct {v2}, Ll/px1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

    .line 53
    :cond_29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    if-eqz v1, :cond_2a

    new-instance v2, Ll/rx1;

    invoke-direct {v2}, Ll/rx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    .line 54
    :cond_2a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    if-eqz v1, :cond_2b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 55
    :cond_2b
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->version:J

    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->version:J

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    .line 57
    :cond_2c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    if-eqz v1, :cond_2d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 58
    :cond_2d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 59
    :cond_2e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    if-eqz v1, :cond_2f

    .line 60
    new-instance v2, Ll/sx1;

    invoke-direct {v2}, Ll/sx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    .line 61
    :cond_2f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    if-eqz v1, :cond_30

    .line 62
    new-instance v2, Ll/tx1;

    invoke-direct {v2}, Ll/tx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    .line 63
    :cond_30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    if-eqz v1, :cond_31

    new-instance v2, Ll/ux1;

    invoke-direct {v2}, Ll/ux1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    .line 64
    :cond_31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    if-eqz v1, :cond_32

    new-instance v2, Ll/vx1;

    invoke-direct {v2}, Ll/vx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    .line 65
    :cond_32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    if-eqz v1, :cond_33

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 66
    :cond_33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medals:Ljava/util/List;

    if-eqz v1, :cond_34

    new-instance v2, Ll/wx1;

    invoke-direct {v2}, Ll/wx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medals:Ljava/util/List;

    .line 67
    :cond_34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    if-eqz v1, :cond_35

    .line 68
    new-instance v2, Ll/xx1;

    invoke-direct {v2}, Ll/xx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    .line 69
    :cond_35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRedPacketEventCounters:Ljava/util/List;

    if-eqz v1, :cond_36

    .line 70
    new-instance v2, Ll/yx1;

    invoke-direct {v2}, Ll/yx1;-><init>()V

    .line 71
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRedPacketEventCounters:Ljava/util/List;

    .line 72
    :cond_36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    if-eqz v1, :cond_37

    new-instance v2, Ll/zx1;

    invoke-direct {v2}, Ll/zx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    .line 73
    :cond_37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    if-eqz v1, :cond_38

    new-instance v2, Ll/cy1;

    invoke-direct {v2}, Ll/cy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    .line 74
    :cond_38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    if-eqz v1, :cond_39

    new-instance v2, Ll/dy1;

    invoke-direct {v2}, Ll/dy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    .line 75
    :cond_39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    if-eqz v1, :cond_3a

    new-instance v2, Ll/ey1;

    invoke-direct {v2}, Ll/ey1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    .line 76
    :cond_3a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    if-eqz v1, :cond_3b

    new-instance v2, Ll/fy1;

    invoke-direct {v2}, Ll/fy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    .line 77
    :cond_3b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userEnterRoomEffects:Ljava/util/List;

    if-eqz v1, :cond_3c

    .line 78
    new-instance v2, Ll/gy1;

    invoke-direct {v2}, Ll/gy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userEnterRoomEffects:Ljava/util/List;

    .line 79
    :cond_3c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    if-eqz v1, :cond_3d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 80
    :cond_3d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    if-eqz v1, :cond_3e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Connector;->clone()Lcom/p1/mobile/putong/data/Connector;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 81
    :cond_3e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    if-eqz v1, :cond_3f

    .line 82
    new-instance v2, Ll/hy1;

    invoke-direct {v2}, Ll/hy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    .line 83
    :cond_3f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    if-eqz v1, :cond_40

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    .line 84
    :cond_40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    if-eqz v1, :cond_41

    new-instance v2, Ll/iy1;

    invoke-direct {v2}, Ll/iy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    .line 85
    :cond_41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    if-eqz v1, :cond_42

    .line 86
    new-instance v2, Ll/jy1;

    invoke-direct {v2}, Ll/jy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    .line 87
    :cond_42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    if-eqz v1, :cond_43

    .line 88
    new-instance v2, Ll/ky1;

    invoke-direct {v2}, Ll/ky1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    .line 89
    :cond_43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    if-eqz v1, :cond_44

    new-instance v2, Ll/ly1;

    invoke-direct {v2}, Ll/ly1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    .line 90
    :cond_44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    if-eqz v1, :cond_45

    new-instance v2, Ll/oy1;

    invoke-direct {v2}, Ll/oy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    .line 91
    :cond_45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    if-eqz v1, :cond_46

    new-instance v2, Ll/py1;

    invoke-direct {v2}, Ll/py1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    .line 92
    :cond_46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    if-eqz v1, :cond_47

    .line 93
    new-instance v2, Ll/qy1;

    invoke-direct {v2}, Ll/qy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    .line 94
    :cond_47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    if-eqz v1, :cond_48

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    .line 95
    :cond_48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rightBindAnchors:Ljava/util/List;

    if-eqz v1, :cond_49

    .line 96
    new-instance v2, Ll/ry1;

    invoke-direct {v2}, Ll/ry1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rightBindAnchors:Ljava/util/List;

    .line 97
    :cond_49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    if-eqz v1, :cond_4a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 98
    :cond_4a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    if-eqz v1, :cond_4b

    .line 99
    new-instance v2, Ll/sy1;

    invoke-direct {v2}, Ll/sy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    .line 100
    :cond_4b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    if-eqz v1, :cond_4c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 101
    :cond_4c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    if-eqz v1, :cond_4d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 102
    :cond_4d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    if-eqz v1, :cond_4e

    new-instance v2, Ll/ty1;

    invoke-direct {v2}, Ll/ty1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    .line 103
    :cond_4e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    if-eqz v1, :cond_4f

    .line 104
    new-instance v2, Ll/uy1;

    invoke-direct {v2}, Ll/uy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    .line 105
    :cond_4f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    if-eqz v1, :cond_50

    .line 106
    new-instance v2, Ll/vy1;

    invoke-direct {v2}, Ll/vy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 107
    :cond_50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    if-eqz v1, :cond_51

    .line 108
    new-instance v2, Ll/wy1;

    invoke-direct {v2}, Ll/wy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 109
    :cond_51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    if-eqz v1, :cond_52

    .line 110
    new-instance v2, Ll/jt1;

    invoke-direct {v2}, Ll/jt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    .line 111
    :cond_52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    if-eqz v1, :cond_53

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 112
    :cond_53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    if-eqz v1, :cond_54

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    .line 113
    :cond_54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    if-eqz v1, :cond_55

    new-instance v2, Ll/lt1;

    invoke-direct {v2}, Ll/lt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 114
    :cond_55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    if-eqz v1, :cond_56

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 115
    :cond_56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    if-eqz v1, :cond_57

    new-instance v2, Ll/mt1;

    invoke-direct {v2}, Ll/mt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    .line 116
    :cond_57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    if-eqz v1, :cond_58

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    .line 117
    :cond_58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    if-eqz v1, :cond_59

    .line 118
    new-instance v2, Ll/nt1;

    invoke-direct {v2}, Ll/nt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    .line 119
    :cond_59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    if-eqz v1, :cond_5a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    .line 120
    :cond_5a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    if-eqz v1, :cond_5b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 121
    :cond_5b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    if-eqz v1, :cond_5c

    .line 122
    new-instance v2, Ll/ot1;

    invoke-direct {v2}, Ll/ot1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    .line 123
    :cond_5c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    if-eqz v1, :cond_5d

    new-instance v2, Ll/pt1;

    invoke-direct {v2}, Ll/pt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    .line 124
    :cond_5d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    if-eqz v1, :cond_5e

    new-instance v2, Ll/qt1;

    invoke-direct {v2}, Ll/qt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    .line 125
    :cond_5e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    if-eqz v1, :cond_5f

    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    .line 127
    :cond_5f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    if-eqz v1, :cond_60

    .line 128
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 129
    :cond_60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    if-eqz v1, :cond_61

    .line 130
    new-instance v2, Ll/rt1;

    invoke-direct {v2}, Ll/rt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    .line 131
    :cond_61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    if-eqz v1, :cond_62

    .line 132
    new-instance v2, Ll/st1;

    invoke-direct {v2}, Ll/st1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    .line 133
    :cond_62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    if-eqz v1, :cond_63

    .line 134
    new-instance v2, Ll/ut1;

    invoke-direct {v2}, Ll/ut1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    .line 135
    :cond_63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    if-eqz v1, :cond_64

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    .line 136
    :cond_64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    if-eqz v1, :cond_65

    new-instance v2, Ll/vt1;

    invoke-direct {v2}, Ll/vt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    .line 137
    :cond_65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    if-eqz v1, :cond_66

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    .line 138
    :cond_66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    if-eqz v1, :cond_67

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 139
    :cond_67
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scrapTabs:Ljava/util/List;

    if-eqz v1, :cond_68

    new-instance v2, Ll/xt1;

    invoke-direct {v2}, Ll/xt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scrapTabs:Ljava/util/List;

    .line 140
    :cond_68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    if-eqz v1, :cond_69

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    .line 141
    :cond_69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    if-eqz v1, :cond_6a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 142
    :cond_6a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    if-eqz v1, :cond_6b

    new-instance v2, Ll/yt1;

    invoke-direct {v2}, Ll/yt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    .line 143
    :cond_6b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInDetails:Ljava/util/List;

    if-eqz v1, :cond_6c

    new-instance v2, Ll/zt1;

    invoke-direct {v2}, Ll/zt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInDetails:Ljava/util/List;

    .line 144
    :cond_6c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInPrizes:Ljava/util/List;

    if-eqz v1, :cond_6d

    new-instance v2, Ll/au1;

    invoke-direct {v2}, Ll/au1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInPrizes:Ljava/util/List;

    .line 145
    :cond_6d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    if-eqz v1, :cond_6e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    .line 146
    :cond_6e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    if-eqz v1, :cond_6f

    .line 147
    new-instance v2, Ll/bu1;

    invoke-direct {v2}, Ll/bu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    .line 148
    :cond_6f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    if-eqz v1, :cond_70

    .line 149
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 150
    :cond_70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    if-eqz v1, :cond_71

    new-instance v2, Ll/cu1;

    invoke-direct {v2}, Ll/cu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    .line 151
    :cond_71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInAchievementMedals:Ljava/util/List;

    if-eqz v1, :cond_72

    .line 153
    new-instance v2, Ll/du1;

    invoke-direct {v2}, Ll/du1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInAchievementMedals:Ljava/util/List;

    .line 154
    :cond_72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    if-eqz v1, :cond_73

    .line 155
    new-instance v2, Ll/fu1;

    invoke-direct {v2}, Ll/fu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    .line 156
    :cond_73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    if-eqz v1, :cond_74

    new-instance v2, Ll/gu1;

    invoke-direct {v2}, Ll/gu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    .line 157
    :cond_74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    if-eqz v1, :cond_75

    new-instance v2, Ll/hu1;

    invoke-direct {v2}, Ll/hu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    .line 158
    :cond_75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    if-eqz v1, :cond_76

    .line 159
    new-instance v2, Ll/ju1;

    invoke-direct {v2}, Ll/ju1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    .line 160
    :cond_76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    if-eqz v1, :cond_77

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    .line 161
    :cond_77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    if-eqz v1, :cond_78

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    .line 162
    :cond_78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    if-eqz v1, :cond_79

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    .line 163
    :cond_79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    if-eqz v1, :cond_7a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    .line 164
    :cond_7a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    if-eqz v1, :cond_7b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 165
    :cond_7b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    if-eqz v1, :cond_7c

    new-instance v2, Ll/ku1;

    invoke-direct {v2}, Ll/ku1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    .line 166
    :cond_7c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareItems:Ljava/util/List;

    if-eqz v1, :cond_7d

    new-instance v2, Ll/lu1;

    invoke-direct {v2}, Ll/lu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareItems:Ljava/util/List;

    .line 167
    :cond_7d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    if-eqz v1, :cond_7e

    new-instance v2, Ll/mu1;

    invoke-direct {v2}, Ll/mu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    .line 168
    :cond_7e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    if-eqz v1, :cond_7f

    new-instance v2, Ll/nu1;

    invoke-direct {v2}, Ll/nu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    .line 169
    :cond_7f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    if-eqz v1, :cond_80

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    .line 170
    :cond_80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    if-eqz v1, :cond_81

    .line 171
    new-instance v2, Ll/ou1;

    invoke-direct {v2}, Ll/ou1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    .line 172
    :cond_81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagerInvites:Ljava/util/List;

    if-eqz v1, :cond_82

    .line 173
    new-instance v2, Ll/qu1;

    invoke-direct {v2}, Ll/qu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagerInvites:Ljava/util/List;

    .line 174
    :cond_82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    if-eqz v1, :cond_83

    new-instance v2, Ll/ru1;

    invoke-direct {v2}, Ll/ru1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    .line 175
    :cond_83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    if-eqz v1, :cond_84

    new-instance v2, Ll/su1;

    invoke-direct {v2}, Ll/su1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    .line 176
    :cond_84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    if-eqz v1, :cond_85

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    .line 177
    :cond_85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    if-eqz v1, :cond_86

    .line 178
    new-instance v2, Ll/tu1;

    invoke-direct {v2}, Ll/tu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    .line 179
    :cond_86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    if-eqz v1, :cond_87

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    .line 180
    :cond_87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    if-eqz v1, :cond_88

    .line 181
    new-instance v2, Ll/vu1;

    invoke-direct {v2}, Ll/vu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    .line 182
    :cond_88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    if-eqz v1, :cond_89

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->clone()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 183
    :cond_89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    if-eqz v1, :cond_8a

    .line 184
    new-instance v2, Ll/wu1;

    invoke-direct {v2}, Ll/wu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    .line 185
    :cond_8a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    if-eqz v1, :cond_8b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    .line 186
    :cond_8b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    if-eqz v1, :cond_8c

    new-instance v2, Ll/xu1;

    invoke-direct {v2}, Ll/xu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    .line 187
    :cond_8c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    if-eqz v1, :cond_8d

    new-instance v2, Ll/yu1;

    invoke-direct {v2}, Ll/yu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    .line 188
    :cond_8d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSchemas:Ljava/util/List;

    if-eqz v1, :cond_8e

    new-instance v2, Ll/zu1;

    invoke-direct {v2}, Ll/zu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSchemas:Ljava/util/List;

    .line 189
    :cond_8e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    if-eqz v1, :cond_8f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePush;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePush;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    .line 190
    :cond_8f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    if-eqz v1, :cond_90

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    .line 191
    :cond_90
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    if-eqz v1, :cond_91

    .line 192
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    .line 193
    :cond_91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    if-eqz v1, :cond_92

    .line 194
    new-instance v2, Ll/bv1;

    invoke-direct {v2}, Ll/bv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    .line 195
    :cond_92
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    if-eqz v1, :cond_93

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 196
    :cond_93
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    if-eqz v1, :cond_94

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    .line 197
    :cond_94
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->needTitle:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->needTitle:Z

    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    if-eqz v1, :cond_95

    .line 199
    new-instance v2, Ll/cv1;

    invoke-direct {v2}, Ll/cv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    .line 200
    :cond_95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    if-eqz v1, :cond_96

    .line 201
    new-instance v2, Ll/dv1;

    invoke-direct {v2}, Ll/dv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    .line 202
    :cond_96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    if-eqz v1, :cond_97

    .line 203
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    .line 204
    :cond_97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    if-eqz v1, :cond_98

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    .line 205
    :cond_98
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    if-eqz v1, :cond_99

    .line 206
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    .line 207
    :cond_99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    if-eqz v1, :cond_9a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    .line 208
    :cond_9a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesGifts:Ljava/util/List;

    if-eqz v1, :cond_9b

    .line 209
    new-instance v2, Ll/ev1;

    invoke-direct {v2}, Ll/ev1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesGifts:Ljava/util/List;

    .line 210
    :cond_9b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    if-eqz v1, :cond_9c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    .line 211
    :cond_9c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    if-eqz v1, :cond_9d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 212
    :cond_9d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    if-eqz v1, :cond_9e

    new-instance v2, Ll/fv1;

    invoke-direct {v2}, Ll/fv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    .line 213
    :cond_9e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    if-eqz v1, :cond_9f

    .line 214
    new-instance v2, Ll/nv1;

    invoke-direct {v2}, Ll/nv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    .line 215
    :cond_9f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    if-eqz v1, :cond_a0

    .line 216
    new-instance v2, Ll/yv1;

    invoke-direct {v2}, Ll/yv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    .line 217
    :cond_a0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    if-eqz v1, :cond_a1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    .line 218
    :cond_a1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    if-eqz v1, :cond_a2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    .line 219
    :cond_a2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    if-eqz v1, :cond_a3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    .line 220
    :cond_a3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    if-eqz v1, :cond_a4

    .line 221
    new-instance v2, Ll/jw1;

    invoke-direct {v2}, Ll/jw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    .line 222
    :cond_a4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    if-eqz v1, :cond_a5

    .line 223
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 224
    :cond_a5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    if-eqz v1, :cond_a6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    .line 225
    :cond_a6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    if-eqz v1, :cond_a7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    .line 226
    :cond_a7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    if-eqz v1, :cond_a8

    .line 227
    new-instance v2, Ll/uw1;

    invoke-direct {v2}, Ll/uw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    .line 228
    :cond_a8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    if-eqz v1, :cond_a9

    new-instance v2, Ll/fx1;

    invoke-direct {v2}, Ll/fx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    .line 229
    :cond_a9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    if-eqz v1, :cond_aa

    .line 230
    new-instance v2, Ll/qx1;

    invoke-direct {v2}, Ll/qx1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    .line 231
    :cond_aa
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    if-eqz v1, :cond_ab

    .line 232
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 233
    :cond_ab
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    if-eqz v1, :cond_ac

    .line 234
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 235
    :cond_ac
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    if-eqz v1, :cond_ad

    .line 236
    new-instance v2, Ll/by1;

    invoke-direct {v2}, Ll/by1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    .line 237
    :cond_ad
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    if-eqz v1, :cond_ae

    .line 238
    new-instance v2, Ll/my1;

    invoke-direct {v2}, Ll/my1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    .line 239
    :cond_ae
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    if-eqz v1, :cond_af

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    .line 240
    :cond_af
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    if-eqz v1, :cond_b0

    .line 241
    new-instance v2, Ll/xy1;

    invoke-direct {v2}, Ll/xy1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    .line 242
    :cond_b0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    if-eqz v1, :cond_b1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    .line 243
    :cond_b1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    if-eqz v1, :cond_b2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 244
    :cond_b2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    if-eqz v1, :cond_b3

    new-instance v2, Ll/tt1;

    invoke-direct {v2}, Ll/tt1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    .line 245
    :cond_b3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    if-eqz v1, :cond_b4

    new-instance v2, Ll/pu1;

    invoke-direct {v2}, Ll/pu1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    .line 246
    :cond_b4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    if-eqz v1, :cond_b5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    .line 247
    :cond_b5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    if-eqz v1, :cond_b6

    new-instance v2, Ll/av1;

    invoke-direct {v2}, Ll/av1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    .line 248
    :cond_b6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    .line 249
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    if-eqz v1, :cond_b7

    new-instance v2, Ll/hv1;

    invoke-direct {v2}, Ll/hv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    .line 250
    :cond_b7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    if-eqz v1, :cond_b8

    new-instance v2, Ll/iv1;

    invoke-direct {v2}, Ll/iv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    .line 251
    :cond_b8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    if-eqz v1, :cond_b9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    .line 252
    :cond_b9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    if-eqz v1, :cond_ba

    .line 253
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    .line 254
    :cond_ba
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    if-eqz v1, :cond_bb

    .line 255
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    .line 256
    :cond_bb
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    if-eqz v1, :cond_bc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    .line 257
    :cond_bc
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    if-eqz v1, :cond_bd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 258
    :cond_bd
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    if-eqz v1, :cond_be

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    .line 259
    :cond_be
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    if-eqz v1, :cond_bf

    .line 260
    new-instance v2, Ll/jv1;

    invoke-direct {v2}, Ll/jv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    .line 261
    :cond_bf
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    if-eqz v1, :cond_c0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 262
    :cond_c0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    if-eqz v1, :cond_c1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 263
    :cond_c1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    if-eqz v1, :cond_c2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    .line 264
    :cond_c2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    if-eqz v1, :cond_c3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    .line 265
    :cond_c3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    if-eqz v1, :cond_c4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    .line 266
    :cond_c4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    if-eqz v1, :cond_c5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    .line 267
    :cond_c5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    if-eqz v1, :cond_c6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 268
    :cond_c6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    if-eqz v1, :cond_c7

    new-instance v2, Ll/kv1;

    invoke-direct {v2}, Ll/kv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    .line 269
    :cond_c7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    if-eqz v1, :cond_c8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    .line 270
    :cond_c8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    if-eqz v1, :cond_c9

    .line 271
    new-instance v2, Ll/lv1;

    invoke-direct {v2}, Ll/lv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    .line 272
    :cond_c9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    if-eqz v1, :cond_ca

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    .line 273
    :cond_ca
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    if-eqz v1, :cond_cb

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    .line 274
    :cond_cb
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    if-eqz v1, :cond_cc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    .line 275
    :cond_cc
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    if-eqz v1, :cond_cd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    .line 276
    :cond_cd
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    if-eqz v1, :cond_ce

    .line 277
    new-instance v2, Ll/mv1;

    invoke-direct {v2}, Ll/mv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    .line 278
    :cond_ce
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    if-eqz v1, :cond_cf

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    .line 279
    :cond_cf
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    if-eqz v1, :cond_d0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    .line 280
    :cond_d0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mutexMode:Ljava/util/List;

    if-eqz v1, :cond_d1

    new-instance v2, Ll/ov1;

    invoke-direct {v2}, Ll/ov1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mutexMode:Ljava/util/List;

    .line 281
    :cond_d1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    if-eqz v1, :cond_d2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    .line 282
    :cond_d2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    if-eqz v1, :cond_d3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    .line 283
    :cond_d3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    if-eqz v1, :cond_d4

    .line 284
    new-instance v2, Ll/pv1;

    invoke-direct {v2}, Ll/pv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    .line 285
    :cond_d4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    if-eqz v1, :cond_d5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    .line 286
    :cond_d5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    if-eqz v1, :cond_d6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 287
    :cond_d6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    if-eqz v1, :cond_d7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    .line 288
    :cond_d7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    if-eqz v1, :cond_d8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 289
    :cond_d8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    if-eqz v1, :cond_d9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 290
    :cond_d9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    if-eqz v1, :cond_da

    .line 291
    new-instance v2, Ll/rv1;

    invoke-direct {v2}, Ll/rv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    .line 292
    :cond_da
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    if-eqz v1, :cond_db

    new-instance v2, Ll/sv1;

    invoke-direct {v2}, Ll/sv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    .line 293
    :cond_db
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    if-eqz v1, :cond_dc

    new-instance v2, Ll/tv1;

    invoke-direct {v2}, Ll/tv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    .line 294
    :cond_dc
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    if-eqz v1, :cond_dd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    .line 295
    :cond_dd
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    if-eqz v1, :cond_de

    .line 296
    new-instance v2, Ll/uv1;

    invoke-direct {v2}, Ll/uv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    .line 297
    :cond_de
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    if-eqz v1, :cond_df

    new-instance v2, Ll/vv1;

    invoke-direct {v2}, Ll/vv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    .line 298
    :cond_df
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    if-eqz v1, :cond_e0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 299
    :cond_e0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    if-eqz v1, :cond_e1

    .line 300
    new-instance v2, Ll/wv1;

    invoke-direct {v2}, Ll/wv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    .line 301
    :cond_e1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    if-eqz v1, :cond_e2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    .line 302
    :cond_e2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    if-eqz v1, :cond_e3

    .line 303
    new-instance v2, Ll/xv1;

    invoke-direct {v2}, Ll/xv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    .line 304
    :cond_e3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    if-eqz v1, :cond_e4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 305
    :cond_e4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->exchangeTTCRedpoint:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->exchangeTTCRedpoint:Z

    .line 306
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    if-eqz v1, :cond_e5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    .line 307
    :cond_e5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    if-eqz v1, :cond_e6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    .line 308
    :cond_e6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    if-eqz v1, :cond_e7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    .line 309
    :cond_e7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    if-eqz v1, :cond_e8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    .line 310
    :cond_e8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    if-eqz v1, :cond_e9

    .line 311
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 312
    :cond_e9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowList:Ljava/util/List;

    if-eqz v1, :cond_ea

    .line 313
    new-instance v2, Ll/zv1;

    invoke-direct {v2}, Ll/zv1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowList:Ljava/util/List;

    .line 314
    :cond_ea
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    if-eqz v1, :cond_eb

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    .line 315
    :cond_eb
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    if-eqz v1, :cond_ec

    .line 316
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    .line 317
    :cond_ec
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    if-eqz v1, :cond_ed

    new-instance v2, Ll/aw1;

    invoke-direct {v2}, Ll/aw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    .line 318
    :cond_ed
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    if-eqz v1, :cond_ee

    .line 319
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    .line 320
    :cond_ee
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    if-eqz v1, :cond_ef

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    .line 321
    :cond_ef
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    if-eqz v1, :cond_f0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    .line 322
    :cond_f0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    if-eqz v1, :cond_f1

    new-instance v2, Ll/bw1;

    invoke-direct {v2}, Ll/bw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    .line 323
    :cond_f1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    if-eqz v1, :cond_f2

    .line 324
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 325
    :cond_f2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    if-eqz v1, :cond_f3

    .line 326
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    .line 327
    :cond_f3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    if-eqz v1, :cond_f4

    new-instance v2, Ll/dw1;

    invoke-direct {v2}, Ll/dw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    .line 328
    :cond_f4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    if-eqz v1, :cond_f5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 329
    :cond_f5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    if-eqz v1, :cond_f6

    .line 330
    new-instance v2, Ll/ew1;

    invoke-direct {v2}, Ll/ew1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    .line 331
    :cond_f6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    if-eqz v1, :cond_f7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 332
    :cond_f7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    if-eqz v1, :cond_f8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 333
    :cond_f8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    if-eqz v1, :cond_f9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    .line 334
    :cond_f9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    if-eqz v1, :cond_fa

    new-instance v2, Ll/fw1;

    invoke-direct {v2}, Ll/fw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    .line 335
    :cond_fa
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    if-eqz v1, :cond_fb

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    .line 336
    :cond_fb
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    if-eqz v1, :cond_fc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    .line 337
    :cond_fc
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    if-eqz v1, :cond_fd

    new-instance v2, Ll/gw1;

    invoke-direct {v2}, Ll/gw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    .line 338
    :cond_fd
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    if-eqz v1, :cond_fe

    .line 339
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;->clone()Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    .line 340
    :cond_fe
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    if-eqz v1, :cond_ff

    .line 341
    new-instance v2, Ll/hw1;

    invoke-direct {v2}, Ll/hw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    .line 342
    :cond_ff
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    if-eqz v1, :cond_100

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 343
    :cond_100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    if-eqz v1, :cond_101

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 344
    :cond_101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    if-eqz v1, :cond_102

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    .line 345
    :cond_102
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->isAnchor:Z

    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->isAnchor:Z

    .line 346
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    if-eqz v1, :cond_103

    .line 347
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    .line 348
    :cond_103
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    if-eqz v1, :cond_104

    new-instance v2, Ll/iw1;

    invoke-direct {v2}, Ll/iw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    .line 349
    :cond_104
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCallCount:I

    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCallCount:I

    .line 350
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    if-eqz v1, :cond_105

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    .line 351
    :cond_105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    if-eqz v1, :cond_106

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    .line 352
    :cond_106
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    if-eqz v1, :cond_107

    .line 353
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    .line 354
    :cond_107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    if-eqz v1, :cond_108

    .line 355
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    .line 356
    :cond_108
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    if-eqz v1, :cond_109

    .line 357
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    .line 358
    :cond_109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    if-eqz v1, :cond_10a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 359
    :cond_10a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    .line 360
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    if-eqz v1, :cond_10b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    .line 361
    :cond_10b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    if-eqz v1, :cond_10c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    .line 362
    :cond_10c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    if-eqz v1, :cond_10d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 363
    :cond_10d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    if-eqz v1, :cond_10e

    .line 364
    new-instance v2, Ll/kw1;

    invoke-direct {v2}, Ll/kw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    .line 365
    :cond_10e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    if-eqz v1, :cond_10f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    .line 366
    :cond_10f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    if-eqz v1, :cond_110

    .line 367
    new-instance v2, Ll/lw1;

    invoke-direct {v2}, Ll/lw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    .line 368
    :cond_110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    if-eqz v1, :cond_111

    new-instance v2, Ll/mw1;

    invoke-direct {v2}, Ll/mw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    .line 369
    :cond_111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    if-eqz v1, :cond_112

    .line 370
    new-instance v2, Ll/nw1;

    invoke-direct {v2}, Ll/nw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    .line 371
    :cond_112
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    if-eqz v1, :cond_113

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    .line 372
    :cond_113
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    .line 373
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    if-eqz v1, :cond_114

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    .line 374
    :cond_114
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    if-eqz v1, :cond_115

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 375
    :cond_115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    if-eqz v1, :cond_116

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 376
    :cond_116
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    if-eqz v1, :cond_117

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    .line 377
    :cond_117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    if-eqz v1, :cond_118

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 378
    :cond_118
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    if-eqz v1, :cond_119

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    .line 379
    :cond_119
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    if-eqz v1, :cond_11a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 380
    :cond_11a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    if-eqz v1, :cond_11b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    .line 381
    :cond_11b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    if-eqz v1, :cond_11c

    new-instance v2, Ll/pw1;

    invoke-direct {v2}, Ll/pw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    .line 382
    :cond_11c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    if-eqz v1, :cond_11d

    new-instance v2, Ll/qw1;

    invoke-direct {v2}, Ll/qw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    .line 383
    :cond_11d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    if-eqz v1, :cond_11e

    new-instance v2, Ll/rw1;

    invoke-direct {v2}, Ll/rw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    .line 384
    :cond_11e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    if-eqz v1, :cond_11f

    .line 385
    new-instance v2, Ll/sw1;

    invoke-direct {v2}, Ll/sw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    .line 386
    :cond_11f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    if-eqz v1, :cond_120

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    .line 387
    :cond_120
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    if-eqz v1, :cond_121

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 388
    :cond_121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    if-eqz v1, :cond_122

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 389
    :cond_122
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    if-eqz v1, :cond_123

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    .line 390
    :cond_123
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    if-eqz v1, :cond_124

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    .line 391
    :cond_124
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    if-eqz v1, :cond_125

    .line 392
    new-instance v2, Ll/tw1;

    invoke-direct {v2}, Ll/tw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    .line 393
    :cond_125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    if-eqz v1, :cond_126

    .line 394
    new-instance v2, Ll/vw1;

    invoke-direct {v2}, Ll/vw1;-><init>()V

    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    .line 395
    :cond_126
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    if-eqz p0, :cond_127

    .line 396
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    :cond_127
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 397
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    .line 4
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    .line 5
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    .line 6
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    .line 7
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    .line 8
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    .line 9
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    .line 10
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    .line 11
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 12
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 13
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSquareSummaries:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSquareSummaries:Ljava/util/List;

    .line 14
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    .line 15
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    .line 16
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    .line 18
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveCampaigns:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveCampaigns:Ljava/util/List;

    .line 19
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveHierarchyGrades:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveHierarchyGrades:Ljava/util/List;

    .line 20
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTips:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTips:Ljava/util/List;

    .line 21
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    .line 22
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    .line 24
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 25
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    .line 26
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    .line 28
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 29
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    .line 30
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    .line 31
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoQualities:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoQualities:Ljava/util/List;

    .line 32
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorHierarchyGrades:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorHierarchyGrades:Ljava/util/List;

    .line 34
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    .line 36
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplates:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplates:Ljava/util/List;

    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickers:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickers:Ljava/util/List;

    .line 38
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSeeks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSeeks:Ljava/util/List;

    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkInvites:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkInvites:Ljava/util/List;

    .line 40
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pks:Ljava/util/List;

    .line 41
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResources:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResources:Ljava/util/List;

    .line 42
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

    .line 44
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 46
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->version:J

    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->version:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 48
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    .line 50
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    .line 51
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    .line 52
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 54
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medals:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medals:Ljava/util/List;

    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    .line 56
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRedPacketEventCounters:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRedPacketEventCounters:Ljava/util/List;

    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    .line 58
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    .line 60
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    .line 61
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    .line 62
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userEnterRoomEffects:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userEnterRoomEffects:Ljava/util/List;

    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 64
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    .line 66
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    .line 68
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    .line 70
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    .line 72
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    .line 74
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rightBindAnchors:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rightBindAnchors:Ljava/util/List;

    .line 76
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    .line 78
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 80
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    .line 82
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 83
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 84
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 86
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 88
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    .line 89
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    .line 90
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    .line 92
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    .line 93
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 94
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    .line 96
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    .line 97
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    .line 98
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 99
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    .line 100
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    .line 102
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    .line 103
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    .line 104
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    .line 106
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scrapTabs:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scrapTabs:Ljava/util/List;

    .line 107
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    .line 108
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    .line 110
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInDetails:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInDetails:Ljava/util/List;

    .line 111
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInPrizes:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInPrizes:Ljava/util/List;

    .line 112
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    .line 113
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    .line 114
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    .line 115
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    .line 116
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInAchievementMedals:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInAchievementMedals:Ljava/util/List;

    .line 118
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    .line 119
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    .line 120
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    .line 121
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    .line 122
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    .line 123
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    .line 124
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    .line 125
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    .line 126
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    .line 128
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareItems:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareItems:Ljava/util/List;

    .line 129
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    .line 130
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    .line 131
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    .line 132
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    .line 133
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagerInvites:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagerInvites:Ljava/util/List;

    .line 134
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    .line 135
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    .line 136
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    .line 138
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    .line 140
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 141
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    .line 142
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    .line 143
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    .line 144
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    .line 145
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSchemas:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSchemas:Ljava/util/List;

    .line 146
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    .line 147
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    .line 148
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    .line 149
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    .line 150
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 151
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    .line 152
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->needTitle:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->needTitle:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    .line 153
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    .line 154
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    .line 156
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    .line 158
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesGifts:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesGifts:Ljava/util/List;

    .line 159
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    .line 160
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 161
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    .line 162
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    .line 163
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    .line 164
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    .line 165
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    .line 166
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    .line 167
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    .line 168
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 169
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    .line 170
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    .line 171
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    .line 172
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    .line 173
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    .line 174
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 175
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 176
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    .line 177
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    .line 178
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    .line 179
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    .line 180
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    .line 181
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 182
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    .line 183
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    .line 184
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    .line 185
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    .line 186
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    .line 187
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    .line 188
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    .line 189
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    .line 190
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    .line 191
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    .line 192
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    .line 193
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 194
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    .line 195
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    .line 196
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    .line 197
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    .line 198
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    .line 199
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    .line 200
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    .line 201
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    .line 202
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 203
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    .line 204
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    .line 205
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    .line 206
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    .line 207
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    .line 208
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    .line 209
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    .line 210
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    .line 211
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    .line 212
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    .line 213
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mutexMode:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mutexMode:Ljava/util/List;

    .line 214
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    .line 215
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    .line 216
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    .line 217
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    .line 218
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 219
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    .line 220
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 221
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 222
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    .line 223
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    .line 224
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    .line 225
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    .line 226
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    .line 227
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    .line 228
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 229
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    .line 230
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    .line 231
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    .line 232
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 233
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->exchangeTTCRedpoint:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->exchangeTTCRedpoint:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    .line 234
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    .line 235
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    .line 236
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    .line 237
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 238
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowList:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowList:Ljava/util/List;

    .line 239
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    .line 240
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    .line 241
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    .line 242
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    .line 243
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    .line 244
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    .line 245
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    .line 246
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 247
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    .line 248
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    .line 249
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 250
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    .line 251
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 252
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    .line 253
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    .line 254
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    .line 255
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    .line 256
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    .line 257
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    .line 258
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    .line 259
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    .line 260
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 261
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 262
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    .line 263
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->isAnchor:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->isAnchor:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    .line 264
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    .line 265
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCallCount:I

    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCallCount:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    .line 266
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    .line 267
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    .line 268
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    .line 269
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    .line 270
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 271
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    .line 272
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    .line 273
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    .line 274
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 275
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    .line 276
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    .line 277
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    .line 278
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    .line 279
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    .line 280
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    .line 281
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    .line 282
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    .line 283
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 284
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 285
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    .line 286
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 287
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    .line 288
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 289
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    .line 290
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    .line 291
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    .line 292
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    .line 293
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    .line 294
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    .line 295
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 296
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 297
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    .line 298
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    .line 299
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    .line 300
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    .line 301
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 302
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivedata"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    if-nez v0, :cond_12f

    mul-int/lit8 v0, v0, 0x29

    .line 2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

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

    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->hashCode()I

    move-result v1

    goto :goto_3

    :cond_3
    move v1, v2

    :goto_3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    if-eqz v1, :cond_4

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_4

    :cond_4
    move v1, v2

    :goto_4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchors:Ljava/util/List;

    if-eqz v1, :cond_5

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_5

    :cond_5
    move v1, v2

    :goto_5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rooms:Ljava/util/List;

    if-eqz v1, :cond_6

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_6

    :cond_6
    move v1, v2

    :goto_6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lives:Ljava/util/List;

    if-eqz v1, :cond_7

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_7

    :cond_7
    move v1, v2

    :goto_7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    if-eqz v1, :cond_8

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_8

    :cond_8
    move v1, v2

    :goto_8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRes:Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    if-eqz v1, :cond_9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->hashCode()I

    move-result v1

    goto :goto_9

    :cond_9
    move v1, v2

    :goto_9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    if-eqz v1, :cond_a

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_a

    :cond_a
    move v1, v2

    :goto_a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSquareSummaries:Ljava/util/List;

    if-eqz v1, :cond_b

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_b

    :cond_b
    move v1, v2

    :goto_b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivitySummaries:Ljava/util/List;

    if-eqz v1, :cond_c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_c

    :cond_c
    move v1, v2

    :goto_c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveActivities:Ljava/util/List;

    if-eqz v1, :cond_d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_d

    :cond_d
    move v1, v2

    :goto_d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    if-eqz v1, :cond_e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_e

    :cond_e
    move v1, v2

    :goto_e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->menuItems:Ljava/util/List;

    if-eqz v1, :cond_f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_f

    :cond_f
    move v1, v2

    :goto_f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveCampaigns:Ljava/util/List;

    if-eqz v1, :cond_10

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_10

    :cond_10
    move v1, v2

    :goto_10
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveHierarchyGrades:Ljava/util/List;

    if-eqz v1, :cond_11

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_11

    :cond_11
    move v1, v2

    :goto_11
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTips:Ljava/util/List;

    if-eqz v1, :cond_12

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_12

    :cond_12
    move v1, v2

    :goto_12
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePushes:Ljava/util/List;

    if-eqz v1, :cond_13

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_13

    :cond_13
    move v1, v2

    :goto_13
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    if-eqz v1, :cond_14

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;->hashCode()I

    move-result v1

    goto :goto_14

    :cond_14
    move v1, v2

    :goto_14
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    if-eqz v1, :cond_15

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->hashCode()I

    move-result v1

    goto :goto_15

    :cond_15
    move v1, v2

    :goto_15
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    if-eqz v1, :cond_16

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_16

    :cond_16
    move v1, v2

    :goto_16
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    if-eqz v1, :cond_17

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->hashCode()I

    move-result v1

    goto :goto_17

    :cond_17
    move v1, v2

    :goto_17
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboards:Ljava/util/List;

    if-eqz v1, :cond_18

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_18

    :cond_18
    move v1, v2

    :goto_18
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    if-eqz v1, :cond_19

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_19

    :cond_19
    move v1, v2

    :goto_19
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hourLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    if-eqz v1, :cond_1a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hashCode()I

    move-result v1

    goto :goto_1a

    :cond_1a
    move v1, v2

    :goto_1a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->momentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;

    if-eqz v1, :cond_1b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMomentConfig;->hashCode()I

    move-result v1

    goto :goto_1b

    :cond_1b
    move v1, v2

    :goto_1b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->treasureBox:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;->hashCode()I

    move-result v1

    goto :goto_1c

    :cond_1c
    move v1, v2

    :goto_1c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoQualities:Ljava/util/List;

    if-eqz v1, :cond_1d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1d

    :cond_1d
    move v1, v2

    :goto_1d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->hashCode()I

    move-result v1

    goto :goto_1e

    :cond_1e
    move v1, v2

    :goto_1e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorHierarchyGrades:Ljava/util/List;

    if-eqz v1, :cond_1f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_1f

    :cond_1f
    move v1, v2

    :goto_1f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    if-eqz v1, :cond_20

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->hashCode()I

    move-result v1

    goto :goto_20

    :cond_20
    move v1, v2

    :goto_20
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;

    if-eqz v1, :cond_21

    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaData;->hashCode()I

    move-result v1

    goto :goto_21

    :cond_21
    move v1, v2

    :goto_21
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplates:Ljava/util/List;

    if-eqz v1, :cond_22

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_22

    :cond_22
    move v1, v2

    :goto_22
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickers:Ljava/util/List;

    if-eqz v1, :cond_23

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_23

    :cond_23
    move v1, v2

    :goto_23
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSeeks:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkInvites:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pks:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResources:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->tasks:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->taskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    if-eqz v1, :cond_2b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->hashCode()I

    move-result v1

    goto :goto_2b

    :cond_2b
    move v1, v2

    :goto_2b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 47
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->version:J

    const/16 v1, 0x20

    ushr-long v5, v3, v1

    xor-long/2addr v3, v5

    long-to-int v1, v3

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedalPanel:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;

    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;->hashCode()I

    move-result v1

    goto :goto_2c

    :cond_2c
    move v1, v2

    :goto_2c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabRedPacketInfo:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    if-eqz v1, :cond_2d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hashCode()I

    move-result v1

    goto :goto_2d

    :cond_2d
    move v1, v2

    :goto_2d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->redPacketGrabResult:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hashCode()I

    move-result v1

    goto :goto_2e

    :cond_2e
    move v1, v2

    :goto_2e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    if-eqz v1, :cond_2f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_2f

    :cond_2f
    move v1, v2

    :goto_2f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    if-eqz v1, :cond_30

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_30

    :cond_30
    move v1, v2

    :goto_30
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    if-eqz v1, :cond_31

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_31

    :cond_31
    move v1, v2

    :goto_31
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->records:Ljava/util/List;

    if-eqz v1, :cond_32

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_32

    :cond_32
    move v1, v2

    :goto_32
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorFanbaseMedal:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    if-eqz v1, :cond_33

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->hashCode()I

    move-result v1

    goto :goto_33

    :cond_33
    move v1, v2

    :goto_33
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medals:Ljava/util/List;

    if-eqz v1, :cond_34

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_34

    :cond_34
    move v1, v2

    :goto_34
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->leaderboardUsers:Ljava/util/List;

    if-eqz v1, :cond_35

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_35

    :cond_35
    move v1, v2

    :goto_35
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRedPacketEventCounters:Ljava/util/List;

    if-eqz v1, :cond_36

    .line 59
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_36

    :cond_36
    move v1, v2

    :goto_36
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    if-eqz v1, :cond_37

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_37

    :cond_37
    move v1, v2

    :goto_37
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    if-eqz v1, :cond_38

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_38

    :cond_38
    move v1, v2

    :goto_38
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    if-eqz v1, :cond_39

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_39

    :cond_39
    move v1, v2

    :goto_39
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    if-eqz v1, :cond_3a

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_3a

    :cond_3a
    move v1, v2

    :goto_3a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    if-eqz v1, :cond_3b

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_3b

    :cond_3b
    move v1, v2

    :goto_3b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userEnterRoomEffects:Ljava/util/List;

    if-eqz v1, :cond_3c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_3c

    :cond_3c
    move v1, v2

    :goto_3c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    if-eqz v1, :cond_3d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->hashCode()I

    move-result v1

    goto :goto_3d

    :cond_3d
    move v1, v2

    :goto_3d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    if-eqz v1, :cond_3e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Connector;->hashCode()I

    move-result v1

    goto :goto_3e

    :cond_3e
    move v1, v2

    :goto_3e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    if-eqz v1, :cond_3f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_3f

    :cond_3f
    move v1, v2

    :goto_3f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->turboCardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;

    if-eqz v1, :cond_40

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;->hashCode()I

    move-result v1

    goto :goto_40

    :cond_40
    move v1, v2

    :goto_40
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    if-eqz v1, :cond_41

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_41

    :cond_41
    move v1, v2

    :goto_41
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    if-eqz v1, :cond_42

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_42

    :cond_42
    move v1, v2

    :goto_42
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    if-eqz v1, :cond_43

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_43

    :cond_43
    move v1, v2

    :goto_43
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    if-eqz v1, :cond_44

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_44

    :cond_44
    move v1, v2

    :goto_44
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    if-eqz v1, :cond_45

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_45

    :cond_45
    move v1, v2

    :goto_45
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    if-eqz v1, :cond_46

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_46

    :cond_46
    move v1, v2

    :goto_46
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    if-eqz v1, :cond_47

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_47

    :cond_47
    move v1, v2

    :goto_47
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->right:Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;

    if-eqz v1, :cond_48

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->hashCode()I

    move-result v1

    goto :goto_48

    :cond_48
    move v1, v2

    :goto_48
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rightBindAnchors:Ljava/util/List;

    if-eqz v1, :cond_49

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_49

    :cond_49
    move v1, v2

    :goto_49
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveOperation:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    if-eqz v1, :cond_4a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->hashCode()I

    move-result v1

    goto :goto_4a

    :cond_4a
    move v1, v2

    :goto_4a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    if-eqz v1, :cond_4b

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_4b

    :cond_4b
    move v1, v2

    :goto_4b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    if-eqz v1, :cond_4c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->hashCode()I

    move-result v1

    goto :goto_4c

    :cond_4c
    move v1, v2

    :goto_4c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftStar:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    if-eqz v1, :cond_4d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->hashCode()I

    move-result v1

    goto :goto_4d

    :cond_4d
    move v1, v2

    :goto_4d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->advancedTasks:Ljava/util/List;

    if-eqz v1, :cond_4e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_4e

    :cond_4e
    move v1, v2

    :goto_4e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    if-eqz v1, :cond_4f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_4f

    :cond_4f
    move v1, v2

    :goto_4f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    if-eqz v1, :cond_50

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_50

    :cond_50
    move v1, v2

    :goto_50
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    if-eqz v1, :cond_51

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_51

    :cond_51
    move v1, v2

    :goto_51
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    if-eqz v1, :cond_52

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_52

    :cond_52
    move v1, v2

    :goto_52
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    if-eqz v1, :cond_53

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->hashCode()I

    move-result v1

    goto :goto_53

    :cond_53
    move v1, v2

    :goto_53
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    if-eqz v1, :cond_54

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hashCode()I

    move-result v1

    goto :goto_54

    :cond_54
    move v1, v2

    :goto_54
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    if-eqz v1, :cond_55

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_55

    :cond_55
    move v1, v2

    :goto_55
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatSettings:Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    if-eqz v1, :cond_56

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;->hashCode()I

    move-result v1

    goto :goto_56

    :cond_56
    move v1, v2

    :goto_56
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    if-eqz v1, :cond_57

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_57

    :cond_57
    move v1, v2

    :goto_57
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    if-eqz v1, :cond_58

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;->hashCode()I

    move-result v1

    goto :goto_58

    :cond_58
    move v1, v2

    :goto_58
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    if-eqz v1, :cond_59

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_59

    :cond_59
    move v1, v2

    :goto_59
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    if-eqz v1, :cond_5a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;->hashCode()I

    move-result v1

    goto :goto_5a

    :cond_5a
    move v1, v2

    :goto_5a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    if-eqz v1, :cond_5b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->hashCode()I

    move-result v1

    goto :goto_5b

    :cond_5b
    move v1, v2

    :goto_5b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    if-eqz v1, :cond_5c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_5c

    :cond_5c
    move v1, v2

    :goto_5c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    if-eqz v1, :cond_5d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_5d

    :cond_5d
    move v1, v2

    :goto_5d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    if-eqz v1, :cond_5e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_5e

    :cond_5e
    move v1, v2

    :goto_5e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletCommentTypes:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;

    if-eqz v1, :cond_5f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuList;->hashCode()I

    move-result v1

    goto :goto_5f

    :cond_5f
    move v1, v2

    :goto_5f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    if-eqz v1, :cond_60

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->hashCode()I

    move-result v1

    goto :goto_60

    :cond_60
    move v1, v2

    :goto_60
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    if-eqz v1, :cond_61

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_61

    :cond_61
    move v1, v2

    :goto_61
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    if-eqz v1, :cond_62

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_62

    :cond_62
    move v1, v2

    :goto_62
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    if-eqz v1, :cond_63

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_63

    :cond_63
    move v1, v2

    :goto_63
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskSummary:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    if-eqz v1, :cond_64

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->hashCode()I

    move-result v1

    goto :goto_64

    :cond_64
    move v1, v2

    :goto_64
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTasks:Ljava/util/List;

    if-eqz v1, :cond_65

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_65

    :cond_65
    move v1, v2

    :goto_65
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyTaskProgress:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    if-eqz v1, :cond_66

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->hashCode()I

    move-result v1

    goto :goto_66

    :cond_66
    move v1, v2

    :goto_66
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSetInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;

    if-eqz v1, :cond_67

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->hashCode()I

    move-result v1

    goto :goto_67

    :cond_67
    move v1, v2

    :goto_67
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scrapTabs:Ljava/util/List;

    if-eqz v1, :cond_68

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_68

    :cond_68
    move v1, v2

    :goto_68
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    if-eqz v1, :cond_69

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;->hashCode()I

    move-result v1

    goto :goto_69

    :cond_69
    move v1, v2

    :goto_69
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    if-eqz v1, :cond_6a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->hashCode()I

    move-result v1

    goto :goto_6a

    :cond_6a
    move v1, v2

    :goto_6a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    if-eqz v1, :cond_6b

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_6b

    :cond_6b
    move v1, v2

    :goto_6b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInDetails:Ljava/util/List;

    if-eqz v1, :cond_6c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_6c

    :cond_6c
    move v1, v2

    :goto_6c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInPrizes:Ljava/util/List;

    if-eqz v1, :cond_6d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_6d

    :cond_6d
    move v1, v2

    :goto_6d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveBeautyConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;

    if-eqz v1, :cond_6e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->hashCode()I

    move-result v1

    goto :goto_6e

    :cond_6e
    move v1, v2

    :goto_6e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    if-eqz v1, :cond_6f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_6f

    :cond_6f
    move v1, v2

    :goto_6f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchyProgress:Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;

    if-eqz v1, :cond_70

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHierarchyProgress;->hashCode()I

    move-result v1

    goto :goto_70

    :cond_70
    move v1, v2

    :goto_70
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    if-eqz v1, :cond_71

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_71

    :cond_71
    move v1, v2

    :goto_71
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    if-eqz v1, :cond_72

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_72

    :cond_72
    move v1, v2

    :goto_72
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->signInAchievementMedals:Ljava/util/List;

    if-eqz v1, :cond_73

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_73

    :cond_73
    move v1, v2

    :goto_73
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardAnchorRankInfos:Ljava/util/List;

    if-eqz v1, :cond_74

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_74

    :cond_74
    move v1, v2

    :goto_74
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guardRecords:Ljava/util/List;

    if-eqz v1, :cond_75

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_75

    :cond_75
    move v1, v2

    :goto_75
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    if-eqz v1, :cond_76

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_76

    :cond_76
    move v1, v2

    :goto_76
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    if-eqz v1, :cond_77

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_77

    :cond_77
    move v1, v2

    :goto_77
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    if-eqz v1, :cond_78

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->hashCode()I

    move-result v1

    goto :goto_78

    :cond_78
    move v1, v2

    :goto_78
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveResourcesCDN:Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;

    if-eqz v1, :cond_79

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveResourceCDN;->hashCode()I

    move-result v1

    goto :goto_79

    :cond_79
    move v1, v2

    :goto_79
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    if-eqz v1, :cond_7a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;->hashCode()I

    move-result v1

    goto :goto_7a

    :cond_7a
    move v1, v2

    :goto_7a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    if-eqz v1, :cond_7b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;->hashCode()I

    move-result v1

    goto :goto_7b

    :cond_7b
    move v1, v2

    :goto_7b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    if-eqz v1, :cond_7c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hashCode()I

    move-result v1

    goto :goto_7c

    :cond_7c
    move v1, v2

    :goto_7c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    if-eqz v1, :cond_7d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_7d

    :cond_7d
    move v1, v2

    :goto_7d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareItems:Ljava/util/List;

    if-eqz v1, :cond_7e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_7e

    :cond_7e
    move v1, v2

    :goto_7e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    if-eqz v1, :cond_7f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_7f

    :cond_7f
    move v1, v2

    :goto_7f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    if-eqz v1, :cond_80

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_80

    :cond_80
    move v1, v2

    :goto_80
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    if-eqz v1, :cond_81

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;->hashCode()I

    move-result v1

    goto :goto_81

    :cond_81
    move v1, v2

    :goto_81
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    if-eqz v1, :cond_82

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_82

    :cond_82
    move v1, v2

    :goto_82
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagerInvites:Ljava/util/List;

    if-eqz v1, :cond_83

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_83

    :cond_83
    move v1, v2

    :goto_83
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    if-eqz v1, :cond_84

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_84

    :cond_84
    move v1, v2

    :goto_84
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    if-eqz v1, :cond_85

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_85

    :cond_85
    move v1, v2

    :goto_85
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;

    if-eqz v1, :cond_86

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->hashCode()I

    move-result v1

    goto :goto_86

    :cond_86
    move v1, v2

    :goto_86
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    if-eqz v1, :cond_87

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_87

    :cond_87
    move v1, v2

    :goto_87
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    if-eqz v1, :cond_88

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;->hashCode()I

    move-result v1

    goto :goto_88

    :cond_88
    move v1, v2

    :goto_88
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    if-eqz v1, :cond_89

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_89

    :cond_89
    move v1, v2

    :goto_89
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    if-eqz v1, :cond_8a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->hashCode()I

    move-result v1

    goto :goto_8a

    :cond_8a
    move v1, v2

    :goto_8a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    if-eqz v1, :cond_8b

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_8b

    :cond_8b
    move v1, v2

    :goto_8b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    if-eqz v1, :cond_8c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;->hashCode()I

    move-result v1

    goto :goto_8c

    :cond_8c
    move v1, v2

    :goto_8c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    if-eqz v1, :cond_8d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_8d

    :cond_8d
    move v1, v2

    :goto_8d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    if-eqz v1, :cond_8e

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_8e

    :cond_8e
    move v1, v2

    :goto_8e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSchemas:Ljava/util/List;

    if-eqz v1, :cond_8f

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_8f

    :cond_8f
    move v1, v2

    :goto_8f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    if-eqz v1, :cond_90

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePush;->hashCode()I

    move-result v1

    goto :goto_90

    :cond_90
    move v1, v2

    :goto_90
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    if-eqz v1, :cond_91

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;->hashCode()I

    move-result v1

    goto :goto_91

    :cond_91
    move v1, v2

    :goto_91
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    if-eqz v1, :cond_92

    .line 152
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;->hashCode()I

    move-result v1

    goto :goto_92

    :cond_92
    move v1, v2

    :goto_92
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallExtends:Ljava/util/List;

    if-eqz v1, :cond_93

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_93

    :cond_93
    move v1, v2

    :goto_93
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->scoreSummary:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    if-eqz v1, :cond_94

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->hashCode()I

    move-result v1

    goto :goto_94

    :cond_94
    move v1, v2

    :goto_94
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    if-eqz v1, :cond_95

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->hashCode()I

    move-result v1

    goto :goto_95

    :cond_95
    move v1, v2

    :goto_95
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 156
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->needTitle:Z

    const/16 v3, 0x4d5

    const/16 v4, 0x4cf

    if-eqz v1, :cond_96

    move v1, v4

    goto :goto_96

    :cond_96
    move v1, v3

    :goto_96
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    if-eqz v1, :cond_97

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_97

    :cond_97
    move v1, v2

    :goto_97
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    if-eqz v1, :cond_98

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_98

    :cond_98
    move v1, v2

    :goto_98
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    if-eqz v1, :cond_99

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;->hashCode()I

    move-result v1

    goto :goto_99

    :cond_99
    move v1, v2

    :goto_99
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    if-eqz v1, :cond_9a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->hashCode()I

    move-result v1

    goto :goto_9a

    :cond_9a
    move v1, v2

    :goto_9a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    if-eqz v1, :cond_9b

    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;->hashCode()I

    move-result v1

    goto :goto_9b

    :cond_9b
    move v1, v2

    :goto_9b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    if-eqz v1, :cond_9c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;->hashCode()I

    move-result v1

    goto :goto_9c

    :cond_9c
    move v1, v2

    :goto_9c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveStickerTemplatesGifts:Ljava/util/List;

    if-eqz v1, :cond_9d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_9d

    :cond_9d
    move v1, v2

    :goto_9d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    if-eqz v1, :cond_9e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;->hashCode()I

    move-result v1

    goto :goto_9e

    :cond_9e
    move v1, v2

    :goto_9e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    if-eqz v1, :cond_9f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->hashCode()I

    move-result v1

    goto :goto_9f

    :cond_9f
    move v1, v2

    :goto_9f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    if-eqz v1, :cond_a0

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_a0

    :cond_a0
    move v1, v2

    :goto_a0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    if-eqz v1, :cond_a1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_a1

    :cond_a1
    move v1, v2

    :goto_a1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    if-eqz v1, :cond_a2

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_a2

    :cond_a2
    move v1, v2

    :goto_a2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    if-eqz v1, :cond_a3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;->hashCode()I

    move-result v1

    goto :goto_a3

    :cond_a3
    move v1, v2

    :goto_a3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    if-eqz v1, :cond_a4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->hashCode()I

    move-result v1

    goto :goto_a4

    :cond_a4
    move v1, v2

    :goto_a4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    if-eqz v1, :cond_a5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->hashCode()I

    move-result v1

    goto :goto_a5

    :cond_a5
    move v1, v2

    :goto_a5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    if-eqz v1, :cond_a6

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_a6

    :cond_a6
    move v1, v2

    :goto_a6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    if-eqz v1, :cond_a7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->hashCode()I

    move-result v1

    goto :goto_a7

    :cond_a7
    move v1, v2

    :goto_a7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    if-eqz v1, :cond_a8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->hashCode()I

    move-result v1

    goto :goto_a8

    :cond_a8
    move v1, v2

    :goto_a8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    if-eqz v1, :cond_a9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;->hashCode()I

    move-result v1

    goto :goto_a9

    :cond_a9
    move v1, v2

    :goto_a9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    if-eqz v1, :cond_aa

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_aa

    :cond_aa
    move v1, v2

    :goto_aa
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    if-eqz v1, :cond_ab

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_ab

    :cond_ab
    move v1, v2

    :goto_ab
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    if-eqz v1, :cond_ac

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_ac

    :cond_ac
    move v1, v2

    :goto_ac
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    if-eqz v1, :cond_ad

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;->hashCode()I

    move-result v1

    goto :goto_ad

    :cond_ad
    move v1, v2

    :goto_ad
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    if-eqz v1, :cond_ae

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->hashCode()I

    move-result v1

    goto :goto_ae

    :cond_ae
    move v1, v2

    :goto_ae
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    if-eqz v1, :cond_af

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_af

    :cond_af
    move v1, v2

    :goto_af
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    if-eqz v1, :cond_b0

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_b0

    :cond_b0
    move v1, v2

    :goto_b0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    if-eqz v1, :cond_b1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;->hashCode()I

    move-result v1

    goto :goto_b1

    :cond_b1
    move v1, v2

    :goto_b1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    if-eqz v1, :cond_b2

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_b2

    :cond_b2
    move v1, v2

    :goto_b2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    if-eqz v1, :cond_b3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;->hashCode()I

    move-result v1

    goto :goto_b3

    :cond_b3
    move v1, v2

    :goto_b3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    if-eqz v1, :cond_b4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->hashCode()I

    move-result v1

    goto :goto_b4

    :cond_b4
    move v1, v2

    :goto_b4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    if-eqz v1, :cond_b5

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_b5

    :cond_b5
    move v1, v2

    :goto_b5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    if-eqz v1, :cond_b6

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_b6

    :cond_b6
    move v1, v2

    :goto_b6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    if-eqz v1, :cond_b7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;->hashCode()I

    move-result v1

    goto :goto_b7

    :cond_b7
    move v1, v2

    :goto_b7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    if-eqz v1, :cond_b8

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_b8

    :cond_b8
    move v1, v2

    :goto_b8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    if-eqz v1, :cond_b9

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_b9

    :cond_b9
    move v1, v2

    :goto_b9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    if-eqz v1, :cond_ba

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_ba

    :cond_ba
    move v1, v2

    :goto_ba
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    if-eqz v1, :cond_bb

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_bb

    :cond_bb
    move v1, v2

    :goto_bb
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    if-eqz v1, :cond_bc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;->hashCode()I

    move-result v1

    goto :goto_bc

    :cond_bc
    move v1, v2

    :goto_bc
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    if-eqz v1, :cond_bd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;->hashCode()I

    move-result v1

    goto :goto_bd

    :cond_bd
    move v1, v2

    :goto_bd
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    if-eqz v1, :cond_be

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;->hashCode()I

    move-result v1

    goto :goto_be

    :cond_be
    move v1, v2

    :goto_be
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    if-eqz v1, :cond_bf

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;->hashCode()I

    move-result v1

    goto :goto_bf

    :cond_bf
    move v1, v2

    :goto_bf
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    if-eqz v1, :cond_c0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->hashCode()I

    move-result v1

    goto :goto_c0

    :cond_c0
    move v1, v2

    :goto_c0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    if-eqz v1, :cond_c1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;->hashCode()I

    move-result v1

    goto :goto_c1

    :cond_c1
    move v1, v2

    :goto_c1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    if-eqz v1, :cond_c2

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_c2

    :cond_c2
    move v1, v2

    :goto_c2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;

    if-eqz v1, :cond_c3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;->hashCode()I

    move-result v1

    goto :goto_c3

    :cond_c3
    move v1, v2

    :goto_c3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomInProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;

    if-eqz v1, :cond_c4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomInProfile;->hashCode()I

    move-result v1

    goto :goto_c4

    :cond_c4
    move v1, v2

    :goto_c4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    if-eqz v1, :cond_c5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;->hashCode()I

    move-result v1

    goto :goto_c5

    :cond_c5
    move v1, v2

    :goto_c5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    if-eqz v1, :cond_c6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;->hashCode()I

    move-result v1

    goto :goto_c6

    :cond_c6
    move v1, v2

    :goto_c6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    if-eqz v1, :cond_c7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;->hashCode()I

    move-result v1

    goto :goto_c7

    :cond_c7
    move v1, v2

    :goto_c7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    if-eqz v1, :cond_c8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;->hashCode()I

    move-result v1

    goto :goto_c8

    :cond_c8
    move v1, v2

    :goto_c8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 208
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    if-eqz v1, :cond_c9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->hashCode()I

    move-result v1

    goto :goto_c9

    :cond_c9
    move v1, v2

    :goto_c9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    if-eqz v1, :cond_ca

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_ca

    :cond_ca
    move v1, v2

    :goto_ca
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 210
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    if-eqz v1, :cond_cb

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;->hashCode()I

    move-result v1

    goto :goto_cb

    :cond_cb
    move v1, v2

    :goto_cb
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    if-eqz v1, :cond_cc

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_cc

    :cond_cc
    move v1, v2

    :goto_cc
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    if-eqz v1, :cond_cd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;->hashCode()I

    move-result v1

    goto :goto_cd

    :cond_cd
    move v1, v2

    :goto_cd
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    if-eqz v1, :cond_ce

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;->hashCode()I

    move-result v1

    goto :goto_ce

    :cond_ce
    move v1, v2

    :goto_ce
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    if-eqz v1, :cond_cf

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->hashCode()I

    move-result v1

    goto :goto_cf

    :cond_cf
    move v1, v2

    :goto_cf
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    if-eqz v1, :cond_d0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->hashCode()I

    move-result v1

    goto :goto_d0

    :cond_d0
    move v1, v2

    :goto_d0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 216
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    if-eqz v1, :cond_d1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_d1

    :cond_d1
    move v1, v2

    :goto_d1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    if-eqz v1, :cond_d2

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;->hashCode()I

    move-result v1

    goto :goto_d2

    :cond_d2
    move v1, v2

    :goto_d2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    if-eqz v1, :cond_d3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;->hashCode()I

    move-result v1

    goto :goto_d3

    :cond_d3
    move v1, v2

    :goto_d3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mutexMode:Ljava/util/List;

    if-eqz v1, :cond_d4

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_d4

    :cond_d4
    move v1, v2

    :goto_d4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 220
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    if-eqz v1, :cond_d5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;->hashCode()I

    move-result v1

    goto :goto_d5

    :cond_d5
    move v1, v2

    :goto_d5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    if-eqz v1, :cond_d6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;->hashCode()I

    move-result v1

    goto :goto_d6

    :cond_d6
    move v1, v2

    :goto_d6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 222
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    if-eqz v1, :cond_d7

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_d7

    :cond_d7
    move v1, v2

    :goto_d7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    if-eqz v1, :cond_d8

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;->hashCode()I

    move-result v1

    goto :goto_d8

    :cond_d8
    move v1, v2

    :goto_d8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 224
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    if-eqz v1, :cond_d9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->hashCode()I

    move-result v1

    goto :goto_d9

    :cond_d9
    move v1, v2

    :goto_d9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    if-eqz v1, :cond_da

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;->hashCode()I

    move-result v1

    goto :goto_da

    :cond_da
    move v1, v2

    :goto_da
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    if-eqz v1, :cond_db

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->hashCode()I

    move-result v1

    goto :goto_db

    :cond_db
    move v1, v2

    :goto_db
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    if-eqz v1, :cond_dc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;->hashCode()I

    move-result v1

    goto :goto_dc

    :cond_dc
    move v1, v2

    :goto_dc
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 228
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    if-eqz v1, :cond_dd

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_dd

    :cond_dd
    move v1, v2

    :goto_dd
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    if-eqz v1, :cond_de

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_de

    :cond_de
    move v1, v2

    :goto_de
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    if-eqz v1, :cond_df

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_df

    :cond_df
    move v1, v2

    :goto_df
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 231
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    if-eqz v1, :cond_e0

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;->hashCode()I

    move-result v1

    goto :goto_e0

    :cond_e0
    move v1, v2

    :goto_e0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 232
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    if-eqz v1, :cond_e1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_e1

    :cond_e1
    move v1, v2

    :goto_e1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    if-eqz v1, :cond_e2

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_e2

    :cond_e2
    move v1, v2

    :goto_e2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 234
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    if-eqz v1, :cond_e3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->hashCode()I

    move-result v1

    goto :goto_e3

    :cond_e3
    move v1, v2

    :goto_e3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 235
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    if-eqz v1, :cond_e4

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_e4

    :cond_e4
    move v1, v2

    :goto_e4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 236
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    if-eqz v1, :cond_e5

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;->hashCode()I

    move-result v1

    goto :goto_e5

    :cond_e5
    move v1, v2

    :goto_e5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 237
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    if-eqz v1, :cond_e6

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_e6

    :cond_e6
    move v1, v2

    :goto_e6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 238
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    if-eqz v1, :cond_e7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->hashCode()I

    move-result v1

    goto :goto_e7

    :cond_e7
    move v1, v2

    :goto_e7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 239
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->exchangeTTCRedpoint:Z

    if-eqz v1, :cond_e8

    move v1, v4

    goto :goto_e8

    :cond_e8
    move v1, v3

    :goto_e8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    if-eqz v1, :cond_e9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;->hashCode()I

    move-result v1

    goto :goto_e9

    :cond_e9
    move v1, v2

    :goto_e9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    if-eqz v1, :cond_ea

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;->hashCode()I

    move-result v1

    goto :goto_ea

    :cond_ea
    move v1, v2

    :goto_ea
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    if-eqz v1, :cond_eb

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;->hashCode()I

    move-result v1

    goto :goto_eb

    :cond_eb
    move v1, v2

    :goto_eb
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 243
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    if-eqz v1, :cond_ec

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;->hashCode()I

    move-result v1

    goto :goto_ec

    :cond_ec
    move v1, v2

    :goto_ec
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 244
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowCurrentAnchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    if-eqz v1, :cond_ed

    .line 245
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->hashCode()I

    move-result v1

    goto :goto_ed

    :cond_ed
    move v1, v2

    :goto_ed
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowList:Ljava/util/List;

    if-eqz v1, :cond_ee

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_ee

    :cond_ee
    move v1, v2

    :goto_ee
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 247
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->officialShowUser:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;

    if-eqz v1, :cond_ef

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowUser;->hashCode()I

    move-result v1

    goto :goto_ef

    :cond_ef
    move v1, v2

    :goto_ef
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 248
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    if-eqz v1, :cond_f0

    .line 249
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;->hashCode()I

    move-result v1

    goto :goto_f0

    :cond_f0
    move v1, v2

    :goto_f0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 250
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    if-eqz v1, :cond_f1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_f1

    :cond_f1
    move v1, v2

    :goto_f1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 251
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    if-eqz v1, :cond_f2

    .line 252
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;->hashCode()I

    move-result v1

    goto :goto_f2

    :cond_f2
    move v1, v2

    :goto_f2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    if-eqz v1, :cond_f3

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;->hashCode()I

    move-result v1

    goto :goto_f3

    :cond_f3
    move v1, v2

    :goto_f3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bagpackItem:Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;

    if-eqz v1, :cond_f4

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftExpiration;->hashCode()I

    move-result v1

    goto :goto_f4

    :cond_f4
    move v1, v2

    :goto_f4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    if-eqz v1, :cond_f5

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_f5

    :cond_f5
    move v1, v2

    :goto_f5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 256
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    if-eqz v1, :cond_f6

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->hashCode()I

    move-result v1

    goto :goto_f6

    :cond_f6
    move v1, v2

    :goto_f6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 257
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    if-eqz v1, :cond_f7

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;->hashCode()I

    move-result v1

    goto :goto_f7

    :cond_f7
    move v1, v2

    :goto_f7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 258
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    if-eqz v1, :cond_f8

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_f8

    :cond_f8
    move v1, v2

    :goto_f8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    if-eqz v1, :cond_f9

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->hashCode()I

    move-result v1

    goto :goto_f9

    :cond_f9
    move v1, v2

    :goto_f9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 260
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    if-eqz v1, :cond_fa

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_fa

    :cond_fa
    move v1, v2

    :goto_fa
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 261
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->livePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    if-eqz v1, :cond_fb

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->hashCode()I

    move-result v1

    goto :goto_fb

    :cond_fb
    move v1, v2

    :goto_fb
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 262
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopUpGuild:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    if-eqz v1, :cond_fc

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;->hashCode()I

    move-result v1

    goto :goto_fc

    :cond_fc
    move v1, v2

    :goto_fc
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 263
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    if-eqz v1, :cond_fd

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;->hashCode()I

    move-result v1

    goto :goto_fd

    :cond_fd
    move v1, v2

    :goto_fd
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 264
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    if-eqz v1, :cond_fe

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_fe

    :cond_fe
    move v1, v2

    :goto_fe
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 265
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    if-eqz v1, :cond_ff

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->hashCode()I

    move-result v1

    goto :goto_ff

    :cond_ff
    move v1, v2

    :goto_ff
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    if-eqz v1, :cond_100

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;->hashCode()I

    move-result v1

    goto :goto_100

    :cond_100
    move v1, v2

    :goto_100
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 267
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    if-eqz v1, :cond_101

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_101

    :cond_101
    move v1, v2

    :goto_101
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 268
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    if-eqz v1, :cond_102

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;->hashCode()I

    move-result v1

    goto :goto_102

    :cond_102
    move v1, v2

    :goto_102
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 269
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    if-eqz v1, :cond_103

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_103

    :cond_103
    move v1, v2

    :goto_103
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 270
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    if-eqz v1, :cond_104

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->hashCode()I

    move-result v1

    goto :goto_104

    :cond_104
    move v1, v2

    :goto_104
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 271
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    if-eqz v1, :cond_105

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->hashCode()I

    move-result v1

    goto :goto_105

    :cond_105
    move v1, v2

    :goto_105
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 272
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    if-eqz v1, :cond_106

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->hashCode()I

    move-result v1

    goto :goto_106

    :cond_106
    move v1, v2

    :goto_106
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 273
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->isAnchor:Z

    if-eqz v1, :cond_107

    move v3, v4

    :cond_107
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x29

    .line 274
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    if-eqz v1, :cond_108

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;->hashCode()I

    move-result v1

    goto :goto_107

    :cond_108
    move v1, v2

    :goto_107
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 275
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    if-eqz v1, :cond_109

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_108

    :cond_109
    move v1, v2

    :goto_108
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 276
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCallCount:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    if-eqz v1, :cond_10a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->hashCode()I

    move-result v1

    goto :goto_109

    :cond_10a
    move v1, v2

    :goto_109
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 278
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    if-eqz v1, :cond_10b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;->hashCode()I

    move-result v1

    goto :goto_10a

    :cond_10b
    move v1, v2

    :goto_10a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 279
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    if-eqz v1, :cond_10c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;->hashCode()I

    move-result v1

    goto :goto_10b

    :cond_10c
    move v1, v2

    :goto_10b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 280
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    if-eqz v1, :cond_10d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->hashCode()I

    move-result v1

    goto :goto_10c

    :cond_10d
    move v1, v2

    :goto_10c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    if-eqz v1, :cond_10e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->hashCode()I

    move-result v1

    goto :goto_10d

    :cond_10e
    move v1, v2

    :goto_10d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 282
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    if-eqz v1, :cond_10f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->hashCode()I

    move-result v1

    goto :goto_10e

    :cond_10f
    move v1, v2

    :goto_10e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 283
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    if-eqz v1, :cond_110

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_10f

    :cond_110
    move v1, v2

    :goto_10f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 284
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    if-eqz v1, :cond_111

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;->hashCode()I

    move-result v1

    goto :goto_110

    :cond_111
    move v1, v2

    :goto_110
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 285
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    if-eqz v1, :cond_112

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;->hashCode()I

    move-result v1

    goto :goto_111

    :cond_112
    move v1, v2

    :goto_111
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 286
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    if-eqz v1, :cond_113

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->hashCode()I

    move-result v1

    goto :goto_112

    :cond_113
    move v1, v2

    :goto_112
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 287
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    if-eqz v1, :cond_114

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_113

    :cond_114
    move v1, v2

    :goto_113
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 288
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    if-eqz v1, :cond_115

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->hashCode()I

    move-result v1

    goto :goto_114

    :cond_115
    move v1, v2

    :goto_114
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 289
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    if-eqz v1, :cond_116

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_115

    :cond_116
    move v1, v2

    :goto_115
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 290
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    if-eqz v1, :cond_117

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_116

    :cond_117
    move v1, v2

    :goto_116
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    if-eqz v1, :cond_118

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_117

    :cond_118
    move v1, v2

    :goto_117
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 292
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    if-eqz v1, :cond_119

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;->hashCode()I

    move-result v1

    goto :goto_118

    :cond_119
    move v1, v2

    :goto_118
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 293
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    if-eqz v1, :cond_11a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_119

    :cond_11a
    move v1, v2

    :goto_119
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 294
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    if-eqz v1, :cond_11b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;->hashCode()I

    move-result v1

    goto :goto_11a

    :cond_11b
    move v1, v2

    :goto_11a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 295
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    if-eqz v1, :cond_11c

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;->hashCode()I

    move-result v1

    goto :goto_11b

    :cond_11c
    move v1, v2

    :goto_11b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 296
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    if-eqz v1, :cond_11d

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->hashCode()I

    move-result v1

    goto :goto_11c

    :cond_11d
    move v1, v2

    :goto_11c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 297
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    if-eqz v1, :cond_11e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;->hashCode()I

    move-result v1

    goto :goto_11d

    :cond_11e
    move v1, v2

    :goto_11d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 298
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    if-eqz v1, :cond_11f

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->hashCode()I

    move-result v1

    goto :goto_11e

    :cond_11f
    move v1, v2

    :goto_11e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 299
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    if-eqz v1, :cond_120

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;->hashCode()I

    move-result v1

    goto :goto_11f

    :cond_120
    move v1, v2

    :goto_11f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 300
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    if-eqz v1, :cond_121

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->hashCode()I

    move-result v1

    goto :goto_120

    :cond_121
    move v1, v2

    :goto_120
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 301
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    if-eqz v1, :cond_122

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->hashCode()I

    move-result v1

    goto :goto_121

    :cond_122
    move v1, v2

    :goto_121
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 302
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    if-eqz v1, :cond_123

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_122

    :cond_123
    move v1, v2

    :goto_122
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    if-eqz v1, :cond_124

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_123

    :cond_124
    move v1, v2

    :goto_123
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 304
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    if-eqz v1, :cond_125

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_124

    :cond_125
    move v1, v2

    :goto_124
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 305
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    if-eqz v1, :cond_126

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_125

    :cond_126
    move v1, v2

    :goto_125
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 306
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    if-eqz v1, :cond_127

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->hashCode()I

    move-result v1

    goto :goto_126

    :cond_127
    move v1, v2

    :goto_126
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 307
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    if-eqz v1, :cond_128

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->hashCode()I

    move-result v1

    goto :goto_127

    :cond_128
    move v1, v2

    :goto_127
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 308
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    if-eqz v1, :cond_129

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->hashCode()I

    move-result v1

    goto :goto_128

    :cond_129
    move v1, v2

    :goto_128
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 309
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    if-eqz v1, :cond_12a

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->hashCode()I

    move-result v1

    goto :goto_129

    :cond_12a
    move v1, v2

    :goto_129
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 310
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    if-eqz v1, :cond_12b

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->hashCode()I

    move-result v1

    goto :goto_12a

    :cond_12b
    move v1, v2

    :goto_12a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 311
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    if-eqz v1, :cond_12c

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_12b

    :cond_12c
    move v1, v2

    :goto_12b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 312
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    if-eqz v1, :cond_12d

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    goto :goto_12c

    :cond_12d
    move v1, v2

    :goto_12c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 313
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    if-eqz v1, :cond_12e

    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->hashCode()I

    move-result v2

    :cond_12e
    add-int/2addr v0, v2

    .line 314
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    :cond_12f
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    .line 3
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->verificationCenter:Ljava/util/List;

    .line 4
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    if-nez v0, :cond_3

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->monetizationConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    .line 5
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    if-nez v0, :cond_4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->managers:Ljava/util/List;

    .line 6
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    if-nez v0, :cond_5

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftItemCDN:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemCDN;

    .line 7
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    if-nez v0, :cond_6

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveRoomTabGifts:Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;

    .line 8
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    if-nez v0, :cond_7

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 9
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    if-nez v0, :cond_8

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->startLivePageCampaigns:Ljava/util/List;

    .line 10
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    if-nez v0, :cond_9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->calls:Ljava/util/List;

    .line 11
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    if-nez v0, :cond_a

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callInvites:Ljava/util/List;

    .line 12
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rtcTokens:Ljava/util/List;

    .line 13
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    if-nez v0, :cond_c

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->callSummaries:Ljava/util/List;

    .line 14
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    if-nez v0, :cond_d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->hierarchies:Ljava/util/List;

    .line 15
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    if-nez v0, :cond_e

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    .line 16
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    if-nez v0, :cond_f

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    .line 17
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    if-nez v0, :cond_10

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallSummaries:Ljava/util/List;

    .line 18
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    if-nez v0, :cond_11

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    .line 19
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    if-nez v0, :cond_12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    .line 20
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    if-nez v0, :cond_13

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->topics:Ljava/util/List;

    .line 21
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    if-nez v0, :cond_14

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    .line 22
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    if-nez v0, :cond_15

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    .line 23
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    if-nez v0, :cond_16

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 24
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    if-nez v0, :cond_17

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsInfosSummary:Ljava/util/List;

    .line 25
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    if-nez v0, :cond_18

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userKnightInfosSummary:Ljava/util/List;

    .line 26
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    if-nez v0, :cond_19

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->knightsRuleInfos:Ljava/util/List;

    .line 27
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    if-nez v0, :cond_1a

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorKnightInfos:Ljava/util/List;

    .line 28
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    if-nez v0, :cond_1b

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->slotInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 29
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    if-nez v0, :cond_1c

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->equippedGift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    .line 30
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    if-nez v0, :cond_1d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 31
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    if-nez v0, :cond_1e

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveGames:Ljava/util/List;

    .line 32
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    if-nez v0, :cond_1f

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkAssets:Lcom/p1/mobile/putong/live/base/data/BLivePkAssets;

    .line 33
    :cond_1f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    if-nez v0, :cond_20

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->privacyPrivilege:Ljava/util/List;

    .line 34
    :cond_20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    if-nez v0, :cond_21

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUser:Lcom/p1/mobile/putong/live/base/data/BLiveFakeUser;

    .line 35
    :cond_21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    if-nez v0, :cond_22

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->mysteryConfig:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 36
    :cond_22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    if-nez v0, :cond_23

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    .line 37
    :cond_23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    if-nez v0, :cond_24

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSummaries:Ljava/util/List;

    .line 38
    :cond_24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    if-nez v0, :cond_25

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->previews:Ljava/util/List;

    .line 39
    :cond_25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    if-nez v0, :cond_26

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveRightResources:Ljava/util/List;

    .line 40
    :cond_26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    if-nez v0, :cond_27

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    .line 41
    :cond_27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    if-nez v0, :cond_28

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    .line 42
    :cond_28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    if-nez v0, :cond_29

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->givenGiftRemindStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftRemindStatus;

    .line 43
    :cond_29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    if-nez v0, :cond_2a

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLiveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 44
    :cond_2a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    if-nez v0, :cond_2b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chestRewardInfo:Ljava/util/List;

    .line 45
    :cond_2b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    if-nez v0, :cond_2c

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    .line 46
    :cond_2c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    const-string v1, ""

    if-nez v0, :cond_2d

    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameInfoResponse:Ljava/lang/String;

    .line 47
    :cond_2d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    if-nez v0, :cond_2e

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userDailyTasks:Ljava/util/List;

    .line 48
    :cond_2e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    if-nez v0, :cond_2f

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorDailyTasks:Ljava/util/List;

    .line 49
    :cond_2f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    if-nez v0, :cond_30

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;

    .line 50
    :cond_30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    if-nez v0, :cond_31

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAssert:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    .line 51
    :cond_31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    if-nez v0, :cond_32

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;

    .line 52
    :cond_32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    if-nez v0, :cond_33

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstRechargeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 53
    :cond_33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    if-nez v0, :cond_34

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    .line 54
    :cond_34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    if-nez v0, :cond_35

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skins:Ljava/util/List;

    .line 55
    :cond_35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    if-nez v0, :cond_36

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroup:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatGroup;

    .line 56
    :cond_36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    if-nez v0, :cond_37

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceChatGroupApplies:Ljava/util/List;

    .line 57
    :cond_37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    if-nez v0, :cond_38

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceManagers:Ljava/util/List;

    .line 58
    :cond_38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    if-nez v0, :cond_39

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCalls:Ljava/util/List;

    .line 59
    :cond_39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    if-nez v0, :cond_3a

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallInvites:Ljava/util/List;

    .line 60
    :cond_3a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    if-nez v0, :cond_3b

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSummary:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    .line 61
    :cond_3b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    if-nez v0, :cond_3c

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->activitySuggests:Ljava/util/List;

    .line 62
    :cond_3c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    if-nez v0, :cond_3d

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;->new_()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRecall:Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 63
    :cond_3d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    if-nez v0, :cond_3e

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    .line 64
    :cond_3e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    if-nez v0, :cond_3f

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    .line 65
    :cond_3f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    if-nez v0, :cond_40

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->suggestedLives:Ljava/util/List;

    .line 66
    :cond_40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    if-nez v0, :cond_41

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePush;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePush;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLivePush:Lcom/p1/mobile/putong/live/base/data/BLivePush;

    .line 67
    :cond_41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    if-nez v0, :cond_42

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->touchMeDetail:Lcom/p1/mobile/putong/live/base/data/BLiveTouchMeDetail;

    .line 68
    :cond_42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    if-nez v0, :cond_43

    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiCallSwitchToLeadRoleInvite:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSwitchToLeadRoleInvite;

    .line 70
    :cond_43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    if-nez v0, :cond_44

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveTopChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveTopChatMessage;

    .line 71
    :cond_44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    if-nez v0, :cond_45

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->squareEntranceSummary:Ljava/util/List;

    .line 72
    :cond_45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    if-nez v0, :cond_46

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    .line 73
    :cond_46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    if-nez v0, :cond_47

    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    .line 75
    :cond_47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    if-nez v0, :cond_48

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAnnouncement;

    .line 76
    :cond_48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    if-nez v0, :cond_49

    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    .line 78
    :cond_49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    if-nez v0, :cond_4a

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveHeartBeat:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeartBeat;

    .line 79
    :cond_4a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    if-nez v0, :cond_4b

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePopsTotal:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePopTotal;

    .line 80
    :cond_4b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    if-nez v0, :cond_4c

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    .line 81
    :cond_4c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    if-nez v0, :cond_4d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctions:Ljava/util/List;

    .line 82
    :cond_4d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    if-nez v0, :cond_4e

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpRecommendUserList:Ljava/util/List;

    .line 83
    :cond_4e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    if-nez v0, :cond_4f

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpLeaderBoards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;

    .line 84
    :cond_4f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    if-nez v0, :cond_50

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseTaskInfos:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseTaskInfos;

    .line 85
    :cond_50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    if-nez v0, :cond_51

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseRankAwardInfo;

    .line 86
    :cond_51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    if-nez v0, :cond_52

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCpHouseList:Ljava/util/List;

    .line 87
    :cond_52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    if-nez v0, :cond_53

    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 89
    :cond_53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    if-nez v0, :cond_54

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    .line 90
    :cond_54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    if-nez v0, :cond_55

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dailyPayment:Lcom/p1/mobile/putong/live/base/data/BLiveDailyPayment;

    .line 91
    :cond_55
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    if-nez v0, :cond_56

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlVoiceLiveCampaigns:Ljava/util/List;

    .line 92
    :cond_56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    if-nez v0, :cond_57

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardList:Ljava/util/List;

    .line 93
    :cond_57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    if-nez v0, :cond_58

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallList:Ljava/util/List;

    .line 94
    :cond_58
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    if-nez v0, :cond_59

    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBookDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 96
    :cond_59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    if-nez v0, :cond_5a

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    .line 97
    :cond_5a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    if-nez v0, :cond_5b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserGiftItems:Ljava/util/List;

    .line 98
    :cond_5b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    if-nez v0, :cond_5c

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->flameCoinMarket:Lcom/p1/mobile/putong/live/base/data/BLiveHeaddressCoinMarket;

    .line 99
    :cond_5c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    if-nez v0, :cond_5d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->virtualVoiceCard:Ljava/util/List;

    .line 100
    :cond_5d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    if-nez v0, :cond_5e

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatMsgLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatRealMsgLiveInfo;

    .line 101
    :cond_5e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    if-nez v0, :cond_5f

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 102
    :cond_5f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    if-nez v0, :cond_60

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    .line 103
    :cond_60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    if-nez v0, :cond_61

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVOrders:Ljava/util/List;

    .line 104
    :cond_61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    if-nez v0, :cond_62

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->complexCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCardFourConfig;

    .line 105
    :cond_62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    if-nez v0, :cond_63

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyMedals:Ljava/util/List;

    .line 106
    :cond_63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    if-nez v0, :cond_64

    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->schema:Ljava/lang/String;

    .line 107
    :cond_64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    if-nez v0, :cond_65

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cells:Ljava/util/List;

    .line 108
    :cond_65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    if-nez v0, :cond_66

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSettles:Ljava/util/List;

    .line 109
    :cond_66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    if-nez v0, :cond_67

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivePush:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;

    .line 110
    :cond_67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    if-nez v0, :cond_68

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceAdminPanelCounter:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAdminPanelCounter;

    .line 111
    :cond_68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    if-nez v0, :cond_69

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserMessageRemind:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserMessageRemind;

    .line 112
    :cond_69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    if-nez v0, :cond_6a

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->shareRoomConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareUrlConfig;

    .line 113
    :cond_6a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    if-nez v0, :cond_6b

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberDetail:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberDetail;

    .line 114
    :cond_6b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    if-nez v0, :cond_6c

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->nobleNiceNumberList:Lcom/p1/mobile/putong/live/base/data/BLiveNiceNumberList;

    .line 115
    :cond_6c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    if-nez v0, :cond_6d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatVoiceRoomTasks:Ljava/util/List;

    .line 116
    :cond_6d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    if-nez v0, :cond_6e

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;

    .line 117
    :cond_6e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    if-nez v0, :cond_6f

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallIList;

    .line 118
    :cond_6f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    if-nez v0, :cond_70

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceWeekLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;

    .line 119
    :cond_70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    if-nez v0, :cond_71

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomLevelDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomLevelDetail;

    .line 120
    :cond_71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    if-nez v0, :cond_72

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 121
    :cond_72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    if-nez v0, :cond_73

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starRedPackets:Ljava/util/List;

    .line 122
    :cond_73
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    if-nez v0, :cond_74

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    .line 123
    :cond_74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    if-nez v0, :cond_75

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    .line 124
    :cond_75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    if-nez v0, :cond_76

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;

    .line 125
    :cond_76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    if-nez v0, :cond_77

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkPanel:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanel;

    .line 126
    :cond_77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    if-nez v0, :cond_78

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkAsset:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;

    .line 127
    :cond_78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    if-nez v0, :cond_79

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->multiPkLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    .line 128
    :cond_79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    if-nez v0, :cond_7a

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomClasses:Ljava/util/List;

    .line 129
    :cond_7a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    if-nez v0, :cond_7b

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopicAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopicAsset;

    .line 130
    :cond_7b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    if-nez v0, :cond_7c

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->chatTopic:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceChatTopic;

    .line 131
    :cond_7c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    if-nez v0, :cond_7d

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->modelDescribe:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceModelDescribe;

    .line 132
    :cond_7d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    if-nez v0, :cond_7e

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveMedalCDN:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    .line 133
    :cond_7e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    if-nez v0, :cond_7f

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserFeedList:Ljava/util/List;

    .line 134
    :cond_7f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    if-nez v0, :cond_80

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userRealVoiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRealVoiceLive;

    .line 135
    :cond_80
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    if-nez v0, :cond_81

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 136
    :cond_81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    if-nez v0, :cond_82

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userWeekLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveUserLeaderboard;

    .line 137
    :cond_82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    if-nez v0, :cond_83

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 138
    :cond_83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    if-nez v0, :cond_84

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCandidates:Ljava/util/List;

    .line 139
    :cond_84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    if-nez v0, :cond_85

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionApplies:Ljava/util/List;

    .line 140
    :cond_85
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    if-nez v0, :cond_86

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionInvites:Ljava/util/List;

    .line 141
    :cond_86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    if-nez v0, :cond_87

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveAuctionAsset:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionAsset;

    .line 142
    :cond_87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    if-nez v0, :cond_88

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionRelationCards:Ljava/util/List;

    .line 143
    :cond_88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    if-nez v0, :cond_89

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bigTVLives:Ljava/util/List;

    .line 144
    :cond_89
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    if-nez v0, :cond_8a

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveClarityLevelInfos:Ljava/util/List;

    .line 145
    :cond_8a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    if-nez v0, :cond_8b

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserLeaderboards:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    .line 146
    :cond_8b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    if-nez v0, :cond_8c

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkSuggestedAnchors:Ljava/util/List;

    .line 147
    :cond_8c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    if-nez v0, :cond_8d

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;

    .line 148
    :cond_8d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    if-nez v0, :cond_8e

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->family:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyInfo;

    .line 149
    :cond_8e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    if-nez v0, :cond_8f

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->familyShareInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFamilyShareInfo;

    .line 150
    :cond_8f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    if-nez v0, :cond_90

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userPushSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveIntlPushSwitch;

    .line 151
    :cond_90
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    if-nez v0, :cond_91

    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->dragonScourgeDisplayChatMessage:Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;

    .line 153
    :cond_91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    if-nez v0, :cond_92

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->rights:Ljava/util/List;

    .line 154
    :cond_92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    if-nez v0, :cond_93

    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionPlatformLeaderboardInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionPlatformLeaderboardInfo;

    .line 156
    :cond_93
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    if-nez v0, :cond_94

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->auctionCounter:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionCounter;

    .line 157
    :cond_94
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    if-nez v0, :cond_95

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftDetails:Ljava/util/List;

    .line 158
    :cond_95
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    if-nez v0, :cond_96

    .line 159
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->luckyParadiseBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 160
    :cond_96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    if-nez v0, :cond_97

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlLiveFramesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFramesCDN;

    .line 161
    :cond_97
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    if-nez v0, :cond_98

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->media:Ljava/util/List;

    .line 162
    :cond_98
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    if-nez v0, :cond_99

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->lovePlanet:Lcom/p1/mobile/putong/live/base/data/BLiveLovePlanet;

    .line 163
    :cond_99
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    if-nez v0, :cond_9a

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->storeBackgroundPics:Ljava/util/List;

    .line 164
    :cond_9a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    if-nez v0, :cond_9b

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftSkinPanel:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftSkinListData;

    .line 165
    :cond_9b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    if-nez v0, :cond_9c

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->emojiPlayMenu:Ljava/util/List;

    .line 166
    :cond_9c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    if-nez v0, :cond_9d

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePayGuideUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    .line 167
    :cond_9d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    if-nez v0, :cond_9e

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorGuildCheck:Lcom/p1/mobile/putong/live/base/data/BLiveGuildAnchorCheck;

    .line 168
    :cond_9e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    if-nez v0, :cond_9f

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->cpInviteRecords:Ljava/util/List;

    .line 169
    :cond_9f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    if-nez v0, :cond_a0

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;->new_()Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->siteWideBroadcastFinder:Lcom/p1/mobile/putong/live/base/data/SiteWideBroadcastFinder;

    .line 170
    :cond_a0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    if-nez v0, :cond_a1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameOperationPositions:Ljava/util/List;

    .line 171
    :cond_a1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    if-nez v0, :cond_a2

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatLive:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 172
    :cond_a2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    if-nez v0, :cond_a3

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 173
    :cond_a3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    if-nez v0, :cond_a4

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;

    .line 174
    :cond_a4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    if-nez v0, :cond_a5

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superUserBirthdayDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodDetail;

    .line 175
    :cond_a5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    if-nez v0, :cond_a6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->missedCalls:Ljava/util/List;

    .line 176
    :cond_a6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    if-nez v0, :cond_a7

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorCall:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    .line 177
    :cond_a7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    if-nez v0, :cond_a8

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAssets:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAssets;

    .line 178
    :cond_a8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    if-nez v0, :cond_a9

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatSquareSummary:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSquareSummary;

    .line 179
    :cond_a9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    if-nez v0, :cond_aa

    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatAttendeeCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;

    .line 181
    :cond_aa
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    if-nez v0, :cond_ab

    .line 182
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->randomMatchCouponDetail:Lcom/p1/mobile/putong/live/base/data/BLiveRandomMatchCouponDetail;

    .line 183
    :cond_ab
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    if-nez v0, :cond_ac

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoChatRandomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 184
    :cond_ac
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    if-nez v0, :cond_ad

    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->code:Ljava/lang/String;

    .line 185
    :cond_ad
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    if-nez v0, :cond_ae

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userCompliance:Lcom/p1/mobile/putong/live/base/data/BLiveUserCompliance;

    .line 186
    :cond_ae
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    if-nez v0, :cond_af

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gamePanelMenus:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGamePanelMenus;

    .line 187
    :cond_af
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    if-nez v0, :cond_b0

    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->funFairBottomEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveLuckyParadiseBottomEntrance;

    .line 189
    :cond_b0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    if-nez v0, :cond_b1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceSquareButtons:Ljava/util/List;

    .line 190
    :cond_b1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    if-nez v0, :cond_b2

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->superChatDetail:Lcom/p1/mobile/putong/live/base/data/BLiveSuperChatDetail;

    .line 191
    :cond_b2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    if-nez v0, :cond_b3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLeaderboardEntrances:Ljava/util/List;

    .line 192
    :cond_b3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    if-nez v0, :cond_b4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->skinList:Ljava/util/List;

    .line 193
    :cond_b4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    if-nez v0, :cond_b5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    .line 194
    :cond_b5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    if-nez v0, :cond_b6

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->pkItemCardsDetail:Lcom/p1/mobile/putong/live/base/data/BLivePKCardShowList;

    .line 195
    :cond_b6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    if-nez v0, :cond_b7

    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->octopusUrl:Ljava/lang/String;

    .line 196
    :cond_b7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    if-nez v0, :cond_b8

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    .line 197
    :cond_b8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    if-nez v0, :cond_b9

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 198
    :cond_b9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    if-nez v0, :cond_ba

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->medalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWall;

    .line 199
    :cond_ba
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    if-nez v0, :cond_bb

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->gameAsset:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePlayModeList;

    .line 200
    :cond_bb
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    if-nez v0, :cond_bc

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->game:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 201
    :cond_bc
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    if-nez v0, :cond_bd

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->canJoinGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;

    .line 202
    :cond_bd
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    if-nez v0, :cond_be

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 203
    :cond_be
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    if-nez v0, :cond_bf

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseDetail:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    .line 204
    :cond_bf
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    if-nez v0, :cond_c0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberLbs:Ljava/util/List;

    .line 205
    :cond_c0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    if-nez v0, :cond_c1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseLbs:Ljava/util/List;

    .line 206
    :cond_c1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    if-nez v0, :cond_c2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->myJoins:Ljava/util/List;

    .line 207
    :cond_c2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    if-nez v0, :cond_c3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbaseMedals:Ljava/util/List;

    .line 208
    :cond_c3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    if-nez v0, :cond_c4

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->heatBoxEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;

    .line 209
    :cond_c4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    if-nez v0, :cond_c5

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voicePkInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 210
    :cond_c5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    if-nez v0, :cond_c6

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossCall:Lcom/p1/mobile/putong/live/base/data/BLiveBossCall;

    .line 211
    :cond_c6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    if-nez v0, :cond_c7

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bossGiftRecord:Lcom/p1/mobile/putong/live/base/data/BLiveBossGiftRecord;

    .line 212
    :cond_c7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    if-nez v0, :cond_c8

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    .line 213
    :cond_c8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    if-nez v0, :cond_c9

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletCommentTypes:Ljava/util/List;

    .line 214
    :cond_c9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    if-nez v0, :cond_ca

    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    :cond_ca
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
