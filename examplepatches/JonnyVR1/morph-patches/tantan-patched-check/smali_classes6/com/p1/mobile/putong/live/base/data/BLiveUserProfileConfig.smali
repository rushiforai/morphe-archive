.class public Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveuserprofileconfig"


# instance fields
.field public blockStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public contributionListShow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public enableNewPrivilege:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public hasFanbaseGroup:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public hierarchy:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;",
            ">;"
        }
    .end annotation
.end field

.field public isBeautifulNumber:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public isGuard:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public isHiddenAnchorHierachy:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public isHiddenUserHierachy:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public isUserInFanbaseGroup:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public jumpConfig:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public showGiftWallEntrance:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public showGiftWallEntranceV2:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public showGuardEntrance:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public showType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;
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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->nullCheck()V

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

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->contributionListShow:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->contributionListShow:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGuardEntrance:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGuardEntrance:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/y72;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/y72;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    new-instance v2, Ll/z72;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/z72;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 47
    .line 48
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isGuard:Z

    .line 49
    .line 50
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isGuard:Z

    .line 51
    .line 52
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 53
    .line 54
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 55
    .line 56
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isUserInFanbaseGroup:Z

    .line 57
    .line 58
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isUserInFanbaseGroup:Z

    .line 59
    .line 60
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntrance:Z

    .line 61
    .line 62
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntrance:Z

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 69
    .line 70
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 71
    .line 72
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isBeautifulNumber:Z

    .line 73
    .line 74
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isBeautifulNumber:Z

    .line 75
    .line 76
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntranceV2:Z

    .line 77
    .line 78
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntranceV2:Z

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenUserHierachy:Z

    .line 81
    .line 82
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenUserHierachy:Z

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenAnchorHierachy:Z

    .line 85
    .line 86
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenAnchorHierachy:Z

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 89
    .line 90
    if-eqz p0, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 97
    .line 98
    :cond_2
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->contributionListShow:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->contributionListShow:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGuardEntrance:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGuardEntrance:Z

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isGuard:Z

    .line 56
    .line 57
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isGuard:Z

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 62
    .line 63
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isUserInFanbaseGroup:Z

    .line 68
    .line 69
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isUserInFanbaseGroup:Z

    .line 70
    .line 71
    if-ne v1, v3, :cond_2

    .line 72
    .line 73
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntrance:Z

    .line 74
    .line 75
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntrance:Z

    .line 76
    .line 77
    if-ne v1, v3, :cond_2

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 90
    .line 91
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 92
    .line 93
    if-ne v1, v3, :cond_2

    .line 94
    .line 95
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isBeautifulNumber:Z

    .line 96
    .line 97
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isBeautifulNumber:Z

    .line 98
    .line 99
    if-ne v1, v3, :cond_2

    .line 100
    .line 101
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntranceV2:Z

    .line 102
    .line 103
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntranceV2:Z

    .line 104
    .line 105
    if-ne v1, v3, :cond_2

    .line 106
    .line 107
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenUserHierachy:Z

    .line 108
    .line 109
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenUserHierachy:Z

    .line 110
    .line 111
    if-ne v1, v3, :cond_2

    .line 112
    .line 113
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenAnchorHierachy:Z

    .line 114
    .line 115
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenAnchorHierachy:Z

    .line 116
    .line 117
    if-ne v1, v3, :cond_2

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 122
    .line 123
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_2

    .line 128
    .line 129
    return v0

    .line 130
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveuserprofileconfig"

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
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->contributionListShow:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGuardEntrance:Z

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    move v1, v4

    .line 40
    goto :goto_2

    .line 41
    :cond_2
    move v1, v3

    .line 42
    :goto_2
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    goto :goto_3

    .line 54
    :cond_3
    move v1, v2

    .line 55
    :goto_3
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_4

    .line 67
    :cond_4
    move v1, v2

    .line 68
    :goto_4
    add-int/2addr v0, v1

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isGuard:Z

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    move v1, v4

    .line 76
    goto :goto_5

    .line 77
    :cond_5
    move v1, v3

    .line 78
    :goto_5
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 82
    .line 83
    if-eqz v1, :cond_6

    .line 84
    .line 85
    move v1, v4

    .line 86
    goto :goto_6

    .line 87
    :cond_6
    move v1, v3

    .line 88
    :goto_6
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isUserInFanbaseGroup:Z

    .line 92
    .line 93
    if-eqz v1, :cond_7

    .line 94
    .line 95
    move v1, v4

    .line 96
    goto :goto_7

    .line 97
    :cond_7
    move v1, v3

    .line 98
    :goto_7
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntrance:Z

    .line 102
    .line 103
    if-eqz v1, :cond_8

    .line 104
    .line 105
    move v1, v4

    .line 106
    goto :goto_8

    .line 107
    :cond_8
    move v1, v3

    .line 108
    :goto_8
    add-int/2addr v0, v1

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 112
    .line 113
    if-eqz v1, :cond_9

    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    goto :goto_9

    .line 120
    :cond_9
    move v1, v2

    .line 121
    :goto_9
    add-int/2addr v0, v1

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 125
    .line 126
    if-eqz v1, :cond_a

    .line 127
    .line 128
    move v1, v4

    .line 129
    goto :goto_a

    .line 130
    :cond_a
    move v1, v3

    .line 131
    :goto_a
    add-int/2addr v0, v1

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isBeautifulNumber:Z

    .line 135
    .line 136
    if-eqz v1, :cond_b

    .line 137
    .line 138
    move v1, v4

    .line 139
    goto :goto_b

    .line 140
    :cond_b
    move v1, v3

    .line 141
    :goto_b
    add-int/2addr v0, v1

    .line 142
    mul-int/lit8 v0, v0, 0x29

    .line 143
    .line 144
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntranceV2:Z

    .line 145
    .line 146
    if-eqz v1, :cond_c

    .line 147
    .line 148
    move v1, v4

    .line 149
    goto :goto_c

    .line 150
    :cond_c
    move v1, v3

    .line 151
    :goto_c
    add-int/2addr v0, v1

    .line 152
    mul-int/lit8 v0, v0, 0x29

    .line 153
    .line 154
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenUserHierachy:Z

    .line 155
    .line 156
    if-eqz v1, :cond_d

    .line 157
    .line 158
    move v1, v4

    .line 159
    goto :goto_d

    .line 160
    :cond_d
    move v1, v3

    .line 161
    :goto_d
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenAnchorHierachy:Z

    .line 165
    .line 166
    if-eqz v1, :cond_e

    .line 167
    .line 168
    move v3, v4

    .line 169
    :cond_e
    add-int/2addr v0, v3

    .line 170
    mul-int/lit8 v0, v0, 0x29

    .line 171
    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 173
    .line 174
    if-eqz v1, :cond_f

    .line 175
    .line 176
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->hashCode()I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    :cond_f
    add-int/2addr v0, v2

    .line 181
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 182
    .line 183
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 36
    .line 37
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 38
    .line 39
    if-nez v0, :cond_4

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 46
    .line 47
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
