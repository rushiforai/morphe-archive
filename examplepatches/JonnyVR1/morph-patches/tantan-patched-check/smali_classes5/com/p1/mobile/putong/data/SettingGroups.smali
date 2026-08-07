.class public Lcom/p1/mobile/putong/data/SettingGroups;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ValueObject<",
        "Lcom/p1/mobile/putong/data/SettingGroups;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/SettingGroups;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "settinggroups"


# instance fields
.field public adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public boost:Lcom/p1/mobile/putong/data/UserBoostSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public cityC:Lcom/p1/mobile/putong/data/CityC;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public decoration:Lcom/p1/mobile/putong/data/DecorationSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public fake:Lcom/p1/mobile/putong/data/UserFakeSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public fvip:Lcom/p1/mobile/putong/data/FemaleVip;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public gender:Lcom/p1/mobile/putong/data/IntlMoreGender;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public growth:Lcom/p1/mobile/putong/data/GrowthSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public live:Lcom/p1/mobile/putong/data/UserLiveSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public marriage:Lcom/p1/mobile/putong/data/MarrySettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public moment:Lcom/p1/mobile/putong/data/UserMomentSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public noPush:Lcom/p1/mobile/putong/data/NotificationSetting;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public pet:Lcom/p1/mobile/putong/data/Pet;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public push:Lcom/p1/mobile/putong/data/UserPushSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public search:Lcom/p1/mobile/putong/data/UserSearchSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public see:Lcom/p1/mobile/putong/data/SeeSettings;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public share:Lcom/p1/mobile/putong/data/ShareSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public soulchat:Lcom/p1/mobile/putong/data/ChatSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public spvip:Lcom/p1/mobile/putong/data/SpVip;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public tttribe:Lcom/p1/mobile/putong/data/TribeSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/SettingGroups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/SettingGroups;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/SettingGroups;->nullCheck()V

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

    .line 372
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SettingGroups;->clone()Lcom/p1/mobile/putong/data/SettingGroups;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserBoostSettings;->clone()Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserLiveSettings;->clone()Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserPrivacySettings;->clone()Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 39
    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 41
    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserPushSettings;->clone()Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 49
    .line 50
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 51
    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserSearchSettings;->clone()Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 59
    .line 60
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 61
    .line 62
    if-eqz v1, :cond_5

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->clone()Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 69
    .line 70
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 71
    .line 72
    if-eqz v1, :cond_6

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserFakeSettings;->clone()Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 79
    .line 80
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 81
    .line 82
    if-eqz v1, :cond_7

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserSVIPSettings;->clone()Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 89
    .line 90
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 91
    .line 92
    if-eqz v1, :cond_8

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->clone()Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 99
    .line 100
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 101
    .line 102
    if-eqz v1, :cond_9

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SeeSettings;->clone()Lcom/p1/mobile/putong/data/SeeSettings;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 109
    .line 110
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 111
    .line 112
    if-eqz v1, :cond_a

    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->clone()Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 119
    .line 120
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 121
    .line 122
    if-eqz v1, :cond_b

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->clone()Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 129
    .line 130
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 131
    .line 132
    if-eqz v1, :cond_c

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ChatSetting;->clone()Lcom/p1/mobile/putong/data/ChatSetting;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 139
    .line 140
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 141
    .line 142
    if-eqz v1, :cond_d

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ChatSetting;->clone()Lcom/p1/mobile/putong/data/ChatSetting;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 149
    .line 150
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 151
    .line 152
    if-eqz v1, :cond_e

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SoulMatchGroup;->clone()Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 159
    .line 160
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 161
    .line 162
    if-eqz v1, :cond_f

    .line 163
    .line 164
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ShareSetting;->clone()Lcom/p1/mobile/putong/data/ShareSetting;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 169
    .line 170
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 171
    .line 172
    if-eqz v1, :cond_10

    .line 173
    .line 174
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DecorationSettings;->clone()Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 179
    .line 180
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 181
    .line 182
    if-eqz v1, :cond_11

    .line 183
    .line 184
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ComDiamond;->clone()Lcom/p1/mobile/putong/data/ComDiamond;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 189
    .line 190
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 191
    .line 192
    if-eqz v1, :cond_12

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CharacterEvaluate;->clone()Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 199
    .line 200
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 201
    .line 202
    if-eqz v1, :cond_13

    .line 203
    .line 204
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Pet;->clone()Lcom/p1/mobile/putong/data/Pet;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 209
    .line 210
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 211
    .line 212
    if-eqz v1, :cond_14

    .line 213
    .line 214
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MomentLevel;->clone()Lcom/p1/mobile/putong/data/MomentLevel;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 219
    .line 220
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 221
    .line 222
    if-eqz v1, :cond_15

    .line 223
    .line 224
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VipSearchSettings;->clone()Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 229
    .line 230
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 231
    .line 232
    if-eqz v1, :cond_16

    .line 233
    .line 234
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserMomentSettings;->clone()Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 239
    .line 240
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 241
    .line 242
    if-eqz v1, :cond_17

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->clone()Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 249
    .line 250
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 251
    .line 252
    if-eqz v1, :cond_18

    .line 253
    .line 254
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PlatinumSettings;->clone()Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 259
    .line 260
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 261
    .line 262
    if-eqz v1, :cond_19

    .line 263
    .line 264
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MarrySettings;->clone()Lcom/p1/mobile/putong/data/MarrySettings;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 269
    .line 270
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 271
    .line 272
    if-eqz v1, :cond_1a

    .line 273
    .line 274
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CityC;->clone()Lcom/p1/mobile/putong/data/CityC;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 279
    .line 280
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 281
    .line 282
    if-eqz v1, :cond_1b

    .line 283
    .line 284
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SpVip;->clone()Lcom/p1/mobile/putong/data/SpVip;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 289
    .line 290
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 291
    .line 292
    if-eqz v1, :cond_1c

    .line 293
    .line 294
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GrowthSettings;->clone()Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 299
    .line 300
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 301
    .line 302
    if-eqz v1, :cond_1d

    .line 303
    .line 304
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FemaleVip;->clone()Lcom/p1/mobile/putong/data/FemaleVip;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 309
    .line 310
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 311
    .line 312
    if-eqz v1, :cond_1e

    .line 313
    .line 314
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SvipSearch;->clone()Lcom/p1/mobile/putong/data/SvipSearch;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 319
    .line 320
    :cond_1e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 321
    .line 322
    if-eqz v1, :cond_1f

    .line 323
    .line 324
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NotificationSetting;->clone()Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 329
    .line 330
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 331
    .line 332
    if-eqz v1, :cond_20

    .line 333
    .line 334
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->clone()Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 339
    .line 340
    :cond_20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 341
    .line 342
    if-eqz v1, :cond_21

    .line 343
    .line 344
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserUpVipSettings;->clone()Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 349
    .line 350
    :cond_21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 351
    .line 352
    if-eqz v1, :cond_22

    .line 353
    .line 354
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IntlMoreGender;->clone()Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 359
    .line 360
    :cond_22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 361
    .line 362
    if-eqz p0, :cond_23

    .line 363
    .line 364
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/TribeSetting;->clone()Lcom/p1/mobile/putong/data/TribeSetting;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 369
    .line 370
    :cond_23
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 371
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SettingGroups;->clone()Lcom/p1/mobile/putong/data/SettingGroups;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/SettingGroups;

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
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 86
    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 96
    .line 97
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 106
    .line 107
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 194
    .line 195
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 204
    .line 205
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 214
    .line 215
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 224
    .line 225
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 234
    .line 235
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 244
    .line 245
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 254
    .line 255
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 264
    .line 265
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 274
    .line 275
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 284
    .line 285
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 286
    .line 287
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-eqz v1, :cond_2

    .line 292
    .line 293
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 294
    .line 295
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 296
    .line 297
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-eqz v1, :cond_2

    .line 302
    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 304
    .line 305
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 306
    .line 307
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    if-eqz v1, :cond_2

    .line 312
    .line 313
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 314
    .line 315
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 316
    .line 317
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    if-eqz v1, :cond_2

    .line 322
    .line 323
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 324
    .line 325
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 334
    .line 335
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 344
    .line 345
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 346
    .line 347
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    if-eqz v1, :cond_2

    .line 352
    .line 353
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 354
    .line 355
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 356
    .line 357
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 358
    .line 359
    .line 360
    move-result v1

    .line 361
    if-eqz v1, :cond_2

    .line 362
    .line 363
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 364
    .line 365
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 374
    .line 375
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 376
    .line 377
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 378
    .line 379
    .line 380
    move-result p0

    .line 381
    if-eqz p0, :cond_2

    .line 382
    .line 383
    return v0

    .line 384
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "settinggroups"

    .line 2
    .line 3
    return-object p0
