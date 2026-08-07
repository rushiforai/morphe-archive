.class public Lcom/p1/mobile/putong/data/Counter;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ValueObject<",
        "Lcom/p1/mobile/putong/data/Counter;",
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
            "Lcom/p1/mobile/putong/data/Counter;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Counter;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "counter"


# instance fields
.field public activities:Lcom/p1/mobile/putong/data/CounterActivities;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public boostLimits:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BoostLimit;",
            ">;"
        }
    .end annotation
.end field

.field public fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public flower:Lcom/p1/mobile/putong/data/FeedFlower;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public followships:Lcom/p1/mobile/putong/data/CounterFollowShips;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public growth:Lcom/p1/mobile/putong/data/CounterGrowth;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public kankan:Lcom/p1/mobile/putong/data/CounterKankan;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public moments:Lcom/p1/mobile/putong/data/CouterMoments;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public mytantan:Lcom/p1/mobile/putong/data/Mytantan;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
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

.field public pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public profileLike:Lcom/p1/mobile/putong/data/ProfileLike;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public swipes:Lcom/p1/mobile/putong/data/Swipes;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public verification:Lcom/p1/mobile/putong/data/VerificationLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public viewers:Lcom/p1/mobile/putong/data/CounterViewer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Counter$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Counter$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Counter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/Counter$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Counter$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Counter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/BoostLimit;)Lcom/p1/mobile/putong/data/BoostLimit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/BoostLimit;->clone()Lcom/p1/mobile/putong/data/BoostLimit;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/Counter;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Counter;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Counter;->nullCheck()V

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

    .line 243
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Counter;->clone()Lcom/p1/mobile/putong/data/Counter;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Counter;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Counter;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->clone()Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterActivities;->clone()Lcom/p1/mobile/putong/data/CounterActivities;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->clone()Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->clone()Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 45
    .line 46
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->clone()Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 55
    .line 56
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 57
    .line 58
    if-eqz v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterFollowShips;->clone()Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 65
    .line 66
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 67
    .line 68
    if-eqz v1, :cond_6

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CouterMoments;->clone()Lcom/p1/mobile/putong/data/CouterMoments;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 75
    .line 76
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 77
    .line 78
    if-eqz v1, :cond_7

    .line 79
    .line 80
    new-instance v2, Ll/xrb;

    .line 81
    .line 82
    invoke-direct {v2}, Ll/xrb;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 90
    .line 91
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 92
    .line 93
    if-eqz v1, :cond_8

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LikersLimit;->clone()Lcom/p1/mobile/putong/data/LikersLimit;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 100
    .line 101
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 102
    .line 103
    if-eqz v1, :cond_9

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveChatLimit;->clone()Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 110
    .line 111
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 112
    .line 113
    if-eqz v1, :cond_a

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Mytantan;->clone()Lcom/p1/mobile/putong/data/Mytantan;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 120
    .line 121
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 122
    .line 123
    if-eqz v1, :cond_b

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LivePushLimit;->clone()Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 130
    .line 131
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 132
    .line 133
    if-eqz v1, :cond_c

    .line 134
    .line 135
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterFriendReminder;->clone()Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 140
    .line 141
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 142
    .line 143
    if-eqz v1, :cond_d

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterViewer;->clone()Lcom/p1/mobile/putong/data/CounterViewer;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 150
    .line 151
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 152
    .line 153
    if-eqz v1, :cond_e

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterShuoshuo;->clone()Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 160
    .line 161
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 162
    .line 163
    if-eqz v1, :cond_f

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterKankan;->clone()Lcom/p1/mobile/putong/data/CounterKankan;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 170
    .line 171
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 172
    .line 173
    if-eqz v1, :cond_10

    .line 174
    .line 175
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Swipes;->clone()Lcom/p1/mobile/putong/data/Swipes;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 180
    .line 181
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 182
    .line 183
    if-eqz v1, :cond_11

    .line 184
    .line 185
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterGrowth;->clone()Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 190
    .line 191
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 192
    .line 193
    if-eqz v1, :cond_12

    .line 194
    .line 195
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileLike;->clone()Lcom/p1/mobile/putong/data/ProfileLike;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 200
    .line 201
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 202
    .line 203
    if-eqz v1, :cond_13

    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterPickUsers;->clone()Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 210
    .line 211
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 212
    .line 213
    if-eqz v1, :cond_14

    .line 214
    .line 215
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FakeLikeLimits;->clone()Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 220
    .line 221
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 222
    .line 223
    if-eqz v1, :cond_15

    .line 224
    .line 225
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FeedFlower;->clone()Lcom/p1/mobile/putong/data/FeedFlower;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 230
    .line 231
    :cond_15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 232
    .line 233
    if-eqz p0, :cond_16

    .line 234
    .line 235
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationLimit;->clone()Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 240
    .line 241
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

    .line 242
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Counter;->clone()Lcom/p1/mobile/putong/data/Counter;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Counter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Counter;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 194
    .line 195
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 204
    .line 205
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 214
    .line 215
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 224
    .line 225
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 234
    .line 235
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 236
    .line 237
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    if-eqz p0, :cond_2

    .line 242
    .line 243
    return v0

    .line 244
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "counter"

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
    if-nez v0, :cond_17

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterActivities;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterFollowShips;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CouterMoments;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LikersLimit;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveChatLimit;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Mytantan;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LivePushLimit;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterFriendReminder;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterViewer;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterShuoshuo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 204
    .line 205
    if-eqz v1, :cond_f

    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterKankan;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 217
    .line 218
    if-eqz v1, :cond_10

    .line 219
    .line 220
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Swipes;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 230
    .line 231
    if-eqz v1, :cond_11

    .line 232
    .line 233
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterGrowth;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 243
    .line 244
    if-eqz v1, :cond_12

    .line 245
    .line 246
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileLike;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 256
    .line 257
    if-eqz v1, :cond_13

    .line 258
    .line 259
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterPickUsers;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 269
    .line 270
    if-eqz v1, :cond_14

    .line 271
    .line 272
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FakeLikeLimits;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 282
    .line 283
    if-eqz v1, :cond_15

    .line 284
    .line 285
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FeedFlower;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 295
    .line 296
    if-eqz v1, :cond_16

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VerificationLimit;->hashCode()I

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    :cond_16
    add-int/2addr v0, v2

    .line 303
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 304
    .line 305
    :cond_17
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->parseFieldSet:Ljava/util/HashSet;

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

