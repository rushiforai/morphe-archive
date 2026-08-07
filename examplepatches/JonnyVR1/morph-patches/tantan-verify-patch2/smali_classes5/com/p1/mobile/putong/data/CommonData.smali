.class public Lcom/p1/mobile/putong/data/CommonData;
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
            "Lcom/p1/mobile/putong/data/CommonData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/CommonData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "commondata"


# instance fields
.field public adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public adReward:Lcom/p1/mobile/putong/data/AdRewardResult;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public avatarFrameConfiguration:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/AvatarFrameConfig;",
            ">;"
        }
    .end annotation
.end field

.field public captcha:Lcom/p1/mobile/putong/data/SliderData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public connector:Lcom/p1/mobile/putong/data/Connector;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public detect:Lcom/p1/mobile/putong/data/Detect;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public devices:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Device;",
            ">;"
        }
    .end annotation
.end field

.field public email:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public links:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Link;",
            ">;"
        }
    .end annotation
.end field

.field public liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public media:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public mobile:Lcom/p1/mobile/putong/data/Mobile;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public newGuide:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public pictureTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/UserPictureTags;",
            ">;"
        }
    .end annotation
.end field

.field public popUps:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public raySequences:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/ReflectResponse;",
            ">;"
        }
    .end annotation
.end field

.field public recommendMessage:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;"
        }
    .end annotation
.end field

.field public showDialog:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public showEntrance:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public stage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public token:Lcom/p1/mobile/putong/data/Token;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
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

.field public verificationTokens:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VerificationToken;",
            ">;"
        }
    .end annotation
.end field

.field public visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public visitorStatistics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/VisitorStatistics;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CommonData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CommonData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/CommonData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/CommonData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CommonData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/CommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/RecommendMessage;)Lcom/p1/mobile/putong/data/RecommendMessage;
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

.method public static synthetic c(Lcom/p1/mobile/putong/data/Device;)Lcom/p1/mobile/putong/data/Device;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->clone()Lcom/p1/mobile/putong/data/Device;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/UserPictureTags;)Lcom/p1/mobile/putong/data/UserPictureTags;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserPictureTags;->clone()Lcom/p1/mobile/putong/data/UserPictureTags;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Link;)Lcom/p1/mobile/putong/data/Link;
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

.method public static synthetic f(Lcom/p1/mobile/putong/data/VerificationToken;)Lcom/p1/mobile/putong/data/VerificationToken;
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

.method public static synthetic k(Lcom/p1/mobile/putong/data/AvatarFrameConfig;)Lcom/p1/mobile/putong/data/AvatarFrameConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/AvatarFrameConfig;->clone()Lcom/p1/mobile/putong/data/AvatarFrameConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
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

