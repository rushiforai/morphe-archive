.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoiceuserprofileconfig"


# instance fields
.field public banners:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;",
            ">;"
        }
    .end annotation
.end field

.field public bottomButtons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public enableNewPrivilege:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public fanAvatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public fanAvatarTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public giftRuleUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public giftShowCaseItemIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public guildId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public hierarchy:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;",
            ">;"
        }
    .end annotation
.end field

.field public identity:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public isJailed:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public manageButtons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public middleButtons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public middleCards:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;",
            ">;"
        }
    .end annotation
.end field

.field public moreButtons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public receiveGift:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public relationState:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public sendGift:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public showReceiveGifts:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public showSpecialFriendRelation:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public specialFriendRelationSchema:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public specialFriendRelations:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;",
            ">;"
        }
    .end annotation
.end field

.field public strawberry:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public userNameGradientColors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;)Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic l(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic m(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->nullCheck()V

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

    .line 268
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showReceiveGifts:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showReceiveGifts:Z

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->strawberry:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->strawberry:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->receiveGift:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->receiveGift:J

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    new-instance v2, Ll/ia2;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/ia2;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 44
    .line 45
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    new-instance v2, Ll/ja2;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/ja2;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 59
    .line 60
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    new-instance v2, Ll/ka2;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/ka2;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 74
    .line 75
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 76
    .line 77
    if-eqz v1, :cond_3

    .line 78
    .line 79
    new-instance v2, Ll/la2;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/la2;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 89
    .line 90
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 91
    .line 92
    if-eqz v1, :cond_4

    .line 93
    .line 94
    new-instance v2, Ll/ma2;

    .line 95
    .line 96
    invoke-direct {v2}, Ll/ma2;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 104
    .line 105
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 106
    .line 107
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 110
    .line 111
    if-eqz v1, :cond_5

    .line 112
    .line 113
    new-instance v2, Ll/na2;

    .line 114
    .line 115
    invoke-direct {v2}, Ll/na2;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 123
    .line 124
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 125
    .line 126
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 129
    .line 130
    if-eqz v1, :cond_6

    .line 131
    .line 132
    new-instance v2, Ll/oa2;

    .line 133
    .line 134
    invoke-direct {v2}, Ll/oa2;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 142
    .line 143
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 144
    .line 145
    if-eqz v1, :cond_7

    .line 146
    .line 147
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 152
    .line 153
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 154
    .line 155
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 158
    .line 159
    if-eqz v1, :cond_8

    .line 160
    .line 161
    new-instance v2, Ll/pa2;

    .line 162
    .line 163
    invoke-direct {v2}, Ll/pa2;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 171
    .line 172
    :cond_8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 173
    .line 174
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 177
    .line 178
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 179
    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 181
    .line 182
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 185
    .line 186
    if-eqz v1, :cond_9

    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 193
    .line 194
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 195
    .line 196
    if-eqz v1, :cond_a

    .line 197
    .line 198
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 203
    .line 204
    :cond_a
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showSpecialFriendRelation:Z

    .line 205
    .line 206
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showSpecialFriendRelation:Z

    .line 207
    .line 208
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 209
    .line 210
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 213
    .line 214
    if-eqz v1, :cond_b

    .line 215
    .line 216
    new-instance v2, Ll/qa2;

    .line 217
    .line 218
    invoke-direct {v2}, Ll/qa2;-><init>()V

    .line 219
    .line 220
    .line 221
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 226
    .line 227
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 228
    .line 229
    if-eqz v1, :cond_c

    .line 230
    .line 231
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 236
    .line 237
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 238
    .line 239
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 240
    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 242
    .line 243
    if-eqz v1, :cond_d

    .line 244
    .line 245
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 250
    .line 251
    :cond_d
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 252
    .line 253
    if-eqz p0, :cond_e

    .line 254
    .line 255
    new-instance v1, Ll/ra2;

    .line 256
    .line 257
    invoke-direct {v1}, Ll/ra2;-><init>()V

    .line 258
    .line 259
    .line 260
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 265
    .line 266
    :cond_e
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 267
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showReceiveGifts:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showReceiveGifts:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->strawberry:J

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->strawberry:J

    .line 32
    .line 33
    cmp-long v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->receiveGift:J

    .line 38
    .line 39
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->receiveGift:J

    .line 40
    .line 41
    cmp-long v1, v3, v5

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 116
    .line 117
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 118
    .line 119
    if-ne v1, v3, :cond_2

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 122
    .line 123
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 124
    .line 125
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_2

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 142
    .line 143
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 152
    .line 153
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 154
    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 162
    .line 163
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_2

    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 172
    .line 173
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 174
    .line 175
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-eqz v1, :cond_2

    .line 180
    .line 181
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 182
    .line 183
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 184
    .line 185
    if-ne v1, v3, :cond_2

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 188
    .line 189
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_2

    .line 196
    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 198
    .line 199
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 200
    .line 201
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_2

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 208
    .line 209
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 210
    .line 211
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-eqz v1, :cond_2

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 218
    .line 219
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 220
    .line 221
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-eqz v1, :cond_2

    .line 226
    .line 227
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showSpecialFriendRelation:Z

    .line 228
    .line 229
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showSpecialFriendRelation:Z

    .line 230
    .line 231
    if-ne v1, v3, :cond_2

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 234
    .line 235
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 236
    .line 237
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_2

    .line 242
    .line 243
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 244
    .line 245
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 246
    .line 247
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-eqz v1, :cond_2

    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 254
    .line 255
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 256
    .line 257
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    if-eqz v1, :cond_2

    .line 262
    .line 263
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 264
    .line 265
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 266
    .line 267
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    if-eqz v1, :cond_2

    .line 272
    .line 273
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 274
    .line 275
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 276
    .line 277
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    if-eqz v1, :cond_2

    .line 282
    .line 283
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 284
    .line 285
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 286
    .line 287
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result p0

    .line 291
    if-eqz p0, :cond_2

    .line 292
    .line 293
    return v0

    .line 294
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoiceuserprofileconfig"

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
    if-nez v0, :cond_1c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showReceiveGifts:Z

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
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->strawberry:J

    .line 36
    .line 37
    const/16 v1, 0x20

    .line 38
    .line 39
    ushr-long v7, v5, v1

    .line 40
    .line 41
    xor-long/2addr v5, v7

    .line 42
    long-to-int v5, v5

    .line 43
    add-int/2addr v0, v5

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->receiveGift:J

    .line 47
    .line 48
    ushr-long v7, v5, v1

    .line 49
    .line 50
    xor-long/2addr v5, v7

    .line 51
    long-to-int v1, v5

    .line 52
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_2

    .line 64
    :cond_2
    move v1, v2

    .line 65
    :goto_2
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    goto :goto_3

    .line 77
    :cond_3
    move v1, v2

    .line 78
    :goto_3
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 82
    .line 83
    if-eqz v1, :cond_4

    .line 84
    .line 85
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    goto :goto_4

    .line 90
    :cond_4
    move v1, v2

    .line 91
    :goto_4
    add-int/2addr v0, v1

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 95
    .line 96
    if-eqz v1, :cond_5

    .line 97
    .line 98
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    goto :goto_5

    .line 103
    :cond_5
    move v1, v2

    .line 104
    :goto_5
    add-int/2addr v0, v1

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 108
    .line 109
    if-eqz v1, :cond_6

    .line 110
    .line 111
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    goto :goto_6

    .line 116
    :cond_6
    move v1, v2

    .line 117
    :goto_6
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x29

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 121
    .line 122
    if-eqz v1, :cond_7

    .line 123
    .line 124
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    goto :goto_7

    .line 129
    :cond_7
    move v1, v2

    .line 130
    :goto_7
    add-int/2addr v0, v1

    .line 131
    mul-int/lit8 v0, v0, 0x29

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 134
    .line 135
    if-eqz v1, :cond_8

    .line 136
    .line 137
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    goto :goto_8

    .line 142
    :cond_8
    move v1, v2

    .line 143
    :goto_8
    add-int/2addr v0, v1

    .line 144
    mul-int/lit8 v0, v0, 0x29

    .line 145
    .line 146
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 147
    .line 148
    if-eqz v1, :cond_9

    .line 149
    .line 150
    move v1, v4

    .line 151
    goto :goto_9

    .line 152
    :cond_9
    move v1, v3

    .line 153
    :goto_9
    add-int/2addr v0, v1

    .line 154
    mul-int/lit8 v0, v0, 0x29

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 157
    .line 158
    if-eqz v1, :cond_a

    .line 159
    .line 160
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    goto :goto_a

    .line 165
    :cond_a
    move v1, v2

    .line 166
    :goto_a
    add-int/2addr v0, v1

    .line 167
    mul-int/lit8 v0, v0, 0x29

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 170
    .line 171
    if-eqz v1, :cond_b

    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    goto :goto_b

    .line 178
    :cond_b
    move v1, v2

    .line 179
    :goto_b
    add-int/2addr v0, v1

    .line 180
    mul-int/lit8 v0, v0, 0x29

    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 183
    .line 184
    if-eqz v1, :cond_c

    .line 185
    .line 186
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    goto :goto_c

    .line 191
    :cond_c
    move v1, v2

    .line 192
    :goto_c
    add-int/2addr v0, v1

    .line 193
    mul-int/lit8 v0, v0, 0x29

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 196
    .line 197
    if-eqz v1, :cond_d

    .line 198
    .line 199
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;->hashCode()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    goto :goto_d

    .line 204
    :cond_d
    move v1, v2

    .line 205
    :goto_d
    add-int/2addr v0, v1

    .line 206
    mul-int/lit8 v0, v0, 0x29

    .line 207
    .line 208
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 209
    .line 210
    if-eqz v1, :cond_e

    .line 211
    .line 212
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    goto :goto_e

    .line 217
    :cond_e
    move v1, v2

    .line 218
    :goto_e
    add-int/2addr v0, v1

    .line 219
    mul-int/lit8 v0, v0, 0x29

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 222
    .line 223
    if-eqz v1, :cond_f

    .line 224
    .line 225
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    goto :goto_f

    .line 230
    :cond_f
    move v1, v2

    .line 231
    :goto_f
    add-int/2addr v0, v1

    .line 232
    mul-int/lit8 v0, v0, 0x29

    .line 233
    .line 234
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 235
    .line 236
    if-eqz v1, :cond_10

    .line 237
    .line 238
    move v1, v4

    .line 239
    goto :goto_10

    .line 240
    :cond_10
    move v1, v3

    .line 241
    :goto_10
    add-int/2addr v0, v1

    .line 242
    mul-int/lit8 v0, v0, 0x29

    .line 243
    .line 244
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 245
    .line 246
    if-eqz v1, :cond_11

    .line 247
    .line 248
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    goto :goto_11

    .line 253
    :cond_11
    move v1, v2

    .line 254
    :goto_11
    add-int/2addr v0, v1

    .line 255
    mul-int/lit8 v0, v0, 0x29

    .line 256
    .line 257
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 258
    .line 259
    if-eqz v1, :cond_12

    .line 260
    .line 261
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    goto :goto_12

    .line 266
    :cond_12
    move v1, v2

    .line 267
    :goto_12
    add-int/2addr v0, v1

    .line 268
    mul-int/lit8 v0, v0, 0x29

    .line 269
    .line 270
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 271
    .line 272
    if-eqz v1, :cond_13

    .line 273
    .line 274
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;->hashCode()I

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    goto :goto_13

    .line 279
    :cond_13
    move v1, v2

    .line 280
    :goto_13
    add-int/2addr v0, v1

    .line 281
    mul-int/lit8 v0, v0, 0x29

    .line 282
    .line 283
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 284
    .line 285
    if-eqz v1, :cond_14

    .line 286
    .line 287
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;->hashCode()I

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    goto :goto_14

    .line 292
    :cond_14
    move v1, v2

    .line 293
    :goto_14
    add-int/2addr v0, v1

    .line 294
    mul-int/lit8 v0, v0, 0x29

    .line 295
    .line 296
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->showSpecialFriendRelation:Z

    .line 297
    .line 298
    if-eqz v1, :cond_15

    .line 299
    .line 300
    move v3, v4

    .line 301
    :cond_15
    add-int/2addr v0, v3

    .line 302
    mul-int/lit8 v0, v0, 0x29

    .line 303
    .line 304
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 305
    .line 306
    if-eqz v1, :cond_16

    .line 307
    .line 308
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 309
    .line 310
    .line 311
    move-result v1

    .line 312
    goto :goto_15

    .line 313
    :cond_16
    move v1, v2

    .line 314
    :goto_15
    add-int/2addr v0, v1

    .line 315
    mul-int/lit8 v0, v0, 0x29

    .line 316
    .line 317
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 318
    .line 319
    if-eqz v1, :cond_17

    .line 320
    .line 321
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    goto :goto_16

    .line 326
    :cond_17
    move v1, v2

    .line 327
    :goto_16
    add-int/2addr v0, v1

    .line 328
    mul-int/lit8 v0, v0, 0x29

    .line 329
    .line 330
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 331
    .line 332
    if-eqz v1, :cond_18

    .line 333
    .line 334
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->hashCode()I

    .line 335
    .line 336
    .line 337
    move-result v1

    .line 338
    goto :goto_17

    .line 339
    :cond_18
    move v1, v2

    .line 340
    :goto_17
    add-int/2addr v0, v1

    .line 341
    mul-int/lit8 v0, v0, 0x29

    .line 342
    .line 343
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 344
    .line 345
    if-eqz v1, :cond_19

    .line 346
    .line 347
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    goto :goto_18

    .line 352
    :cond_19
    move v1, v2

    .line 353
    :goto_18
    add-int/2addr v0, v1

    .line 354
    mul-int/lit8 v0, v0, 0x29

    .line 355
    .line 356
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 357
    .line 358
    if-eqz v1, :cond_1a

    .line 359
    .line 360
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->hashCode()I

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    goto :goto_19

    .line 365
    :cond_1a
    move v1, v2

    .line 366
    :goto_19
    add-int/2addr v0, v1

    .line 367
    mul-int/lit8 v0, v0, 0x29

    .line 368
    .line 369
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 370
    .line 371
    if-eqz v1, :cond_1b

    .line 372
    .line 373
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 374
    .line 375
    .line 376
    move-result v2

    .line 377
    :cond_1b
    add-int/2addr v0, v2

    .line 378
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 379
    .line 380
    :cond_1c
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftRuleUrl:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sendGift:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleButtons:Ljava/util/List;

    .line 42
    .line 43
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 44
    .line 45
    if-nez v0, :cond_5

    .line 46
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 53
    .line 54
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 55
    .line 56
    if-nez v0, :cond_6

    .line 57
    .line 58
    new-instance v0, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 64
    .line 65
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 66
    .line 67
    if-nez v0, :cond_7

    .line 68
    .line 69
    new-instance v0, Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 75
    .line 76
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 77
    .line 78
    if-nez v0, :cond_8

    .line 79
    .line 80
    new-instance v0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 86
    .line 87
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 88
    .line 89
    if-nez v0, :cond_9

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 92
    .line 93
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 94
    .line 95
    if-nez v0, :cond_a

    .line 96
    .line 97
    new-instance v0, Ljava/util/ArrayList;

    .line 98
    .line 99
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 103
    .line 104
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 105
    .line 106
    if-nez v0, :cond_b

    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 113
    .line 114
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 115
    .line 116
    if-nez v0, :cond_c

    .line 117
    .line 118
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 119
    .line 120
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 121
    .line 122
    if-nez v0, :cond_d

    .line 123
    .line 124
    new-instance v0, Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->moreButtons:Ljava/util/List;

    .line 130
    .line 131
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 132
    .line 133
    if-nez v0, :cond_e

    .line 134
    .line 135
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatar:Ljava/lang/String;

    .line 136
    .line 137
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 138
    .line 139
    if-nez v0, :cond_f

    .line 140
    .line 141
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->fanAvatarTag:Ljava/lang/String;

    .line 142
    .line 143
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 144
    .line 145
    if-nez v0, :cond_10

    .line 146
    .line 147
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelationSchema:Ljava/lang/String;

    .line 148
    .line 149
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 150
    .line 151
    if-nez v0, :cond_11

    .line 152
    .line 153
    new-instance v0, Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->specialFriendRelations:Ljava/util/List;

    .line 159
    .line 160
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 161
    .line 162
    if-nez v0, :cond_12

    .line 163
    .line 164
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 169
    .line 170
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 171
    .line 172
    if-nez v0, :cond_13

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 175
    .line 176
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 177
    .line 178
    if-nez v0, :cond_14

    .line 179
    .line 180
    new-instance v0, Ljava/util/ArrayList;

    .line 181
    .line 182
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 183
    .line 184
    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userNameGradientColors:Ljava/util/List;

    .line 186
    .line 187
    :cond_14
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
