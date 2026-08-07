.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoiceliveconfig"


# instance fields
.field public anchorGrowthEntrySwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation
.end field

.field public auctionTrickBubble:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public audienceOperateMenu:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;"
        }
    .end annotation
.end field

.field public bindChatGroupPermission:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public chatEntryExp:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public chatEntryRefreshInterval:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public defaultTabTopicId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public directLeaveRoomMaxStaySeconds:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation
.end field

.field public feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public fixRoomManagerLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public intlEnterRoomOptimize:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2d
    .end annotation
.end field

.field public intlFlyMicEffectConfig:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;",
            ">;"
        }
    .end annotation
.end field

.field public intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2e
    .end annotation
.end field

.field public intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public isHideCreateRoomButton:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x31
    .end annotation
.end field

.field public isOverseaChineseMigrated:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x30
    .end annotation
.end field

.field public memberListRefreshInterval:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public operateMenu:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;"
        }
    .end annotation
.end field

.field public ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public reflectAudioProcessSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation
.end field

.field public roomAdministratorExplainH5:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public roomCardTemplateType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public shareScreenRealNameAuthSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation
.end field

.field public shareScreenSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field

.field public showAnnouncementEntrance:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public showEntrance:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2f
    .end annotation
.end field

.field public showPledgeAuctionNewTag:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x32
    .end annotation
.end field

