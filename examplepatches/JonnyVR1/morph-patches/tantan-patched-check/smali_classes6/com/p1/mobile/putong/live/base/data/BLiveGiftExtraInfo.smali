.class public Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivegiftextrainfo"


# instance fields
.field public call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public discounts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;)Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->nullCheck()V

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

    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 45
    .line 46
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 55
    .line 56
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 57
    .line 58
    if-eqz v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 65
    .line 66
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 67
    .line 68
    if-eqz v1, :cond_6

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 75
    .line 76
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 77
    .line 78
    if-eqz v1, :cond_7

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 85
    .line 86
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 87
    .line 88
    if-eqz v1, :cond_8

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 95
    .line 96
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 97
    .line 98
    if-eqz v1, :cond_9

    .line 99
    .line 100
    new-instance v2, Ll/o02;

    .line 101
    .line 102
    invoke-direct {v2}, Ll/o02;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 110
    .line 111
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 112
    .line 113
    if-eqz v1, :cond_a

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 120
    .line 121
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 122
    .line 123
    if-eqz v1, :cond_b

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 130
    .line 131
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 132
    .line 133
    if-eqz v1, :cond_c

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 140
    .line 141
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 142
    .line 143
    if-eqz v1, :cond_d

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 150
    .line 151
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 152
    .line 153
    if-eqz v1, :cond_e

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 160
    .line 161
    :cond_e
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 162
    .line 163
    if-eqz p0, :cond_f

    .line 164
    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 170
    .line 171
    :cond_f
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 172
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 164
    .line 165
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 166
    .line 167
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_2

    .line 172
    .line 173
    return v0

    .line 174
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivegiftextrainfo"

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
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 204
    .line 205
    if-eqz v1, :cond_f

    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->hashCode()I

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    :cond_f
    add-int/2addr v0, v2

    .line 212
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 213
    .line 214
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    new-instance v0, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 61
    .line 62
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 63
    .line 64
    if-nez v0, :cond_6

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 71
    .line 72
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 73
    .line 74
    if-nez v0, :cond_7

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 81
    .line 82
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 83
    .line 84
    if-nez v0, :cond_8

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 91
    .line 92
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 93
    .line 94
    if-nez v0, :cond_9

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 101
    .line 102
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 103
    .line 104
    if-nez v0, :cond_a

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 111
    .line 112
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 113
    .line 114
    if-nez v0, :cond_b

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 121
    .line 122
    :cond_b
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