.method public static synthetic m(Lcom/p1/mobile/putong/data/VisitorStatistics;)Lcom/p1/mobile/putong/data/VisitorStatistics;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VisitorStatistics;->clone()Lcom/p1/mobile/putong/data/VisitorStatistics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/data/ReflectResponse;)Lcom/p1/mobile/putong/data/ReflectResponse;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ReflectResponse;->clone()Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/CommonData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CommonData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CommonData;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public addAll(Lcom/tantanapp/common/data/BaseData;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/BaseData;->addAll(Lcom/tantanapp/common/data/BaseData;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 33
    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 316
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CommonData;->clone()Lcom/p1/mobile/putong/data/CommonData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/CommonData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CommonData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/kj5;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/kj5;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    new-instance v2, Ll/lj5;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/lj5;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    new-instance v2, Ll/mj5;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/mj5;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 50
    .line 51
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Connector;->clone()Lcom/p1/mobile/putong/data/Connector;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 60
    .line 61
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    new-instance v2, Ll/nj5;

    .line 66
    .line 67
    invoke-direct {v2}, Ll/nj5;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    new-instance v2, Ll/oj5;

    .line 81
    .line 82
    invoke-direct {v2}, Ll/oj5;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 90
    .line 91
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Detect;->clone()Lcom/p1/mobile/putong/data/Detect;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 100
    .line 101
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 102
    .line 103
    if-eqz v1, :cond_7

    .line 104
    .line 105
    new-instance v2, Ll/pj5;

    .line 106
    .line 107
    invoke-direct {v2}, Ll/pj5;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 115
    .line 116
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 117
    .line 118
    if-eqz v1, :cond_8

    .line 119
    .line 120
    new-instance v2, Ll/qj5;

    .line 121
    .line 122
    invoke-direct {v2}, Ll/qj5;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 130
    .line 131
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 132
    .line 133
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 136
    .line 137
    if-eqz v1, :cond_9

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SliderData;->clone()Lcom/p1/mobile/putong/data/SliderData;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 144
    .line 145
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 146
    .line 147
    if-eqz v1, :cond_a

    .line 148
    .line 149
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VisitorInfo;->clone()Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 154
    .line 155
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 156
    .line 157
    if-eqz v1, :cond_b

    .line 158
    .line 159
    new-instance v2, Ll/rj5;

    .line 160
    .line 161
    invoke-direct {v2}, Ll/rj5;-><init>()V

    .line 162
    .line 163
    .line 164
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 169
    .line 170
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 171
    .line 172
    if-eqz v1, :cond_c

    .line 173
    .line 174
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VisitorCounter;->clone()Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 179
    .line 180
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 181
    .line 182
    if-eqz v1, :cond_d

    .line 183
    .line 184
    new-instance v2, Ll/sj5;

    .line 185
    .line 186
    invoke-direct {v2}, Ll/sj5;-><init>()V

    .line 187
    .line 188
    .line 189
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 194
    .line 195
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 196
    .line 197
    if-eqz v1, :cond_e

    .line 198
    .line 199
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveRightCDN;->clone()Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 204
    .line 205
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 206
    .line 207
    if-eqz v1, :cond_f

    .line 208
    .line 209
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AdConfiguration;->clone()Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 214
    .line 215
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 216
    .line 217
    if-eqz v1, :cond_10

    .line 218
    .line 219
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AdRewardResult;->clone()Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 224
    .line 225
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 226
    .line 227
    if-eqz v1, :cond_11

    .line 228
    .line 229
    new-instance v2, Ll/tj5;

    .line 230
    .line 231
    invoke-direct {v2}, Ll/tj5;-><init>()V

    .line 232
    .line 233
    .line 234
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 239
    .line 240
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 241
    .line 242
    if-eqz v1, :cond_12

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserActivityInfo;->clone()Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 249
    .line 250
    :cond_12
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 251
    .line 252
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 253
    .line 254
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 255
    .line 256
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 257
    .line 258
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 259
    .line 260
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 261
    .line 262
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 263
    .line 264
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 265
    .line 266
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 267
    .line 268
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 269
    .line 270
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 271
    .line 272
    if-eqz v1, :cond_13

    .line 273
    .line 274
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Mobile;->clone()Lcom/p1/mobile/putong/data/Mobile;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 279
    .line 280
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 281
    .line 282
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 283
    .line 284
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 285
    .line 286
    if-eqz v1, :cond_14

    .line 287
    .line 288
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ThirdParty;->clone()Lcom/p1/mobile/putong/data/ThirdParty;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 293
    .line 294
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 295
    .line 296
    if-eqz v1, :cond_15

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Token;->clone()Lcom/p1/mobile/putong/data/Token;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 303
    .line 304
    :cond_15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 305
    .line 306
    if-eqz p0, :cond_16

    .line 307
    .line 308
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->clone()Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 309
    .line 310
    .line 311
    move-result-object p0

    .line 312
    iput-object p0, v0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 313
    .line 314
    :cond_16
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 315
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CommonData;->clone()Lcom/p1/mobile/putong/data/CommonData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/CommonData;

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
    check-cast v1, Lcom/p1/mobile/putong/data/CommonData;

    .line 13
    .line 14
    if-eq p0, p1, :cond_2

    .line 15
    .line 16
    return v2

    .line 17
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 18
    .line 19
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 28
    .line 29
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 38
    .line 39
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 48
    .line 49
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 58
    .line 59
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 68
    .line 69
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 78
    .line 79
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 88
    .line 89
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 98
    .line 99
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 118
    .line 119
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 128
    .line 129
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 138
    .line 139
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 148
    .line 149
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 158
    .line 159
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 168
    .line 169
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 178
    .line 179
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 188
    .line 189
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 198
    .line 199
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 208
    .line 209
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 218
    .line 219
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 220
    .line 221
    if-ne p1, v3, :cond_3

    .line 222
    .line 223
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 224
    .line 225
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 226
    .line 227
    if-ne p1, v3, :cond_3

    .line 228
    .line 229
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 230
    .line 231
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 232
    .line 233
    if-ne p1, v3, :cond_3

    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 236
    .line 237
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 238
    .line 239
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-eqz p1, :cond_3

    .line 244
    .line 245
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 246
    .line 247
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 248
    .line 249
    if-ne p1, v3, :cond_3

    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 252
    .line 253
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 254
    .line 255
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_3

    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 262
    .line 263
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 264
    .line 265
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    if-eqz p1, :cond_3

    .line 270
    .line 271
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 272
    .line 273
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 274
    .line 275
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    if-eqz p1, :cond_3

    .line 280
    .line 281
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 282
    .line 283
    iget-object v3, v1, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 284
    .line 285
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result p1

    .line 289
    if-eqz p1, :cond_3

    .line 290
    .line 291
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 292
    .line 293
    iget-object p1, v1, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 294
    .line 295
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result p0

    .line 299
    if-eqz p0, :cond_3

    .line 300
    .line 301
    return v0

    .line 302
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "commondata"

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
    if-nez v0, :cond_1e

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Connector;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Detect;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 130
    .line 131
    if-eqz v1, :cond_9

    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 143
    .line 144
    if-eqz v1, :cond_a

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SliderData;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 156
    .line 157
    if-eqz v1, :cond_b

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VisitorInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 182
    .line 183
    if-eqz v1, :cond_d

    .line 184
    .line 185
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VisitorCounter;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 208
    .line 209
    if-eqz v1, :cond_f

    .line 210
    .line 211
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveRightCDN;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 221
    .line 222
    if-eqz v1, :cond_10

    .line 223
    .line 224
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AdConfiguration;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 234
    .line 235
    if-eqz v1, :cond_11

    .line 236
    .line 237
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AdRewardResult;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 260
    .line 261
    if-eqz v1, :cond_13

    .line 262
    .line 263
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserActivityInfo;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 273
    .line 274
    const/16 v3, 0x4d5

    .line 275
    .line 276
    const/16 v4, 0x4cf

    .line 277
    .line 278
    if-eqz v1, :cond_14

    .line 279
    .line 280
    move v1, v4

    .line 281
    goto :goto_14

    .line 282
    :cond_14
    move v1, v3

    .line 283
    :goto_14
    add-int/2addr v0, v1

    .line 284
    mul-int/lit8 v0, v0, 0x29

    .line 285
    .line 286
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 287
    .line 288
    if-eqz v1, :cond_15

    .line 289
    .line 290
    move v1, v4

    .line 291
    goto :goto_15

    .line 292
    :cond_15
    move v1, v3

    .line 293
    :goto_15
    add-int/2addr v0, v1

    .line 294
    mul-int/lit8 v0, v0, 0x29

    .line 295
    .line 296
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 297
    .line 298
    if-eqz v1, :cond_16

    .line 299
    .line 300
    move v1, v4

    .line 301
    goto :goto_16

    .line 302
    :cond_16
    move v1, v3

    .line 303
    :goto_16
    add-int/2addr v0, v1

    .line 304
    mul-int/lit8 v0, v0, 0x29

    .line 305
    .line 306
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 307
    .line 308
    if-eqz v1, :cond_17

    .line 309
    .line 310
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    goto :goto_17

    .line 315
    :cond_17
    move v1, v2

    .line 316
    :goto_17
    add-int/2addr v0, v1

    .line 317
    mul-int/lit8 v0, v0, 0x29

    .line 318
    .line 319
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 320
    .line 321
    if-eqz v1, :cond_18

    .line 322
    .line 323
    move v3, v4

    .line 324
    :cond_18
    add-int/2addr v0, v3

    .line 325
    mul-int/lit8 v0, v0, 0x29

    .line 326
    .line 327
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 328
    .line 329
    if-eqz v1, :cond_19

    .line 330
    .line 331
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Mobile;->hashCode()I

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    goto :goto_18

    .line 336
    :cond_19
    move v1, v2

    .line 337
    :goto_18
    add-int/2addr v0, v1

    .line 338
    mul-int/lit8 v0, v0, 0x29

    .line 339
    .line 340
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 341
    .line 342
    if-eqz v1, :cond_1a

    .line 343
    .line 344
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 345
    .line 346
    .line 347
    move-result v1

    .line 348
    goto :goto_19

    .line 349
    :cond_1a
    move v1, v2

    .line 350
    :goto_19
    add-int/2addr v0, v1

    .line 351
    mul-int/lit8 v0, v0, 0x29

    .line 352
    .line 353
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 354
    .line 355
    if-eqz v1, :cond_1b

    .line 356
    .line 357
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ThirdParty;->hashCode()I

    .line 358
    .line 359
    .line 360
    move-result v1

    .line 361
    goto :goto_1a

    .line 362
    :cond_1b
    move v1, v2

    .line 363
    :goto_1a
    add-int/2addr v0, v1

    .line 364
    mul-int/lit8 v0, v0, 0x29

    .line 365
    .line 366
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 367
    .line 368
    if-eqz v1, :cond_1c

    .line 369
    .line 370
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Token;->hashCode()I

    .line 371
    .line 372
    .line 373
    move-result v1

    .line 374
    goto :goto_1b

    .line 375
    :cond_1c
    move v1, v2

    .line 376
    :goto_1b
    add-int/2addr v0, v1

    .line 377
    mul-int/lit8 v0, v0, 0x29

    .line 378
    .line 379
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 380
    .line 381
    if-eqz v1, :cond_1d

    .line 382
    .line 383
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->hashCode()I

    .line 384
    .line 385
    .line 386
    move-result v2

    .line 387
    :cond_1d
    add-int/2addr v0, v2

    .line 388
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 389
    .line 390
    :cond_1e
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/data/Detect;->new_()Lcom/p1/mobile/putong/data/Detect;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 46
    .line 47
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 48
    .line 49
    if-nez v0, :cond_4

    .line 50
    .line 51
    new-instance v0, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 57
    .line 58
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 59
    .line 60
    if-nez v0, :cond_5

    .line 61
    .line 62
    new-instance v0, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 68
    .line 69
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 70
    .line 71
    const-string v1, ""

    .line 72
    .line 73
    if-nez v0, :cond_6

    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 76
    .line 77
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 78
    .line 79
    if-nez v0, :cond_7

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/data/SliderData;->new_()Lcom/p1/mobile/putong/data/SliderData;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 86
    .line 87
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 88
    .line 89
    if-nez v0, :cond_8

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/data/VisitorInfo;->new_()Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 96
    .line 97
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 98
    .line 99
    if-nez v0, :cond_9

    .line 100
    .line 101
    new-instance v0, Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 107
    .line 108
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 109
    .line 110
    if-nez v0, :cond_a

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/data/VisitorCounter;->new_()Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 117
    .line 118
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 119
    .line 120
    if-nez v0, :cond_b

    .line 121
    .line 122
    new-instance v0, Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .line 126
    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 128
    .line 129
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 130
    .line 131
    if-nez v0, :cond_c

    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveRightCDN;->new_()Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 138
    .line 139
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 140
    .line 141
    if-nez v0, :cond_d

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/data/AdConfiguration;->new_()Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 148
    .line 149
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 150
    .line 151
    if-nez v0, :cond_e

    .line 152
    .line 153
    invoke-static {}, Lcom/p1/mobile/putong/data/AdRewardResult;->new_()Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 158
    .line 159
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 160
    .line 161
    if-nez v0, :cond_f

    .line 162
    .line 163
    new-instance v0, Ljava/util/ArrayList;

    .line 164
    .line 165
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 166
    .line 167
    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 169
    .line 170
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 171
    .line 172
    if-nez v0, :cond_10

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 175
    .line 176
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 177
    .line 178
    if-nez v0, :cond_11

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/data/Mobile;->new_()Lcom/p1/mobile/putong/data/Mobile;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 185
    .line 186
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 187
    .line 188
    if-nez v0, :cond_12

    .line 189
    .line 190
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 191
    .line 192
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 193
    .line 194
    if-nez v0, :cond_13

    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/data/ThirdParty;->new_()Lcom/p1/mobile/putong/data/ThirdParty;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 201
    .line 202
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 203
    .line 204
    if-nez v0, :cond_14

    .line 205
    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/data/Token;->new_()Lcom/p1/mobile/putong/data/Token;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 211
    .line 212
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 213
    .line 214
    if-nez v0, :cond_15

    .line 215
    .line 216
    invoke-static {}, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->new_()Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 221
    .line 222
    :cond_15
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/CommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
