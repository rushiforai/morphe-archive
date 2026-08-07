.class public Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveextradata"


# instance fields
.field public anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public batchGivenGiftRes:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;",
            ">;"
        }
    .end annotation
.end field

.field public blackList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;",
            ">;"
        }
    .end annotation
.end field

.field public coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public liveSchemas:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSchema;",
            ">;"
        }
    .end annotation
.end field

.field public shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public voiceSettles:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;",
            ">;"
        }
    .end annotation
.end field

.field public wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;)Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;)Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveSchema;)Lcom/p1/mobile/putong/live/base/data/BLiveSchema;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSchema;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->nullCheck()V

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

    .line 168
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 45
    .line 46
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 55
    .line 56
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 57
    .line 58
    if-eqz v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 65
    .line 66
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 67
    .line 68
    if-eqz v1, :cond_6

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 75
    .line 76
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

    .line 77
    .line 78
    if-eqz v1, :cond_7

    .line 79
    .line 80
    new-instance v2, Ll/sz1;

    .line 81
    .line 82
    invoke-direct {v2}, Ll/sz1;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

    .line 90
    .line 91
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 92
    .line 93
    if-eqz v1, :cond_8

    .line 94
    .line 95
    new-instance v2, Ll/tz1;

    .line 96
    .line 97
    invoke-direct {v2}, Ll/tz1;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 105
    .line 106
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 107
    .line 108
    if-eqz v1, :cond_9

    .line 109
    .line 110
    new-instance v2, Ll/uz1;

    .line 111
    .line 112
    invoke-direct {v2}, Ll/uz1;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 120
    .line 121
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 122
    .line 123
    if-eqz v1, :cond_a

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 130
    .line 131
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 132
    .line 133
    if-eqz v1, :cond_b

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 140
    .line 141
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 142
    .line 143
    if-eqz v1, :cond_c

    .line 144
    .line 145
    new-instance v2, Ll/vz1;

    .line 146
    .line 147
    invoke-direct {v2}, Ll/vz1;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 155
    .line 156
    :cond_c
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 157
    .line 158
    if-eqz p0, :cond_d

    .line 159
    .line 160
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 165
    .line 166
    :cond_d
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 167
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 144
    .line 145
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 146
    .line 147
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_2

    .line 152
    .line 153
    return v0

    .line 154
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveextradata"

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
    if-nez v0, :cond_e

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    :cond_d
    add-int/2addr v0, v2

    .line 186
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 187
    .line 188
    :cond_e
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

    .line 41
    .line 42
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 43
    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 52
    .line 53
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 54
    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 63
    .line 64
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 65
    .line 66
    if-nez v0, :cond_6

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 73
    .line 74
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 75
    .line 76
    if-nez v0, :cond_7

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 83
    .line 84
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 85
    .line 86
    if-nez v0, :cond_8

    .line 87
    .line 88
    new-instance v0, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 94
    .line 95
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 96
    .line 97
    if-nez v0, :cond_9

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 104
    .line 105
    :cond_9
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