.end method

.method public hasIntlMoreGenderSetting()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->lookingForGenders:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gtz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/IntlGender;->isUnknownType()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IntlMoreGender;->subGender:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public hashCode()I
    .locals 3

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserBoostSettings;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserLiveSettings;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserPushSettings;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserSearchSettings;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserFakeSettings;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    goto :goto_7

    .line 108
    :cond_7
    move v1, v2

    .line 109
    :goto_7
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserSVIPSettings;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v2

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_9

    .line 134
    :cond_9
    move v1, v2

    .line 135
    :goto_9
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SeeSettings;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_a

    .line 147
    :cond_a
    move v1, v2

    .line 148
    :goto_a
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto :goto_b

    .line 160
    :cond_b
    move v1, v2

    .line 161
    :goto_b
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    goto :goto_c

    .line 173
    :cond_c
    move v1, v2

    .line 174
    :goto_c
    add-int/2addr v0, v1

    .line 175
    mul-int/lit8 v0, v0, 0x29

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ChatSetting;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    goto :goto_d

    .line 186
    :cond_d
    move v1, v2

    .line 187
    :goto_d
    add-int/2addr v0, v1

    .line 188
    mul-int/lit8 v0, v0, 0x29

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ChatSetting;->hashCode()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    goto :goto_e

    .line 199
    :cond_e
    move v1, v2

    .line 200
    :goto_e
    add-int/2addr v0, v1

    .line 201
    mul-int/lit8 v0, v0, 0x29

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 204
    .line 205
    if-eqz v1, :cond_f

    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SoulMatchGroup;->hashCode()I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    goto :goto_f

    .line 212
    :cond_f
    move v1, v2

    .line 213
    :goto_f
    add-int/2addr v0, v1

    .line 214
    mul-int/lit8 v0, v0, 0x29

    .line 215
    .line 216
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 217
    .line 218
    if-eqz v1, :cond_10

    .line 219
    .line 220
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ShareSetting;->hashCode()I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    goto :goto_10

    .line 225
    :cond_10
    move v1, v2

    .line 226
    :goto_10
    add-int/2addr v0, v1

    .line 227
    mul-int/lit8 v0, v0, 0x29

    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 230
    .line 231
    if-eqz v1, :cond_11

    .line 232
    .line 233
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/DecorationSettings;->hashCode()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    goto :goto_11

    .line 238
    :cond_11
    move v1, v2

    .line 239
    :goto_11
    add-int/2addr v0, v1

    .line 240
    mul-int/lit8 v0, v0, 0x29

    .line 241
    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 243
    .line 244
    if-eqz v1, :cond_12

    .line 245
    .line 246
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ComDiamond;->hashCode()I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    goto :goto_12

    .line 251
    :cond_12
    move v1, v2

    .line 252
    :goto_12
    add-int/2addr v0, v1

    .line 253
    mul-int/lit8 v0, v0, 0x29

    .line 254
    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 256
    .line 257
    if-eqz v1, :cond_13

    .line 258
    .line 259
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hashCode()I

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    goto :goto_13

    .line 264
    :cond_13
    move v1, v2

    .line 265
    :goto_13
    add-int/2addr v0, v1

    .line 266
    mul-int/lit8 v0, v0, 0x29

    .line 267
    .line 268
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 269
    .line 270
    if-eqz v1, :cond_14

    .line 271
    .line 272
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Pet;->hashCode()I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    goto :goto_14

    .line 277
    :cond_14
    move v1, v2

    .line 278
    :goto_14
    add-int/2addr v0, v1

    .line 279
    mul-int/lit8 v0, v0, 0x29

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 282
    .line 283
    if-eqz v1, :cond_15

    .line 284
    .line 285
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MomentLevel;->hashCode()I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    goto :goto_15

    .line 290
    :cond_15
    move v1, v2

    .line 291
    :goto_15
    add-int/2addr v0, v1

    .line 292
    mul-int/lit8 v0, v0, 0x29

    .line 293
    .line 294
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 295
    .line 296
    if-eqz v1, :cond_16

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VipSearchSettings;->hashCode()I

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    goto :goto_16

    .line 303
    :cond_16
    move v1, v2

    .line 304
    :goto_16
    add-int/2addr v0, v1

    .line 305
    mul-int/lit8 v0, v0, 0x29

    .line 306
    .line 307
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 308
    .line 309
    if-eqz v1, :cond_17

    .line 310
    .line 311
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserMomentSettings;->hashCode()I

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    goto :goto_17

    .line 316
    :cond_17
    move v1, v2

    .line 317
    :goto_17
    add-int/2addr v0, v1

    .line 318
    mul-int/lit8 v0, v0, 0x29

    .line 319
    .line 320
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 321
    .line 322
    if-eqz v1, :cond_18

    .line 323
    .line 324
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->hashCode()I

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    goto :goto_18

    .line 329
    :cond_18
    move v1, v2

    .line 330
    :goto_18
    add-int/2addr v0, v1

    .line 331
    mul-int/lit8 v0, v0, 0x29

    .line 332
    .line 333
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 334
    .line 335
    if-eqz v1, :cond_19

    .line 336
    .line 337
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PlatinumSettings;->hashCode()I

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    goto :goto_19

    .line 342
    :cond_19
    move v1, v2

    .line 343
    :goto_19
    add-int/2addr v0, v1

    .line 344
    mul-int/lit8 v0, v0, 0x29

    .line 345
    .line 346
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 347
    .line 348
    if-eqz v1, :cond_1a

    .line 349
    .line 350
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MarrySettings;->hashCode()I

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    goto :goto_1a

    .line 355
    :cond_1a
    move v1, v2

    .line 356
    :goto_1a
    add-int/2addr v0, v1

    .line 357
    mul-int/lit8 v0, v0, 0x29

    .line 358
    .line 359
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 360
    .line 361
    if-eqz v1, :cond_1b

    .line 362
    .line 363
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CityC;->hashCode()I

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    goto :goto_1b

    .line 368
    :cond_1b
    move v1, v2

    .line 369
    :goto_1b
    add-int/2addr v0, v1

    .line 370
    mul-int/lit8 v0, v0, 0x29

    .line 371
    .line 372
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 373
    .line 374
    if-eqz v1, :cond_1c

    .line 375
    .line 376
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SpVip;->hashCode()I

    .line 377
    .line 378
    .line 379
    move-result v1

    .line 380
    goto :goto_1c

    .line 381
    :cond_1c
    move v1, v2

    .line 382
    :goto_1c
    add-int/2addr v0, v1

    .line 383
    mul-int/lit8 v0, v0, 0x29

    .line 384
    .line 385
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 386
    .line 387
    if-eqz v1, :cond_1d

    .line 388
    .line 389
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GrowthSettings;->hashCode()I

    .line 390
    .line 391
    .line 392
    move-result v1

    .line 393
    goto :goto_1d

    .line 394
    :cond_1d
    move v1, v2

    .line 395
    :goto_1d
    add-int/2addr v0, v1

    .line 396
    mul-int/lit8 v0, v0, 0x29

    .line 397
    .line 398
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 399
    .line 400
    if-eqz v1, :cond_1e

    .line 401
    .line 402
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FemaleVip;->hashCode()I

    .line 403
    .line 404
    .line 405
    move-result v1

    .line 406
    goto :goto_1e

    .line 407
    :cond_1e
    move v1, v2

    .line 408
    :goto_1e
    add-int/2addr v0, v1

    .line 409
    mul-int/lit8 v0, v0, 0x29

    .line 410
    .line 411
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 412
    .line 413
    if-eqz v1, :cond_1f

    .line 414
    .line 415
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SvipSearch;->hashCode()I

    .line 416
    .line 417
    .line 418
    move-result v1

    .line 419
    goto :goto_1f

    .line 420
    :cond_1f
    move v1, v2

    .line 421
    :goto_1f
    add-int/2addr v0, v1

    .line 422
    mul-int/lit8 v0, v0, 0x29

    .line 423
    .line 424
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 425
    .line 426
    if-eqz v1, :cond_20

    .line 427
    .line 428
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NotificationSetting;->hashCode()I

    .line 429
    .line 430
    .line 431
    move-result v1

    .line 432
    goto :goto_20

    .line 433
    :cond_20
    move v1, v2

    .line 434
    :goto_20
    add-int/2addr v0, v1

    .line 435
    mul-int/lit8 v0, v0, 0x29

    .line 436
    .line 437
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 438
    .line 439
    if-eqz v1, :cond_21

    .line 440
    .line 441
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->hashCode()I

    .line 442
    .line 443
    .line 444
    move-result v1

    .line 445
    goto :goto_21

    .line 446
    :cond_21
    move v1, v2

    .line 447
    :goto_21
    add-int/2addr v0, v1

    .line 448
    mul-int/lit8 v0, v0, 0x29

    .line 449
    .line 450
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 451
    .line 452
    if-eqz v1, :cond_22

    .line 453
    .line 454
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserUpVipSettings;->hashCode()I

    .line 455
    .line 456
    .line 457
    move-result v1

    .line 458
    goto :goto_22

    .line 459
    :cond_22
    move v1, v2

    .line 460
    :goto_22
    add-int/2addr v0, v1

    .line 461
    mul-int/lit8 v0, v0, 0x29

    .line 462
    .line 463
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 464
    .line 465
    if-eqz v1, :cond_23

    .line 466
    .line 467
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IntlMoreGender;->hashCode()I

    .line 468
    .line 469
    .line 470
    move-result v1

    .line 471
    goto :goto_23

    .line 472
    :cond_23
    move v1, v2

    .line 473
    :goto_23
    add-int/2addr v0, v1

    .line 474
    mul-int/lit8 v0, v0, 0x29

    .line 475
    .line 476
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 477
    .line 478
    if-eqz v1, :cond_24

    .line 479
    .line 480
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/TribeSetting;->hashCode()I

    .line 481
    .line 482
    .line 483
    move-result v2

    .line 484
    :cond_24
    add-int/2addr v0, v2

    .line 485
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 486
    .line 487
    :cond_25
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_26

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SettingGroups;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const-string v0, "type"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    const-string v0, "boost"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 38
    .line 39
    :cond_2
    const-string v0, "live"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 50
    .line 51
    :cond_3
    const-string v0, "privacy"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 62
    .line 63
    :cond_4
    const-string v0, "push"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 74
    .line 75
    :cond_5
    const-string v0, "search"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 86
    .line 87
    :cond_6
    const-string v0, "subscription"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 98
    .line 99
    :cond_7
    const-string v0, "fake"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 110
    .line 111
    :cond_8
    const-string v0, "svip"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 122
    .line 123
    :cond_9
    const-string v0, "svipPrivacy"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 134
    .line 135
    :cond_a
    const-string v0, "see"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 146
    .line 147
    :cond_b
    const-string v0, "diamondVIP"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 158
    .line 159
    :cond_c
    const-string v0, "diamondVIPPrivateMatch"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 170
    .line 171
    :cond_d
    const-string v0, "soulchat"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 182
    .line 183
    :cond_e
    const-string v0, "quickchatchat"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 194
    .line 195
    :cond_f
    const-string v0, "soulmate"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 206
    .line 207
    :cond_10
    const-string v0, "share"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 218
    .line 219
    :cond_11
    const-string v0, "decoration"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 228
    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 230
    .line 231
    :cond_12
    const-string v0, "comDiamond"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_13

    .line 238
    .line 239
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 240
    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 242
    .line 243
    :cond_13
    const-string v0, "characterEvaluate"

    .line 244
    .line 245
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_14

    .line 250
    .line 251
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 254
    .line 255
    :cond_14
    const-string v0, "pet"

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_15

    .line 262
    .line 263
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 264
    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 266
    .line 267
    :cond_15
    const-string v0, "momentLevel"

    .line 268
    .line 269
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_16

    .line 274
    .line 275
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 276
    .line 277
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 278
    .line 279
    :cond_16
    const-string v0, "vipSearch"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_17

    .line 286
    .line 287
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 288
    .line 289
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 290
    .line 291
    :cond_17
    const-string v0, "moment"

    .line 292
    .line 293
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_18

    .line 298
    .line 299
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 300
    .line 301
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 302
    .line 303
    :cond_18
    const-string v0, "profile"

    .line 304
    .line 305
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-nez v0, :cond_19

    .line 310
    .line 311
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 312
    .line 313
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 314
    .line 315
    :cond_19
    const-string v0, "pvip"

    .line 316
    .line 317
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_1a

    .line 322
    .line 323
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 324
    .line 325
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 326
    .line 327
    :cond_1a
    const-string v0, "marriage"

    .line 328
    .line 329
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    if-nez v0, :cond_1b

    .line 334
    .line 335
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 336
    .line 337
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 338
    .line 339
    :cond_1b
    const-string v0, "cityC"

    .line 340
    .line 341
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-nez v0, :cond_1c

    .line 346
    .line 347
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 348
    .line 349
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 350
    .line 351
    :cond_1c
    const-string v0, "spvip"

    .line 352
    .line 353
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 354
    .line 355
    .line 356
    move-result v0

    .line 357
    if-nez v0, :cond_1d

    .line 358
    .line 359
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 360
    .line 361
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 362
    .line 363
    :cond_1d
    const-string v0, "growth"

    .line 364
    .line 365
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    if-nez v0, :cond_1e

    .line 370
    .line 371
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 372
    .line 373
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 374
    .line 375
    :cond_1e
    const-string v0, "fvip"

    .line 376
    .line 377
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    if-nez v0, :cond_1f

    .line 382
    .line 383
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 384
    .line 385
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 386
    .line 387
    :cond_1f
    const-string v0, "svipSearch"

    .line 388
    .line 389
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-nez v0, :cond_20

    .line 394
    .line 395
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 396
    .line 397
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 398
    .line 399
    :cond_20
    const-string v0, "noPush"

    .line 400
    .line 401
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    if-nez v0, :cond_21

    .line 406
    .line 407
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 408
    .line 409
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 410
    .line 411
    :cond_21
    const-string v0, "adsMaterialRouter"

    .line 412
    .line 413
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-nez v0, :cond_22

    .line 418
    .line 419
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 420
    .line 421
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 422
    .line 423
    :cond_22
    const-string v0, "upvip"

    .line 424
    .line 425
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-nez v0, :cond_23

    .line 430
    .line 431
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 432
    .line 433
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 434
    .line 435
    :cond_23
    const-string v0, "gender"

    .line 436
    .line 437
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-nez v0, :cond_24

    .line 442
    .line 443
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 444
    .line 445
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 446
    .line 447
    :cond_24
    const-string v0, "tttribe"

    .line 448
    .line 449
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/SettingGroups;->isFieldParsed(Ljava/lang/String;)Z

    .line 450
    .line 451
    .line 452
    move-result v0

    .line 453
    if-nez v0, :cond_25

    .line 454
    .line 455
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 456
    .line 457
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 458
    .line 459
    :cond_25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->parseFieldSet:Ljava/util/HashSet;

    .line 460
    .line 461
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 462
    .line 463
    .line 464
    :cond_26
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 465
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SettingGroups;->mergeData(Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/UserBoostSettings;->new_()Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveSettings;->new_()Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/UserPrivacySettings;->new_()Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/data/UserPushSettings;->new_()Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/data/UserSearchSettings;->new_()Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->new_()Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 60
    .line 61
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 62
    .line 63
    if-nez v0, :cond_6

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/data/UserFakeSettings;->new_()Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/data/UserSVIPSettings;->new_()Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 80
    .line 81
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 82
    .line 83
    if-nez v0, :cond_8

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->new_()Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 90
    .line 91
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 92
    .line 93
    if-nez v0, :cond_9

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->new_()Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 100
    .line 101
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 102
    .line 103
    if-nez v0, :cond_a

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/data/ChatSetting;->new_()Lcom/p1/mobile/putong/data/ChatSetting;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 110
    .line 111
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 112
    .line 113
    if-nez v0, :cond_b

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/data/ChatSetting;->new_()Lcom/p1/mobile/putong/data/ChatSetting;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 120
    .line 121
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 122
    .line 123
    if-nez v0, :cond_c

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/data/SoulMatchGroup;->new_()Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 130
    .line 131
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 132
    .line 133
    if-nez v0, :cond_d

    .line 134
    .line 135
    invoke-static {}, Lcom/p1/mobile/putong/data/ShareSetting;->new_()Lcom/p1/mobile/putong/data/ShareSetting;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 140
    .line 141
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 142
    .line 143
    if-nez v0, :cond_e

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/data/DecorationSettings;->new_()Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 150
    .line 151
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 152
    .line 153
    if-nez v0, :cond_f

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/data/ComDiamond;->new_()Lcom/p1/mobile/putong/data/ComDiamond;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 160
    .line 161
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 162
    .line 163
    if-nez v0, :cond_10

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/data/Pet;->new_()Lcom/p1/mobile/putong/data/Pet;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 170
    .line 171
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 172
    .line 173
    if-nez v0, :cond_11

    .line 174
    .line 175
    invoke-static {}, Lcom/p1/mobile/putong/data/MomentLevel;->new_()Lcom/p1/mobile/putong/data/MomentLevel;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 180
    .line 181
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 182
    .line 183
    if-nez v0, :cond_12

    .line 184
    .line 185
    invoke-static {}, Lcom/p1/mobile/putong/data/VipSearchSettings;->new_()Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 190
    .line 191
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 192
    .line 193
    if-nez v0, :cond_13

    .line 194
    .line 195
    invoke-static {}, Lcom/p1/mobile/putong/data/UserMomentSettings;->new_()Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 200
    .line 201
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 202
    .line 203
    if-nez v0, :cond_14

    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->new_()Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 210
    .line 211
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 212
    .line 213
    if-nez v0, :cond_15

    .line 214
    .line 215
    invoke-static {}, Lcom/p1/mobile/putong/data/PlatinumSettings;->new_()Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 220
    .line 221
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 222
    .line 223
    if-nez v0, :cond_16

    .line 224
    .line 225
    invoke-static {}, Lcom/p1/mobile/putong/data/MarrySettings;->new_()Lcom/p1/mobile/putong/data/MarrySettings;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 230
    .line 231
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 232
    .line 233
    if-nez v0, :cond_17

    .line 234
    .line 235
    invoke-static {}, Lcom/p1/mobile/putong/data/CityC;->new_()Lcom/p1/mobile/putong/data/CityC;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 240
    .line 241
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 242
    .line 243
    if-nez v0, :cond_18

    .line 244
    .line 245
    invoke-static {}, Lcom/p1/mobile/putong/data/SpVip;->new_()Lcom/p1/mobile/putong/data/SpVip;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 250
    .line 251
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 252
    .line 253
    if-nez v0, :cond_19

    .line 254
    .line 255
    invoke-static {}, Lcom/p1/mobile/putong/data/GrowthSettings;->new_()Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 260
    .line 261
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 262
    .line 263
    if-nez v0, :cond_1a

    .line 264
    .line 265
    invoke-static {}, Lcom/p1/mobile/putong/data/FemaleVip;->new_()Lcom/p1/mobile/putong/data/FemaleVip;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 270
    .line 271
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 272
    .line 273
    if-nez v0, :cond_1b

    .line 274
    .line 275
    invoke-static {}, Lcom/p1/mobile/putong/data/SvipSearch;->new_()Lcom/p1/mobile/putong/data/SvipSearch;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 280
    .line 281
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 282
    .line 283
    if-nez v0, :cond_1c

    .line 284
    .line 285
    invoke-static {}, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->new_()Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 290
    .line 291
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 292
    .line 293
    if-nez v0, :cond_1d

    .line 294
    .line 295
    invoke-static {}, Lcom/p1/mobile/putong/data/UserUpVipSettings;->new_()Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 300
    .line 301
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 302
    .line 303
    if-nez v0, :cond_1e

    .line 304
    .line 305
    invoke-static {}, Lcom/p1/mobile/putong/data/IntlMoreGender;->new_()Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 310
    .line 311
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 312
    .line 313
    if-nez v0, :cond_1f

    .line 314
    .line 315
    invoke-static {}, Lcom/p1/mobile/putong/data/TribeSetting;->new_()Lcom/p1/mobile/putong/data/TribeSetting;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 320
    .line 321
    :cond_1f
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/UserPrivacySettings;->subtract(Lcom/p1/mobile/putong/data/UserPrivacySettings;)Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 59
    .line 60
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/UserPushSettings;->subtract(Lcom/p1/mobile/putong/data/UserPushSettings;)Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 71
    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/UserSearchSettings;->subtract(Lcom/p1/mobile/putong/data/UserSearchSettings;)Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 83
    .line 84
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 85
    .line 86
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 87
    .line 88
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_6

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 95
    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 97
    .line 98
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 99
    .line 100
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 101
    .line 102
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-nez v1, :cond_7

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 109
    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 111
    .line 112
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 113
    .line 114
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 115
    .line 116
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-nez v1, :cond_8

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 123
    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 125
    .line 126
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 127
    .line 128
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 129
    .line 130
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-nez v1, :cond_9

    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 137
    .line 138
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 139
    .line 140
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 141
    .line 142
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 143
    .line 144
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-nez v1, :cond_a

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 151
    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 153
    .line 154
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 155
    .line 156
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 157
    .line 158
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-nez v1, :cond_b

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 165
    .line 166
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 167
    .line 168
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 169
    .line 170
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 171
    .line 172
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_c

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 179
    .line 180
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 181
    .line 182
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 183
    .line 184
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 185
    .line 186
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    if-nez v1, :cond_d

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 193
    .line 194
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 195
    .line 196
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 197
    .line 198
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 199
    .line 200
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-nez v1, :cond_e

    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 207
    .line 208
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 209
    .line 210
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 211
    .line 212
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 213
    .line 214
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    if-nez v1, :cond_f

    .line 219
    .line 220
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 221
    .line 222
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 223
    .line 224
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 225
    .line 226
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 227
    .line 228
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    if-nez v1, :cond_10

    .line 233
    .line 234
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 235
    .line 236
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 237
    .line 238
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 239
    .line 240
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 241
    .line 242
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-nez v1, :cond_11

    .line 247
    .line 248
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 249
    .line 250
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 251
    .line 252
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 253
    .line 254
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 255
    .line 256
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    if-nez v1, :cond_12

    .line 261
    .line 262
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 263
    .line 264
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 265
    .line 266
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 267
    .line 268
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 269
    .line 270
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-nez v1, :cond_13

    .line 275
    .line 276
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 277
    .line 278
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 279
    .line 280
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 281
    .line 282
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 283
    .line 284
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    if-nez v1, :cond_14

    .line 289
    .line 290
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 291
    .line 292
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 293
    .line 294
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 295
    .line 296
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 297
    .line 298
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    if-nez v1, :cond_15

    .line 303
    .line 304
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 305
    .line 306
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 307
    .line 308
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 309
    .line 310
    if-eqz v1, :cond_16

    .line 311
    .line 312
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 313
    .line 314
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/VipSearchSettings;->subtract(Lcom/p1/mobile/putong/data/VipSearchSettings;)Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 319
    .line 320
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 321
    .line 322
    if-eqz v1, :cond_17

    .line 323
    .line 324
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 325
    .line 326
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/UserMomentSettings;->subtract(Lcom/p1/mobile/putong/data/UserMomentSettings;)Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 331
    .line 332
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 333
    .line 334
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 335
    .line 336
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    if-nez v1, :cond_18

    .line 341
    .line 342
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 343
    .line 344
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 345
    .line 346
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 347
    .line 348
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 349
    .line 350
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    if-nez v1, :cond_19

    .line 355
    .line 356
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 357
    .line 358
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 359
    .line 360
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 361
    .line 362
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 363
    .line 364
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    move-result v1

    .line 368
    if-nez v1, :cond_1a

    .line 369
    .line 370
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 371
    .line 372
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 373
    .line 374
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 375
    .line 376
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 377
    .line 378
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    move-result v1

    .line 382
    if-nez v1, :cond_1b

    .line 383
    .line 384
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 385
    .line 386
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 387
    .line 388
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 389
    .line 390
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 391
    .line 392
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    if-nez v1, :cond_1c

    .line 397
    .line 398
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 399
    .line 400
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 401
    .line 402
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 403
    .line 404
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 405
    .line 406
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    move-result v1

    .line 410
    if-nez v1, :cond_1d

    .line 411
    .line 412
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 413
    .line 414
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 415
    .line 416
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 417
    .line 418
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 419
    .line 420
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move-result v1

    .line 424
    if-nez v1, :cond_1e

    .line 425
    .line 426
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 427
    .line 428
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 429
    .line 430
    :cond_1e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 431
    .line 432
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 433
    .line 434
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    if-nez v1, :cond_1f

    .line 439
    .line 440
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 441
    .line 442
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 443
    .line 444
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 445
    .line 446
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 447
    .line 448
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 449
    .line 450
    .line 451
    move-result v1

    .line 452
    if-nez v1, :cond_20

    .line 453
    .line 454
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 455
    .line 456
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 457
    .line 458
    :cond_20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 459
    .line 460
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 461
    .line 462
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    move-result v1

    .line 466
    if-nez v1, :cond_21

    .line 467
    .line 468
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 469
    .line 470
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 471
    .line 472
    :cond_21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 473
    .line 474
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 475
    .line 476
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 477
    .line 478
    .line 479
    move-result v1

    .line 480
    if-nez v1, :cond_22

    .line 481
    .line 482
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 483
    .line 484
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 485
    .line 486
    :cond_22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 487
    .line 488
    if-eqz v1, :cond_23

    .line 489
    .line 490
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 491
    .line 492
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/IntlMoreGender;->subtract(Lcom/p1/mobile/putong/data/IntlMoreGender;)Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 493
    .line 494
    .line 495
    move-result-object v1

    .line 496
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 497
    .line 498
    :cond_23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 499
    .line 500
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 501
    .line 502
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 503
    .line 504
    .line 505
    move-result p1

    .line 506
    if-nez p1, :cond_24

    .line 507
    .line 508
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 509
    .line 510
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 511
    .line 512
    :cond_24
    new-instance p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 513
    .line 514
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 515
    .line 516
    .line 517
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/SettingGroups;->equals(Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    move-result p0

    .line 521
    if-eqz p0, :cond_25

    .line 522
    .line 523
    const/4 p0, 0x0

    .line 524
    return-object p0

    .line 525
    :cond_25
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/SettingGroups;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
