.class public Ll/uoe0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ljava/lang/String;

.field public C:Z

.field public D:Z

.field public E:Ll/stj;

.field public F:Ll/g3e;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public G:Ll/wxj;

.field public H:Ljava/lang/String;

.field public I:Z

.field public J:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/coj;",
            ">;"
        }
    .end annotation
.end field

.field public K:Ljava/lang/String;

.field public L:Ljava/lang/String;

.field public M:Ljava/lang/String;

.field public N:Ljava/lang/String;

.field public O:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ll/cqj;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public w:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

.field public x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public y:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public z:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "unknown_"

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, ""

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/uoe0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 17
    .line 18
    iput-object v1, p0, Ll/uoe0;->A:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "live"

    .line 21
    .line 22
    iput-object v0, p0, Ll/uoe0;->B:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Ll/uoe0;->C:Z

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Ll/uoe0;->D:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/uoe0;->I:Z

    .line 31
    .line 32
    return-void
.end method

.method public static d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p9    # Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;ZI",
            "Ljava/lang/String;",
            "Ll/cqj;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;",
            ")",
            "Ll/uoe0;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/uoe0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/uoe0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p6, v0, Ll/uoe0;->f:I

    .line 7
    .line 8
    iput-object p0, v0, Ll/uoe0;->d:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p1, v0, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 11
    .line 12
    iput-object p7, v0, Ll/uoe0;->n:Ljava/lang/String;

    .line 13
    .line 14
    iput-boolean p5, v0, Ll/uoe0;->p:Z

    .line 15
    .line 16
    iput-object p2, v0, Ll/uoe0;->q:Ll/y20;

    .line 17
    .line 18
    iput-object p3, v0, Ll/uoe0;->r:Ll/y20;

    .line 19
    .line 20
    iput-object p4, v0, Ll/uoe0;->s:Ll/y20;

    .line 21
    .line 22
    iput-object p8, v0, Ll/uoe0;->m:Ll/cqj;

    .line 23
    .line 24
    iput-object p9, v0, Ll/uoe0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 25
    .line 26
    return-object v0
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uoe0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 2
    .line 3
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 4
    .line 5
    iget-object v0, p0, Ll/uoe0;->m:Ll/cqj;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/uoe0;->m:Ll/cqj;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/cqj;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 26
    .line 27
    iget-object v1, p0, Ll/uoe0;->m:Ll/cqj;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/cqj;->a()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->biz:Ljava/lang/String;

    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Ll/uoe0;->G:Ll/wxj;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/wxj;->a()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->enterSource:Ljava/lang/String;

    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public b()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "live"

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->scenario:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->originalId:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v2, p0, Ll/uoe0;->x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Ll/uoe0;->x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 30
    .line 31
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->roomIdRoleIn:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->roomId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->liveIdRoleIn:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->liveId:Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v2, p0, Ll/uoe0;->y:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    iget-object v2, p0, Ll/uoe0;->y:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 51
    .line 52
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->roomIdRoleIn:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->roomId:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->liveIdRoleIn:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->liveId:Ljava/lang/String;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object v2, p0, Ll/uoe0;->b:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->roomId:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v2, p0, Ll/uoe0;->a:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->liveId:Ljava/lang/String;

    .line 68
    .line 69
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v3, p0, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 74
    .line 75
    if-nez v3, :cond_2

    .line 76
    .line 77
    const-string v3, ""

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 81
    .line 82
    :goto_1
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;->giftType:Ljava/lang/String;

    .line 83
    .line 84
    iget v3, p0, Ll/uoe0;->f:I

    .line 85
    .line 86
    iput v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInfo;->num:I

    .line 87
    .line 88
    new-instance v3, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->giftInfo:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/uoe0;->n()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-nez v2, :cond_5

    .line 103
    .line 104
    const-string v2, "voiceLiveMain"

    .line 105
    .line 106
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-nez v2, :cond_5

    .line 113
    .line 114
    const-string v2, "voiceLiveVice"

    .line 115
    .line 116
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_5

    .line 123
    .line 124
    const-string v2, "voiceLiveAudience"

    .line 125
    .line 126
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-nez v2, :cond_5

    .line 133
    .line 134
    const-string v2, "voice-chat-admin"

    .line 135
    .line 136
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-nez v2, :cond_5

    .line 143
    .line 144
    const-string v2, "voiceLiveConfessDetail"

    .line 145
    .line 146
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-nez v2, :cond_5

    .line 153
    .line 154
    const-string v2, "voice_auction"

    .line 155
    .line 156
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-nez v2, :cond_5

    .line 163
    .line 164
    const-string v2, "voice_sweet_bind_cp"

    .line 165
    .line 166
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    if-nez v2, :cond_5

    .line 173
    .line 174
    const-string v2, "voice_gift_wall"

    .line 175
    .line 176
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 177
    .line 178
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-nez v2, :cond_5

    .line 183
    .line 184
    const-string v2, "source_voice_ktv_quick_gift"

    .line 185
    .line 186
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-nez v2, :cond_5

    .line 193
    .line 194
    const-string v2, "source_voice_gift_guide"

    .line 195
    .line 196
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    if-nez v2, :cond_5

    .line 203
    .line 204
    const-string v2, "source_voice_fan_base"

    .line 205
    .line 206
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 207
    .line 208
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-eqz v2, :cond_3

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_3
    const-string v2, "guildCallAudience"

    .line 216
    .line 217
    iget-object v3, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 218
    .line 219
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    if-eqz v2, :cond_4

    .line 224
    .line 225
    const-string v1, "guildLive"

    .line 226
    .line 227
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->type:Ljava/lang/String;

    .line 228
    .line 229
    goto :goto_3

    .line 230
    :cond_4
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->type:Ljava/lang/String;

    .line 231
    .line 232
    goto :goto_3

    .line 233
    :cond_5
    :goto_2
    const-string v1, "voiceLive"

    .line 234
    .line 235
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->type:Ljava/lang/String;

    .line 236
    .line 237
    :goto_3
    invoke-virtual {p0}, Ll/uoe0;->f()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 242
    .line 243
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 244
    .line 245
    iget-object v2, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 246
    .line 247
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-nez v1, :cond_7

    .line 252
    .line 253
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_3:Ljava/lang/String;

    .line 254
    .line 255
    iget-object v2, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    if-nez v1, :cond_7

    .line 262
    .line 263
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_5:Ljava/lang/String;

    .line 264
    .line 265
    iget-object v2, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    if-eqz v1, :cond_6

    .line 272
    .line 273
    goto :goto_4

    .line 274
    :cond_6
    iget-object p0, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 275
    .line 276
    goto :goto_5

    .line 277
    :cond_7
    :goto_4
    const-string p0, "normal"

    .line 278
    .line 279
    :goto_5
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftReq;->liveMode:Ljava/lang/String;

    .line 280
    .line 281
    return-object v0
