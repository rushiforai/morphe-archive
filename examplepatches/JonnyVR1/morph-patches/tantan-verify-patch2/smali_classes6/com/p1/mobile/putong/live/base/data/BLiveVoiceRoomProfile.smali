.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATE_DEFAULT:Ljava/lang/String; = "default"

.field public static final STATE_DELETED:Ljava/lang/String; = "deleted"

.field public static final STATE_PENDING:Ljava/lang/String; = "pending"

.field public static final TYPE:Ljava/lang/String; = "blivevoiceroomprofile"


# instance fields
.field public announcement:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public announcementStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public canOpenPersonal:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public coverStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public coverUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public createdTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public debugText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public freeCall:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public freeSettle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public heat:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public heatBgImg:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public heatDesc:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;",
            ">;"
        }
    .end annotation
.end field

.field public heatIcon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public heatSvga:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public heatTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public identity:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public isPersonal:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public isSettled:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public level:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public levelBgEndColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public levelBgStartColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public levelIcon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public publicRoomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public remindType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public roomAttributes:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomAttributes;",
            ">;"
        }
    .end annotation
.end field

.field public roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public settleMembers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;",
            ">;"
        }
    .end annotation
.end field

.field public settleMembersLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public stick:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public titleStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->canOpenPersonal:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomAttributes;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomAttributes;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomAttributes;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomAttributes;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomHeatDesc;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final isStatePending(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "pending"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->nullCheck()V

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

    .line 175
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->createdTime:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->createdTime:J

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isPersonal:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isPersonal:Z

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeSettle:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeSettle:Z

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembersLimit:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembersLimit:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    new-instance v2, Ll/aa2;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/aa2;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 48
    .line 49
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->level:I

    .line 62
    .line 63
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->level:I

    .line 64
    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heat:I

    .line 66
    .line 67
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heat:I

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

    .line 74
    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

    .line 78
    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

    .line 82
    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

    .line 86
    .line 87
    if-eqz v1, :cond_1

    .line 88
    .line 89
    new-instance v2, Ll/ba2;

    .line 90
    .line 91
    invoke-direct {v2}, Ll/ba2;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

    .line 99
    .line 100
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 107
    .line 108
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeCall:Z

    .line 109
    .line 110
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeCall:Z

    .line 111
    .line 112
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->stick:Z

    .line 113
    .line 114
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->stick:Z

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 117
    .line 118
    if-eqz v1, :cond_2

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 125
    .line 126
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 127
    .line 128
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 129
    .line 130
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isSettled:Z

    .line 131
    .line 132
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isSettled:Z

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 135
    .line 136
    if-eqz v1, :cond_3

    .line 137
    .line 138
    new-instance v2, Ll/ca2;

    .line 139
    .line 140
    invoke-direct {v2}, Ll/ca2;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 148
    .line 149
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->canOpenPersonal:Z

    .line 150
    .line 151
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->canOpenPersonal:Z

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

    .line 154
    .line 155
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

    .line 158
    .line 159
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

    .line 162
    .line 163
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 166
    .line 167
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 170
    .line 171
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 172
    .line 173
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 174
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->createdTime:J

    .line 44
    .line 45
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->createdTime:J

    .line 46
    .line 47
    cmp-long v1, v3, v5

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isPersonal:Z

    .line 52
    .line 53
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isPersonal:Z

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeSettle:Z

    .line 58
    .line 59
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeSettle:Z

    .line 60
    .line 61
    if-ne v1, v3, :cond_2

    .line 62
    .line 63
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembersLimit:I

    .line 64
    .line 65
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembersLimit:I

    .line 66
    .line 67
    if-ne v1, v3, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 72
    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->level:I

    .line 110
    .line 111
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->level:I

    .line 112
    .line 113
    if-ne v1, v3, :cond_2

    .line 114
    .line 115
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heat:I

    .line 116
    .line 117
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heat:I

    .line 118
    .line 119
    if-ne v1, v3, :cond_2

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

    .line 142
    .line 143
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

    .line 162
    .line 163
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 182
    .line 183
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 184
    .line 185
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-eqz v1, :cond_2

    .line 190
    .line 191
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeCall:Z

    .line 192
    .line 193
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeCall:Z

    .line 194
    .line 195
    if-ne v1, v3, :cond_2

    .line 196
    .line 197
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->stick:Z

    .line 198
    .line 199
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->stick:Z

    .line 200
    .line 201
    if-ne v1, v3, :cond_2

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 204
    .line 205
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 214
    .line 215
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isSettled:Z

    .line 224
    .line 225
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isSettled:Z

    .line 226
    .line 227
    if-ne v1, v3, :cond_2

    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 230
    .line 231
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 232
    .line 233
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-eqz v1, :cond_2

    .line 238
    .line 239
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->canOpenPersonal:Z

    .line 240
    .line 241
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->canOpenPersonal:Z

    .line 242
    .line 243
    if-ne v1, v3, :cond_2

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

    .line 246
    .line 247
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

    .line 256
    .line 257
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

    .line 266
    .line 267
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 276
    .line 277
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 286
    .line 287
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 288
    .line 289
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    if-eqz p0, :cond_2

    .line 294
    .line 295
    return v0

    .line 296
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoiceroomprofile"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->createdTime:J

    .line 48
    .line 49
    const/16 v1, 0x20

    .line 50
    .line 51
    ushr-long v5, v3, v1

    .line 52
    .line 53
    xor-long/2addr v3, v5

    .line 54
    long-to-int v1, v3

    .line 55
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isPersonal:Z

    .line 59
    .line 60
    const/16 v3, 0x4d5

    .line 61
    .line 62
    const/16 v4, 0x4cf

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    move v1, v4

    .line 67
    goto :goto_3

    .line 68
    :cond_3
    move v1, v3

    .line 69
    :goto_3
    add-int/2addr v0, v1

    .line 70
    mul-int/lit8 v0, v0, 0x29

    .line 71
    .line 72
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeSettle:Z

    .line 73
    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    move v1, v4

    .line 77
    goto :goto_4

    .line 78
    :cond_4
    move v1, v3

    .line 79
    :goto_4
    add-int/2addr v0, v1

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembersLimit:I

    .line 83
    .line 84
    add-int/2addr v0, v1

    .line 85
    mul-int/lit8 v0, v0, 0x29

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 88
    .line 89
    if-eqz v1, :cond_5

    .line 90
    .line 91
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    goto :goto_5

    .line 96
    :cond_5
    move v1, v2

    .line 97
    :goto_5
    add-int/2addr v0, v1

    .line 98
    mul-int/lit8 v0, v0, 0x29

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 101
    .line 102
    if-eqz v1, :cond_6

    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    goto :goto_6

    .line 109
    :cond_6
    move v1, v2

    .line 110
    :goto_6
    add-int/2addr v0, v1

    .line 111
    mul-int/lit8 v0, v0, 0x29

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz v1, :cond_7

    .line 116
    .line 117
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    goto :goto_7

    .line 122
    :cond_7
    move v1, v2

    .line 123
    :goto_7
    add-int/2addr v0, v1

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

    .line 127
    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    goto :goto_8

    .line 135
    :cond_8
    move v1, v2

    .line 136
    :goto_8
    add-int/2addr v0, v1

    .line 137
    mul-int/lit8 v0, v0, 0x29

    .line 138
    .line 139
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->level:I

    .line 140
    .line 141
    add-int/2addr v0, v1

    .line 142
    mul-int/lit8 v0, v0, 0x29

    .line 143
    .line 144
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heat:I

    .line 145
    .line 146
    add-int/2addr v0, v1

    .line 147
    mul-int/lit8 v0, v0, 0x29

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz v1, :cond_9

    .line 152
    .line 153
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    goto :goto_9

    .line 158
    :cond_9
    move v1, v2

    .line 159
    :goto_9
    add-int/2addr v0, v1

    .line 160
    mul-int/lit8 v0, v0, 0x29

    .line 161
    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz v1, :cond_a

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    goto :goto_a

    .line 171
    :cond_a
    move v1, v2

    .line 172
    :goto_a
    add-int/2addr v0, v1

    .line 173
    mul-int/lit8 v0, v0, 0x29

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

    .line 176
    .line 177
    if-eqz v1, :cond_b

    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    goto :goto_b

    .line 184
    :cond_b
    move v1, v2

    .line 185
    :goto_b
    add-int/2addr v0, v1

    .line 186
    mul-int/lit8 v0, v0, 0x29

    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

    .line 189
    .line 190
    if-eqz v1, :cond_c

    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    goto :goto_c

    .line 197
    :cond_c
    move v1, v2

    .line 198
    :goto_c
    add-int/2addr v0, v1

    .line 199
    mul-int/lit8 v0, v0, 0x29

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

    .line 215
    .line 216
    if-eqz v1, :cond_e

    .line 217
    .line 218
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 228
    .line 229
    if-eqz v1, :cond_f

    .line 230
    .line 231
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->freeCall:Z

    .line 241
    .line 242
    if-eqz v1, :cond_10

    .line 243
    .line 244
    move v1, v4

    .line 245
    goto :goto_10

    .line 246
    :cond_10
    move v1, v3

    .line 247
    :goto_10
    add-int/2addr v0, v1

    .line 248
    mul-int/lit8 v0, v0, 0x29

    .line 249
    .line 250
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->stick:Z

    .line 251
    .line 252
    if-eqz v1, :cond_11

    .line 253
    .line 254
    move v1, v4

    .line 255
    goto :goto_11

    .line 256
    :cond_11
    move v1, v3

    .line 257
    :goto_11
    add-int/2addr v0, v1

    .line 258
    mul-int/lit8 v0, v0, 0x29

    .line 259
    .line 260
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 261
    .line 262
    if-eqz v1, :cond_12

    .line 263
    .line 264
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->hashCode()I

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    goto :goto_12

    .line 269
    :cond_12
    move v1, v2

    .line 270
    :goto_12
    add-int/2addr v0, v1

    .line 271
    mul-int/lit8 v0, v0, 0x29

    .line 272
    .line 273
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 274
    .line 275
    if-eqz v1, :cond_13

    .line 276
    .line 277
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    goto :goto_13

    .line 282
    :cond_13
    move v1, v2

    .line 283
    :goto_13
    add-int/2addr v0, v1

    .line 284
    mul-int/lit8 v0, v0, 0x29

    .line 285
    .line 286
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isSettled:Z

    .line 287
    .line 288
    if-eqz v1, :cond_14

    .line 289
    .line 290
    move v1, v4

    .line 291
    goto :goto_14

    .line 292
    :cond_14
    move v1, v3

    .line 293
    :goto_14
    add-int/2addr v0, v1

    .line 294
    mul-int/lit8 v0, v0, 0x29

    .line 295
    .line 296
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 297
    .line 298
    if-eqz v1, :cond_15

    .line 299
    .line 300
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    goto :goto_15

    .line 305
    :cond_15
    move v1, v2

    .line 306
    :goto_15
    add-int/2addr v0, v1

    .line 307
    mul-int/lit8 v0, v0, 0x29

    .line 308
    .line 309
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->canOpenPersonal:Z

    .line 310
    .line 311
    if-eqz v1, :cond_16

    .line 312
    .line 313
    move v3, v4

    .line 314
    :cond_16
    add-int/2addr v0, v3

    .line 315
    mul-int/lit8 v0, v0, 0x29

    .line 316
    .line 317
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

    .line 318
    .line 319
    if-eqz v1, :cond_17

    .line 320
    .line 321
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

    .line 331
    .line 332
    if-eqz v1, :cond_18

    .line 333
    .line 334
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 357
    .line 358
    if-eqz v1, :cond_1a

    .line 359
    .line 360
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 370
    .line 371
    if-eqz v1, :cond_1b

    .line 372
    .line 373
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcement:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->title:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->settleMembers:Ljava/util/List;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelIcon:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgStartColor:Ljava/lang/String;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->levelBgEndColor:Ljava/lang/String;

    .line 49
    .line 50
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_7

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatIcon:Ljava/lang/String;

    .line 55
    .line 56
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_8

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatTitle:Ljava/lang/String;

    .line 61
    .line 62
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

    .line 63
    .line 64
    if-nez v0, :cond_9

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatSvga:Ljava/lang/String;

    .line 67
    .line 68
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

    .line 69
    .line 70
    if-nez v0, :cond_a

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatBgImg:Ljava/lang/String;

    .line 73
    .line 74
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

    .line 75
    .line 76
    if-nez v0, :cond_b

    .line 77
    .line 78
    new-instance v0, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->heatDesc:Ljava/util/List;

    .line 84
    .line 85
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

    .line 86
    .line 87
    if-nez v0, :cond_c

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->debugText:Ljava/lang/String;

    .line 90
    .line 91
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 92
    .line 93
    if-nez v0, :cond_d

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->remindType:Ljava/lang/String;

    .line 96
    .line 97
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 98
    .line 99
    if-nez v0, :cond_e

    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomClass:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomClass;

    .line 106
    .line 107
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 108
    .line 109
    if-nez v0, :cond_f

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->identity:Ljava/lang/String;

    .line 112
    .line 113
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 114
    .line 115
    if-nez v0, :cond_10

    .line 116
    .line 117
    new-instance v0, Ljava/util/ArrayList;

    .line 118
    .line 119
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .line 121
    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->roomAttributes:Ljava/util/List;

    .line 123
    .line 124
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

    .line 125
    .line 126
    if-nez v0, :cond_11

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->titleStatus:Ljava/lang/String;

    .line 129
    .line 130
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

    .line 131
    .line 132
    if-nez v0, :cond_12

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->announcementStatus:Ljava/lang/String;

    .line 135
    .line 136
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

    .line 137
    .line 138
    if-nez v0, :cond_13

    .line 139
    .line 140
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->publicRoomId:Ljava/lang/String;

    .line 141
    .line 142
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 143
    .line 144
    if-nez v0, :cond_14

    .line 145
    .line 146
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverUrl:Ljava/lang/String;

    .line 147
    .line 148
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 149
    .line 150
    if-nez v0, :cond_15

    .line 151
    .line 152
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->coverStatus:Ljava/lang/String;

    .line 153
    .line 154
    :cond_15
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
