.class public Lcom/p1/mobile/putong/feed/data/FeedData;
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
            "Lcom/p1/mobile/putong/feed/data/FeedData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/FeedData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "feeddata"


# instance fields
.field public activities:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public board:Lcom/p1/mobile/putong/feed/data/RankingBoards;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public cameraCategories:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;"
        }
    .end annotation
.end field

.field public cameraFilters:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraFilter;",
            ">;"
        }
    .end annotation
.end field

.field public cameraStickers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
            ">;"
        }
    .end annotation
.end field

.field public comments:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public dynamic_moments:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public extra:Lcom/p1/mobile/putong/feed/data/Extra;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public fakeUserStates:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            ">;"
        }
    .end annotation
.end field

.field public feeds:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;"
        }
    .end annotation
.end field

.field public followships:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation
.end field

.field public frames:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Frame;",
            ">;"
        }
    .end annotation
.end field

.field public greetingPermissions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/GreetingPermission;",
            ">;"
        }
    .end annotation
.end field

.field public groups:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            ">;"
        }
    .end annotation
.end field

.field public guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public literatures:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/FeedLiterature;",
            ">;"
        }
    .end annotation
.end field

.field public literaturesComments:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;",
            ">;"
        }
    .end annotation
.end field

.field public liveCircleMomentExtInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;",
            ">;"
        }
    .end annotation
.end field

.field public liveGroupCircleMomentBanners:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x30
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;",
            ">;"
        }
    .end annotation
.end field

.field public liveLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;",
            ">;"
        }
    .end annotation
.end field

.field public liveRecommendCards:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;",
            ">;"
        }
    .end annotation
.end field

.field public liveSchemas:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;",
            ">;"
        }
    .end annotation
.end field

.field public lives:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;"
        }
    .end annotation
.end field

.field public location:Lcom/p1/mobile/putong/feed/data/PoiLocation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x32
    .end annotation
.end field

.field public masks:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LiveUserMask;",
            ">;"
        }
    .end annotation
.end field

.field public meets:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Meet;",
            ">;"
        }
    .end annotation
.end field

.field public messages:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public momentExtras:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentExtra;",
            ">;"
        }
    .end annotation
.end field

.field public momentLevelCounters:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;",
            ">;"
        }
    .end annotation
.end field

.field public momentLevelGuides:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;",
            ">;"
        }
    .end annotation
.end field

.field public momentPopWindows:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;",
            ">;"
        }
    .end annotation
.end field

.field public momentSettings:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;",
            ">;"
        }
    .end annotation
.end field

.field public momentTopics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation
.end field

.field public momentVoiceLiveInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;",
            ">;"
        }
    .end annotation
.end field

.field public moments:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public musicCategories:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MusicCategory;",
            ">;"
        }
    .end annotation
.end field

.field public musics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;"
        }
    .end annotation
.end field

.field public myMeetFeeds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public notifyUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
            ">;"
        }
    .end annotation
.end field

.field public paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public popWindows:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x31
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;",
            ">;"
        }
    .end annotation
.end field

.field public rooms:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Room;",
            ">;"
        }
    .end annotation
.end field

.field public sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation
.end field

.field public states:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
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
        index = 0x33
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field public topicCategories:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;"
        }
    .end annotation
.end field

.field public topicOperations:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveGames:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VoiceLiveGame;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveMomentFeeds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLiveStates:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;",
            ">;"
        }
    .end annotation
.end field

.field public voiceLives:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
            ">;"
        }
    .end annotation
.end field

.field public voiceRooms:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VoiceRoomInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/FeedData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/FeedData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/FeedData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/FeedData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/FeedData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/FeedData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic A(Lcom/p1/mobile/putong/data/VoiceRoomInfo;)Lcom/p1/mobile/putong/data/VoiceRoomInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->clone()Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->clone()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;)Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->clone()Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;)Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->clone()Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/data/TopicMomentIdBox;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    return-object p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Lcom/p1/mobile/putong/feed/data/TopicMoment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->clone()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;)Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->clone()Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->clone()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/feed/data/RawFeed;)Lcom/p1/mobile/putong/feed/data/RawFeed;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/RawFeed;->clone()Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/feed/data/Group;)Lcom/p1/mobile/putong/feed/data/Group;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Group;->clone()Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->clone()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Lcom/p1/mobile/putong/feed/data/TopicOperations;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicOperations;->clone()Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;)Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;->clone()Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;)Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->clone()Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/feed/data/MusicCategory;)Lcom/p1/mobile/putong/feed/data/MusicCategory;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MusicCategory;->clone()Lcom/p1/mobile/putong/feed/data/MusicCategory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/data/BubbleInfo;)Lcom/p1/mobile/putong/data/BubbleInfo;
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

.method public static synthetic V(Lcom/p1/mobile/putong/data/BubbleInfo;)Lcom/p1/mobile/putong/data/BubbleInfo;
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

.method public static synthetic W(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/data/Live;
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

.method public static synthetic X(Lcom/p1/mobile/putong/feed/data/TopicCategorie;)Lcom/p1/mobile/putong/feed/data/TopicCategorie;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->clone()Lcom/p1/mobile/putong/feed/data/TopicCategorie;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->clone()Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/data/Followship;)Lcom/p1/mobile/putong/data/Followship;
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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/data/MomentExtra;)Lcom/p1/mobile/putong/feed/data/MomentExtra;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentExtra;->clone()Lcom/p1/mobile/putong/feed/data/MomentExtra;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;)Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;->clone()Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)Lcom/p1/mobile/putong/feed/data/NotifyUsers;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->clone()Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/Music;)Lcom/p1/mobile/putong/data/Music;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Music;->clone()Lcom/p1/mobile/putong/data/Music;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;)Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->clone()Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private checkTopicMomentCanUse()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-lez p0, :cond_0

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