.field public showRoomRegion:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public startVoiceLive:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public undercoverMinPlayerCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public updateChatV3:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public verificationLevel:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public virtualAvatarSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public voiceActivityShowNumber:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public voiceBottomTabMode:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public voiceLiveActivityMomentShow:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public voiceLiveActivityMomentTest:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public voiceLiveHotChatMatchTest:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public voiceLiveHotChatMatchTest2:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public voiceManagerLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
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

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->nullCheck()V

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

    .line 335
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 25
    .line 26
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->memberListRefreshInterval:I

    .line 33
    .line 34
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->memberListRefreshInterval:I

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    new-instance v2, Ll/i92;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/i92;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 50
    .line 51
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceBottomTabMode:I

    .line 52
    .line 53
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceBottomTabMode:I

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    new-instance v2, Ll/j92;

    .line 60
    .line 61
    invoke-direct {v2}, Ll/j92;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 69
    .line 70
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 71
    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 79
    .line 80
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showAnnouncementEntrance:Z

    .line 81
    .line 82
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showAnnouncementEntrance:Z

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->bindChatGroupPermission:Z

    .line 85
    .line 86
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->bindChatGroupPermission:Z

    .line 87
    .line 88
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->updateChatV3:Z

    .line 89
    .line 90
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->updateChatV3:Z

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceManagerLimit:I

    .line 93
    .line 94
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceManagerLimit:I

    .line 95
    .line 96
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->undercoverMinPlayerCount:I

    .line 97
    .line 98
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->undercoverMinPlayerCount:I

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 101
    .line 102
    if-eqz v1, :cond_4

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 109
    .line 110
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 111
    .line 112
    if-eqz v1, :cond_5

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 119
    .line 120
    :cond_5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest:Z

    .line 121
    .line 122
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest:Z

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 125
    .line 126
    if-eqz v1, :cond_6

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 133
    .line 134
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 135
    .line 136
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 139
    .line 140
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 141
    .line 142
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest2:Z

    .line 143
    .line 144
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest2:Z

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 147
    .line 148
    if-eqz v1, :cond_7

    .line 149
    .line 150
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 155
    .line 156
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 157
    .line 158
    if-eqz v1, :cond_8

    .line 159
    .line 160
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 165
    .line 166
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 167
    .line 168
    if-eqz v1, :cond_9

    .line 169
    .line 170
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 175
    .line 176
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 177
    .line 178
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 179
    .line 180
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryRefreshInterval:I

    .line 181
    .line 182
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryRefreshInterval:I

    .line 183
    .line 184
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryExp:Z

    .line 185
    .line 186
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryExp:Z

    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 189
    .line 190
    if-eqz v1, :cond_a

    .line 191
    .line 192
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 197
    .line 198
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 199
    .line 200
    if-eqz v1, :cond_b

    .line 201
    .line 202
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 207
    .line 208
    :cond_b
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->virtualAvatarSwitch:Z

    .line 209
    .line 210
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->virtualAvatarSwitch:Z

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 213
    .line 214
    if-eqz v1, :cond_c

    .line 215
    .line 216
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 221
    .line 222
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 223
    .line 224
    if-eqz v1, :cond_d

    .line 225
    .line 226
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 231
    .line 232
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 233
    .line 234
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 235
    .line 236
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showRoomRegion:Z

    .line 237
    .line 238
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showRoomRegion:Z

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 241
    .line 242
    if-eqz v1, :cond_e

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 249
    .line 250
    :cond_e
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->fixRoomManagerLimit:I

    .line 251
    .line 252
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->fixRoomManagerLimit:I

    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 255
    .line 256
    if-eqz v1, :cond_f

    .line 257
    .line 258
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 263
    .line 264
    :cond_f
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenSwitch:Z

    .line 265
    .line 266
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenSwitch:Z

    .line 267
    .line 268
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenRealNameAuthSwitch:Z

    .line 269
    .line 270
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenRealNameAuthSwitch:Z

    .line 271
    .line 272
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->reflectAudioProcessSwitch:Z

    .line 273
    .line 274
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->reflectAudioProcessSwitch:Z

    .line 275
    .line 276
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->directLeaveRoomMaxStaySeconds:I

    .line 277
    .line 278
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->directLeaveRoomMaxStaySeconds:I

    .line 279
    .line 280
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->anchorGrowthEntrySwitch:Z

    .line 281
    .line 282
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->anchorGrowthEntrySwitch:Z

    .line 283
    .line 284
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 285
    .line 286
    if-eqz v1, :cond_10

    .line 287
    .line 288
    new-instance v2, Ll/k92;

    .line 289
    .line 290
    invoke-direct {v2}, Ll/k92;-><init>()V

    .line 291
    .line 292
    .line 293
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 298
    .line 299
    :cond_10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlEnterRoomOptimize:Z

    .line 300
    .line 301
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlEnterRoomOptimize:Z

    .line 302
    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 304
    .line 305
    if-eqz v1, :cond_11

    .line 306
    .line 307
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 312
    .line 313
    :cond_11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showEntrance:Z

    .line 314
    .line 315
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showEntrance:Z

    .line 316
    .line 317
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isOverseaChineseMigrated:Z

    .line 318
    .line 319
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isOverseaChineseMigrated:Z

    .line 320
    .line 321
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isHideCreateRoomButton:Z

    .line 322
    .line 323
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isHideCreateRoomButton:Z

    .line 324
    .line 325
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 326
    .line 327
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 328
    .line 329
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showPledgeAuctionNewTag:Z

    .line 330
    .line 331
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showPledgeAuctionNewTag:Z

    .line 332
    .line 333
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 334
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 44
    .line 45
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->memberListRefreshInterval:I

    .line 60
    .line 61
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->memberListRefreshInterval:I

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceBottomTabMode:I

    .line 76
    .line 77
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceBottomTabMode:I

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showAnnouncementEntrance:Z

    .line 102
    .line 103
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showAnnouncementEntrance:Z

    .line 104
    .line 105
    if-ne v1, v3, :cond_2

    .line 106
    .line 107
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->bindChatGroupPermission:Z

    .line 108
    .line 109
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->bindChatGroupPermission:Z

    .line 110
    .line 111
    if-ne v1, v3, :cond_2

    .line 112
    .line 113
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->updateChatV3:Z

    .line 114
    .line 115
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->updateChatV3:Z

    .line 116
    .line 117
    if-ne v1, v3, :cond_2

    .line 118
    .line 119
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceManagerLimit:I

    .line 120
    .line 121
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceManagerLimit:I

    .line 122
    .line 123
    if-ne v1, v3, :cond_2

    .line 124
    .line 125
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->undercoverMinPlayerCount:I

    .line 126
    .line 127
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->undercoverMinPlayerCount:I

    .line 128
    .line 129
    if-ne v1, v3, :cond_2

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 132
    .line 133
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 142
    .line 143
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest:Z

    .line 152
    .line 153
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest:Z

    .line 154
    .line 155
    if-ne v1, v3, :cond_2

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 158
    .line 159
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 160
    .line 161
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_2

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 180
    .line 181
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_2

    .line 186
    .line 187
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest2:Z

    .line 188
    .line 189
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest2:Z

    .line 190
    .line 191
    if-ne v1, v3, :cond_2

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 194
    .line 195
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 204
    .line 205
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 214
    .line 215
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 224
    .line 225
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryRefreshInterval:I

    .line 234
    .line 235
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryRefreshInterval:I

    .line 236
    .line 237
    if-ne v1, v3, :cond_2

    .line 238
    .line 239
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryExp:Z

    .line 240
    .line 241
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryExp:Z

    .line 242
    .line 243
    if-ne v1, v3, :cond_2

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 246
    .line 247
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 256
    .line 257
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->virtualAvatarSwitch:Z

    .line 266
    .line 267
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->virtualAvatarSwitch:Z

    .line 268
    .line 269
    if-ne v1, v3, :cond_2

    .line 270
    .line 271
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 272
    .line 273
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 274
    .line 275
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    if-eqz v1, :cond_2

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 282
    .line 283
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 292
    .line 293
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showRoomRegion:Z

    .line 302
    .line 303
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showRoomRegion:Z

    .line 304
    .line 305
    if-ne v1, v3, :cond_2

    .line 306
    .line 307
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 308
    .line 309
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->fixRoomManagerLimit:I

    .line 318
    .line 319
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->fixRoomManagerLimit:I

    .line 320
    .line 321
    if-ne v1, v3, :cond_2

    .line 322
    .line 323
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 324
    .line 325
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 326
    .line 327
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    if-eqz v1, :cond_2

    .line 332
    .line 333
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenSwitch:Z

    .line 334
    .line 335
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenSwitch:Z

    .line 336
    .line 337
    if-ne v1, v3, :cond_2

    .line 338
    .line 339
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenRealNameAuthSwitch:Z

    .line 340
    .line 341
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenRealNameAuthSwitch:Z

    .line 342
    .line 343
    if-ne v1, v3, :cond_2

    .line 344
    .line 345
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->reflectAudioProcessSwitch:Z

    .line 346
    .line 347
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->reflectAudioProcessSwitch:Z

    .line 348
    .line 349
    if-ne v1, v3, :cond_2

    .line 350
    .line 351
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->directLeaveRoomMaxStaySeconds:I

    .line 352
    .line 353
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->directLeaveRoomMaxStaySeconds:I

    .line 354
    .line 355
    if-ne v1, v3, :cond_2

    .line 356
    .line 357
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->anchorGrowthEntrySwitch:Z

    .line 358
    .line 359
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->anchorGrowthEntrySwitch:Z

    .line 360
    .line 361
    if-ne v1, v3, :cond_2

    .line 362
    .line 363
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 364
    .line 365
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 366
    .line 367
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    if-eqz v1, :cond_2

    .line 372
    .line 373
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlEnterRoomOptimize:Z

    .line 374
    .line 375
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlEnterRoomOptimize:Z

    .line 376
    .line 377
    if-ne v1, v3, :cond_2

    .line 378
    .line 379
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 380
    .line 381
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 382
    .line 383
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    if-eqz v1, :cond_2

    .line 388
    .line 389
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showEntrance:Z

    .line 390
    .line 391
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showEntrance:Z

    .line 392
    .line 393
    if-ne v1, v3, :cond_2

    .line 394
    .line 395
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isOverseaChineseMigrated:Z

    .line 396
    .line 397
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isOverseaChineseMigrated:Z

    .line 398
    .line 399
    if-ne v1, v3, :cond_2

    .line 400
    .line 401
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isHideCreateRoomButton:Z

    .line 402
    .line 403
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isHideCreateRoomButton:Z

    .line 404
    .line 405
    if-ne v1, v3, :cond_2

    .line 406
    .line 407
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 408
    .line 409
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 410
    .line 411
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result v1

    .line 415
    if-eqz v1, :cond_2

    .line 416
    .line 417
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showPledgeAuctionNewTag:Z

    .line 418
    .line 419
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showPledgeAuctionNewTag:Z

    .line 420
    .line 421
    if-ne p0, p1, :cond_2

    .line 422
    .line 423
    return v0

    .line 424
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoiceliveconfig"

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
    if-nez v0, :cond_2c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 48
    .line 49
    const/16 v3, 0x4d5

    .line 50
    .line 51
    const/16 v4, 0x4cf

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    move v1, v4

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v1, v3

    .line 58
    :goto_3
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    goto :goto_4

    .line 70
    :cond_4
    move v1, v2

    .line 71
    :goto_4
    add-int/2addr v0, v1

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->memberListRefreshInterval:I

    .line 75
    .line 76
    add-int/2addr v0, v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    goto :goto_5

    .line 88
    :cond_5
    move v1, v2

    .line 89
    :goto_5
    add-int/2addr v0, v1

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceBottomTabMode:I

    .line 93
    .line 94
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 98
    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    goto :goto_6

    .line 106
    :cond_6
    move v1, v2

    .line 107
    :goto_6
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 111
    .line 112
    if-eqz v1, :cond_7

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    goto :goto_7

    .line 119
    :cond_7
    move v1, v2

    .line 120
    :goto_7
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showAnnouncementEntrance:Z

    .line 124
    .line 125
    if-eqz v1, :cond_8

    .line 126
    .line 127
    move v1, v4

    .line 128
    goto :goto_8

    .line 129
    :cond_8
    move v1, v3

    .line 130
    :goto_8
    add-int/2addr v0, v1

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->bindChatGroupPermission:Z

    .line 134
    .line 135
    if-eqz v1, :cond_9

    .line 136
    .line 137
    move v1, v4

    .line 138
    goto :goto_9

    .line 139
    :cond_9
    move v1, v3

    .line 140
    :goto_9
    add-int/2addr v0, v1

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->updateChatV3:Z

    .line 144
    .line 145
    if-eqz v1, :cond_a

    .line 146
    .line 147
    move v1, v4

    .line 148
    goto :goto_a

    .line 149
    :cond_a
    move v1, v3

    .line 150
    :goto_a
    add-int/2addr v0, v1

    .line 151
    mul-int/lit8 v0, v0, 0x29

    .line 152
    .line 153
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceManagerLimit:I

    .line 154
    .line 155
    add-int/2addr v0, v1

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->undercoverMinPlayerCount:I

    .line 159
    .line 160
    add-int/2addr v0, v1

    .line 161
    mul-int/lit8 v0, v0, 0x29

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 164
    .line 165
    if-eqz v1, :cond_b

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;->hashCode()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    goto :goto_b

    .line 172
    :cond_b
    move v1, v2

    .line 173
    :goto_b
    add-int/2addr v0, v1

    .line 174
    mul-int/lit8 v0, v0, 0x29

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 177
    .line 178
    if-eqz v1, :cond_c

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    goto :goto_c

    .line 185
    :cond_c
    move v1, v2

    .line 186
    :goto_c
    add-int/2addr v0, v1

    .line 187
    mul-int/lit8 v0, v0, 0x29

    .line 188
    .line 189
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest:Z

    .line 190
    .line 191
    if-eqz v1, :cond_d

    .line 192
    .line 193
    move v1, v4

    .line 194
    goto :goto_d

    .line 195
    :cond_d
    move v1, v3

    .line 196
    :goto_d
    add-int/2addr v0, v1

    .line 197
    mul-int/lit8 v0, v0, 0x29

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 200
    .line 201
    if-eqz v1, :cond_e

    .line 202
    .line 203
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;->hashCode()I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    goto :goto_e

    .line 208
    :cond_e
    move v1, v2

    .line 209
    :goto_e
    add-int/2addr v0, v1

    .line 210
    mul-int/lit8 v0, v0, 0x29

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 213
    .line 214
    if-eqz v1, :cond_f

    .line 215
    .line 216
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    goto :goto_f

    .line 221
    :cond_f
    move v1, v2

    .line 222
    :goto_f
    add-int/2addr v0, v1

    .line 223
    mul-int/lit8 v0, v0, 0x29

    .line 224
    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 226
    .line 227
    if-eqz v1, :cond_10

    .line 228
    .line 229
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    goto :goto_10

    .line 234
    :cond_10
    move v1, v2

    .line 235
    :goto_10
    add-int/2addr v0, v1

    .line 236
    mul-int/lit8 v0, v0, 0x29

    .line 237
    .line 238
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveHotChatMatchTest2:Z

    .line 239
    .line 240
    if-eqz v1, :cond_11

    .line 241
    .line 242
    move v1, v4

    .line 243
    goto :goto_11

    .line 244
    :cond_11
    move v1, v3

    .line 245
    :goto_11
    add-int/2addr v0, v1

    .line 246
    mul-int/lit8 v0, v0, 0x29

    .line 247
    .line 248
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 249
    .line 250
    if-eqz v1, :cond_12

    .line 251
    .line 252
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;->hashCode()I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    goto :goto_12

    .line 257
    :cond_12
    move v1, v2

    .line 258
    :goto_12
    add-int/2addr v0, v1

    .line 259
    mul-int/lit8 v0, v0, 0x29

    .line 260
    .line 261
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 262
    .line 263
    if-eqz v1, :cond_13

    .line 264
    .line 265
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->hashCode()I

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    goto :goto_13

    .line 270
    :cond_13
    move v1, v2

    .line 271
    :goto_13
    add-int/2addr v0, v1

    .line 272
    mul-int/lit8 v0, v0, 0x29

    .line 273
    .line 274
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 275
    .line 276
    if-eqz v1, :cond_14

    .line 277
    .line 278
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;->hashCode()I

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    goto :goto_14

    .line 283
    :cond_14
    move v1, v2

    .line 284
    :goto_14
    add-int/2addr v0, v1

    .line 285
    mul-int/lit8 v0, v0, 0x29

    .line 286
    .line 287
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 288
    .line 289
    if-eqz v1, :cond_15

    .line 290
    .line 291
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    goto :goto_15

    .line 296
    :cond_15
    move v1, v2

    .line 297
    :goto_15
    add-int/2addr v0, v1

    .line 298
    mul-int/lit8 v0, v0, 0x29

    .line 299
    .line 300
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryRefreshInterval:I

    .line 301
    .line 302
    add-int/2addr v0, v1

    .line 303
    mul-int/lit8 v0, v0, 0x29

    .line 304
    .line 305
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryExp:Z

    .line 306
    .line 307
    if-eqz v1, :cond_16

    .line 308
    .line 309
    move v1, v4

    .line 310
    goto :goto_16

    .line 311
    :cond_16
    move v1, v3

    .line 312
    :goto_16
    add-int/2addr v0, v1

    .line 313
    mul-int/lit8 v0, v0, 0x29

    .line 314
    .line 315
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 316
    .line 317
    if-eqz v1, :cond_17

    .line 318
    .line 319
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;->hashCode()I

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    goto :goto_17

    .line 324
    :cond_17
    move v1, v2

    .line 325
    :goto_17
    add-int/2addr v0, v1

    .line 326
    mul-int/lit8 v0, v0, 0x29

    .line 327
    .line 328
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 329
    .line 330
    if-eqz v1, :cond_18

    .line 331
    .line 332
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;->hashCode()I

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    goto :goto_18

    .line 337
    :cond_18
    move v1, v2

    .line 338
    :goto_18
    add-int/2addr v0, v1

    .line 339
    mul-int/lit8 v0, v0, 0x29

    .line 340
    .line 341
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->virtualAvatarSwitch:Z

    .line 342
    .line 343
    if-eqz v1, :cond_19

    .line 344
    .line 345
    move v1, v4

    .line 346
    goto :goto_19

    .line 347
    :cond_19
    move v1, v3

    .line 348
    :goto_19
    add-int/2addr v0, v1

    .line 349
    mul-int/lit8 v0, v0, 0x29

    .line 350
    .line 351
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 352
    .line 353
    if-eqz v1, :cond_1a

    .line 354
    .line 355
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;->hashCode()I

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    goto :goto_1a

    .line 360
    :cond_1a
    move v1, v2

    .line 361
    :goto_1a
    add-int/2addr v0, v1

    .line 362
    mul-int/lit8 v0, v0, 0x29

    .line 363
    .line 364
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 365
    .line 366
    if-eqz v1, :cond_1b

    .line 367
    .line 368
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;->hashCode()I

    .line 369
    .line 370
    .line 371
    move-result v1

    .line 372
    goto :goto_1b

    .line 373
    :cond_1b
    move v1, v2

    .line 374
    :goto_1b
    add-int/2addr v0, v1

    .line 375
    mul-int/lit8 v0, v0, 0x29

    .line 376
    .line 377
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 378
    .line 379
    if-eqz v1, :cond_1c

    .line 380
    .line 381
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 382
    .line 383
    .line 384
    move-result v1

    .line 385
    goto :goto_1c

    .line 386
    :cond_1c
    move v1, v2

    .line 387
    :goto_1c
    add-int/2addr v0, v1

    .line 388
    mul-int/lit8 v0, v0, 0x29

    .line 389
    .line 390
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showRoomRegion:Z

    .line 391
    .line 392
    if-eqz v1, :cond_1d

    .line 393
    .line 394
    move v1, v4

    .line 395
    goto :goto_1d

    .line 396
    :cond_1d
    move v1, v3

    .line 397
    :goto_1d
    add-int/2addr v0, v1

    .line 398
    mul-int/lit8 v0, v0, 0x29

    .line 399
    .line 400
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 401
    .line 402
    if-eqz v1, :cond_1e

    .line 403
    .line 404
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;->hashCode()I

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    goto :goto_1e

    .line 409
    :cond_1e
    move v1, v2

    .line 410
    :goto_1e
    add-int/2addr v0, v1

    .line 411
    mul-int/lit8 v0, v0, 0x29

    .line 412
    .line 413
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->fixRoomManagerLimit:I

    .line 414
    .line 415
    add-int/2addr v0, v1

    .line 416
    mul-int/lit8 v0, v0, 0x29

    .line 417
    .line 418
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 419
    .line 420
    if-eqz v1, :cond_1f

    .line 421
    .line 422
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;->hashCode()I

    .line 423
    .line 424
    .line 425
    move-result v1

    .line 426
    goto :goto_1f

    .line 427
    :cond_1f
    move v1, v2

    .line 428
    :goto_1f
    add-int/2addr v0, v1

    .line 429
    mul-int/lit8 v0, v0, 0x29

    .line 430
    .line 431
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenSwitch:Z

    .line 432
    .line 433
    if-eqz v1, :cond_20

    .line 434
    .line 435
    move v1, v4

    .line 436
    goto :goto_20

    .line 437
    :cond_20
    move v1, v3

    .line 438
    :goto_20
    add-int/2addr v0, v1

    .line 439
    mul-int/lit8 v0, v0, 0x29

    .line 440
    .line 441
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareScreenRealNameAuthSwitch:Z

    .line 442
    .line 443
    if-eqz v1, :cond_21

    .line 444
    .line 445
    move v1, v4

    .line 446
    goto :goto_21

    .line 447
    :cond_21
    move v1, v3

    .line 448
    :goto_21
    add-int/2addr v0, v1

    .line 449
    mul-int/lit8 v0, v0, 0x29

    .line 450
    .line 451
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->reflectAudioProcessSwitch:Z

    .line 452
    .line 453
    if-eqz v1, :cond_22

    .line 454
    .line 455
    move v1, v4

    .line 456
    goto :goto_22

    .line 457
    :cond_22
    move v1, v3

    .line 458
    :goto_22
    add-int/2addr v0, v1

    .line 459
    mul-int/lit8 v0, v0, 0x29

    .line 460
    .line 461
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->directLeaveRoomMaxStaySeconds:I

    .line 462
    .line 463
    add-int/2addr v0, v1

    .line 464
    mul-int/lit8 v0, v0, 0x29

    .line 465
    .line 466
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->anchorGrowthEntrySwitch:Z

    .line 467
    .line 468
    if-eqz v1, :cond_23

    .line 469
    .line 470
    move v1, v4

    .line 471
    goto :goto_23

    .line 472
    :cond_23
    move v1, v3

    .line 473
    :goto_23
    add-int/2addr v0, v1

    .line 474
    mul-int/lit8 v0, v0, 0x29

    .line 475
    .line 476
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 477
    .line 478
    if-eqz v1, :cond_24

    .line 479
    .line 480
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 481
    .line 482
    .line 483
    move-result v1

    .line 484
    goto :goto_24

    .line 485
    :cond_24
    move v1, v2

    .line 486
    :goto_24
    add-int/2addr v0, v1

    .line 487
    mul-int/lit8 v0, v0, 0x29

    .line 488
    .line 489
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlEnterRoomOptimize:Z

    .line 490
    .line 491
    if-eqz v1, :cond_25

    .line 492
    .line 493
    move v1, v4

    .line 494
    goto :goto_25

    .line 495
    :cond_25
    move v1, v3

    .line 496
    :goto_25
    add-int/2addr v0, v1

    .line 497
    mul-int/lit8 v0, v0, 0x29

    .line 498
    .line 499
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 500
    .line 501
    if-eqz v1, :cond_26

    .line 502
    .line 503
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->hashCode()I

    .line 504
    .line 505
    .line 506
    move-result v1

    .line 507
    goto :goto_26

    .line 508
    :cond_26
    move v1, v2

    .line 509
    :goto_26
    add-int/2addr v0, v1

    .line 510
    mul-int/lit8 v0, v0, 0x29

    .line 511
    .line 512
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showEntrance:Z

    .line 513
    .line 514
    if-eqz v1, :cond_27

    .line 515
    .line 516
    move v1, v4

    .line 517
    goto :goto_27

    .line 518
    :cond_27
    move v1, v3

    .line 519
    :goto_27
    add-int/2addr v0, v1

    .line 520
    mul-int/lit8 v0, v0, 0x29

    .line 521
    .line 522
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isOverseaChineseMigrated:Z

    .line 523
    .line 524
    if-eqz v1, :cond_28

    .line 525
    .line 526
    move v1, v4

    .line 527
    goto :goto_28

    .line 528
    :cond_28
    move v1, v3

    .line 529
    :goto_28
    add-int/2addr v0, v1

    .line 530
    mul-int/lit8 v0, v0, 0x29

    .line 531
    .line 532
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isHideCreateRoomButton:Z

    .line 533
    .line 534
    if-eqz v1, :cond_29

    .line 535
    .line 536
    move v1, v4

    .line 537
    goto :goto_29

    .line 538
    :cond_29
    move v1, v3

    .line 539
    :goto_29
    add-int/2addr v0, v1

    .line 540
    mul-int/lit8 v0, v0, 0x29

    .line 541
    .line 542
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 543
    .line 544
    if-eqz v1, :cond_2a

    .line 545
    .line 546
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 547
    .line 548
    .line 549
    move-result v2

    .line 550
    :cond_2a
    add-int/2addr v0, v2

    .line 551
    mul-int/lit8 v0, v0, 0x29

    .line 552
    .line 553
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showPledgeAuctionNewTag:Z

    .line 554
    .line 555
    if-eqz v1, :cond_2b

    .line 556
    .line 557
    move v3, v4

    .line 558
    :cond_2b
    add-int/2addr v0, v3

    .line 559
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 560
    .line 561
    :cond_2c
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->startVoiceLive:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 41
    .line 42
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 43
    .line 44
    if-nez v0, :cond_5

    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 52
    .line 53
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 54
    .line 55
    if-nez v0, :cond_6

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 62
    .line 63
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 64
    .line 65
    if-nez v0, :cond_7

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 72
    .line 73
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 74
    .line 75
    if-nez v0, :cond_8

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 82
    .line 83
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 84
    .line 85
    if-nez v0, :cond_9

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 92
    .line 93
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v0, :cond_a

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 98
    .line 99
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 100
    .line 101
    if-nez v0, :cond_b

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentShow:Ljava/lang/String;

    .line 104
    .line 105
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 106
    .line 107
    if-nez v0, :cond_c

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 114
    .line 115
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 116
    .line 117
    if-nez v0, :cond_d

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 124
    .line 125
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 126
    .line 127
    if-nez v0, :cond_e

    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 134
    .line 135
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 136
    .line 137
    if-nez v0, :cond_f

    .line 138
    .line 139
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 140
    .line 141
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 142
    .line 143
    if-nez v0, :cond_10

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 150
    .line 151
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 152
    .line 153
    if-nez v0, :cond_11

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 160
    .line 161
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 162
    .line 163
    if-nez v0, :cond_12

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 170
    .line 171
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 172
    .line 173
    if-nez v0, :cond_13

    .line 174
    .line 175
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 176
    .line 177
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 178
    .line 179
    if-nez v0, :cond_14

    .line 180
    .line 181
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 186
    .line 187
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 188
    .line 189
    if-nez v0, :cond_15

    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceSingGameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogetherConfig;

    .line 196
    .line 197
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 198
    .line 199
    if-nez v0, :cond_16

    .line 200
    .line 201
    new-instance v0, Ljava/util/ArrayList;

    .line 202
    .line 203
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 204
    .line 205
    .line 206
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 207
    .line 208
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 209
    .line 210
    if-nez v0, :cond_17

    .line 211
    .line 212
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 217
    .line 218
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 219
    .line 220
    if-nez v0, :cond_18

    .line 221
    .line 222
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 223
    .line 224
    :cond_18
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
