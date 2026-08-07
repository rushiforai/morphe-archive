.class public Lcom/p1/mobile/putong/live/base/data/BLiveConfig;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveconfig"


# instance fields
.field public activityOngoingAdditionCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x31
    .end annotation
.end field

.field public activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation
.end field

.field public call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public cardOnLiveText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public enableFriendsLiveStartEntrance:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public entertainmentTabText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation
.end field

.field public hideLiveTab:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public inAppPushHideConfig:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public isMagicGestureOpened:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public liveSquareRefreshListInterval:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public liveSquareRefreshStateInterval:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public managerRights:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public memberListMax:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public msgSameLocationLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x30
    .end annotation
.end field

.field public nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x32
    .end annotation
.end field

.field public pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation
.end field

.field public pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public pushMaxTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public recallFansLimitToast:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public reportFeedback:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public roomManagerCountMax:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public showDebugInfo:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public showMomentLikesAndComments:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2d
    .end annotation
.end field

.field public smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation
.end field

.field public stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2f
    .end annotation
.end field

.field public suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation
.end field

.field public swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2e
    .end annotation
.end field

.field public videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public vipReportGrade:Ljava/lang/Long;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nullCheck()V

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

    .line 596
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->memberListMax:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->memberListMax:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 19
    .line 20
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushMaxTimes:I

    .line 21
    .line 22
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushMaxTimes:I

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshStateInterval:I

    .line 25
    .line 26
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshStateInterval:I

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    .line 29
    .line 30
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 41
    .line 42
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 51
    .line 52
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    new-instance v2, Ll/vs1;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/vs1;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 66
    .line 67
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    .line 68
    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    .line 76
    .line 77
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showMomentLikesAndComments:Z

    .line 78
    .line 79
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showMomentLikesAndComments:Z

    .line 80
    .line 81
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomManagerCountMax:I

    .line 82
    .line 83
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomManagerCountMax:I

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 86
    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 94
    .line 95
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    .line 100
    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    .line 102
    .line 103
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->isMagicGestureOpened:Z

    .line 104
    .line 105
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->isMagicGestureOpened:Z

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 112
    .line 113
    if-eqz v1, :cond_6

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 120
    .line 121
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 122
    .line 123
    if-eqz v1, :cond_7

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 130
    .line 131
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 132
    .line 133
    if-eqz v1, :cond_8

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 140
    .line 141
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 142
    .line 143
    if-eqz v1, :cond_9

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 150
    .line 151
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 152
    .line 153
    if-eqz v1, :cond_a

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 160
    .line 161
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 162
    .line 163
    if-eqz v1, :cond_b

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 170
    .line 171
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 172
    .line 173
    if-eqz v1, :cond_c

    .line 174
    .line 175
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 180
    .line 181
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 182
    .line 183
    if-eqz v1, :cond_d

    .line 184
    .line 185
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 190
    .line 191
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 192
    .line 193
    if-eqz v1, :cond_e

    .line 194
    .line 195
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 200
    .line 201
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 202
    .line 203
    if-eqz v1, :cond_f

    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 210
    .line 211
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 212
    .line 213
    if-eqz v1, :cond_10

    .line 214
    .line 215
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 220
    .line 221
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 222
    .line 223
    if-eqz v1, :cond_11

    .line 224
    .line 225
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 230
    .line 231
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 232
    .line 233
    if-eqz v1, :cond_12

    .line 234
    .line 235
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 240
    .line 241
    :cond_12
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->msgSameLocationLimit:I

    .line 242
    .line 243
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->msgSameLocationLimit:I

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 246
    .line 247
    if-eqz v1, :cond_13

    .line 248
    .line 249
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 254
    .line 255
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 256
    .line 257
    if-eqz v1, :cond_14

    .line 258
    .line 259
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 264
    .line 265
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 266
    .line 267
    if-eqz v1, :cond_15

    .line 268
    .line 269
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 274
    .line 275
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    .line 276
    .line 277
    if-eqz v1, :cond_16

    .line 278
    .line 279
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    .line 284
    .line 285
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 286
    .line 287
    if-eqz v1, :cond_17

    .line 288
    .line 289
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 294
    .line 295
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 296
    .line 297
    if-eqz v1, :cond_18

    .line 298
    .line 299
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 304
    .line 305
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 306
    .line 307
    if-eqz v1, :cond_19

    .line 308
    .line 309
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 314
    .line 315
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 316
    .line 317
    if-eqz v1, :cond_1a

    .line 318
    .line 319
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 324
    .line 325
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->vipReportGrade:Ljava/lang/Long;

    .line 326
    .line 327
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->vipReportGrade:Ljava/lang/Long;

    .line 328
    .line 329
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 330
    .line 331
    if-eqz v1, :cond_1b

    .line 332
    .line 333
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 338
    .line 339
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 340
    .line 341
    if-eqz v1, :cond_1c

    .line 342
    .line 343
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 348
    .line 349
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 350
    .line 351
    if-eqz v1, :cond_1d

    .line 352
    .line 353
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 358
    .line 359
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 360
    .line 361
    if-eqz v1, :cond_1e

    .line 362
    .line 363
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 364
    .line 365
    .line 366
    move-result-object v1

    .line 367
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 368
    .line 369
    :cond_1e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 370
    .line 371
    if-eqz v1, :cond_1f

    .line 372
    .line 373
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 378
    .line 379
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 380
    .line 381
    if-eqz v1, :cond_20

    .line 382
    .line 383
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 388
    .line 389
    :cond_20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 390
    .line 391
    if-eqz v1, :cond_21

    .line 392
    .line 393
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 398
    .line 399
    :cond_21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 400
    .line 401
    if-eqz v1, :cond_22

    .line 402
    .line 403
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 408
    .line 409
    :cond_22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 410
    .line 411
    if-eqz v1, :cond_23

    .line 412
    .line 413
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 418
    .line 419
    :cond_23
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activityOngoingAdditionCount:I

    .line 420
    .line 421
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activityOngoingAdditionCount:I

    .line 422
    .line 423
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 424
    .line 425
    if-eqz v1, :cond_24

    .line 426
    .line 427
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 432
    .line 433
    :cond_24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 434
    .line 435
    if-eqz v1, :cond_25

    .line 436
    .line 437
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;->clone()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 438
    .line 439
    .line 440
    move-result-object v1

    .line 441
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 442
    .line 443
    :cond_25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 444
    .line 445
    if-eqz v1, :cond_26

    .line 446
    .line 447
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 452
    .line 453
    :cond_26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showDebugInfo:Z

    .line 454
    .line 455
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showDebugInfo:Z

    .line 456
    .line 457
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 458
    .line 459
    if-eqz v1, :cond_27

    .line 460
    .line 461
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 462
    .line 463
    .line 464
    move-result-object v1

    .line 465
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 466
    .line 467
    :cond_27
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enableFriendsLiveStartEntrance:Z

    .line 468
    .line 469
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enableFriendsLiveStartEntrance:Z

    .line 470
    .line 471
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 472
    .line 473
    if-eqz v1, :cond_28

    .line 474
    .line 475
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 480
    .line 481
    :cond_28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 482
    .line 483
    if-eqz v1, :cond_29

    .line 484
    .line 485
    new-instance v2, Ll/ws1;

    .line 486
    .line 487
    invoke-direct {v2}, Ll/ws1;-><init>()V

    .line 488
    .line 489
    .line 490
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 495
    .line 496
    :cond_29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 497
    .line 498
    if-eqz v1, :cond_2a

    .line 499
    .line 500
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 505
    .line 506
    :cond_2a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 507
    .line 508
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 509
    .line 510
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 511
    .line 512
    if-eqz v1, :cond_2b

    .line 513
    .line 514
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 519
    .line 520
    :cond_2b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 521
    .line 522
    if-eqz v1, :cond_2c

    .line 523
    .line 524
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 525
    .line 526
    .line 527
    move-result-object v1

    .line 528
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 529
    .line 530
    :cond_2c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 531
    .line 532
    if-eqz v1, :cond_2d

    .line 533
    .line 534
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 539
    .line 540
    :cond_2d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    .line 541
    .line 542
    if-eqz v1, :cond_2e

    .line 543
    .line 544
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    .line 545
    .line 546
    .line 547
    move-result-object v1

    .line 548
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    .line 549
    .line 550
    :cond_2e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 551
    .line 552
    if-eqz v1, :cond_2f

    .line 553
    .line 554
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 555
    .line 556
    .line 557
    move-result-object v1

    .line 558
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 559
    .line 560
    :cond_2f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 561
    .line 562
    if-eqz v1, :cond_30

    .line 563
    .line 564
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 565
    .line 566
    .line 567
    move-result-object v1

    .line 568
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 569
    .line 570
    :cond_30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 571
    .line 572
    if-eqz v1, :cond_31

    .line 573
    .line 574
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 575
    .line 576
    .line 577
    move-result-object v1

    .line 578
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 579
    .line 580
    :cond_31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 581
    .line 582
    if-eqz v1, :cond_32

    .line 583
    .line 584
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 585
    .line 586
    .line 587
    move-result-object v1

    .line 588
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 589
    .line 590
    :cond_32
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->hideLiveTab:Z

    .line 591
    .line 592
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->hideLiveTab:Z

    .line 593
    .line 594
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 595
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->memberListMax:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->memberListMax:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushMaxTimes:I

    .line 30
    .line 31
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushMaxTimes:I

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshStateInterval:I

    .line 36
    .line 37
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshStateInterval:I

    .line 38
    .line 39
    if-ne v1, v3, :cond_2

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    .line 42
    .line 43
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    .line 44
    .line 45
    if-ne v1, v3, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showMomentLikesAndComments:Z

    .line 88
    .line 89
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showMomentLikesAndComments:Z

    .line 90
    .line 91
    if-ne v1, v3, :cond_2

    .line 92
    .line 93
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomManagerCountMax:I

    .line 94
    .line 95
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomManagerCountMax:I

    .line 96
    .line 97
    if-ne v1, v3, :cond_2

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->isMagicGestureOpened:Z

    .line 130
    .line 131
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->isMagicGestureOpened:Z

    .line 132
    .line 133
    if-ne v1, v3, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 156
    .line 157
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 166
    .line 167
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 168
    .line 169
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_2

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 176
    .line 177
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 186
    .line 187
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 188
    .line 189
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_2

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 196
    .line 197
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 198
    .line 199
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-eqz v1, :cond_2

    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 206
    .line 207
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 208
    .line 209
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    if-eqz v1, :cond_2

    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 216
    .line 217
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 218
    .line 219
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-eqz v1, :cond_2

    .line 224
    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 226
    .line 227
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 228
    .line 229
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    if-eqz v1, :cond_2

    .line 234
    .line 235
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 236
    .line 237
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 238
    .line 239
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_2

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 246
    .line 247
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 256
    .line 257
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 266
    .line 267
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->msgSameLocationLimit:I

    .line 276
    .line 277
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->msgSameLocationLimit:I

    .line 278
    .line 279
    if-ne v1, v3, :cond_2

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 282
    .line 283
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 284
    .line 285
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    if-eqz v1, :cond_2

    .line 290
    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 292
    .line 293
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 302
    .line 303
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    .line 312
    .line 313
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 322
    .line 323
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 332
    .line 333
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 342
    .line 343
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 344
    .line 345
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result v1

    .line 349
    if-eqz v1, :cond_2

    .line 350
    .line 351
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 352
    .line 353
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 354
    .line 355
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    if-eqz v1, :cond_2

    .line 360
    .line 361
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->vipReportGrade:Ljava/lang/Long;

    .line 362
    .line 363
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->vipReportGrade:Ljava/lang/Long;

    .line 364
    .line 365
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    if-eqz v1, :cond_2

    .line 370
    .line 371
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 372
    .line 373
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 374
    .line 375
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    if-eqz v1, :cond_2

    .line 380
    .line 381
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 382
    .line 383
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 392
    .line 393
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 402
    .line 403
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 412
    .line 413
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 414
    .line 415
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 416
    .line 417
    .line 418
    move-result v1

    .line 419
    if-eqz v1, :cond_2

    .line 420
    .line 421
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 422
    .line 423
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 424
    .line 425
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    if-eqz v1, :cond_2

    .line 430
    .line 431
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 432
    .line 433
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 434
    .line 435
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result v1

    .line 439
    if-eqz v1, :cond_2

    .line 440
    .line 441
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 442
    .line 443
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 444
    .line 445
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result v1

    .line 449
    if-eqz v1, :cond_2

    .line 450
    .line 451
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 452
    .line 453
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 454
    .line 455
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 456
    .line 457
    .line 458
    move-result v1

    .line 459
    if-eqz v1, :cond_2

    .line 460
    .line 461
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activityOngoingAdditionCount:I

    .line 462
    .line 463
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activityOngoingAdditionCount:I

    .line 464
    .line 465
    if-ne v1, v3, :cond_2

    .line 466
    .line 467
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 468
    .line 469
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 478
    .line 479
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 488
    .line 489
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showDebugInfo:Z

    .line 498
    .line 499
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showDebugInfo:Z

    .line 500
    .line 501
    if-ne v1, v3, :cond_2

    .line 502
    .line 503
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 504
    .line 505
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 506
    .line 507
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    move-result v1

    .line 511
    if-eqz v1, :cond_2

    .line 512
    .line 513
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enableFriendsLiveStartEntrance:Z

    .line 514
    .line 515
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enableFriendsLiveStartEntrance:Z

    .line 516
    .line 517
    if-ne v1, v3, :cond_2

    .line 518
    .line 519
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 520
    .line 521
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 522
    .line 523
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 524
    .line 525
    .line 526
    move-result v1

    .line 527
    if-eqz v1, :cond_2

    .line 528
    .line 529
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 530
    .line 531
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 532
    .line 533
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    if-eqz v1, :cond_2

    .line 538
    .line 539
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 540
    .line 541
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 542
    .line 543
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 544
    .line 545
    .line 546
    move-result v1

    .line 547
    if-eqz v1, :cond_2

    .line 548
    .line 549
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 550
    .line 551
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 552
    .line 553
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 554
    .line 555
    .line 556
    move-result v1

    .line 557
    if-eqz v1, :cond_2

    .line 558
    .line 559
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 560
    .line 561
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 562
    .line 563
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 564
    .line 565
    .line 566
    move-result v1

    .line 567
    if-eqz v1, :cond_2

    .line 568
    .line 569
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 570
    .line 571
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 572
    .line 573
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 574
    .line 575
    .line 576
    move-result v1

    .line 577
    if-eqz v1, :cond_2

    .line 578
    .line 579
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 580
    .line 581
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 582
    .line 583
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 584
    .line 585
    .line 586
    move-result v1

    .line 587
    if-eqz v1, :cond_2

    .line 588
    .line 589
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    .line 590
    .line 591
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    .line 592
    .line 593
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 594
    .line 595
    .line 596
    move-result v1

    .line 597
    if-eqz v1, :cond_2

    .line 598
    .line 599
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 600
    .line 601
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 602
    .line 603
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 604
    .line 605
    .line 606
    move-result v1

    .line 607
    if-eqz v1, :cond_2

    .line 608
    .line 609
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 610
    .line 611
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 612
    .line 613
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 614
    .line 615
    .line 616
    move-result v1

    .line 617
    if-eqz v1, :cond_2

    .line 618
    .line 619
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 620
    .line 621
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 622
    .line 623
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 624
    .line 625
    .line 626
    move-result v1

    .line 627
    if-eqz v1, :cond_2

    .line 628
    .line 629
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 630
    .line 631
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 632
    .line 633
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 634
    .line 635
    .line 636
    move-result v1

    .line 637
    if-eqz v1, :cond_2

    .line 638
    .line 639
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->hideLiveTab:Z

    .line 640
    .line 641
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->hideLiveTab:Z

    .line 642
    .line 643
    if-ne p0, p1, :cond_2

    .line 644
    .line 645
    return v0

    .line 646
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveconfig"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_3d

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->memberListMax:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushMaxTimes:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshStateInterval:I

    .line 32
    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    .line 37
    .line 38
    add-int/2addr v0, v1

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v1, v2

    .line 51
    :goto_1
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;->hashCode()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    move v1, v2

    .line 64
    :goto_2
    add-int/2addr v0, v1

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 68
    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    move v1, v2

    .line 77
    :goto_3
    add-int/2addr v0, v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;->hashCode()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    goto :goto_4

    .line 89
    :cond_4
    move v1, v2

    .line 90
    :goto_4
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showMomentLikesAndComments:Z

    .line 94
    .line 95
    const/16 v3, 0x4d5

    .line 96
    .line 97
    const/16 v4, 0x4cf

    .line 98
    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    move v1, v4

    .line 102
    goto :goto_5

    .line 103
    :cond_5
    move v1, v3

    .line 104
    :goto_5
    add-int/2addr v0, v1

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomManagerCountMax:I

    .line 108
    .line 109
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 113
    .line 114
    if-eqz v1, :cond_6

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    goto :goto_6

    .line 121
    :cond_6
    move v1, v2

    .line 122
    :goto_6
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz v1, :cond_7

    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_7

    .line 134
    :cond_7
    move v1, v2

    .line 135
    :goto_7
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz v1, :cond_8

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_8

    .line 147
    :cond_8
    move v1, v2

    .line 148
    :goto_8
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->isMagicGestureOpened:Z

    .line 152
    .line 153
    if-eqz v1, :cond_9

    .line 154
    .line 155
    move v1, v4

    .line 156
    goto :goto_9

    .line 157
    :cond_9
    move v1, v3

    .line 158
    :goto_9
    add-int/2addr v0, v1

    .line 159
    mul-int/lit8 v0, v0, 0x29

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 175
    .line 176
    if-eqz v1, :cond_b

    .line 177
    .line 178
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 188
    .line 189
    if-eqz v1, :cond_c

    .line 190
    .line 191
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 201
    .line 202
    if-eqz v1, :cond_d

    .line 203
    .line 204
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 214
    .line 215
    if-eqz v1, :cond_e

    .line 216
    .line 217
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;->hashCode()I

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    goto :goto_e

    .line 222
    :cond_e
    move v1, v2

    .line 223
    :goto_e
    add-int/2addr v0, v1

    .line 224
    mul-int/lit8 v0, v0, 0x29

    .line 225
    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 227
    .line 228
    if-eqz v1, :cond_f

    .line 229
    .line 230
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;->hashCode()I

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    goto :goto_f

    .line 235
    :cond_f
    move v1, v2

    .line 236
    :goto_f
    add-int/2addr v0, v1

    .line 237
    mul-int/lit8 v0, v0, 0x29

    .line 238
    .line 239
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 240
    .line 241
    if-eqz v1, :cond_10

    .line 242
    .line 243
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->hashCode()I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    goto :goto_10

    .line 248
    :cond_10
    move v1, v2

    .line 249
    :goto_10
    add-int/2addr v0, v1

    .line 250
    mul-int/lit8 v0, v0, 0x29

    .line 251
    .line 252
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 253
    .line 254
    if-eqz v1, :cond_11

    .line 255
    .line 256
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->hashCode()I

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    goto :goto_11

    .line 261
    :cond_11
    move v1, v2

    .line 262
    :goto_11
    add-int/2addr v0, v1

    .line 263
    mul-int/lit8 v0, v0, 0x29

    .line 264
    .line 265
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 266
    .line 267
    if-eqz v1, :cond_12

    .line 268
    .line 269
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->hashCode()I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    goto :goto_12

    .line 274
    :cond_12
    move v1, v2

    .line 275
    :goto_12
    add-int/2addr v0, v1

    .line 276
    mul-int/lit8 v0, v0, 0x29

    .line 277
    .line 278
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 279
    .line 280
    if-eqz v1, :cond_13

    .line 281
    .line 282
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->hashCode()I

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    goto :goto_13

    .line 287
    :cond_13
    move v1, v2

    .line 288
    :goto_13
    add-int/2addr v0, v1

    .line 289
    mul-int/lit8 v0, v0, 0x29

    .line 290
    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 292
    .line 293
    if-eqz v1, :cond_14

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;->hashCode()I

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    goto :goto_14

    .line 300
    :cond_14
    move v1, v2

    .line 301
    :goto_14
    add-int/2addr v0, v1

    .line 302
    mul-int/lit8 v0, v0, 0x29

    .line 303
    .line 304
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 305
    .line 306
    if-eqz v1, :cond_15

    .line 307
    .line 308
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;->hashCode()I

    .line 309
    .line 310
    .line 311
    move-result v1

    .line 312
    goto :goto_15

    .line 313
    :cond_15
    move v1, v2

    .line 314
    :goto_15
    add-int/2addr v0, v1

    .line 315
    mul-int/lit8 v0, v0, 0x29

    .line 316
    .line 317
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 318
    .line 319
    if-eqz v1, :cond_16

    .line 320
    .line 321
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;->hashCode()I

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    goto :goto_16

    .line 326
    :cond_16
    move v1, v2

    .line 327
    :goto_16
    add-int/2addr v0, v1

    .line 328
    mul-int/lit8 v0, v0, 0x29

    .line 329
    .line 330
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 331
    .line 332
    if-eqz v1, :cond_17

    .line 333
    .line 334
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->hashCode()I

    .line 335
    .line 336
    .line 337
    move-result v1

    .line 338
    goto :goto_17

    .line 339
    :cond_17
    move v1, v2

    .line 340
    :goto_17
    add-int/2addr v0, v1

    .line 341
    mul-int/lit8 v0, v0, 0x29

    .line 342
    .line 343
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->msgSameLocationLimit:I

    .line 344
    .line 345
    add-int/2addr v0, v1

    .line 346
    mul-int/lit8 v0, v0, 0x29

    .line 347
    .line 348
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 349
    .line 350
    if-eqz v1, :cond_18

    .line 351
    .line 352
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;->hashCode()I

    .line 353
    .line 354
    .line 355
    move-result v1

    .line 356
    goto :goto_18

    .line 357
    :cond_18
    move v1, v2

    .line 358
    :goto_18
    add-int/2addr v0, v1

    .line 359
    mul-int/lit8 v0, v0, 0x29

    .line 360
    .line 361
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 362
    .line 363
    if-eqz v1, :cond_19

    .line 364
    .line 365
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->hashCode()I

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    goto :goto_19

    .line 370
    :cond_19
    move v1, v2

    .line 371
    :goto_19
    add-int/2addr v0, v1

    .line 372
    mul-int/lit8 v0, v0, 0x29

    .line 373
    .line 374
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 375
    .line 376
    if-eqz v1, :cond_1a

    .line 377
    .line 378
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->hashCode()I

    .line 379
    .line 380
    .line 381
    move-result v1

    .line 382
    goto :goto_1a

    .line 383
    :cond_1a
    move v1, v2

    .line 384
    :goto_1a
    add-int/2addr v0, v1

    .line 385
    mul-int/lit8 v0, v0, 0x29

    .line 386
    .line 387
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    .line 388
    .line 389
    if-eqz v1, :cond_1b

    .line 390
    .line 391
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;->hashCode()I

    .line 392
    .line 393
    .line 394
    move-result v1

    .line 395
    goto :goto_1b

    .line 396
    :cond_1b
    move v1, v2

    .line 397
    :goto_1b
    add-int/2addr v0, v1

    .line 398
    mul-int/lit8 v0, v0, 0x29

    .line 399
    .line 400
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 401
    .line 402
    if-eqz v1, :cond_1c

    .line 403
    .line 404
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;->hashCode()I

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    goto :goto_1c

    .line 409
    :cond_1c
    move v1, v2

    .line 410
    :goto_1c
    add-int/2addr v0, v1

    .line 411
    mul-int/lit8 v0, v0, 0x29

    .line 412
    .line 413
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 414
    .line 415
    if-eqz v1, :cond_1d

    .line 416
    .line 417
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->hashCode()I

    .line 418
    .line 419
    .line 420
    move-result v1

    .line 421
    goto :goto_1d

    .line 422
    :cond_1d
    move v1, v2

    .line 423
    :goto_1d
    add-int/2addr v0, v1

    .line 424
    mul-int/lit8 v0, v0, 0x29

    .line 425
    .line 426
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 427
    .line 428
    if-eqz v1, :cond_1e

    .line 429
    .line 430
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;->hashCode()I

    .line 431
    .line 432
    .line 433
    move-result v1

    .line 434
    goto :goto_1e

    .line 435
    :cond_1e
    move v1, v2

    .line 436
    :goto_1e
    add-int/2addr v0, v1

    .line 437
    mul-int/lit8 v0, v0, 0x29

    .line 438
    .line 439
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 440
    .line 441
    if-eqz v1, :cond_1f

    .line 442
    .line 443
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->hashCode()I

    .line 444
    .line 445
    .line 446
    move-result v1

    .line 447
    goto :goto_1f

    .line 448
    :cond_1f
    move v1, v2

    .line 449
    :goto_1f
    add-int/2addr v0, v1

    .line 450
    mul-int/lit8 v0, v0, 0x29

    .line 451
    .line 452
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->vipReportGrade:Ljava/lang/Long;

    .line 453
    .line 454
    if-eqz v1, :cond_20

    .line 455
    .line 456
    invoke-virtual {v1}, Ljava/lang/Long;->hashCode()I

    .line 457
    .line 458
    .line 459
    move-result v1

    .line 460
    goto :goto_20

    .line 461
    :cond_20
    move v1, v2

    .line 462
    :goto_20
    add-int/2addr v0, v1

    .line 463
    mul-int/lit8 v0, v0, 0x29

    .line 464
    .line 465
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 466
    .line 467
    if-eqz v1, :cond_21

    .line 468
    .line 469
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;->hashCode()I

    .line 470
    .line 471
    .line 472
    move-result v1

    .line 473
    goto :goto_21

    .line 474
    :cond_21
    move v1, v2

    .line 475
    :goto_21
    add-int/2addr v0, v1

    .line 476
    mul-int/lit8 v0, v0, 0x29

    .line 477
    .line 478
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 479
    .line 480
    if-eqz v1, :cond_22

    .line 481
    .line 482
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->hashCode()I

    .line 483
    .line 484
    .line 485
    move-result v1

    .line 486
    goto :goto_22

    .line 487
    :cond_22
    move v1, v2

    .line 488
    :goto_22
    add-int/2addr v0, v1

    .line 489
    mul-int/lit8 v0, v0, 0x29

    .line 490
    .line 491
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 492
    .line 493
    if-eqz v1, :cond_23

    .line 494
    .line 495
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

    .line 496
    .line 497
    .line 498
    move-result v1

    .line 499
    goto :goto_23

    .line 500
    :cond_23
    move v1, v2

    .line 501
    :goto_23
    add-int/2addr v0, v1

    .line 502
    mul-int/lit8 v0, v0, 0x29

    .line 503
    .line 504
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 505
    .line 506
    if-eqz v1, :cond_24

    .line 507
    .line 508
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;->hashCode()I

    .line 509
    .line 510
    .line 511
    move-result v1

    .line 512
    goto :goto_24

    .line 513
    :cond_24
    move v1, v2

    .line 514
    :goto_24
    add-int/2addr v0, v1

    .line 515
    mul-int/lit8 v0, v0, 0x29

    .line 516
    .line 517
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 518
    .line 519
    if-eqz v1, :cond_25

    .line 520
    .line 521
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;->hashCode()I

    .line 522
    .line 523
    .line 524
    move-result v1

    .line 525
    goto :goto_25

    .line 526
    :cond_25
    move v1, v2

    .line 527
    :goto_25
    add-int/2addr v0, v1

    .line 528
    mul-int/lit8 v0, v0, 0x29

    .line 529
    .line 530
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 531
    .line 532
    if-eqz v1, :cond_26

    .line 533
    .line 534
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    goto :goto_26

    .line 539
    :cond_26
    move v1, v2

    .line 540
    :goto_26
    add-int/2addr v0, v1

    .line 541
    mul-int/lit8 v0, v0, 0x29

    .line 542
    .line 543
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 544
    .line 545
    if-eqz v1, :cond_27

    .line 546
    .line 547
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;->hashCode()I

    .line 548
    .line 549
    .line 550
    move-result v1

    .line 551
    goto :goto_27

    .line 552
    :cond_27
    move v1, v2

    .line 553
    :goto_27
    add-int/2addr v0, v1

    .line 554
    mul-int/lit8 v0, v0, 0x29

    .line 555
    .line 556
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 557
    .line 558
    if-eqz v1, :cond_28

    .line 559
    .line 560
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

    .line 561
    .line 562
    .line 563
    move-result v1

    .line 564
    goto :goto_28

    .line 565
    :cond_28
    move v1, v2

    .line 566
    :goto_28
    add-int/2addr v0, v1

    .line 567
    mul-int/lit8 v0, v0, 0x29

    .line 568
    .line 569
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 570
    .line 571
    if-eqz v1, :cond_29

    .line 572
    .line 573
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;->hashCode()I

    .line 574
    .line 575
    .line 576
    move-result v1

    .line 577
    goto :goto_29

    .line 578
    :cond_29
    move v1, v2

    .line 579
    :goto_29
    add-int/2addr v0, v1

    .line 580
    mul-int/lit8 v0, v0, 0x29

    .line 581
    .line 582
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activityOngoingAdditionCount:I

    .line 583
    .line 584
    add-int/2addr v0, v1

    .line 585
    mul-int/lit8 v0, v0, 0x29

    .line 586
    .line 587
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 588
    .line 589
    if-eqz v1, :cond_2a

    .line 590
    .line 591
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

    .line 592
    .line 593
    .line 594
    move-result v1

    .line 595
    goto :goto_2a

    .line 596
    :cond_2a
    move v1, v2

    .line 597
    :goto_2a
    add-int/2addr v0, v1

    .line 598
    mul-int/lit8 v0, v0, 0x29

    .line 599
    .line 600
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 601
    .line 602
    if-eqz v1, :cond_2b

    .line 603
    .line 604
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;->hashCode()I

    .line 605
    .line 606
    .line 607
    move-result v1

    .line 608
    goto :goto_2b

    .line 609
    :cond_2b
    move v1, v2

    .line 610
    :goto_2b
    add-int/2addr v0, v1

    .line 611
    mul-int/lit8 v0, v0, 0x29

    .line 612
    .line 613
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 614
    .line 615
    if-eqz v1, :cond_2c

    .line 616
    .line 617
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->hashCode()I

    .line 618
    .line 619
    .line 620
    move-result v1

    .line 621
    goto :goto_2c

    .line 622
    :cond_2c
    move v1, v2

    .line 623
    :goto_2c
    add-int/2addr v0, v1

    .line 624
    mul-int/lit8 v0, v0, 0x29

    .line 625
    .line 626
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showDebugInfo:Z

    .line 627
    .line 628
    if-eqz v1, :cond_2d

    .line 629
    .line 630
    move v1, v4

    .line 631
    goto :goto_2d

    .line 632
    :cond_2d
    move v1, v3

    .line 633
    :goto_2d
    add-int/2addr v0, v1

    .line 634
    mul-int/lit8 v0, v0, 0x29

    .line 635
    .line 636
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 637
    .line 638
    if-eqz v1, :cond_2e

    .line 639
    .line 640
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->hashCode()I

    .line 641
    .line 642
    .line 643
    move-result v1

    .line 644
    goto :goto_2e

    .line 645
    :cond_2e
    move v1, v2

    .line 646
    :goto_2e
    add-int/2addr v0, v1

    .line 647
    mul-int/lit8 v0, v0, 0x29

    .line 648
    .line 649
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enableFriendsLiveStartEntrance:Z

    .line 650
    .line 651
    if-eqz v1, :cond_2f

    .line 652
    .line 653
    move v1, v4

    .line 654
    goto :goto_2f

    .line 655
    :cond_2f
    move v1, v3

    .line 656
    :goto_2f
    add-int/2addr v0, v1

    .line 657
    mul-int/lit8 v0, v0, 0x29

    .line 658
    .line 659
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 660
    .line 661
    if-eqz v1, :cond_30

    .line 662
    .line 663
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

    .line 664
    .line 665
    .line 666
    move-result v1

    .line 667
    goto :goto_30

    .line 668
    :cond_30
    move v1, v2

    .line 669
    :goto_30
    add-int/2addr v0, v1

    .line 670
    mul-int/lit8 v0, v0, 0x29

    .line 671
    .line 672
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 673
    .line 674
    if-eqz v1, :cond_31

    .line 675
    .line 676
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 677
    .line 678
    .line 679
    move-result v1

    .line 680
    goto :goto_31

    .line 681
    :cond_31
    move v1, v2

    .line 682
    :goto_31
    add-int/2addr v0, v1

    .line 683
    mul-int/lit8 v0, v0, 0x29

    .line 684
    .line 685
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 686
    .line 687
    if-eqz v1, :cond_32

    .line 688
    .line 689
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;->hashCode()I

    .line 690
    .line 691
    .line 692
    move-result v1

    .line 693
    goto :goto_32

    .line 694
    :cond_32
    move v1, v2

    .line 695
    :goto_32
    add-int/2addr v0, v1

    .line 696
    mul-int/lit8 v0, v0, 0x29

    .line 697
    .line 698
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 699
    .line 700
    if-eqz v1, :cond_33

    .line 701
    .line 702
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 703
    .line 704
    .line 705
    move-result v1

    .line 706
    goto :goto_33

    .line 707
    :cond_33
    move v1, v2

    .line 708
    :goto_33
    add-int/2addr v0, v1

    .line 709
    mul-int/lit8 v0, v0, 0x29

    .line 710
    .line 711
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 712
    .line 713
    if-eqz v1, :cond_34

    .line 714
    .line 715
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;->hashCode()I

    .line 716
    .line 717
    .line 718
    move-result v1

    .line 719
    goto :goto_34

    .line 720
    :cond_34
    move v1, v2

    .line 721
    :goto_34
    add-int/2addr v0, v1

    .line 722
    mul-int/lit8 v0, v0, 0x29

    .line 723
    .line 724
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 725
    .line 726
    if-eqz v1, :cond_35

    .line 727
    .line 728
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

    .line 729
    .line 730
    .line 731
    move-result v1

    .line 732
    goto :goto_35

    .line 733
    :cond_35
    move v1, v2

    .line 734
    :goto_35
    add-int/2addr v0, v1

    .line 735
    mul-int/lit8 v0, v0, 0x29

    .line 736
    .line 737
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 738
    .line 739
    if-eqz v1, :cond_36

    .line 740
    .line 741
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;->hashCode()I

    .line 742
    .line 743
    .line 744
    move-result v1

    .line 745
    goto :goto_36

    .line 746
    :cond_36
    move v1, v2

    .line 747
    :goto_36
    add-int/2addr v0, v1

    .line 748
    mul-int/lit8 v0, v0, 0x29

    .line 749
    .line 750
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeLiveCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;

    .line 751
    .line 752
    if-eqz v1, :cond_37

    .line 753
    .line 754
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeLiveCardConfig;->hashCode()I

    .line 755
    .line 756
    .line 757
    move-result v1

    .line 758
    goto :goto_37

    .line 759
    :cond_37
    move v1, v2

    .line 760
    :goto_37
    add-int/2addr v0, v1

    .line 761
    mul-int/lit8 v0, v0, 0x29

    .line 762
    .line 763
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 764
    .line 765
    if-eqz v1, :cond_38

    .line 766
    .line 767
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->hashCode()I

    .line 768
    .line 769
    .line 770
    move-result v1

    .line 771
    goto :goto_38

    .line 772
    :cond_38
    move v1, v2

    .line 773
    :goto_38
    add-int/2addr v0, v1

    .line 774
    mul-int/lit8 v0, v0, 0x29

    .line 775
    .line 776
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 777
    .line 778
    if-eqz v1, :cond_39

    .line 779
    .line 780
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;->hashCode()I

    .line 781
    .line 782
    .line 783
    move-result v1

    .line 784
    goto :goto_39

    .line 785
    :cond_39
    move v1, v2

    .line 786
    :goto_39
    add-int/2addr v0, v1

    .line 787
    mul-int/lit8 v0, v0, 0x29

    .line 788
    .line 789
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 790
    .line 791
    if-eqz v1, :cond_3a

    .line 792
    .line 793
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;->hashCode()I

    .line 794
    .line 795
    .line 796
    move-result v1

    .line 797
    goto :goto_3a

    .line 798
    :cond_3a
    move v1, v2

    .line 799
    :goto_3a
    add-int/2addr v0, v1

    .line 800
    mul-int/lit8 v0, v0, 0x29

    .line 801
    .line 802
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 803
    .line 804
    if-eqz v1, :cond_3b

    .line 805
    .line 806
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;->hashCode()I

    .line 807
    .line 808
    .line 809
    move-result v2

    .line 810
    :cond_3b
    add-int/2addr v0, v2

    .line 811
    mul-int/lit8 v0, v0, 0x29

    .line 812
    .line 813
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->hideLiveTab:Z

    .line 814
    .line 815
    if-eqz v1, :cond_3c

    .line 816
    .line 817
    move v3, v4

    .line 818
    :cond_3c
    add-int/2addr v0, v3

    .line 819
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 820
    .line 821
    :cond_3d
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 41
    .line 42
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 43
    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 51
    .line 52
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    .line 53
    .line 54
    const-string v1, ""

    .line 55
    .line 56
    if-nez v0, :cond_5

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    .line 59
    .line 60
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    .line 61
    .line 62
    if-nez v0, :cond_6

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    .line 65
    .line 66
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

    .line 67
    .line 68
    if-nez v0, :cond_7

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

    .line 71
    .line 72
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 73
    .line 74
    if-nez v0, :cond_8

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 81
    .line 82
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 83
    .line 84
    if-nez v0, :cond_9

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 91
    .line 92
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 93
    .line 94
    if-nez v0, :cond_a

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 101
    .line 102
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 103
    .line 104
    if-nez v0, :cond_b

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 111
    .line 112
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 113
    .line 114
    if-nez v0, :cond_c

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 121
    .line 122
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 123
    .line 124
    if-nez v0, :cond_d

    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 131
    .line 132
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 133
    .line 134
    if-nez v0, :cond_e

    .line 135
    .line 136
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 141
    .line 142
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 143
    .line 144
    if-nez v0, :cond_f

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 151
    .line 152
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 153
    .line 154
    if-nez v0, :cond_10

    .line 155
    .line 156
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 161
    .line 162
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 163
    .line 164
    if-nez v0, :cond_11

    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 171
    .line 172
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 173
    .line 174
    if-nez v0, :cond_12

    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 181
    .line 182
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 183
    .line 184
    if-nez v0, :cond_13

    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 191
    .line 192
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 193
    .line 194
    if-nez v0, :cond_14

    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 201
    .line 202
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 203
    .line 204
    if-nez v0, :cond_15

    .line 205
    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 211
    .line 212
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 213
    .line 214
    if-nez v0, :cond_16

    .line 215
    .line 216
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 221
    .line 222
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 223
    .line 224
    if-nez v0, :cond_17

    .line 225
    .line 226
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 231
    .line 232
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 233
    .line 234
    if-nez v0, :cond_18

    .line 235
    .line 236
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 241
    .line 242
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 243
    .line 244
    if-nez v0, :cond_19

    .line 245
    .line 246
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 251
    .line 252
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 253
    .line 254
    if-nez v0, :cond_1a

    .line 255
    .line 256
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 261
    .line 262
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 263
    .line 264
    if-nez v0, :cond_1b

    .line 265
    .line 266
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;->new_()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 271
    .line 272
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 273
    .line 274
    if-nez v0, :cond_1c

    .line 275
    .line 276
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 281
    .line 282
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 283
    .line 284
    if-nez v0, :cond_1d

    .line 285
    .line 286
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 291
    .line 292
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 293
    .line 294
    if-nez v0, :cond_1e

    .line 295
    .line 296
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 301
    .line 302
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 303
    .line 304
    if-nez v0, :cond_1f

    .line 305
    .line 306
    new-instance v0, Ljava/util/ArrayList;

    .line 307
    .line 308
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 309
    .line 310
    .line 311
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 312
    .line 313
    :cond_1f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 314
    .line 315
    if-nez v0, :cond_20

    .line 316
    .line 317
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 322
    .line 323
    :cond_20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 324
    .line 325
    if-nez v0, :cond_21

    .line 326
    .line 327
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 328
    .line 329
    :cond_21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 330
    .line 331
    if-nez v0, :cond_22

    .line 332
    .line 333
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 338
    .line 339
    :cond_22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 340
    .line 341
    if-nez v0, :cond_23

    .line 342
    .line 343
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 348
    .line 349
    :cond_23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 350
    .line 351
    if-nez v0, :cond_24

    .line 352
    .line 353
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 354
    .line 355
    .line 356
    move-result-object v0

    .line 357
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoardConfig;

    .line 358
    .line 359
    :cond_24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 360
    .line 361
    if-nez v0, :cond_25

    .line 362
    .line 363
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 368
    .line 369
    :cond_25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 370
    .line 371
    if-nez v0, :cond_26

    .line 372
    .line 373
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 378
    .line 379
    :cond_26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 380
    .line 381
    if-nez v0, :cond_27

    .line 382
    .line 383
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 388
    .line 389
    :cond_27
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