.method public static synthetic d(Lcom/p1/mobile/putong/feed/data/VoiceLive;)Lcom/p1/mobile/putong/feed/data/VoiceLive;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLive;->clone()Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/feed/data/FeedLiterature;)Lcom/p1/mobile/putong/feed/data/FeedLiterature;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->clone()Lcom/p1/mobile/putong/feed/data/FeedLiterature;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Lcom/p1/mobile/putong/feed/data/MomentActivity;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentActivity;->clone()Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/feed/data/GreetingPermission;)Lcom/p1/mobile/putong/feed/data/GreetingPermission;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/GreetingPermission;->clone()Lcom/p1/mobile/putong/feed/data/GreetingPermission;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/data/CameraCategory;)Lcom/p1/mobile/putong/feed/data/CameraCategory;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/CameraCategory;->clone()Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;)Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;->clone()Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;)Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;->clone()Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/data/CameraFilter;)Lcom/p1/mobile/putong/feed/data/CameraFilter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/CameraFilter;->clone()Lcom/p1/mobile/putong/feed/data/CameraFilter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;)Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->clone()Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/data/Room;)Lcom/p1/mobile/putong/data/Room;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Room;->clone()Lcom/p1/mobile/putong/data/Room;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->clone()Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/FeedData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/FeedData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/FeedData;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/data/Frame;)Lcom/p1/mobile/putong/feed/data/Frame;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Frame;->clone()Lcom/p1/mobile/putong/feed/data/Frame;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->clone()Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private processTopicMoment()V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_4

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-eqz v4, :cond_3

    .line 45
    .line 46
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    check-cast v4, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 51
    .line 52
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 53
    .line 54
    new-instance v6, Ll/czg;

    .line 55
    .line 56
    invoke-direct {v6, v4}, Ll/czg;-><init>(Lcom/p1/mobile/putong/data/TopicMomentIdBox;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v5, v6}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 64
    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/data/Moment;->setTopicList(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catch_0
    :cond_4
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)I
    .locals 2

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 2
    .line 3
    iget-wide p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 4
    .line 5
    sub-double/2addr v0, p0

    .line 6
    double-to-int p0, v0

    .line 7
    return p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/data/LiveUserMask;)Lcom/p1/mobile/putong/data/LiveUserMask;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveUserMask;->clone()Lcom/p1/mobile/putong/data/LiveUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/data/CameraSticker;)Lcom/p1/mobile/putong/feed/data/CameraSticker;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/CameraSticker;->clone()Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/data/VoiceLiveGame;)Lcom/p1/mobile/putong/data/VoiceLiveGame;
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