.method public mergeData(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Counter;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_18

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Counter;->equals(Ljava/lang/Object;)Z

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
    const-string v0, "likeLimit"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 26
    .line 27
    :cond_1
    const-string v0, "activities"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 38
    .line 39
    :cond_2
    const-string v0, "secretCrushLimit"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 50
    .line 51
    :cond_3
    const-string v0, "superLikeLimit"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 62
    .line 63
    :cond_4
    const-string v0, "undoLimit"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 74
    .line 75
    :cond_5
    const-string v0, "followships"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 86
    .line 87
    :cond_6
    const-string v0, "moments"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 98
    .line 99
    :cond_7
    const-string v0, "boostLimits"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 110
    .line 111
    :cond_8
    const-string v0, "seeLimit"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 122
    .line 123
    :cond_9
    const-string v0, "liveChatLimit"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 134
    .line 135
    :cond_a
    const-string v0, "mytantan"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 146
    .line 147
    :cond_b
    const-string v0, "livePushLimit"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 158
    .line 159
    :cond_c
    const-string v0, "friend-reminders"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 170
    .line 171
    :cond_d
    const-string v0, "viewers"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 182
    .line 183
    :cond_e
    const-string v0, "shuoshuos"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 194
    .line 195
    :cond_f
    const-string v0, "kankan"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 206
    .line 207
    :cond_10
    const-string v0, "swipes"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 218
    .line 219
    :cond_11
    const-string v0, "growth"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 228
    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 230
    .line 231
    :cond_12
    const-string v0, "profileLike"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_13

    .line 238
    .line 239
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 240
    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 242
    .line 243
    :cond_13
    const-string v0, "pickUsers"

    .line 244
    .line 245
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_14

    .line 250
    .line 251
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 254
    .line 255
    :cond_14
    const-string v0, "fakeLikeLimits"

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_15

    .line 262
    .line 263
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 264
    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 266
    .line 267
    :cond_15
    const-string v0, "flower"

    .line 268
    .line 269
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_16

    .line 274
    .line 275
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 276
    .line 277
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 278
    .line 279
    :cond_16
    const-string v0, "verification"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Counter;->isFieldParsed(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_17

    .line 286
    .line 287
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 288
    .line 289
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 290
    .line 291
    :cond_17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->parseFieldSet:Ljava/util/HashSet;

    .line 292
    .line 293
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 294
    .line 295
    .line 296
    :cond_18
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 297
    check-cast p1, Lcom/p1/mobile/putong/data/Counter;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Counter;->mergeData(Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->new_()Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterActivities;->new_()Lcom/p1/mobile/putong/data/CounterActivities;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->new_()Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->new_()Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->new_()Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterFollowShips;->new_()Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 60
    .line 61
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 62
    .line 63
    if-nez v0, :cond_6

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/data/CouterMoments;->new_()Lcom/p1/mobile/putong/data/CouterMoments;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    new-instance v0, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 81
    .line 82
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 83
    .line 84
    if-nez v0, :cond_8

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/data/LikersLimit;->new_()Lcom/p1/mobile/putong/data/LikersLimit;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 91
    .line 92
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 93
    .line 94
    if-nez v0, :cond_9

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveChatLimit;->new_()Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 101
    .line 102
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 103
    .line 104
    if-nez v0, :cond_a

    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/data/Mytantan;->new_()Lcom/p1/mobile/putong/data/Mytantan;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 111
    .line 112
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 113
    .line 114
    if-nez v0, :cond_b

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/data/LivePushLimit;->new_()Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 121
    .line 122
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 123
    .line 124
    if-nez v0, :cond_c

    .line 125
    .line 126
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterFriendReminder;->new_()Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 131
    .line 132
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 133
    .line 134
    if-nez v0, :cond_d

    .line 135
    .line 136
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterViewer;->new_()Lcom/p1/mobile/putong/data/CounterViewer;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 141
    .line 142
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 143
    .line 144
    if-nez v0, :cond_e

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterShuoshuo;->new_()Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 151
    .line 152
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 153
    .line 154
    if-nez v0, :cond_f

    .line 155
    .line 156
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterKankan;->new_()Lcom/p1/mobile/putong/data/CounterKankan;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 161
    .line 162
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 163
    .line 164
    if-nez v0, :cond_10

    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/data/Swipes;->new_()Lcom/p1/mobile/putong/data/Swipes;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 171
    .line 172
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 173
    .line 174
    if-nez v0, :cond_11

    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterGrowth;->new_()Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 181
    .line 182
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 183
    .line 184
    if-nez v0, :cond_12

    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileLike;->new_()Lcom/p1/mobile/putong/data/ProfileLike;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 191
    .line 192
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 193
    .line 194
    if-nez v0, :cond_13

    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterPickUsers;->new_()Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 201
    .line 202
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 203
    .line 204
    if-nez v0, :cond_14

    .line 205
    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/data/FakeLikeLimits;->new_()Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 211
    .line 212
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 213
    .line 214
    if-nez v0, :cond_15

    .line 215
    .line 216
    invoke-static {}, Lcom/p1/mobile/putong/data/FeedFlower;->new_()Lcom/p1/mobile/putong/data/FeedFlower;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 221
    .line 222
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 223
    .line 224
    if-nez v0, :cond_16

    .line 225
    .line 226
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationLimit;->new_()Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 231
    .line 232
    :cond_16
    return-void
.end method

.method public putParsedField(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "v2"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->requestUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "v3"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->parseFieldSet:Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public shouldMergeData()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    const-string v1, "v2"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->requestUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "v3"

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 39
    return p0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Counter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