.end method

.method public c(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 6

    .line 1
    const-string v0, "videoChat"

    .line 2
    .line 3
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    const-string v2, "scenario"

    .line 9
    .line 10
    const-string v3, "live"

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v2, "originalId"

    .line 16
    .line 17
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    const-string v2, "roomId"

    .line 29
    .line 30
    iget-object v3, p0, Ll/uoe0;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    const-string v2, "liveId"

    .line 36
    .line 37
    iget-object v3, p0, Ll/uoe0;->a:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    const-string v2, "type"

    .line 43
    .line 44
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    const-string v2, "liveMode"

    .line 48
    .line 49
    const-string v3, "normal"

    .line 50
    .line 51
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    new-instance v2, Lorg/json/JSONArray;

    .line 55
    .line 56
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v3, Lorg/json/JSONObject;

    .line 60
    .line 61
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v4, "giftType"

    .line 65
    .line 66
    iget-object v5, p0, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 67
    .line 68
    if-nez v5, :cond_0

    .line 69
    .line 70
    const-string v5, ""

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 74
    .line 75
    :goto_0
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    const-string v4, "num"

    .line 79
    .line 80
    iget p0, p0, Ll/uoe0;->f:I

    .line 81
    .line 82
    invoke-virtual {v3, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 86
    .line 87
    .line 88
    const-string p0, "giftInfo"

    .line 89
    .line 90
    invoke-virtual {v1, p0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    .line 92
    .line 93
    new-instance p0, Lorg/json/JSONObject;

    .line 94
    .line 95
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 96
    .line 97
    .line 98
    new-instance v2, Lorg/json/JSONObject;

    .line 99
    .line 100
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v3, "chatId"

    .line 104
    .line 105
    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    const-string p1, "extraInfo"

    .line 112
    .line 113
    invoke-virtual {v1, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    return-object v1

    .line 117
    :catch_0
    move-exception p0

    .line 118
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 122
    .line 123
    .line 124
    const/4 p0, 0x0

    .line 125
    return-object p0
.end method

.method public e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uoe0;->J:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;
    .locals 10
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Ll/uoe0;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;->pkId:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 18
    .line 19
    iget-object v1, p0, Ll/uoe0;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Ll/uoe0;->h:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;->id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v1, p0, Ll/uoe0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;

    .line 32
    .line 33
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkReceiveGiftRole;

    .line 34
    .line 35
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 36
    .line 37
    :cond_0
    iget-object v1, p0, Ll/uoe0;->x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Ll/uoe0;->x:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 48
    .line 49
    :cond_1
    iget-object v1, p0, Ll/uoe0;->y:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 50
    .line 51
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Ll/uoe0;->y:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 60
    .line 61
    :cond_2
    iget-object v1, p0, Ll/uoe0;->O:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 62
    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 64
    .line 65
    iget-object v1, p0, Ll/uoe0;->z:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 66
    .line 67
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    iget-object v1, p0, Ll/uoe0;->z:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 74
    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 76
    .line 77
    :cond_3
    iget-object v1, p0, Ll/uoe0;->w:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 78
    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 82
    .line 83
    :cond_4
    invoke-virtual {p0, v0}, Ll/uoe0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/uoe0;->k:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    const-string v2, ""

    .line 93
    .line 94
    if-eqz v1, :cond_5

    .line 95
    .line 96
    iget-object v1, p0, Ll/uoe0;->l:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_8

    .line 103
    .line 104
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iget-object v3, p0, Ll/uoe0;->k:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-eqz v3, :cond_6

    .line 115
    .line 116
    move-object v3, v2

    .line 117
    goto :goto_0

    .line 118
    :cond_6
    iget-object v3, p0, Ll/uoe0;->k:Ljava/lang/String;

    .line 119
    .line 120
    :goto_0
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;->text:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v3, p0, Ll/uoe0;->l:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-eqz v3, :cond_7

    .line 129
    .line 130
    move-object v3, v2

    .line 131
    goto :goto_1

    .line 132
    :cond_7
    iget-object v3, p0, Ll/uoe0;->l:Ljava/lang/String;

    .line 133
    .line 134
    :goto_1
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;->defaultCommentId:Ljava/lang/String;

    .line 135
    .line 136
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 137
    .line 138
    :cond_8
    iget-object v1, p0, Ll/uoe0;->j:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-nez v1, :cond_9

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iget-object v3, p0, Ll/uoe0;->j:Ljava/lang/String;

    .line 151
    .line 152
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;->topChatText:Ljava/lang/String;

    .line 153
    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 155
    .line 156
    :cond_9
    iget-object v1, p0, Ll/uoe0;->M:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-nez v1, :cond_a

    .line 163
    .line 164
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iget-object v3, p0, Ll/uoe0;->M:Ljava/lang/String;

    .line 169
    .line 170
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 171
    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 173
    .line 174
    :cond_a
    iget-object v1, p0, Ll/uoe0;->E:Ll/stj;

    .line 175
    .line 176
    if-eqz v1, :cond_b

    .line 177
    .line 178
    invoke-virtual {v1}, Ll/stj;->a()Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    if-eqz v1, :cond_b

    .line 183
    .line 184
    iget-object v1, p0, Ll/uoe0;->d:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {v1}, Ll/muj;->j0(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    iget-object v1, p0, Ll/uoe0;->E:Ll/stj;

    .line 190
    .line 191
    invoke-virtual {v1}, Ll/stj;->a()Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 196
    .line 197
    :cond_b
    iget-object v1, p0, Ll/uoe0;->F:Ll/g3e;

    .line 198
    .line 199
    if-eqz v1, :cond_c

    .line 200
    .line 201
    invoke-virtual {v1}, Ll/g3e;->a()Ljava/util/List;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-nez v1, :cond_c

    .line 210
    .line 211
    new-instance v1, Ljava/util/ArrayList;

    .line 212
    .line 213
    iget-object v3, p0, Ll/uoe0;->F:Ll/g3e;

    .line 214
    .line 215
    invoke-virtual {v3}, Ll/g3e;->a()Ljava/util/List;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 220
    .line 221
    .line 222
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 223
    .line 224
    :cond_c
    invoke-virtual {p0}, Ll/uoe0;->m()Z

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    const/4 v3, 0x0

    .line 229
    if-eqz v1, :cond_d

    .line 230
    .line 231
    iget-object v1, p0, Ll/uoe0;->J:Ljava/util/List;

    .line 232
    .line 233
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    check-cast v1, Ll/coj;

    .line 238
    .line 239
    iget-object v2, v1, Ll/coj;->g:Ljava/lang/String;

    .line 240
    .line 241
    iget-object v3, v1, Ll/coj;->f:Ll/p54;

    .line 242
    .line 243
    move-object v4, v3

    .line 244
    iget-object v3, v4, Ll/p54;->a:Ljava/lang/String;

    .line 245
    .line 246
    iget-object v1, v1, Ll/coj;->e:Ll/h64;

    .line 247
    .line 248
    iget-object v1, v1, Ll/h64;->a:Ljava/lang/String;

    .line 249
    .line 250
    iget v5, v4, Ll/p54;->d:I

    .line 251
    .line 252
    iget-object v6, p0, Ll/uoe0;->c:Ljava/lang/String;

    .line 253
    .line 254
    iget-object v7, p0, Ll/uoe0;->K:Ljava/lang/String;

    .line 255
    .line 256
    move-object v4, v1

    .line 257
    invoke-static/range {v2 .. v7}, Ll/txj;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ll/sxj;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-virtual {v1}, Ll/sxj;->a()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 266
    .line 267
    invoke-virtual {v1}, Ll/sxj;->b()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 272
    .line 273
    goto :goto_7

    .line 274
    :cond_d
    iget-object v1, p0, Ll/uoe0;->m:Ll/cqj;

    .line 275
    .line 276
    if-nez v1, :cond_e

    .line 277
    .line 278
    move-object v5, v2

    .line 279
    goto :goto_2

    .line 280
    :cond_e
    invoke-virtual {v1}, Ll/cqj;->c()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    move-object v5, v1

    .line 285
    :goto_2
    iget-object v1, p0, Ll/uoe0;->m:Ll/cqj;

    .line 286
    .line 287
    if-nez v1, :cond_f

    .line 288
    .line 289
    :goto_3
    move-object v6, v2

    .line 290
    goto :goto_4

    .line 291
    :cond_f
    invoke-virtual {v1}, Ll/cqj;->e()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    goto :goto_3

    .line 296
    :goto_4
    iget-object v1, p0, Ll/uoe0;->m:Ll/cqj;

    .line 297
    .line 298
    if-nez v1, :cond_10

    .line 299
    .line 300
    :goto_5
    move v7, v3

    .line 301
    goto :goto_6

    .line 302
    :cond_10
    invoke-virtual {v1}, Ll/cqj;->d()Ll/p54;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    iget v3, v1, Ll/p54;->d:I

    .line 307
    .line 308
    goto :goto_5

    .line 309
    :goto_6
    iget-object v4, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 310
    .line 311
    iget-object v8, p0, Ll/uoe0;->c:Ljava/lang/String;

    .line 312
    .line 313
    iget-object v9, p0, Ll/uoe0;->K:Ljava/lang/String;

    .line 314
    .line 315
    invoke-static/range {v4 .. v9}, Ll/txj;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ll/sxj;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    invoke-virtual {v1}, Ll/sxj;->a()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 324
    .line 325
    invoke-virtual {v1}, Ll/sxj;->b()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 330
    .line 331
    :goto_7
    iget-object v1, p0, Ll/uoe0;->z:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 332
    .line 333
    if-eqz v1, :cond_11

    .line 334
    .line 335
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 336
    .line 337
    const-string v1, "auction"

    .line 338
    .line 339
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceLiveMode:Ljava/lang/String;

    .line 340
    .line 341
    return-object v0

    .line 342
    :cond_11
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 343
    .line 344
    iget-object v2, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 345
    .line 346
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    move-result v1

    .line 350
    if-nez v1, :cond_13

    .line 351
    .line 352
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_3:Ljava/lang/String;

    .line 353
    .line 354
    iget-object v2, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 355
    .line 356
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    if-nez v1, :cond_13

    .line 361
    .line 362
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_RADIO_5:Ljava/lang/String;

    .line 363
    .line 364
    iget-object v2, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 365
    .line 366
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    move-result v1

    .line 370
    if-eqz v1, :cond_12

    .line 371
    .line 372
    goto :goto_8

    .line 373
    :cond_12
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 374
    .line 375
    const-string v1, "normal"

    .line 376
    .line 377
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceLiveMode:Ljava/lang/String;

    .line 378
    .line 379
    return-object v0

    .line 380
    :cond_13
    :goto_8
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 381
    .line 382
    iget-object p0, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 383
    .line 384
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceLiveMode:Ljava/lang/String;

    .line 385
    .line 386
    return-object v0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "source_voice_gift_guide"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_6

    .line 10
    .line 11
    iget-object v0, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "voice_sweet_bind_cp"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_6

    .line 20
    .line 21
    iget-object v0, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "voice_gift_wall"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_6

    .line 30
    .line 31
    iget-object v0, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "source_voice_ktv_quick_gift"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_6

    .line 40
    .line 41
    iget-object v0, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "source_voice_fan_base"

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_0
    invoke-virtual {p0}, Ll/uoe0;->m()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object p0, p0, Ll/uoe0;->J:Ljava/util/List;

    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Ll/coj;

    .line 66
    .line 67
    iget-object p0, p0, Ll/coj;->e:Ll/h64;

    .line 68
    .line 69
    iget-object p0, p0, Ll/h64;->a:Ljava/lang/String;

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_1
    iget-object v0, p0, Ll/uoe0;->o:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_2

    .line 79
    .line 80
    iget-object p0, p0, Ll/uoe0;->o:Ljava/lang/String;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_2
    iget-object v0, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 84
    .line 85
    const-string v1, "live"

    .line 86
    .line 87
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    iget-object v0, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 94
    .line 95
    const-string v1, "call-main"

    .line 96
    .line 97
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_5

    .line 102
    .line 103
    iget-object v0, p0, Ll/uoe0;->n:Ljava/lang/String;

    .line 104
    .line 105
    const-string v1, "voiceLiveMain"

    .line 106
    .line 107
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    iget-object v0, p0, Ll/uoe0;->m:Ll/cqj;

    .line 115
    .line 116
    if-nez v0, :cond_4

    .line 117
    .line 118
    iget-object p0, p0, Ll/uoe0;->c:Ljava/lang/String;

    .line 119
    .line 120
    return-object p0

    .line 121
    :cond_4
    invoke-virtual {v0}, Ll/cqj;->e()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0

    .line 126
    :cond_5
    :goto_0
    iget-object p0, p0, Ll/uoe0;->c:Ljava/lang/String;

    .line 127
    .line 128
    return-object p0

    .line 129
    :cond_6
    :goto_1
    iget-object p0, p0, Ll/uoe0;->L:Ljava/lang/String;

    .line 130
    .line 131
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uoe0;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uoe0;->K:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Z
    .locals 1

    .line 1
    const-string v0, "js"

    .line 2
    .line 3
    iget-object p0, p0, Ll/uoe0;->A:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public l()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uoe0;->J:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uoe0;->J:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x2

    .line 16
    if-lt p0, v0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public m()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uoe0;->J:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/uoe0;->J:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public n()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/uoe0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/uoe0;->B:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "voice-live"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public o(Z)Ll/uoe0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/uoe0;->D:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ljava/lang/String;)Ll/uoe0;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string v0, "1"

    .line 9
    .line 10
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Ll/uoe0;->C:Z

    .line 15
    .line 16
    return-object p0
.end method

.method public q(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/uoe0;->J:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public r(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uoe0;->H:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public s(Ll/wxj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uoe0;->G:Ll/wxj;

    .line 2
    .line 3
    return-void
.end method

.method public t(Ljava/lang/String;)Ll/uoe0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uoe0;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Ljava/lang/String;)Ll/uoe0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uoe0;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uoe0;->K:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