.method public static synthetic u(Lcom/p1/mobile/putong/data/StickerInfo;)Lcom/p1/mobile/putong/data/StickerInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/StickerInfo;->clone()Lcom/p1/mobile/putong/data/StickerInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;)Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;->clone()Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;)Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->clone()Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/data/Meet;)Lcom/p1/mobile/putong/feed/data/Meet;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Meet;->clone()Lcom/p1/mobile/putong/feed/data/Meet;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;)Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;->clone()Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;

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
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
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

    .line 788
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/FeedData;->clone()Lcom/p1/mobile/putong/feed/data/FeedData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/FeedData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/FeedData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/oxg;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/oxg;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    new-instance v2, Ll/qxg;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/qxg;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    new-instance v2, Ll/cyg;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/cyg;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 50
    .line 51
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    new-instance v2, Ll/oyg;

    .line 56
    .line 57
    invoke-direct {v2}, Ll/oyg;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 65
    .line 66
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    new-instance v2, Ll/wyg;

    .line 71
    .line 72
    invoke-direct {v2}, Ll/wyg;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 80
    .line 81
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    new-instance v2, Ll/xyg;

    .line 86
    .line 87
    invoke-direct {v2}, Ll/xyg;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 95
    .line 96
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 97
    .line 98
    if-eqz v1, :cond_6

    .line 99
    .line 100
    new-instance v2, Ll/yyg;

    .line 101
    .line 102
    invoke-direct {v2}, Ll/yyg;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 110
    .line 111
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v1, :cond_7

    .line 114
    .line 115
    new-instance v2, Ll/zyg;

    .line 116
    .line 117
    invoke-direct {v2}, Ll/zyg;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 125
    .line 126
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    new-instance v2, Ll/azg;

    .line 131
    .line 132
    invoke-direct {v2}, Ll/azg;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 140
    .line 141
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 142
    .line 143
    if-eqz v1, :cond_9

    .line 144
    .line 145
    new-instance v2, Ll/bzg;

    .line 146
    .line 147
    invoke-direct {v2}, Ll/bzg;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 155
    .line 156
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 157
    .line 158
    if-eqz v1, :cond_a

    .line 159
    .line 160
    new-instance v2, Ll/zxg;

    .line 161
    .line 162
    invoke-direct {v2}, Ll/zxg;-><init>()V

    .line 163
    .line 164
    .line 165
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 170
    .line 171
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 172
    .line 173
    if-eqz v1, :cond_b

    .line 174
    .line 175
    new-instance v2, Ll/kyg;

    .line 176
    .line 177
    invoke-direct {v2}, Ll/kyg;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 185
    .line 186
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 187
    .line 188
    if-eqz v1, :cond_c

    .line 189
    .line 190
    new-instance v2, Ll/vyg;

    .line 191
    .line 192
    invoke-direct {v2}, Ll/vyg;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 200
    .line 201
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 202
    .line 203
    if-eqz v1, :cond_d

    .line 204
    .line 205
    new-instance v2, Ll/ezg;

    .line 206
    .line 207
    invoke-direct {v2}, Ll/ezg;-><init>()V

    .line 208
    .line 209
    .line 210
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 215
    .line 216
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 217
    .line 218
    if-eqz v1, :cond_e

    .line 219
    .line 220
    new-instance v2, Ll/fzg;

    .line 221
    .line 222
    invoke-direct {v2}, Ll/fzg;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 230
    .line 231
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 232
    .line 233
    if-eqz v1, :cond_f

    .line 234
    .line 235
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/Extra;->clone()Lcom/p1/mobile/putong/feed/data/Extra;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 240
    .line 241
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 242
    .line 243
    if-eqz v1, :cond_10

    .line 244
    .line 245
    new-instance v2, Ll/gzg;

    .line 246
    .line 247
    invoke-direct {v2}, Ll/gzg;-><init>()V

    .line 248
    .line 249
    .line 250
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 255
    .line 256
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 257
    .line 258
    if-eqz v1, :cond_11

    .line 259
    .line 260
    new-instance v2, Ll/hzg;

    .line 261
    .line 262
    invoke-direct {v2}, Ll/hzg;-><init>()V

    .line 263
    .line 264
    .line 265
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 270
    .line 271
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 272
    .line 273
    if-eqz v1, :cond_12

    .line 274
    .line 275
    new-instance v2, Ll/izg;

    .line 276
    .line 277
    invoke-direct {v2}, Ll/izg;-><init>()V

    .line 278
    .line 279
    .line 280
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 285
    .line 286
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 287
    .line 288
    if-eqz v1, :cond_13

    .line 289
    .line 290
    new-instance v2, Ll/jzg;

    .line 291
    .line 292
    invoke-direct {v2}, Ll/jzg;-><init>()V

    .line 293
    .line 294
    .line 295
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 300
    .line 301
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 302
    .line 303
    if-eqz v1, :cond_14

    .line 304
    .line 305
    new-instance v2, Ll/pxg;

    .line 306
    .line 307
    invoke-direct {v2}, Ll/pxg;-><init>()V

    .line 308
    .line 309
    .line 310
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 315
    .line 316
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 317
    .line 318
    if-eqz v1, :cond_15

    .line 319
    .line 320
    new-instance v2, Ll/rxg;

    .line 321
    .line 322
    invoke-direct {v2}, Ll/rxg;-><init>()V

    .line 323
    .line 324
    .line 325
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 330
    .line 331
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 332
    .line 333
    if-eqz v1, :cond_16

    .line 334
    .line 335
    new-instance v2, Ll/sxg;

    .line 336
    .line 337
    invoke-direct {v2}, Ll/sxg;-><init>()V

    .line 338
    .line 339
    .line 340
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 345
    .line 346
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 347
    .line 348
    if-eqz v1, :cond_17

    .line 349
    .line 350
    new-instance v2, Ll/txg;

    .line 351
    .line 352
    invoke-direct {v2}, Ll/txg;-><init>()V

    .line 353
    .line 354
    .line 355
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 356
    .line 357
    .line 358
    move-result-object v1

    .line 359
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 360
    .line 361
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 362
    .line 363
    if-eqz v1, :cond_18

    .line 364
    .line 365
    new-instance v2, Ll/uxg;

    .line 366
    .line 367
    invoke-direct {v2}, Ll/uxg;-><init>()V

    .line 368
    .line 369
    .line 370
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 371
    .line 372
    .line 373
    move-result-object v1

    .line 374
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 375
    .line 376
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 377
    .line 378
    if-eqz v1, :cond_19

    .line 379
    .line 380
    new-instance v2, Ll/vxg;

    .line 381
    .line 382
    invoke-direct {v2}, Ll/vxg;-><init>()V

    .line 383
    .line 384
    .line 385
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 390
    .line 391
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 392
    .line 393
    if-eqz v1, :cond_1a

    .line 394
    .line 395
    new-instance v2, Ll/wxg;

    .line 396
    .line 397
    invoke-direct {v2}, Ll/wxg;-><init>()V

    .line 398
    .line 399
    .line 400
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 405
    .line 406
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 407
    .line 408
    if-eqz v1, :cond_1b

    .line 409
    .line 410
    new-instance v2, Ll/xxg;

    .line 411
    .line 412
    invoke-direct {v2}, Ll/xxg;-><init>()V

    .line 413
    .line 414
    .line 415
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 420
    .line 421
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 422
    .line 423
    if-eqz v1, :cond_1c

    .line 424
    .line 425
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/DetectInfo;->clone()Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 430
    .line 431
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 432
    .line 433
    if-eqz v1, :cond_1d

    .line 434
    .line 435
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/RankingBoards;->clone()Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 436
    .line 437
    .line 438
    move-result-object v1

    .line 439
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 440
    .line 441
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 442
    .line 443
    if-eqz v1, :cond_1e

    .line 444
    .line 445
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;->clone()Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 446
    .line 447
    .line 448
    move-result-object v1

    .line 449
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 450
    .line 451
    :cond_1e
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 452
    .line 453
    if-eqz v1, :cond_1f

    .line 454
    .line 455
    new-instance v2, Ll/yxg;

    .line 456
    .line 457
    invoke-direct {v2}, Ll/yxg;-><init>()V

    .line 458
    .line 459
    .line 460
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 461
    .line 462
    .line 463
    move-result-object v1

    .line 464
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 465
    .line 466
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 467
    .line 468
    if-eqz v1, :cond_20

    .line 469
    .line 470
    new-instance v2, Ll/ayg;

    .line 471
    .line 472
    invoke-direct {v2}, Ll/ayg;-><init>()V

    .line 473
    .line 474
    .line 475
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 480
    .line 481
    :cond_20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 482
    .line 483
    if-eqz v1, :cond_21

    .line 484
    .line 485
    new-instance v2, Ll/byg;

    .line 486
    .line 487
    invoke-direct {v2}, Ll/byg;-><init>()V

    .line 488
    .line 489
    .line 490
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 495
    .line 496
    :cond_21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 497
    .line 498
    if-eqz v1, :cond_22

    .line 499
    .line 500
    new-instance v2, Ll/dyg;

    .line 501
    .line 502
    invoke-direct {v2}, Ll/dyg;-><init>()V

    .line 503
    .line 504
    .line 505
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 506
    .line 507
    .line 508
    move-result-object v1

    .line 509
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 510
    .line 511
    :cond_22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 512
    .line 513
    if-eqz v1, :cond_23

    .line 514
    .line 515
    new-instance v2, Ll/eyg;

    .line 516
    .line 517
    invoke-direct {v2}, Ll/eyg;-><init>()V

    .line 518
    .line 519
    .line 520
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 521
    .line 522
    .line 523
    move-result-object v1

    .line 524
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 525
    .line 526
    :cond_23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 527
    .line 528
    if-eqz v1, :cond_24

    .line 529
    .line 530
    new-instance v2, Ll/fyg;

    .line 531
    .line 532
    invoke-direct {v2}, Ll/fyg;-><init>()V

    .line 533
    .line 534
    .line 535
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 536
    .line 537
    .line 538
    move-result-object v1

    .line 539
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 540
    .line 541
    :cond_24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 542
    .line 543
    if-eqz v1, :cond_25

    .line 544
    .line 545
    new-instance v2, Ll/gyg;

    .line 546
    .line 547
    invoke-direct {v2}, Ll/gyg;-><init>()V

    .line 548
    .line 549
    .line 550
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 551
    .line 552
    .line 553
    move-result-object v1

    .line 554
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 555
    .line 556
    :cond_25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 557
    .line 558
    if-eqz v1, :cond_26

    .line 559
    .line 560
    new-instance v2, Ll/hyg;

    .line 561
    .line 562
    invoke-direct {v2}, Ll/hyg;-><init>()V

    .line 563
    .line 564
    .line 565
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 566
    .line 567
    .line 568
    move-result-object v1

    .line 569
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 570
    .line 571
    :cond_26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 572
    .line 573
    if-eqz v1, :cond_27

    .line 574
    .line 575
    new-instance v2, Ll/iyg;

    .line 576
    .line 577
    invoke-direct {v2}, Ll/iyg;-><init>()V

    .line 578
    .line 579
    .line 580
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 581
    .line 582
    .line 583
    move-result-object v1

    .line 584
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 585
    .line 586
    :cond_27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 587
    .line 588
    if-eqz v1, :cond_28

    .line 589
    .line 590
    new-instance v2, Ll/jyg;

    .line 591
    .line 592
    invoke-direct {v2}, Ll/jyg;-><init>()V

    .line 593
    .line 594
    .line 595
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 596
    .line 597
    .line 598
    move-result-object v1

    .line 599
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 600
    .line 601
    :cond_28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 602
    .line 603
    if-eqz v1, :cond_29

    .line 604
    .line 605
    new-instance v2, Ll/lyg;

    .line 606
    .line 607
    invoke-direct {v2}, Ll/lyg;-><init>()V

    .line 608
    .line 609
    .line 610
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 615
    .line 616
    :cond_29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 617
    .line 618
    if-eqz v1, :cond_2a

    .line 619
    .line 620
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->clone()Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 621
    .line 622
    .line 623
    move-result-object v1

    .line 624
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 625
    .line 626
    :cond_2a
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 627
    .line 628
    if-eqz v1, :cond_2b

    .line 629
    .line 630
    new-instance v2, Ll/myg;

    .line 631
    .line 632
    invoke-direct {v2}, Ll/myg;-><init>()V

    .line 633
    .line 634
    .line 635
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 636
    .line 637
    .line 638
    move-result-object v1

    .line 639
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 640
    .line 641
    :cond_2b
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 642
    .line 643
    if-eqz v1, :cond_2c

    .line 644
    .line 645
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->clone()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 646
    .line 647
    .line 648
    move-result-object v1

    .line 649
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 650
    .line 651
    :cond_2c
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 652
    .line 653
    if-eqz v1, :cond_2d

    .line 654
    .line 655
    new-instance v2, Ll/nyg;

    .line 656
    .line 657
    invoke-direct {v2}, Ll/nyg;-><init>()V

    .line 658
    .line 659
    .line 660
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 661
    .line 662
    .line 663
    move-result-object v1

    .line 664
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 665
    .line 666
    :cond_2d
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 667
    .line 668
    if-eqz v1, :cond_2e

    .line 669
    .line 670
    new-instance v2, Ll/pyg;

    .line 671
    .line 672
    invoke-direct {v2}, Ll/pyg;-><init>()V

    .line 673
    .line 674
    .line 675
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 676
    .line 677
    .line 678
    move-result-object v1

    .line 679
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 680
    .line 681
    :cond_2e
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 682
    .line 683
    if-eqz v1, :cond_2f

    .line 684
    .line 685
    new-instance v2, Ll/qyg;

    .line 686
    .line 687
    invoke-direct {v2}, Ll/qyg;-><init>()V

    .line 688
    .line 689
    .line 690
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 691
    .line 692
    .line 693
    move-result-object v1

    .line 694
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 695
    .line 696
    :cond_2f
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 697
    .line 698
    if-eqz v1, :cond_30

    .line 699
    .line 700
    new-instance v2, Ll/ryg;

    .line 701
    .line 702
    invoke-direct {v2}, Ll/ryg;-><init>()V

    .line 703
    .line 704
    .line 705
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 706
    .line 707
    .line 708
    move-result-object v1

    .line 709
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 710
    .line 711
    :cond_30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 712
    .line 713
    if-eqz v1, :cond_31

    .line 714
    .line 715
    new-instance v2, Ll/syg;

    .line 716
    .line 717
    invoke-direct {v2}, Ll/syg;-><init>()V

    .line 718
    .line 719
    .line 720
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 721
    .line 722
    .line 723
    move-result-object v1

    .line 724
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 725
    .line 726
    :cond_31
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 727
    .line 728
    if-eqz v1, :cond_32

    .line 729
    .line 730
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/PoiLocation;->clone()Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 731
    .line 732
    .line 733
    move-result-object v1

    .line 734
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 735
    .line 736
    :cond_32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 737
    .line 738
    if-eqz v1, :cond_33

    .line 739
    .line 740
    new-instance v2, Ll/tyg;

    .line 741
    .line 742
    invoke-direct {v2}, Ll/tyg;-><init>()V

    .line 743
    .line 744
    .line 745
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 746
    .line 747
    .line 748
    move-result-object v1

    .line 749
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 750
    .line 751
    :cond_33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 752
    .line 753
    if-eqz v1, :cond_34

    .line 754
    .line 755
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->clone()Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 756
    .line 757
    .line 758
    move-result-object v1

    .line 759
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 760
    .line 761
    :cond_34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 762
    .line 763
    if-eqz v1, :cond_35

    .line 764
    .line 765
    new-instance v2, Ll/uyg;

    .line 766
    .line 767
    invoke-direct {v2}, Ll/uyg;-><init>()V

    .line 768
    .line 769
    .line 770
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 771
    .line 772
    .line 773
    move-result-object v1

    .line 774
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 775
    .line 776
    :cond_35
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 777
    .line 778
    if-eqz p0, :cond_36

    .line 779
    .line 780
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->clone()Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 781
    .line 782
    .line 783
    move-result-object p0

    .line 784
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 785
    .line 786
    :cond_36
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 787
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/FeedData;->clone()Lcom/p1/mobile/putong/feed/data/FeedData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;

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
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 13
    .line 14
    if-eq p0, p1, :cond_2

    .line 15
    .line 16
    return v2

    .line 17
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 18
    .line 19
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 28
    .line 29
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_3

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 38
    .line 39
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_3

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 48
    .line 49
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 58
    .line 59
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 60
    .line 61
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 68
    .line 69
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 78
    .line 79
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 80
    .line 81
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 88
    .line 89
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 98
    .line 99
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 100
    .line 101
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_3

    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 108
    .line 109
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 110
    .line 111
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_3

    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 118
    .line 119
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_3

    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 128
    .line 129
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 130
    .line 131
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_3

    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 138
    .line 139
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 140
    .line 141
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-eqz p1, :cond_3

    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 148
    .line 149
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 150
    .line 151
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-eqz p1, :cond_3

    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 158
    .line 159
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 160
    .line 161
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_3

    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 168
    .line 169
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 170
    .line 171
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-eqz p1, :cond_3

    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 178
    .line 179
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 180
    .line 181
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-eqz p1, :cond_3

    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 188
    .line 189
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 190
    .line 191
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_3

    .line 196
    .line 197
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 198
    .line 199
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 200
    .line 201
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-eqz p1, :cond_3

    .line 206
    .line 207
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 208
    .line 209
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 210
    .line 211
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    if-eqz p1, :cond_3

    .line 216
    .line 217
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 218
    .line 219
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 220
    .line 221
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    if-eqz p1, :cond_3

    .line 226
    .line 227
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 228
    .line 229
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 230
    .line 231
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-eqz p1, :cond_3

    .line 236
    .line 237
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 238
    .line 239
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 240
    .line 241
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-eqz p1, :cond_3

    .line 246
    .line 247
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 248
    .line 249
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 250
    .line 251
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-eqz p1, :cond_3

    .line 256
    .line 257
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 258
    .line 259
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 260
    .line 261
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    if-eqz p1, :cond_3

    .line 266
    .line 267
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 268
    .line 269
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 270
    .line 271
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-eqz p1, :cond_3

    .line 276
    .line 277
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 278
    .line 279
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 280
    .line 281
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    if-eqz p1, :cond_3

    .line 286
    .line 287
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 288
    .line 289
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 290
    .line 291
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    if-eqz p1, :cond_3

    .line 296
    .line 297
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 298
    .line 299
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 300
    .line 301
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result p1

    .line 305
    if-eqz p1, :cond_3

    .line 306
    .line 307
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 308
    .line 309
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 310
    .line 311
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    if-eqz p1, :cond_3

    .line 316
    .line 317
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 318
    .line 319
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 320
    .line 321
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    if-eqz p1, :cond_3

    .line 326
    .line 327
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 328
    .line 329
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 330
    .line 331
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    if-eqz p1, :cond_3

    .line 336
    .line 337
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 338
    .line 339
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 340
    .line 341
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 342
    .line 343
    .line 344
    move-result p1

    .line 345
    if-eqz p1, :cond_3

    .line 346
    .line 347
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 348
    .line 349
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 350
    .line 351
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-eqz p1, :cond_3

    .line 356
    .line 357
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 358
    .line 359
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 360
    .line 361
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    move-result p1

    .line 365
    if-eqz p1, :cond_3

    .line 366
    .line 367
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 368
    .line 369
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 370
    .line 371
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    move-result p1

    .line 375
    if-eqz p1, :cond_3

    .line 376
    .line 377
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 378
    .line 379
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 380
    .line 381
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result p1

    .line 385
    if-eqz p1, :cond_3

    .line 386
    .line 387
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 388
    .line 389
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 390
    .line 391
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    move-result p1

    .line 395
    if-eqz p1, :cond_3

    .line 396
    .line 397
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 398
    .line 399
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 400
    .line 401
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    if-eqz p1, :cond_3

    .line 406
    .line 407
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 408
    .line 409
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 410
    .line 411
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 412
    .line 413
    .line 414
    move-result p1

    .line 415
    if-eqz p1, :cond_3

    .line 416
    .line 417
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 418
    .line 419
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 420
    .line 421
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    move-result p1

    .line 425
    if-eqz p1, :cond_3

    .line 426
    .line 427
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 428
    .line 429
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 430
    .line 431
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result p1

    .line 435
    if-eqz p1, :cond_3

    .line 436
    .line 437
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 438
    .line 439
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 440
    .line 441
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 442
    .line 443
    .line 444
    move-result p1

    .line 445
    if-eqz p1, :cond_3

    .line 446
    .line 447
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 448
    .line 449
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 450
    .line 451
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 452
    .line 453
    .line 454
    move-result p1

    .line 455
    if-eqz p1, :cond_3

    .line 456
    .line 457
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 458
    .line 459
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 460
    .line 461
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 462
    .line 463
    .line 464
    move-result p1

    .line 465
    if-eqz p1, :cond_3

    .line 466
    .line 467
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 468
    .line 469
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 470
    .line 471
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 472
    .line 473
    .line 474
    move-result p1

    .line 475
    if-eqz p1, :cond_3

    .line 476
    .line 477
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 478
    .line 479
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 480
    .line 481
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 482
    .line 483
    .line 484
    move-result p1

    .line 485
    if-eqz p1, :cond_3

    .line 486
    .line 487
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 488
    .line 489
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 490
    .line 491
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result p1

    .line 495
    if-eqz p1, :cond_3

    .line 496
    .line 497
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 498
    .line 499
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 500
    .line 501
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 502
    .line 503
    .line 504
    move-result p1

    .line 505
    if-eqz p1, :cond_3

    .line 506
    .line 507
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 508
    .line 509
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 510
    .line 511
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    move-result p1

    .line 515
    if-eqz p1, :cond_3

    .line 516
    .line 517
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 518
    .line 519
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 520
    .line 521
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 522
    .line 523
    .line 524
    move-result p1

    .line 525
    if-eqz p1, :cond_3

    .line 526
    .line 527
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 528
    .line 529
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 530
    .line 531
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result p1

    .line 535
    if-eqz p1, :cond_3

    .line 536
    .line 537
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 538
    .line 539
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 540
    .line 541
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 542
    .line 543
    .line 544
    move-result p1

    .line 545
    if-eqz p1, :cond_3

    .line 546
    .line 547
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 548
    .line 549
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 550
    .line 551
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 552
    .line 553
    .line 554
    move-result p1

    .line 555
    if-eqz p1, :cond_3

    .line 556
    .line 557
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 558
    .line 559
    iget-object p1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 560
    .line 561
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 562
    .line 563
    .line 564
    move-result p0

    .line 565
    if-eqz p0, :cond_3

    .line 566
    .line 567
    return v0

    .line 568
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "feeddata"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_37

    .line 4
    .line 5
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    move v1, v2

    .line 61
    :goto_3
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    goto :goto_4

    .line 73
    :cond_4
    move v1, v2

    .line 74
    :goto_4
    add-int/2addr v0, v1

    .line 75
    mul-int/lit8 v0, v0, 0x29

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    goto :goto_5

    .line 86
    :cond_5
    move v1, v2

    .line 87
    :goto_5
    add-int/2addr v0, v1

    .line 88
    mul-int/lit8 v0, v0, 0x29

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    goto :goto_6

    .line 99
    :cond_6
    move v1, v2

    .line 100
    :goto_6
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 104
    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    goto :goto_7

    .line 112
    :cond_7
    move v1, v2

    .line 113
    :goto_7
    add-int/2addr v0, v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 117
    .line 118
    if-eqz v1, :cond_8

    .line 119
    .line 120
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    goto :goto_8

    .line 125
    :cond_8
    move v1, v2

    .line 126
    :goto_8
    add-int/2addr v0, v1

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 130
    .line 131
    if-eqz v1, :cond_9

    .line 132
    .line 133
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    goto :goto_9

    .line 138
    :cond_9
    move v1, v2

    .line 139
    :goto_9
    add-int/2addr v0, v1

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 143
    .line 144
    if-eqz v1, :cond_a

    .line 145
    .line 146
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    goto :goto_a

    .line 151
    :cond_a
    move v1, v2

    .line 152
    :goto_a
    add-int/2addr v0, v1

    .line 153
    mul-int/lit8 v0, v0, 0x29

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 156
    .line 157
    if-eqz v1, :cond_b

    .line 158
    .line 159
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    goto :goto_b

    .line 164
    :cond_b
    move v1, v2

    .line 165
    :goto_b
    add-int/2addr v0, v1

    .line 166
    mul-int/lit8 v0, v0, 0x29

    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 169
    .line 170
    if-eqz v1, :cond_c

    .line 171
    .line 172
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    goto :goto_c

    .line 177
    :cond_c
    move v1, v2

    .line 178
    :goto_c
    add-int/2addr v0, v1

    .line 179
    mul-int/lit8 v0, v0, 0x29

    .line 180
    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 182
    .line 183
    if-eqz v1, :cond_d

    .line 184
    .line 185
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    goto :goto_d

    .line 190
    :cond_d
    move v1, v2

    .line 191
    :goto_d
    add-int/2addr v0, v1

    .line 192
    mul-int/lit8 v0, v0, 0x29

    .line 193
    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 195
    .line 196
    if-eqz v1, :cond_e

    .line 197
    .line 198
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    goto :goto_e

    .line 203
    :cond_e
    move v1, v2

    .line 204
    :goto_e
    add-int/2addr v0, v1

    .line 205
    mul-int/lit8 v0, v0, 0x29

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 208
    .line 209
    if-eqz v1, :cond_f

    .line 210
    .line 211
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/Extra;->hashCode()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    goto :goto_f

    .line 216
    :cond_f
    move v1, v2

    .line 217
    :goto_f
    add-int/2addr v0, v1

    .line 218
    mul-int/lit8 v0, v0, 0x29

    .line 219
    .line 220
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 221
    .line 222
    if-eqz v1, :cond_10

    .line 223
    .line 224
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    goto :goto_10

    .line 229
    :cond_10
    move v1, v2

    .line 230
    :goto_10
    add-int/2addr v0, v1

    .line 231
    mul-int/lit8 v0, v0, 0x29

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 234
    .line 235
    if-eqz v1, :cond_11

    .line 236
    .line 237
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    goto :goto_11

    .line 242
    :cond_11
    move v1, v2

    .line 243
    :goto_11
    add-int/2addr v0, v1

    .line 244
    mul-int/lit8 v0, v0, 0x29

    .line 245
    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 247
    .line 248
    if-eqz v1, :cond_12

    .line 249
    .line 250
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    goto :goto_12

    .line 255
    :cond_12
    move v1, v2

    .line 256
    :goto_12
    add-int/2addr v0, v1

    .line 257
    mul-int/lit8 v0, v0, 0x29

    .line 258
    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 260
    .line 261
    if-eqz v1, :cond_13

    .line 262
    .line 263
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    goto :goto_13

    .line 268
    :cond_13
    move v1, v2

    .line 269
    :goto_13
    add-int/2addr v0, v1

    .line 270
    mul-int/lit8 v0, v0, 0x29

    .line 271
    .line 272
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 273
    .line 274
    if-eqz v1, :cond_14

    .line 275
    .line 276
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    goto :goto_14

    .line 281
    :cond_14
    move v1, v2

    .line 282
    :goto_14
    add-int/2addr v0, v1

    .line 283
    mul-int/lit8 v0, v0, 0x29

    .line 284
    .line 285
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 286
    .line 287
    if-eqz v1, :cond_15

    .line 288
    .line 289
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    goto :goto_15

    .line 294
    :cond_15
    move v1, v2

    .line 295
    :goto_15
    add-int/2addr v0, v1

    .line 296
    mul-int/lit8 v0, v0, 0x29

    .line 297
    .line 298
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 299
    .line 300
    if-eqz v1, :cond_16

    .line 301
    .line 302
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    goto :goto_16

    .line 307
    :cond_16
    move v1, v2

    .line 308
    :goto_16
    add-int/2addr v0, v1

    .line 309
    mul-int/lit8 v0, v0, 0x29

    .line 310
    .line 311
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 312
    .line 313
    if-eqz v1, :cond_17

    .line 314
    .line 315
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    goto :goto_17

    .line 320
    :cond_17
    move v1, v2

    .line 321
    :goto_17
    add-int/2addr v0, v1

    .line 322
    mul-int/lit8 v0, v0, 0x29

    .line 323
    .line 324
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 325
    .line 326
    if-eqz v1, :cond_18

    .line 327
    .line 328
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    goto :goto_18

    .line 333
    :cond_18
    move v1, v2

    .line 334
    :goto_18
    add-int/2addr v0, v1

    .line 335
    mul-int/lit8 v0, v0, 0x29

    .line 336
    .line 337
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 338
    .line 339
    if-eqz v1, :cond_19

    .line 340
    .line 341
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    goto :goto_19

    .line 346
    :cond_19
    move v1, v2

    .line 347
    :goto_19
    add-int/2addr v0, v1

    .line 348
    mul-int/lit8 v0, v0, 0x29

    .line 349
    .line 350
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 351
    .line 352
    if-eqz v1, :cond_1a

    .line 353
    .line 354
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 355
    .line 356
    .line 357
    move-result v1

    .line 358
    goto :goto_1a

    .line 359
    :cond_1a
    move v1, v2

    .line 360
    :goto_1a
    add-int/2addr v0, v1

    .line 361
    mul-int/lit8 v0, v0, 0x29

    .line 362
    .line 363
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 364
    .line 365
    if-eqz v1, :cond_1b

    .line 366
    .line 367
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    goto :goto_1b

    .line 372
    :cond_1b
    move v1, v2

    .line 373
    :goto_1b
    add-int/2addr v0, v1

    .line 374
    mul-int/lit8 v0, v0, 0x29

    .line 375
    .line 376
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 377
    .line 378
    if-eqz v1, :cond_1c

    .line 379
    .line 380
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/DetectInfo;->hashCode()I

    .line 381
    .line 382
    .line 383
    move-result v1

    .line 384
    goto :goto_1c

    .line 385
    :cond_1c
    move v1, v2

    .line 386
    :goto_1c
    add-int/2addr v0, v1

    .line 387
    mul-int/lit8 v0, v0, 0x29

    .line 388
    .line 389
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 390
    .line 391
    if-eqz v1, :cond_1d

    .line 392
    .line 393
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/RankingBoards;->hashCode()I

    .line 394
    .line 395
    .line 396
    move-result v1

    .line 397
    goto :goto_1d

    .line 398
    :cond_1d
    move v1, v2

    .line 399
    :goto_1d
    add-int/2addr v0, v1

    .line 400
    mul-int/lit8 v0, v0, 0x29

    .line 401
    .line 402
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 403
    .line 404
    if-eqz v1, :cond_1e

    .line 405
    .line 406
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;->hashCode()I

    .line 407
    .line 408
    .line 409
    move-result v1

    .line 410
    goto :goto_1e

    .line 411
    :cond_1e
    move v1, v2

    .line 412
    :goto_1e
    add-int/2addr v0, v1

    .line 413
    mul-int/lit8 v0, v0, 0x29

    .line 414
    .line 415
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 416
    .line 417
    if-eqz v1, :cond_1f

    .line 418
    .line 419
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    goto :goto_1f

    .line 424
    :cond_1f
    move v1, v2

    .line 425
    :goto_1f
    add-int/2addr v0, v1

    .line 426
    mul-int/lit8 v0, v0, 0x29

    .line 427
    .line 428
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 429
    .line 430
    if-eqz v1, :cond_20

    .line 431
    .line 432
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 433
    .line 434
    .line 435
    move-result v1

    .line 436
    goto :goto_20

    .line 437
    :cond_20
    move v1, v2

    .line 438
    :goto_20
    add-int/2addr v0, v1

    .line 439
    mul-int/lit8 v0, v0, 0x29

    .line 440
    .line 441
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 442
    .line 443
    if-eqz v1, :cond_21

    .line 444
    .line 445
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 446
    .line 447
    .line 448
    move-result v1

    .line 449
    goto :goto_21

    .line 450
    :cond_21
    move v1, v2

    .line 451
    :goto_21
    add-int/2addr v0, v1

    .line 452
    mul-int/lit8 v0, v0, 0x29

    .line 453
    .line 454
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 455
    .line 456
    if-eqz v1, :cond_22

    .line 457
    .line 458
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 459
    .line 460
    .line 461
    move-result v1

    .line 462
    goto :goto_22

    .line 463
    :cond_22
    move v1, v2

    .line 464
    :goto_22
    add-int/2addr v0, v1

    .line 465
    mul-int/lit8 v0, v0, 0x29

    .line 466
    .line 467
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 468
    .line 469
    if-eqz v1, :cond_23

    .line 470
    .line 471
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 472
    .line 473
    .line 474
    move-result v1

    .line 475
    goto :goto_23

    .line 476
    :cond_23
    move v1, v2

    .line 477
    :goto_23
    add-int/2addr v0, v1

    .line 478
    mul-int/lit8 v0, v0, 0x29

    .line 479
    .line 480
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 481
    .line 482
    if-eqz v1, :cond_24

    .line 483
    .line 484
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 485
    .line 486
    .line 487
    move-result v1

    .line 488
    goto :goto_24

    .line 489
    :cond_24
    move v1, v2

    .line 490
    :goto_24
    add-int/2addr v0, v1

    .line 491
    mul-int/lit8 v0, v0, 0x29

    .line 492
    .line 493
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 494
    .line 495
    if-eqz v1, :cond_25

    .line 496
    .line 497
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 498
    .line 499
    .line 500
    move-result v1

    .line 501
    goto :goto_25

    .line 502
    :cond_25
    move v1, v2

    .line 503
    :goto_25
    add-int/2addr v0, v1

    .line 504
    mul-int/lit8 v0, v0, 0x29

    .line 505
    .line 506
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 507
    .line 508
    if-eqz v1, :cond_26

    .line 509
    .line 510
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 511
    .line 512
    .line 513
    move-result v1

    .line 514
    goto :goto_26

    .line 515
    :cond_26
    move v1, v2

    .line 516
    :goto_26
    add-int/2addr v0, v1

    .line 517
    mul-int/lit8 v0, v0, 0x29

    .line 518
    .line 519
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 520
    .line 521
    if-eqz v1, :cond_27

    .line 522
    .line 523
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 524
    .line 525
    .line 526
    move-result v1

    .line 527
    goto :goto_27

    .line 528
    :cond_27
    move v1, v2

    .line 529
    :goto_27
    add-int/2addr v0, v1

    .line 530
    mul-int/lit8 v0, v0, 0x29

    .line 531
    .line 532
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 533
    .line 534
    if-eqz v1, :cond_28

    .line 535
    .line 536
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 537
    .line 538
    .line 539
    move-result v1

    .line 540
    goto :goto_28

    .line 541
    :cond_28
    move v1, v2

    .line 542
    :goto_28
    add-int/2addr v0, v1

    .line 543
    mul-int/lit8 v0, v0, 0x29

    .line 544
    .line 545
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 546
    .line 547
    if-eqz v1, :cond_29

    .line 548
    .line 549
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 550
    .line 551
    .line 552
    move-result v1

    .line 553
    goto :goto_29

    .line 554
    :cond_29
    move v1, v2

    .line 555
    :goto_29
    add-int/2addr v0, v1

    .line 556
    mul-int/lit8 v0, v0, 0x29

    .line 557
    .line 558
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 559
    .line 560
    if-eqz v1, :cond_2a

    .line 561
    .line 562
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->hashCode()I

    .line 563
    .line 564
    .line 565
    move-result v1

    .line 566
    goto :goto_2a

    .line 567
    :cond_2a
    move v1, v2

    .line 568
    :goto_2a
    add-int/2addr v0, v1

    .line 569
    mul-int/lit8 v0, v0, 0x29

    .line 570
    .line 571
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 572
    .line 573
    if-eqz v1, :cond_2b

    .line 574
    .line 575
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 576
    .line 577
    .line 578
    move-result v1

    .line 579
    goto :goto_2b

    .line 580
    :cond_2b
    move v1, v2

    .line 581
    :goto_2b
    add-int/2addr v0, v1

    .line 582
    mul-int/lit8 v0, v0, 0x29

    .line 583
    .line 584
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 585
    .line 586
    if-eqz v1, :cond_2c

    .line 587
    .line 588
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->hashCode()I

    .line 589
    .line 590
    .line 591
    move-result v1

    .line 592
    goto :goto_2c

    .line 593
    :cond_2c
    move v1, v2

    .line 594
    :goto_2c
    add-int/2addr v0, v1

    .line 595
    mul-int/lit8 v0, v0, 0x29

    .line 596
    .line 597
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 598
    .line 599
    if-eqz v1, :cond_2d

    .line 600
    .line 601
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 602
    .line 603
    .line 604
    move-result v1

    .line 605
    goto :goto_2d

    .line 606
    :cond_2d
    move v1, v2

    .line 607
    :goto_2d
    add-int/2addr v0, v1

    .line 608
    mul-int/lit8 v0, v0, 0x29

    .line 609
    .line 610
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 611
    .line 612
    if-eqz v1, :cond_2e

    .line 613
    .line 614
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 615
    .line 616
    .line 617
    move-result v1

    .line 618
    goto :goto_2e

    .line 619
    :cond_2e
    move v1, v2

    .line 620
    :goto_2e
    add-int/2addr v0, v1

    .line 621
    mul-int/lit8 v0, v0, 0x29

    .line 622
    .line 623
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 624
    .line 625
    if-eqz v1, :cond_2f

    .line 626
    .line 627
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 628
    .line 629
    .line 630
    move-result v1

    .line 631
    goto :goto_2f

    .line 632
    :cond_2f
    move v1, v2

    .line 633
    :goto_2f
    add-int/2addr v0, v1

    .line 634
    mul-int/lit8 v0, v0, 0x29

    .line 635
    .line 636
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 637
    .line 638
    if-eqz v1, :cond_30

    .line 639
    .line 640
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 641
    .line 642
    .line 643
    move-result v1

    .line 644
    goto :goto_30

    .line 645
    :cond_30
    move v1, v2

    .line 646
    :goto_30
    add-int/2addr v0, v1

    .line 647
    mul-int/lit8 v0, v0, 0x29

    .line 648
    .line 649
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 650
    .line 651
    if-eqz v1, :cond_31

    .line 652
    .line 653
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 654
    .line 655
    .line 656
    move-result v1

    .line 657
    goto :goto_31

    .line 658
    :cond_31
    move v1, v2

    .line 659
    :goto_31
    add-int/2addr v0, v1

    .line 660
    mul-int/lit8 v0, v0, 0x29

    .line 661
    .line 662
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 663
    .line 664
    if-eqz v1, :cond_32

    .line 665
    .line 666
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/PoiLocation;->hashCode()I

    .line 667
    .line 668
    .line 669
    move-result v1

    .line 670
    goto :goto_32

    .line 671
    :cond_32
    move v1, v2

    .line 672
    :goto_32
    add-int/2addr v0, v1

    .line 673
    mul-int/lit8 v0, v0, 0x29

    .line 674
    .line 675
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 676
    .line 677
    if-eqz v1, :cond_33

    .line 678
    .line 679
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 680
    .line 681
    .line 682
    move-result v1

    .line 683
    goto :goto_33

    .line 684
    :cond_33
    move v1, v2

    .line 685
    :goto_33
    add-int/2addr v0, v1

    .line 686
    mul-int/lit8 v0, v0, 0x29

    .line 687
    .line 688
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 689
    .line 690
    if-eqz v1, :cond_34

    .line 691
    .line 692
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->hashCode()I

    .line 693
    .line 694
    .line 695
    move-result v1

    .line 696
    goto :goto_34

    .line 697
    :cond_34
    move v1, v2

    .line 698
    :goto_34
    add-int/2addr v0, v1

    .line 699
    mul-int/lit8 v0, v0, 0x29

    .line 700
    .line 701
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 702
    .line 703
    if-eqz v1, :cond_35

    .line 704
    .line 705
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 706
    .line 707
    .line 708
    move-result v1

    .line 709
    goto :goto_35

    .line 710
    :cond_35
    move v1, v2

    .line 711
    :goto_35
    add-int/2addr v0, v1

    .line 712
    mul-int/lit8 v0, v0, 0x29

    .line 713
    .line 714
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 715
    .line 716
    if-eqz v1, :cond_36

    .line 717
    .line 718
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->hashCode()I

    .line 719
    .line 720
    .line 721
    move-result v2

    .line 722
    :cond_36
    add-int/2addr v0, v2

    .line 723
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 724
    .line 725
    :cond_37
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 47
    .line 48
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 58
    .line 59
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 69
    .line 70
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 80
    .line 81
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 91
    .line 92
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 102
    .line 103
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 113
    .line 114
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 115
    .line 116
    if-nez v0, :cond_a

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Extra;->new_()Lcom/p1/mobile/putong/feed/data/Extra;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 123
    .line 124
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 125
    .line 126
    if-nez v0, :cond_b

    .line 127
    .line 128
    new-instance v0, Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 134
    .line 135
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 136
    .line 137
    if-nez v0, :cond_c

    .line 138
    .line 139
    new-instance v0, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 145
    .line 146
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 156
    .line 157
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 167
    .line 168
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 178
    .line 179
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 180
    .line 181
    if-nez v0, :cond_10

    .line 182
    .line 183
    new-instance v0, Ljava/util/ArrayList;

    .line 184
    .line 185
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 186
    .line 187
    .line 188
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 189
    .line 190
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 191
    .line 192
    if-nez v0, :cond_11

    .line 193
    .line 194
    new-instance v0, Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .line 198
    .line 199
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 200
    .line 201
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 202
    .line 203
    if-nez v0, :cond_12

    .line 204
    .line 205
    new-instance v0, Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 208
    .line 209
    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 211
    .line 212
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 213
    .line 214
    if-nez v0, :cond_13

    .line 215
    .line 216
    new-instance v0, Ljava/util/ArrayList;

    .line 217
    .line 218
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 219
    .line 220
    .line 221
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 222
    .line 223
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 224
    .line 225
    if-nez v0, :cond_14

    .line 226
    .line 227
    new-instance v0, Ljava/util/ArrayList;

    .line 228
    .line 229
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 230
    .line 231
    .line 232
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 233
    .line 234
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 235
    .line 236
    if-nez v0, :cond_15

    .line 237
    .line 238
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/DetectInfo;->new_()Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 243
    .line 244
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 254
    .line 255
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 265
    .line 266
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 276
    .line 277
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 278
    .line 279
    if-nez v0, :cond_19

    .line 280
    .line 281
    new-instance v0, Ljava/util/ArrayList;

    .line 282
    .line 283
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 284
    .line 285
    .line 286
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 287
    .line 288
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 289
    .line 290
    if-nez v0, :cond_1a

    .line 291
    .line 292
    new-instance v0, Ljava/util/ArrayList;

    .line 293
    .line 294
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 295
    .line 296
    .line 297
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 298
    .line 299
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 300
    .line 301
    if-nez v0, :cond_1b

    .line 302
    .line 303
    new-instance v0, Ljava/util/ArrayList;

    .line 304
    .line 305
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 306
    .line 307
    .line 308
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 309
    .line 310
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 311
    .line 312
    if-nez v0, :cond_1c

    .line 313
    .line 314
    new-instance v0, Ljava/util/ArrayList;

    .line 315
    .line 316
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 317
    .line 318
    .line 319
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 320
    .line 321
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 322
    .line 323
    if-nez v0, :cond_1d

    .line 324
    .line 325
    new-instance v0, Ljava/util/ArrayList;

    .line 326
    .line 327
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 328
    .line 329
    .line 330
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 331
    .line 332
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 333
    .line 334
    if-nez v0, :cond_1e

    .line 335
    .line 336
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->new_()Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 341
    .line 342
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 343
    .line 344
    if-nez v0, :cond_1f

    .line 345
    .line 346
    new-instance v0, Ljava/util/ArrayList;

    .line 347
    .line 348
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 349
    .line 350
    .line 351
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 352
    .line 353
    :cond_1f
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 354
    .line 355
    if-nez v0, :cond_20

    .line 356
    .line 357
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 362
    .line 363
    :cond_20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 364
    .line 365
    if-nez v0, :cond_21

    .line 366
    .line 367
    new-instance v0, Ljava/util/ArrayList;

    .line 368
    .line 369
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 370
    .line 371
    .line 372
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 373
    .line 374
    :cond_21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 375
    .line 376
    if-nez v0, :cond_22

    .line 377
    .line 378
    new-instance v0, Ljava/util/ArrayList;

    .line 379
    .line 380
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 381
    .line 382
    .line 383
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 384
    .line 385
    :cond_22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 386
    .line 387
    if-nez v0, :cond_23

    .line 388
    .line 389
    new-instance v0, Ljava/util/ArrayList;

    .line 390
    .line 391
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 392
    .line 393
    .line 394
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 395
    .line 396
    :cond_23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 397
    .line 398
    if-nez v0, :cond_24

    .line 399
    .line 400
    new-instance v0, Ljava/util/ArrayList;

    .line 401
    .line 402
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 403
    .line 404
    .line 405
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 406
    .line 407
    :cond_24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 408
    .line 409
    if-nez v0, :cond_25

    .line 410
    .line 411
    new-instance v0, Ljava/util/ArrayList;

    .line 412
    .line 413
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 414
    .line 415
    .line 416
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 417
    .line 418
    :cond_25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 419
    .line 420
    if-nez v0, :cond_26

    .line 421
    .line 422
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PoiLocation;->new_()Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 427
    .line 428
    :cond_26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 429
    .line 430
    if-nez v0, :cond_27

    .line 431
    .line 432
    new-instance v0, Ljava/util/ArrayList;

    .line 433
    .line 434
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 435
    .line 436
    .line 437
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 438
    .line 439
    :cond_27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 440
    .line 441
    if-nez v0, :cond_28

    .line 442
    .line 443
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->new_()Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 448
    .line 449
    :cond_28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 450
    .line 451
    if-nez v0, :cond_29

    .line 452
    .line 453
    new-instance v0, Ljava/util/ArrayList;

    .line 454
    .line 455
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 456
    .line 457
    .line 458
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 459
    .line 460
    :cond_29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 461
    .line 462
    if-nez v0, :cond_2a

    .line 463
    .line 464
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->new_()Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 469
    .line 470
    :cond_2a
    return-void
.end method

.method public onApiParseComplete()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->onApiParseComplete()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 20
    .line 21
    new-instance v0, Ll/dzg;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/dzg;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, v0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
